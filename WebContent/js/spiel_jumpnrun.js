//Erstellt von Lukas Theinert

//KEIN USE STRICT!!!
//"use strict";

//-------------------------------
//---------- Animation ----------
//-------------------------------

var spielGestartet = false;
var bilderFigur = [];
var index = 0;

bilderFigur[0] = ['bilder/jumpnrun/figur1.png'];
bilderFigur[1] = ['bilder/jumpnrun/figur2.png'];

function change() {
		document.getElementById("figur").src = bilderFigur[index];
		if (index == 1) {
			index = 0;
		} else {
			index++;
		}
	//alert("Test")
	setTimeout(change, 100);	
}


//-------------------------------
//---------- Verhalten ----------
//-------------------------------

var figur = document.getElementById("figur");
var vogel = document.getElementById("vogel");
var stein = document.getElementById("stein");
var counter = 0;

//Figur: Springen
function jump() {
	if (figur.classList == "animate") { return }
	figur.classList.add("animate");
	setTimeout(function() {
		figur.classList.remove("animate");
	}, 500);
}

//Figur: Ducken
function ducken() {
	if (figur.classList == "ducken") { return }
	figur.classList.add("ducken");
	setTimeout(function() {
		figur.classList.remove("ducken");
	}, 500);
}

//Hinderniss: Stein erscheinen lassen
function hindernisStein() {
	//Zufällig alle 3 - 10 Sekunden einen Stein erscheinen lassen
	var zeitStein = Math.floor(Math.random() * (4 - 2 + 1) + 2)

	actionStein = setInterval(function() {
		zeitStein -= 1;
		document.getElementById("timerStein").innerHTML = zeitStein;
		//alert("Zeit: " + zeitStein)

		if (zeitStein === 0) {
      stein.style.visibility = "visible";
			stein.style.animation = "stein 1s linear";
			stopCountdownStein();
			checkStein();
		}
	}, 1000);
}

//Hinderniss: Vogel erscheinen lassen
function hindernisVogel() {
	//Zufällig alle 8 - 12 Sekunden einen Vogel erscheinen lassen
	var zeitVogel = Math.floor(Math.random() * (6 - 2 + 1) + 2)

	actionVogel = setInterval(function() {
		zeitVogel -= 1;
		document.getElementById("timerVogel").innerHTML = zeitVogel;
		
		if (zeitVogel === 0) {
      vogel.style.visibility = "visible";
      vogel.style.animation = "vogel 1s linear";
			stopCountdownVogel();
			checkVogel();
		}
	}, 1000);
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
          counter--;
        }
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
          counter--;
        }
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
	change();
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