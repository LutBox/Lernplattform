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
	 * @source Lukas Theinert Bilderverwaltung START
	 */
	document.getElementById("neuesProfilbild").onchange = function(event) {
		var img = document.getElementById('output');
		img.src = URL.createObjectURL(event.target.files[0]);
		img.onload = function() {
			var height = this.height;
			var width = this.width;
			if (!(height == 1024 && width == 1024)) {
				alert("Das von Ihnen gewählte Profilbild entspricht nicht der maximalen Größe von 1024 x 1024!");
				document.getElementById("neuesProfilbild").value = '';
			}	
		};
	};
	/**
	 * @source Lukas Theinert Bilderverwaltung END
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
 * @source https://dillionmegida.com/p/default-image-src/
 */
function keinProfilbild(){
	document.getElementById("profilbild").addEventListener("error", function(evt) {
		evt.target.src = "http://localhost:8080/Lernplattform/bilder/standardProfilbild.jpg";
		evt.onerror = null;
		}
	);
}
