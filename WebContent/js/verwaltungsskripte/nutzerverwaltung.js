/**
 * @author Merlin
 */

document.addEventListener("DOMContentLoaded", init);

function init() {
	document.getElementById("suchenbutton").addEventListener("click",
			changeContent);
	/**
	 * @source w3schools: https://www.w3schools.com/howto/howto_js_trigger_button_enter.asp START
	 */
	document.getElementById("fragment").addEventListener("keypress",
			function(evnent) {
				if (event.key === "Enter") {
					event.preventDefault();
					document.getElementById("suchenbutton").click();
				}
			});
	/**
	 * @source w3schools: https://www.w3schools.com/howto/howto_js_trigger_button_enter.asp END
	 */
}

function changeContent() {
	var searchURL = "../../NutzerSucheServlet";
	var fragment = document.getElementById("fragment").value;
	if (fragment != null && fragment.length > 0)
		searchURL += "?fragment=" + encodeURIComponent(fragment);

	var xmlhttpSearch = new XMLHttpRequest();
	xmlhttpSearch.addEventListener("load",function() {
		document.getElementById("suchergebnisse").innerHTML = xmlhttpSearch.responseText;
		keinProfilbild();
		loeschenBestaetigenLaden();
	});
	xmlhttpSearch.open("GET", searchURL, true);
	xmlhttpSearch.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttpSearch.send();
}

function loeschenBestaetigenLaden(){
	var forms = document.getElementsByClassName("loeschenformular");
	for ( var i = 0; i < forms.length; i++) {
		var form = forms[i];
		form.addEventListener("click", loeschenBestaetigen);
	}
}

function loeschenBestaetigen(evt){
	var nutzer = this.querySelector(".nutzerMitNameXLoeschen").value;
	var wirklichLoeschen = confirm("Möchten Sie den Nutzer "+nutzer+" wirklich löschen?");
	if (wirklichLoeschen){
		var delURL ="../../NutzerLoeschenServlet";
		var xmlhttpDel = new XMLHttpRequest();
		xmlhttpDel.addEventListener("load",function() {
			document.getElementById("suchenbutton").click();
		});
		xmlhttpDel.open("POST",delURL,true);
		xmlhttpDel.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttpDel.send("nutzerMitNameXLoeschen="+encodeURIComponent(nutzer));
	}
}

/**
 * @source https://dillionmegida.com/p/default-image-src/
 */
function keinProfilbild(){
	var profilbilder = document.getElementsByClassName("profilbild");
	for ( var i = 0; i < profilbilder.length; i++) {
		profilbilder[i].addEventListener("error",
			function(evt) {
				evt.target.src = "http://localhost:8080/Lernplattform/bilder/standardProfilbild.jpg";
				evt.onerror = null;
			}
		);
	}
}
