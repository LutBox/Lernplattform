/*
 * Erstellt von Lukas Theinert
 */

"use strict";

//-------------------------------
//---------- Verhalten ----------
//-------------------------------

const kategorien = document.querySelectorAll(".kategorie");

//Bilder verstecken
function verstecken() {

	if (!document.getElementById(this.id).checked) {
		//document.getElementsByClassName(this.id).style.display = 'none';
		
		let elems = document.getElementsByClassName(this.id);
		for (var i = 0; i < elems.length; i += 1){
  			elems[i].style.display = 'none';
		}
		
		//alert("Verstecken:" + this.id)
	}
	
	if (document.getElementById(this.id).checked) {
		//document.getElementsByClassName(this.id).style.display = 'block';
		
		let elems = document.getElementsByClassName(this.id);
		for (var i = 0; i < elems.length; i += 1){
  			elems[i].style.display = 'block';
		}
		
		//alert("Zeigen:" + this.id)
	}
}

// Alle Checkboxes auswählen
function alleWahl(item){
	document.getElementById(item.id).checked = true;
	
	if (!document.getElementById(item.id).checked) {		
		let elems = document.getElementsByClassName(item.id);
		for (var i = 0; i < elems.length; i += 1){
  			elems[i].style.display = 'none';
		}
	}
	
	if (document.getElementById(item.id).checked) {		
		let elems = document.getElementsByClassName(item.id);
		for (var i = 0; i < elems.length; i += 1){
  			elems[i].style.display = 'block';
		}
	}
}

// Alle Checkboxes abwählen
function keineWahl(item){
	document.getElementById(item.id).checked = false;
	
	if (!document.getElementById(item.id).checked) {		
		let elems = document.getElementsByClassName(item.id);
		for (var i = 0; i < elems.length; i += 1){
  			elems[i].style.display = 'none';
		}
	}
	
	if (document.getElementById(item.id).checked) {		
		let elems = document.getElementsByClassName(item.id);
		for (var i = 0; i < elems.length; i += 1){
  			elems[i].style.display = 'block';
		}
	}
}

//----------------------------
//---------- Events ----------
//----------------------------

kategorien.forEach(kategorie => kategorie.addEventListener("click", verstecken));

// Aktualisieren
document.getElementById("aktualisieren").onclick = function() {
	window.location.reload();
}


document.getElementById("alle").onclick = function() {	
	kategorien.forEach(alleWahl);
}

// Alle Checkboxes abwählen
document.getElementById("keine").onclick = function() {	
	kategorien.forEach(keineWahl);
}
