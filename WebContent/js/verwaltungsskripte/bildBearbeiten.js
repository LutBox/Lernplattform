/*
 * Erstellt von Lukas Theinert
 */

"use strict";

var bildBeschreibung = document.getElementById("bildBeschreibung").innerHTML;
const kategorien = document.querySelectorAll(".kategorie");

var auswahl = document.getElementById(bildBeschreibung);
auswahl.checked = true


kategorien.forEach(kategorie => kategorie.addEventListener("click", click));

function click() {
	let kategorie = document.getElementById(this.id);
	kategorie.checked = true
	document.getElementById("bildBeschreibung").innerHTML = this.id
}

document.getElementById("delete").onclick = function() {
	var deleteBild = confirm("Möchten Sie das Bild wirklich löschen?");
	if(deleteBild){
		location.href = "http://localhost:8080/Lernplattform/AlleBilderAnzeigenServlet";
	}
	
}

document.getElementById("safe").onclick = function() {
	//safe();
	var safeBild = confirm("Möchten Sie das Bild wirklich speichern?");
	if(safeBild){
		safe();
		//window.location.href = "${pageContext.request.contextPath}/AlleBilderAnzeigenServlet";
		window.location.href = "/Lernplattform/AlleBilderAnzeigenServlet";
	}
	
}

document.getElementById("abbruch").onclick = function() {
	var abbruch = confirm("Möchten Sie wirklich abbrechen?");
	//.href = "http://localhost:8080/Lernplattform/AlleBilderAnzeigenServlet";	
	window.location.href = "http://localhost:8080/Lernplattform/AlleBilderAnzeigenServlet";
}

function safe(){
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
}	