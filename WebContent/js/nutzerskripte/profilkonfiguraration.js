/**
 * @author Merlin
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	document.getElementById("profilkonfigurationsform").addEventListener("submit", pwKontrolle);	
	document.getElementById("profilkonfigurationsform").addEventListener("reset", resetBestaetigen);
	
	/**
	 * @source https://stackoverflow.com/questions/3717793/javascript-file-upload-size-validation START
	 */
	document.getElementById("neuesProfilbild").onchange = function(event) {
		var imgSize = this.files[0].size;
		if (imgSize > 64 * 1024){
			alert("Ihr Profilbild darf maximal 64 KB groß sein!");
			document.getElementById("neuesProfilbild").value = '';
		}
	};
	/**
	 * @source https://stackoverflow.com/questions/3717793/javascript-file-upload-size-validation END
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
