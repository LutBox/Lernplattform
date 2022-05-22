/*
Erstellt von Lukas Theinert

Idee für den Scroll-To_Top Button ist von W3Schools übernommen, siehe:
https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_navbar_sticky

Idee für den Scroll-To_Top Button ist von W3Schools übernommen, siehe:
https://www.w3schools.com/howto/howto_js_scroll_to_top.asp
 */
 
document.addEventListener("DOMContentLoaded", initial);
document.addEventListener("DOMContentLoaded", datenBank);

window.onscroll = function() {scrollFunction()};

function initial() {
document.getElementById("goToTopButton").addEventListener("click", goToTop);
} 

window.onscroll = function() {myFunctionGoToTop()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

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

"use strict";

function datenBank() {

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("liste1").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "indexBestenlisteAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send();

	//alert("Spiel in Datenbank gespeichert");
}

