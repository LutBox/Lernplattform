/**
 * @author Merlin
 */

document.addEventListener("DOMContentLoaded", init);

function init() {
	document.getElementById("profilkonfigurationsform").addEventListener("submit", pwKontrolle);	
	document.getElementById("profilkonfigurationsform").addEventListener("reset", resetBestaetigen);
	
	/**
	 * @source nicht von Merlin
	 */
//	document.getElementById("absenden").disabled = true;
//	document.getElementById("image").onchange = function(event) {
//		var img = document.getElementById('output');
//		img.src = URL.createObjectURL(event.target.files[0]);
//
//		img.onload = function() {
//			var height = this.height;
//			var width = this.width;
//			if (height == 128 && width == 128) {
//				document.getElementById("output").style.display = 'inline-block';
//				document.getElementById("absenden").disabled = false;			
//			} else {
//				alert("Das ausgew�hlte Bild muss eine Gr��e von 128*128 Pixel haben!");
//			}	
//		};
//	};
}

function resetBestaetigen(evt){
	var wirklichZuruecksetzen = confirm("Formular wirklich zurücksetzen?");
	if (!wirklichZuruecksetzen) {
		evt.preventDefault();
	}
}

function pwKontrolle(evt){
	var gueltig = document.getElementById("passwort").value === document.getElementById("passwort2").value;
	if (!gueltig) {
		evt.preventDefault();
		alert("Die Passwörter müssen übereinstimmen!");
	}
}
