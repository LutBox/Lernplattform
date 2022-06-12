/**
 * @author Merlin
 */

document.addEventListener("DOMContentLoaded", init);

function init() {
	var forms = document.getElementsByClassName("loeschenformular");
	for ( var i = 0; i < forms.length; i++) {
		var form = forms[i];
		form.addEventListener("submit", loeschenbestaetigen);
	}

}

function loeschenbestaetigen(evt) {
	var wirklichloeschen = confirm("Möchten Sie den Nutzer wirklich löschen?");
	if (!wirklichloeschen) {
		evt.preventDefault();
	} else {
		alert("Der Nutzer wurde gelöscht!");
	}
}