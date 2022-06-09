/*
 * Erstellt von Lukas Theinert
 */
 
//Sticky-Navigation-Bar Grundfunktion von https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_navbar_sticky
//Go-To-Top-Button Grundfunktion von https://www.w3schools.com/howto/howto_js_scroll_to_top.asp

//Sticky-Navigation-Bar Grundfunktion:
//----------- Anfang -----------
document.addEventListener("DOMContentLoaded", initial);

window.onscroll = function() { scrollFunction() };

function initial() {
	document.getElementById("goToTopButton").addEventListener("click", goToTop);
}

window.onscroll = function() { myFunctionGoToTop() };

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;
//----------- Ende -----------

//Go-To-Top-Button Grundfunktio:
//----------- Anfang -----------
function myFunctionGoToTop() {
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
//----------- Ende -----------