//Erstellt von Lukas Theinert

document.addEventListener("DOMContentLoaded", besteSpieler);
document.addEventListener("DOMContentLoaded", beliebtesteSpiele);

"use strict";

function besteSpieler() {

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("besteSpieler").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BesteSpielerAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send();

	//alert("Spiel in Datenbank gespeichert");
}

function beliebtesteSpiele() {

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("beliebtesteSpiele").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BeliebtesteSpieleAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send();

	//alert("Spiel in Datenbank gespeichert");
}
