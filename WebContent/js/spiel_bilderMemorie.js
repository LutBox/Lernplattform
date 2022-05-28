//Erstellt von Lukas Theinert

"use strict";

function datenbankEintrag() {

	var zeit = state.totalTime;
	var versuche = state.totalFlips;

	var sendData = "zeit=" + zeit + "&versuche=" + versuche;

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BilderMemorieAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);

	//alert("Spiel in Datenbank gespeichert");
}


//Spiel
const karten = document.querySelectorAll('.memorieKarte');

const selectors = {
	boardContainer: document.querySelector('.board-container'),
	board: document.querySelector('.board'),
	moves: document.querySelector('.moves'),
	timer: document.querySelector('.timer'),
	start: document.querySelector('button'),
	win: document.querySelector('.win')
}

const state = {
	gameStarted: false,
	flippedCards: 0,
	totalFlips: 0,
	totalTime: 0,
	loop: null
}


const startGame = () => {
	state.gameStarted = true

	state.loop = setInterval(() => {
		state.totalTime++

		//alert(document.getElementById("gewertet").innerHTML);
			
		if (document.getElementById("gewertet").innerHTML === "gewertetAn") {
			selectors.moves.innerText = `Versuche: ${state.totalFlips} `
		}
		
		if (document.getElementById("timerID").innerHTML === "timerAn") {
			selectors.timer.innerText = `Zeit: ${state.totalTime} Sekunden`
		}
		
	}, 1000)
}


const attachEventListeners = () => {
	document.addEventListener('click', event => {
		const eventTarget = event.target
		const eventParent = eventTarget.parentElement

		if (eventTarget.nodeName === 'BUTTON' && state.gameStarted === false) {
			startGame()
		}
		if (eventTarget.nodeName === 'IMG' && state.gameStarted === false) {
			startGame()
		}
	})
}


//Memorie-Idee von Tutorial: https://www.freecodecamp.org/news/vanilla-javascript-tutorial-build-a-memory-game-in-30-minutes-e542c4447eae
//----------- Anfang ----------------------
let istUmgedreht = false;
let istAufgedeckt = false;
let ersteKarte, zweiteKarte;

function karteVorneDrehen() {
	if (istAufgedeckt) return;
	if (this === ersteKarte) return;
	state.totalFlips++
	state.flippedCards++
	this.classList.add('drehen');

	if (!istUmgedreht) {
		istUmgedreht = true;
		ersteKarte = this;
		return;
	}

	zweiteKarte = this;
	versuchChecken();
}

function versuchChecken() {
	let isMatch = ersteKarte.dataset.framework === zweiteKarte.dataset.framework;
	isMatch ? kartenDeaktivieren() : karteHintenDrehen();

	if (state.flippedCards === document.querySelectorAll('.memorieKarte').length) {
		//  if(isMatch){
		setTimeout(() => {
			selectors.boardContainer.classList.add('flipped')
			document.getElementById("controls").style.visibility = "hide";
			document.getElementById("board-container").style.visibility = "visible";
			selectors.win.innerHTML = `       
                    Du hast gewonnen!<br />       
                    Versuche: <span class="highlight">${state.totalFlips}</span><br />
                    Zeit: <span class="highlight">${state.totalTime}</span> Sekunden
            `
			clearInterval(state.loop)			
			//DatenbankEintrag
			if (document.getElementById("nutzer").innerHTML !== "") {
				datenbankEintrag();	
				//alert(document.getElementById("nutzer").innerHTML);
			}
		}, 1000)
	}
}

function isEmpty(obj) {
    for(var key in obj) {
        if(obj.hasOwnProperty(key))
            return false;
    }
    return true;
}

function unhideRestart() {
	document.getElementByID().style.visability = 'restart';
}



function kartenDeaktivieren() {
	ersteKarte.removeEventListener('click', karteVorneDrehen);
	zweiteKarte.removeEventListener('click', karteVorneDrehen);

	versuchFalsch();
}

function karteHintenDrehen() {
	istAufgedeckt = true;

	state.flippedCards--;
	state.flippedCards--;

	setTimeout(() => {
		ersteKarte.classList.remove('drehen');
		zweiteKarte.classList.remove('drehen');

		versuchFalsch();
	}, 1500);
}

function versuchFalsch() {
	[istUmgedreht, istAufgedeckt] = [false, false];
	[ersteKarte, zweiteKarte] = [null, null];
}

(function kartenMischen() {
	karten.forEach(karte => {
		let randomPos = Math.floor(Math.random() * 12);
		karte.style.order = randomPos;
	});
})();
//----------- Ende ----------------------

karten.forEach(karte => karte.addEventListener('click', karteVorneDrehen));
attachEventListeners()
