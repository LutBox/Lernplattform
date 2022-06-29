/**
 * @author Merlin
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	var forms = document.getElementsByClassName("loeschenformular");
	for ( var i = 0; i < forms.length; i++) {
		var form = forms[i];
		form.addEventListener("submit", loeschenbestaetigen);
	}
	document.getElementById("postfachButton").addEventListener("click",postfach);
	document.getElementById("archivButton").addEventListener("click",archiv);
}

function loeschenbestaetigen(evt) {
	var wirklichloeschen = confirm("Möchten Sie die Kontaktanfrage wirklich löschen?");
	if (!wirklichloeschen) {
		evt.preventDefault();
	}
}

/**
 * @source https://www.codegrepper.com/code-examples/javascript/javascript+button+click+scroll+to+id START
 */
function postfach(evt){
	document.getElementById("postfachheaderrow").scrollIntoView();
}

function archiv(evt) {
	document.getElementById("archivheaderrow").scrollIntoView();
}

/**
 * @source https://www.codegrepper.com/code-examples/javascript/javascript+button+click+scroll+to+id END
 */