//Erstellt von Lukas Theinert

//KEIN USE STRICT!!!
//"use strict";

//-------------------------------
//---------- Animation ----------
//-------------------------------

var spielGestartet = false;
var bilderFigur = [];
var bilderVogel = [];
var indexFigur = 0;
var indexVogel = 0;

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
			document.getElementById("zeit").innerHTML = zeit;
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
		alert("Du hast verloren!");
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
	} else if (counter >= 50 && counter < 70){
		figur.style.animation = "jump 0.2s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 300);
	} else if (counter >= 70 && counter < 90){
		figur.style.animation = "jump 0.1s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 100);
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
	} else if (counter >= 50 && counter < 70){
		figur.style.animation = "ducken 0.2s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 300);
	} else if (counter >= 70 && counter < 90){
		figur.style.animation = "ducken 0.1s linear";
		setTimeout(function() {
			figur.style.animation = "none";
		}, 100);
	}
	
}

//Hinderniss: Stein erscheinen lassen
function hindernisStein() {
	//Zufällig alle 1 - 4 Sekunden einen Stein erscheinen lassen -> mit 1 Nachkommastellen
	 zeitStein = Math.round((Math.random() * (4 - 1 + 1) + 1)*10)/10;
	
	if(spielGestartet){
		actionStein = setInterval(function() {
			zeitStein -= 1;
			document.getElementById("timerStein").innerHTML = zeitStein;
			//alert("Zeit: " + zeitStein)
	
			if(zeitVogel < 1.5 && zeitStein < 1.5){
				//nochmal()
				//alert("ZeitStein: " + zeitStein + " ZeitVogel: " + zeitVogel);
				zeitStein = Math.round((Math.random() * (4 - 2 + 1) + 2)*10)/10;
			}
	
			if (zeitStein <= 1) {
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
				} else if (counter >= 50 && counter < 60){
					stein.style.animation = "stein 0.6s linear";
				} else {
					stein.style.animation = "stein 0.5s linear";
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
	zeitVogel = Math.round((Math.random() * (6 - 2 + 1) + 2)*10)/10;
	
	if(spielGestartet){
		actionVogel = setInterval(function() {
			zeitVogel -= 1;
			document.getElementById("timerVogel").innerHTML = zeitVogel;
	
			//if(zeitVogel - zeitStein <= 2 && zeitVogel - zeitStein >= 0 || zeitStein - zeitVogel <= 2 && zeitStein - zeitVogel >= 0){
			if(zeitVogel < 1.2 && zeitStein < 1.2){
				//nochmal()
				//alert("ZeitStein: " + zeitStein + " ZeitVogel: " + zeitVogel);
				zeitVogel = Math.round((Math.random() * (6 - 2 + 1) + 2)*10)/10;
			}
	
			if (zeitVogel <= 1) {
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
				} else if (counter >= 50 && counter < 60){
					vogel.style.animation = "vogel 0.6s linear";
				} else {
					vogel.style.animation = "vogel 0.5s linear";
				}
				
				stopCountdownVogel();
				checkVogel();
			}
		}, 100);
	}
}

function nochmal(){
	//alert("ZeitStein: " + zeitStein + " ZeitVogel: " + zeitVogel);
	zeitVogel = Math.round((Math.random() * (6 - 2 + 1) + 2)*10)/10;
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
		let figurTop = parseInt(window.getComputedStyle(figur).getPropertyValue("top"));
		let steinLinks = parseInt(window.getComputedStyle(stein).getPropertyValue("left"));

		document.getElementById("steinLinks").innerHTML = steinLinks;
		if (steinLinks <= -100) {
			if (figurTop >= 325 && steinLinks <= -80) {
				if(counter > 0){
          			counter++;	
        		}
        	//verloren();
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
		if (vogelLinks <= -80) {

			if (figurTop <= 350 && vogelLinks <= -40) {
				if(counter > 0){
          			counter++;         		
        		}
        	//verloren();
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
//---------- Events ----------
//----------------------------

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