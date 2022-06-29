/**
 * @author Merlin
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);


function init() {
	aktuellenStatusSetzen();
	document.getElementById("nutzerkonfigurationsform").addEventListener("submit", pwKontrolle);
	document.getElementById("nutzerkonfigurationsform").addEventListener("reset", resetBestaetigen);
	
	/**
	 * @source https://stackoverflow.com/questions/3717793/javascript-file-upload-size-validation START
	 */
	document.getElementById("neuesProfilbild").onchange = function(event) {
		var imgSize = this.files[0].size;
		if (imgSize > 64 * 1024){
			alert("Das Nutzerprofilbild darf maximal 64KB groß sein!");
			document.getElementById("neuesProfilbild").value = '';
		}
	};
	/**
	 * @source https://stackoverflow.com/questions/3717793/javascript-file-upload-size-validation END
	 */
}

function resetBestaetigen(evt) {
	var wirklichZuruecksetzen = confirm("Formular wirklich zurücksetzen?");
	if (!wirklichZuruecksetzen) {
		evt.preventDefault();
	}
}

function pwKontrolle(evt) {
	var gueltig = document.getElementById("neuesPasswort").value === document
			.getElementById("passwort2").value;
	if (!gueltig) {
		evt.preventDefault();
		alert("Die Passwörter müssen übereinstimmen!");
	} else {
		alert("Nutzer wurde aktualisiert!");
	}
}

function aktuellenStatusSetzen(){
	var aktuellerSatus = document.getElementById("aktuellerstatus").value;
	if (aktuellerSatus == 1) {
		/**
		 * @source StackOverflow: https://stackoverflow.com/questions/9476617/how-to-set-radio-button-status-with-javascript START
		 */ 
		document.getElementById("administrator").checked = true;
		/**
		 * @source StackOverflow: https://stackoverflow.com/questions/9476617/how-to-set-radio-button-status-with-javascript END
		 */
	} 
	if (aktuellerSatus == 0) {
		/**
		 * @source StackOverflow: https://stackoverflow.com/questions/9476617/how-to-set-radio-button-status-with-javascript START
		 */ 
		document.getElementById("regnutzer").checked = true;
		/**
		 * @source StackOverflow: https://stackoverflow.com/questions/9476617/how-to-set-radio-button-status-with-javascript START
		 */ 
	}
}

/**
 * @source https://dillionmegida.com/p/default-image-src/ START
 */
function keinProfilbild(){
	document.getElementById("profilbild").addEventListener("error", function(evt) {
		evt.target.src = "http://localhost:8080/Lernplattform/bilder/standardProfilbild.jpg";
		evt.onerror = null;
		}
	);
}

/**
 * @source https://dillionmegida.com/p/default-image-src/ END
 */