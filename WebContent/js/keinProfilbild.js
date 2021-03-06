/**
 *	@author Merlin
 *	@source https://dillionmegida.com/p/default-image-src/
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init(){
	var profilbilder = document.getElementsByClassName("profilbild");
	for ( var i = 0; i < profilbilder.length; i++) {
		/**
		 *	@source https://dillionmegida.com/p/default-image-src/ START
		 */
		profilbilder[i].addEventListener("error",
			function(evt) {
				evt.target.src = "http://localhost:8080/Lernplattform/bilder/standardProfilbild.jpg";
				evt.onerror = null;
			}
		);
		/**
		 *	@source https://dillionmegida.com/p/default-image-src/ END
		 */
	}
}