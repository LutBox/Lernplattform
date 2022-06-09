
// Todo Fix


function timer() {
  var countDownDate = new Date(document.getElementById("t1").getAttribute("data-endzeit")).getTime();

  // Get today's date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Output the result in an element with id="demo"
  document.getElementById("t1").innerHTML = minutes + ":" + seconds;
  


  // If the count down is over, write some text 
  if (distance < 0) {
	datenbankEintrag()
    window.location.href = "html/spieleseiten/spiel_bilderWort_ergebnis.jsp"
  }


}
window.onload = function () {
  
  timer()
  // Update the count down every 1 second
  var x = setInterval(function () {
    timer()
  }, 1000);

}

//Datenbankeintrag
"use strict";

function datenbankEintrag() {
	
	var punkt =document.getElementById("insgesamt_Punkte").innerHTML;
	var versuche = document.getElementById("erreichte_Punkte").innerHTML;
	//alert("Punkte insgesamt: " + punkt + " Erreichte Punkte: " + versuche)
	var sendData = "punkt=" + punkt + "&versuche=" + versuche;

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BilderWortAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);

	//alert("Spiel in Datenbank gespeichert");
}
