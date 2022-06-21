/**
 * @author Merlin
 */

document.addEventListener("DOMContentLoaded", sindKekseInDerDose);


function sindKekseInDerDose() {
	var kekseDa = navigator.cookieEnabled;
	if (kekseDa) {
		document.getElementById("cookiepopupbox").style.display = "none";
		document.getElementById("cookievorhang").style.display = "none";
	} else {
		document.getElementById("cookiepopupbox").style.display = "block";
		document.getElementById("cookievorhang").style.display = "block";
	}
}