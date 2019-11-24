using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Sajt.DataLayer;

namespace Sajt.BusinessLayer
{
    public class AdminDb : DbItem
    {

        #region Podaci
        private int Id;
        private string username;
        private string password;
        #endregion
        #region Svojstva
        public int ID
        {
            get { return Id; }
            set { Id = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        #endregion
        public override string ToString()
        {
            return this.Id.ToString() + " " + this.username + " " + this.password;
        }
    }
    public class KriterijumAdmin : KriterijumZaSelekciju
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }

    public abstract class OpAdminBase : Operacija
    {
        public KriterijumAdmin Kriterijum { get; set; }
        public override OperacijaRezultat izvrsi(Baza1Entities entiteti)
        {
            IEnumerable<AdminDb> ieAdmini;
            if ((this.Kriterijum == null) || (this.Kriterijum.Username == null)
                 && (this.Kriterijum.Password == null))
                ieAdmini = from admin in entiteti.admins
                           where admin.Id > 1
                           select new AdminDb
                           {
                               ID = admin.Id,
                               Username = admin.username,
                               Password = admin.password
                           };
            else
                ieAdmini = from admin in entiteti.admins
                           where ((this.Kriterijum.Username == null) ? true :
                                        this.Kriterijum.Username == admin.username) &&
                                 ((this.Kriterijum.Password == null) ? true :
                                        this.Kriterijum.Password == admin.password)
                           select new AdminDb
                           {
                               ID = admin.Id,
                               Username = admin.username,
                               Password = admin.password
                           };
            AdminDb[] niz = ieAdmini.ToArray();


            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
    public class OpAdminSelect : OpAdminBase
    {

    }
    public class OpAdminInsert : OpAdminBase
    {
        private AdminDb admin;
        public AdminDb Admin
        {
            get { return admin; }
            set { admin = value; }
        }
        public override OperacijaRezultat izvrsi(Baza1Entities entiteti)
        {
            if ((this.admin != null) && !string.IsNullOrEmpty(this.admin.Username) &&
                !string.IsNullOrEmpty(this.admin.Password))
                entiteti.AdminInsert(this.admin.Username, this.admin.Password);
            return base.izvrsi(entiteti);
        }
    }
    public class OpAdminUpdate : OpAdminBase
    {
        private AdminDb admin;
        public AdminDb Admin
        {
            get { return admin; }
            set { admin = value; }
        }
        public override OperacijaRezultat izvrsi(Baza1Entities entiteti)
        {
            if ((this.admin != null) && (this.Admin.ID) > 0 &&
                !string.IsNullOrEmpty(this.admin.Username) &&
                !string.IsNullOrEmpty(this.admin.Password))
                entiteti.AdminUpdate(this.Admin.ID, this.Admin.Username, this.Admin.Password);
            return base.izvrsi(entiteti);
        }

    }
    public class OpAdminDelete : OpAdminBase
    {
        private int idAdmin;
        public int IdAdmin
        {
            get { return idAdmin; }
            set { idAdmin = value; }
        }
        public override OperacijaRezultat izvrsi(Baza1Entities entiteti)
        {
            if (this.IdAdmin > 0)
                entiteti.AdminDelete(this.IdAdmin);
            return base.izvrsi(entiteti);
        }

    }
}
