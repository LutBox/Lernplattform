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

//----------------------------
//---------- Events ----------
//----------------------------

kategorien.forEach(kategorie => kategorie.addEventListener("click", verstecken));