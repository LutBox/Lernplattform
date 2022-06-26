/**
 * @author Merlin
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	document.getElementById("profilkonfigurationsform").addEventListener("submit", pwKontrolle);	
	document.getElementById("profilkonfigurationsform").addEventListener("reset", resetBestaetigen);
	
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



function resetBestaetigen(evt){
	var wirklichZuruecksetzen = confirm("Formular wirklich zurÃ¼cksetzen?");
	if (!wirklichZuruecksetzen) {
		evt.preventDefault();
	}
}

function pwKontrolle(evt){
	var gueltig = document.getElementById("passwort").value === document.getElementById("passwort2").value;
	if (!gueltig) {
		evt.preventDefault();
		alert("Die PasswÃ¶rter mÃ¼ssen Ã¼bereinstimmen!");
	}
}
