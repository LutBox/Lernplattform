/*
 * Erstellt von Lukas Theinert
 */
 
 //Bild-Dimensionen auslesen-Idee von: https://stackoverflow.com/questions/8903854/check-image-width-and-height-before-upload-with-javascript

"use strict";

//----------------------------
//---------- Events ----------
//----------------------------

document.addEventListener("DOMContentLoaded", init);

//Absenden-Button deaktivieren und Vorschau-Bild verstecken
function init() {
	document.getElementById("output").style.display = 'none';
	document.getElementById("absenden").disabled = true;
	
}

//Bildhöhe und -breite auslesen
//Bild-Dimensionen auslesen-Idee:
//----------- Anfang ----------------------
document.getElementById("image").onchange = function(event) {
	var img = document.getElementById('output');
	img.src = URL.createObjectURL(event.target.files[0]);

	img.onload = function() {
		var height = this.height;
		var width = this.width;
		if (height == 128 && width == 128) {
			document.getElementById("output").style.display = 'inline-block';
			document.getElementById("absenden").disabled = false;			
		} else {
			alert("Das ausgewählte Bild muss die Dimensionen von 128*128 Pixel haben!");
		}	
	}
}
//----------- Ende ----------------------