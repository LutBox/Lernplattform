/*
 * Erstellt von Lukas Theinert
 */

"use strict";

//----------------------------
//---------- Events ----------
//----------------------------

document.addEventListener("DOMContentLoaded", besteSpieler);
document.addEventListener("DOMContentLoaded", beliebtesteSpiele);

//Bestenliste "Beste Spieler" aus Datenbank auslesen
function besteSpieler() {
	let url = "../../BesteSpielerAjax";
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("besteSpieler").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", url, true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send();

	//alert("Spiel in Datenbank gespeichert");
}

//Bestenliste "Beliebteste Spiele" aus Datenbank auslesen
function beliebtesteSpiele() {
	let url = "../../BeliebtesteSpieleAjax";

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("beliebtesteSpiele").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", url, true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send();

	//alert("Spiel in Datenbank gespeichert");
}
