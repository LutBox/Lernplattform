/*
 * Erstellt von Lukas Theinert
 */

"use strict";

//-------------------------------
//---------- Verhalten ----------
//-------------------------------

var bildBeschreibung = document.getElementById("bildBeschreibung").innerHTML;
const kategorien = document.querySelectorAll(".kategorie");

var auswahl = document.getElementById(bildBeschreibung);
auswahl.checked = true

//Änderungen speichern
function safeBildFunction(){
		var bildID = document.getElementById("bildID").innerHTML;
		var neuKategorie = document.getElementById("bildBeschreibung").innerHTML;
		var sendData = "neuKategorie=" + neuKategorie + "&bildID=" + bildID;
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BildBearbeitenAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);
	
	window.location.href = "/Lernplattform/html/verwaltungsseiten/spielekonfigurator.jsp";
}

//Bild löschen
function deleteBildFunction(){
		var bildID = document.getElementById("bildID").innerHTML;
		var sendData = "bildID=" + bildID;
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BildEntfernenAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);
	
	window.location.href = "/Lernplattform/html/verwaltungsseiten/spielekonfigurator.jsp";
}	

//Kategorie auswählen
function click() {
	let kategorie = document.getElementById(this.id);
	kategorie.checked = true
	document.getElementById("bildBeschreibung").innerHTML = this.id
}

//----------------------------
//---------- Events ----------
//----------------------------

kategorien.forEach(kategorie => kategorie.addEventListener("click", click));

document.getElementById("delete").onclick = function() {
	var deleteBild = confirm("Wollen Sie das Bild wirklich entfernen?");
	if(deleteBild){
		deleteBildFunction();
	}	
}
document.getElementById("safe").onclick = function() {
	safeBildFunction();
}


document.getElementById("abbruch").onclick = function() {
	window.location.href = "/Lernplattform/html/verwaltungsseiten/spielekonfigurator.jsp";
}