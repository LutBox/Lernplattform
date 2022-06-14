/**
 * @author Merlin
 */

document.addEventListener("DOMContentLoaded", init);

var form = document.getElementById("aenderungsformular");

function init() {
	form.addEventListener("submit", pwKontrolle);
	form.addEventListener("reset", resetBestaetigen);
}

function resetBestaetigen(evt) {
	var wirklichZuruecksetzen = confirm("Formular wirklich zurücksetzen?");
	if (!wirklichZuruecksetzen) {
		evt.preventDefault();
	}
}

function pwKontrolle(evt) {
	var gueltig = document.getElementById("passwort").value === document
			.getElementById("passwort2").value;
	if (!gueltig) {
		evt.preventDefault();
		alert("Die Passwörter müssen übereinstimmen!");
	}
}