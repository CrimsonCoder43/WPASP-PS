window.scrollTo = function (x, y)
{
    return true;
}

function currentDiv(n) {
    showDivs(slideIndex = n);
}

function showDivs(n) {
    var i;
    var thumb = document.getElementsByClassName("thumb");
    var pic = document.getElementsByClassName("cover");
    if (n > pic.length)
    {
        slideIndex = 1
    }
    if (n < 1)
    {
        slideIndex = pic.length
    }
    for (i = 0; i < pic.length; i++)
    {
        pic[i].style.display = "none";
    }

    pic[slideIndex - 1].style.display = "block";

    var txt = document.getElementsByClassName("cover_txt");
    if (n > txt.length)
    {
        slideIndex = 1
    }
    if (n < 1)
    {
        slideIndex = txt.length
    }
    for (i = 0; i < txt.length; i++)
    {
        txt[i].style.display = "none";
    }

    txt[slideIndex - 1].style.display = "block";
}

$(document).ready(function () {
    $("#menu table tr:odd").css("background-color", "#ccc");
});
