document.addEventListener("DOMContentLoaded", init);

function init() {
	document.getElementById("profilkonfigurationsform").addEventListener("submit", pwKontrolle);	
	document.getElementById("profilkonfigurationsform").addEventListener("reset", resetBestaetigen);
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