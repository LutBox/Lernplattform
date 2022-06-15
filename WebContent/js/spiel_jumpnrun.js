/*
 * Erstellt von Lukas Theinert
 */

"use strict";

//-------------------------------
//---------- Animation ----------
//-------------------------------

var spielGestartet = false;
var bilderFigur = [];
var bilderVogel = [];
var indexFigur = 0;
var indexVogel = 0;
var timerAn = document.getElementById("timerID").innerHTML;
var gewertetAn = document.getElementById("gewertet").innerHTML;


document.getElementById("stein").src = 'bilder/jumpnrun/stein1.png';

bilderFigur[0] = ['bilder/jumpnrun/figur1.png'];
bilderFigur[1] = ['bilder/jumpnrun/figur2.png'];

function animationFigur() {
		document.getElementById("figur").src = bilderFigur[indexFigur];
		if(spielGestartet){
			if (indexFigur == 1) {
				indexFigur = 0;
			} else {
				indexFigur++;
			}
		}
		
	//alert("Test")
	setTimeout(animationFigur, 100);	
}

bilderVogel[0] = ['bilder/jumpnrun/vogel1.png'];
bilderVogel[1] = ['bilder/jumpnrun/vogel2.png'];

function animationVogel() {
		document.getElementById("vogel").src = bilderVogel[indexVogel];
		if(spielGestartet){
			if (indexVogel == 1) {
				indexVogel = 0;
			} else {
				indexVogel++;
			}
		}
		
	//alert("Test")
	setTimeout(animationVogel, 100);	
}

//--------------------------
//---------- Zeit ----------
//--------------------------

var zeit = 0;

function startZeit(){
		actionZeit = setInterval(function() {
		if(spielGestartet){
			zeit++			
			if(timerAn === "timerAn"){document.getElementById("zeit").innerHTML = zeit;}			
		}
	}, 1000)
}
	

//------------------------------
//---------- Versuche ----------
//------------------------------

var anzahlLeben

if(document.getElementById("schwierigkeit").innerHTML === "leicht"){
	anzahlLeben = 3;
} else if(document.getElementById("schwierigkeit").innerHTML === "mittel"){
	anzahlLeben = 2;
} else {
	anzahlLeben = 1;
}
document.getElementById("leben").innerHTML = anzahlLeben;

function verloren(){
	anzahlLeben--;
	if(anzahlLeben === 0){
		spielGestartet = false;
		
		//DatenbankEintrag
		if (document.getElementById("nutzer").innerHTML !== "") {
			datenbank();
			//alert(document.getElementById("nutzer").innerHTML);
		}
		
		document.getElementById("buttonStart").style.visibility = "hidden";
		document.getElementById("figur").style.display = "none";
		document.getElementById("vogel").style.display = "none";
		document.getElementById("stein").style.display = "none";
		
		if(timerAn === "timerAn"){
			document.getElementById("zeitLayout").style.display = "none";
		}
		if(timerAn === "TimerAus" && gewertetAn === "gewertetAus"){
			document.getElementById("infos").style.display = "none";
		} else {
			document.getElementById("lebenLayout").style.display = "none";
		}
		
		document.getElementById("spielVorbei").style.display = "block";
		
	}
	document.getElementById("leben").innerHTML = anzahlLeben;	
}

//-------------------------------
//---------- Verhalten ----------
//-------------------------------

var figur = document.getElementById("figur");
var vogel = document.getElementById("vogel");
var stein = document.getElementById("stein");
var counter = 0;
var zeitStein = 2.1
var zeitVogel = 5.1;
var actionStein, actionVogel, actionZeit, checkGetroffenStein, checkGetroffenVogel;

//Figur: Springen
function jump() {
	
	//Schwierigkeitsgrade
	if(counter < 10){
		figur.style.animation = "jump 0.6s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 600);
	} else if (counter >= 10 && counter < 50){
		figur.style.animation = "jump 0.3s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 300);
	} else {
		figur.style.animation = "jump 0.2s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 200);
	} 
}

//Figur: Ducken
function ducken() {

	//Schwierigkeitsgrade
	if(counter < 10){
		figur.style.animation = "ducken 0.6s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 600);
	} else if (counter >= 10 && counter < 20){
		figur.style.animation = "ducken 0.45s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 450);
	} else if (counter >= 20 && counter < 50){
		figur.style.animation = "ducken 0.3s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 300);
	} else {
		figur.style.animation = "ducken 0.2s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 200);
	} 
	
}

//Hinderniss: Stein erscheinen lassen
function hindernisStein() {
	//Zufällig alle 10 - 40 Sekunden einen Stein erscheinen lassen -> mit 1 Nachkommastellen
	 zeitStein = Math.round(Math.random() * (60 - 20 + 10) + 20);
	
	if(spielGestartet){
		actionStein = setInterval(function() {
			zeitStein -= 10;
			document.getElementById("timerStein").innerHTML = zeitStein;
			//alert("Zeit: " + zeitStein)
	
			if(zeitVogel < 15 && zeitStein < 15){
				//alert("ZeitStein: " + zeitStein + " ZeitVogel: " + zeitVogel);
				zeitStein = Math.round(Math.random() * (60 - 20 + 10) + 20);
			}
	
			if (zeitStein <= 10) {
	      		stein.style.visibility = "visible";
	      		
	      		//Schwierigkeitsgrade
	      		if(counter < 10){
					stein.style.animation = "stein 2s linear";
				} else if (counter >= 10 && counter < 20){
					stein.style.animation = "stein 1.5s linear";
				} else if (counter >= 20 && counter < 30){
					stein.style.animation = "stein 1.0s linear";
				} else if (counter >= 30 && counter < 40){
					stein.style.animation = "stein 0.8s linear";
				} else if (counter >= 40 && counter < 50){
					stein.style.animation = "stein 0.7s linear";
				} else {
					stein.style.animation = "stein 0.6s linear";
				} 
				
				stopCountdownStein();
				checkStein();
			}
		}, 100);
	}
}

