/**
 * @author Merlin
 */

document.addEventListener("DOMContentLoaded", init);


function init() {
	document.getElementById("nutzerkonfigurationsform").addEventListener("submit", pwKontrolle);
	document.getElementById("nutzerkonfigurationsform").addEventListener("reset", resetBestaetigen);
	aktuellenStatusSetzen();
	//AJAX implementieren
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

function aktuellenStatusSetzen(){
	var aktuellerSatus = document.getElementById("aktuellerstatus").value;
	if (aktuellerSatus == 1) {
		// StackOverflow: https://stackoverflow.com/questions/9476617/how-to-set-radio-button-status-with-javascript START
		document.getElementById("administrator").checked = true;
		// StackOverflow: https://stackoverflow.com/questions/9476617/how-to-set-radio-button-status-with-javascript END
	} 
	if (aktuellerSatus == 0) {
		// StackOverflow: https://stackoverflow.com/questions/9476617/how-to-set-radio-button-status-with-javascript START
		document.getElementById("regnutzer").checked = true;
		// StackOverflow: https://stackoverflow.com/questions/9476617/how-to-set-radio-button-status-with-javascript END
	}
}

function changeContent() {
	var changeURL = "../../NutzerAktualisierenServlet";
	var name = document.getElementById("neuerName");
	var email = document.getElementById("neueEmail");
	var pw = document.getElementById("passwort");
	var status = 0;
	if (document.getElementById("administrator").checked === true) {
		status = 1;
	}
	console.log("Name: "+name);
	console.log("Email: "+email);
	console.log("Passwort: "+pw);
	console.log("Status: "+status);
}

