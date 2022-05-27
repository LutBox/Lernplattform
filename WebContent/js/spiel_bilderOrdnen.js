//Erstellt von Lukas Theinert
//Bilder-Ordnen-Idee von Tutorial: https://codepen.io/Coding_Journey/pen/YzKpLvE

let correct = 0;
let total = 0;
const totalDraggableItems = document.querySelectorAll('.draggable').length;
const totalMatchingPairs = document.querySelectorAll('.droppable').length;
const draggableElements = document.querySelectorAll(".draggable");
const droppableElements = document.querySelectorAll(".droppable");

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
	totalFlips: 0,
	totalTime: 0,
	loop: null
}

//Starten sobald Button gedrückt oder Bild angelickt wird
const attachEventListeners = () => {

	document.addEventListener('click', event => {
		const eventTarget = event.target
		if (eventTarget.nodeName === 'BUTTON' && state.gameStarted === false) {
			startGame()
		}
	})

	document.addEventListener('drag', event => {
		const eventTarget = event.target
		if (eventTarget.nodeName === 'IMG' && state.gameStarted === false) {
			startGame()
		}
	})
}

//Spiel wurde gestartet, Timer und Versuche aktualisieren
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

//Bilder werden gemischt
(function bildMischen() {
	droppableElements.forEach(droppableElements => {
		let randomPos = Math.floor(Math.random() * 12);
		droppableElements.style.order = randomPos;
	});
})();

//Wörter werden gemischt
(function wortMischen() {
	draggableElements.forEach(draggableElements => {
		let randomPos = Math.floor(Math.random() * 12);
		draggableElements.style.order = randomPos;
	});
})();

//Bilder-Ordnen-Idee von Tutorial: https://codepen.io/Coding_Journey/pen/YzKpLvE
//----------- Anfang ----------------------
draggableElements.forEach(elem => {
	elem.addEventListener("dragstart", dragStart);
});

droppableElements.forEach(elem => {
	elem.addEventListener("dragenter", dragEnter);
	elem.addEventListener("dragover", dragOver);
	elem.addEventListener("dragleave", dragLeave);
	elem.addEventListener("drop", drop);
});

// Drag and Drop Functions
//Events fired on the drag target
function dragStart(event) {
	event.dataTransfer.setData("text", event.target.id);
}

	//Events fired on the drop target
	function dragEnter(event) {
		if (!event.target.classList.contains("dropped")) {
			event.target.classList.add("droppable-hover");
		}
	}

	function dragOver(event) {
		if (!event.target.classList.contains("dropped")) {
			event.preventDefault(); // Prevent default to allow drop
		}
	}

	function dragLeave(event) {
		if (!event.target.classList.contains("dropped")) {
			event.target.classList.remove("droppable-hover");
		}
	}

	function drop(event) {
		event.preventDefault(); // This is in order to prevent the browser default handling of the data
		event.target.classList.remove("droppable-hover");
		const draggableElementData = event.dataTransfer.getData("text");
		const droppableElementData = event.target.getAttribute("data-draggable-id");
		//alert("Draggable: " + draggableElementData + " -> Droppable: " + droppableElementData);
		const isCorrectMatching = draggableElementData === droppableElementData;
		state.totalFlips++

		if (isCorrectMatching) {
			const draggableElement = document.getElementById(draggableElementData);
			event.target.classList.add("dropped");
			event.target.style.backgroundColor = window.getComputedStyle(draggableElement).color;
			draggableElement.classList.add("dragged");
			draggableElement.setAttribute("draggable", "false");
			event.target.insertAdjacentHTML("afterbegin", `<i class="fas fa-${draggableElementData}"></i>`);
			correct++;
		}
	//----------- Ende ----------------------  

	//Prüfen ob Spiel zuende ist
	if (correct === totalDraggableItems) {

		setTimeout(() => {

			document.getElementById("buttonStart").style.display = "none";
			document.getElementById("start").style.visibility = "hide";
			document.getElementById("buttonRestart").style.display = "block";

			selectors.win.innerHTML = `       
                    Du hast gewonnen!<br />       
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

//Datenbankeintrag
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
	xmlhttp.open("POST", "BilderOrdnenAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);

	alert("Spiel in Datenbank gespeichert");
}

attachEventListeners()