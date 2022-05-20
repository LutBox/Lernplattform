/*
Erstellt von Lukas Theinert

Idee für den Scroll-To_Top Button ist von W3Schools übernommen, siehe:
https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_navbar_sticky

Idee für den Scroll-To_Top Button ist von W3Schools übernommen, siehe:
https://www.w3schools.com/howto/howto_js_scroll_to_top.asp
 */
 
document.addEventListener("DOMContentLoaded", init_goToTop);

window.onscroll = function() {scrollFunction()};

function init_goToTop() {
document.getElementById("goToTopButton").addEventListener("click", goToTop);
} 

window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
      if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("goToTopButton").style.display = "block";
    } else {
        document.getElementById("goToTopButton").style.display = "none";
    }

}

function goToTop() {
    document.documentElement.scrollTop = 0;
}

