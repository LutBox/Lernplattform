/**
 * @author Merlin
 */

document.addEventListener("DOMContentLoaded", init);

function init() {
	document.getElementById("suchenbutton").addEventListener("click",
			changeContent);
	/*
	 * w3schools:
	 * https://www.w3schools.com/howto/howto_js_trigger_button_enter.asp START
	 */
	document.getElementById("fragment").addEventListener("keypress",
			function(evnent) {
				if (event.key === "Enter") {
					event.preventDefault();
					document.getElementById("suchenbutton").click();
				}
			});
	/*
	 * w3schools:
	 * https://www.w3schools.com/howto/howto_js_trigger_button_enter.asp END
	 */
}

function changeContent() {
	var searchURL = "../../NutzerSucheServlet";
	var fragment = document.getElementById("fragment").value;
	if (fragment != null && fragment.length > 0)
		searchURL += "?fragment=" + encodeURIComponent(fragment);

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("suchergebnisse").innerHTML = xmlhttp.responseText;
			
			var forms = document.getElementsByClassName("loeschenformular");
			for ( var i = 0; i < forms.length; i++) {
				form = forms[i];
				form.addEventListener("click", function(evt){
					var nutzer = this.querySelector(".delNutzername").value;
					console.log(nutzer);
					var wirklichLoeschen = confirm("Möchten Sie den Nutzer "+nutzer+" wirklich löschen?");
					if (wirklichLoeschen){
						var delURL ="../../NutzerLoeschenServlet";
						var xmlhttpDel = new XMLHttpRequest();
						xmlhttpDel.onreadychange = function() {
							if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
								document.getElementById("suchenbutton").click();
							}
						};
						xmlhttpDel.open("POST",delURL,true);
						console.log(encodeURIComponent(nutzer));
						xmlhttpDel.send("zuloeschenderNutzer"+encodeURIComponent(nutzer));
					}
				});
			}
		}
	};
	xmlhttp.open("GET", searchURL, true);
	xmlhttp.send();

}