//Hinderniss: Vogel erscheinen lassen
function hindernisVogel() {
	//Zufällig alle 6 - 2 Sekunden einen Vogel erscheinen lassen -> mit 1 Nachkommastellen
	zeitVogel = zeitVogel = Math.round(Math.random() * (60 - 20 + 10) + 20);

	
	if(spielGestartet){
		actionVogel = setInterval(function() {
			zeitVogel -= 10;
			document.getElementById("timerVogel").innerHTML = zeitVogel;
	
			//if(zeitVogel - zeitStein <= 2 && zeitVogel - zeitStein >= 0 || zeitStein - zeitVogel <= 2 && zeitStein - zeitVogel >= 0){
			if(zeitVogel < 15 && zeitStein < 15){
				//alert("ZeitStein: " + zeitStein + " ZeitVogel: " + zeitVogel);
				zeitVogel = Math.round(Math.random() * (60 - 20 + 10) + 20);
			}
	
			if (zeitVogel <= 10) {
	      		vogel.style.visibility = "visible";
	      		
	      		//Schwierigkeitsgrade
	      		if(counter < 10){
					vogel.style.animation = "vogel 2s linear";
				} else if (counter >= 10 && counter < 20){
					vogel.style.animation = "vogel 1.5s linear";
				} else if (counter >= 20 && counter < 30){
					vogel.style.animation = "vogel 1.0s linear";
				} else if (counter >= 30 && counter < 40){
					vogel.style.animation = "vogel 0.8s linear";
				} else if (counter >= 40 && counter < 50){
					vogel.style.animation = "vogel 0.7s linear";
				} else {
					vogel.style.animation = "vogel 0.6s linear";
				} 
				
				stopCountdownVogel();
				checkVogel();
			}
		}, 100);
	}
}


//Timer stoppen
function stopCountdownStein() {
	clearInterval(actionStein);
}
function stopCountdownVogel() {
	clearInterval(actionVogel);
}
function stopCheckStein() {
	clearInterval(checkGetroffenStein);
	document.getElementById("steinLinks").innerHTML = "gestoppt";
}
function stopCheckVogel() {
	clearInterval(checkGetroffenVogel);
	document.getElementById("vogelLinks").innerHTML = "gestoppt";
}

function checkStein() {

	checkGetroffenStein = setInterval(function() {
		let figurTopp = parseInt(window.getComputedStyle(figur).getPropertyValue("top"));
		let steinLinks = parseInt(window.getComputedStyle(stein).getPropertyValue("left"));

		document.getElementById("steinLinks").innerHTML = steinLinks;
		if (steinLinks <= -105) {
			if (figurTopp >= 325) {
				if(counter > 0){
          			counter--;	
        		}
        	verloren();
			} else {
        		counter++;
     		}
      		document.getElementById("scoreSpan").innerHTML = counter;
      		stein.style.visibility = "hidden";			
			stein.style.animation = "none";
			stopCheckStein()
			hindernisStein()      
		} 
	}, 10);

}

function checkVogel() {

	checkGetroffenVogel = setInterval(function() {
		let figurTop = parseInt(window.getComputedStyle(figur).getPropertyValue("top"));
		let vogelLinks = parseInt(window.getComputedStyle(vogel).getPropertyValue("left"));

		document.getElementById("vogelLinks").innerHTML = vogelLinks;
		if (vogelLinks <= -65) {
			if (figurTop <= 350) {
				if(counter > 0){
          			counter--;         		
        		}
        	verloren();
			} else {
        		counter++;
     		}
      		document.getElementById("scoreSpan").innerHTML = counter;
      		vogel.style.visibility = "hidden";	
			vogel.style.animation = "none";
			stopCheckVogel()
			hindernisVogel()
      
		} 

	}, 10);

}

//----------------------------
//---------- Datenbank -------
//----------------------------

function datenbank() {
	//alert("Zeit= " + zeit + " Versuche: " + counter)

	var sendData = "zeit=" + zeit + "&versuche=" + counter;

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "JumpnrunAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);

	//alert("Spiel in Datenbank gespeichert");
}

//----------------------------
//---------- Events ----------
//----------------------------

//Restart-Button
document.getElementById("restartButton").onclick = function() {
	window.location.reload();
}

//Start-Button
document.getElementById("start").addEventListener("click", start);
function start(){
	spielGestartet = true
	hindernisStein();
	hindernisVogel();
	animationFigur();
	animationVogel();
	startZeit();
	document.getElementById("start").disabled = 'true';
}

//Spiel-Steuerung
document.addEventListener('keydown', (event) => {
    var name = event.key;
    var code = event.code;
    if (name === 'ArrowUp' || name === 'w' || code === 'Space') {
        jump()
    }
    if (name === 'ArrowDown' || name === 's') {
        ducken()
    }

  }, false);