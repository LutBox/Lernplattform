/*
 * Erstellt von Lukas Theinert
 */

//Bilder-Ordnen-Idee von Tutorial: https://codepen.io/Coding_Journey/pen/YzKpLvE

"use strict";

//-------------------------------
//---------- Verhalten ----------
//-------------------------------

//Const-Objekte können nicht neu deklariert oder zugewiesen werden und muessen initialisiert werden
//Eigenschaften eines Const-Objektes kann man jederzeit ändern 
//Quelle: https://www.w3schools.com/js/js_const.asp

var correct = 0;
var total = 0;

const totalDraggableItems = document.querySelectorAll('.draggable').length;
const draggableElements = document.querySelectorAll(".draggable");
const droppableElements = document.querySelectorAll(".droppable");

const spielEigenschaften = {
	versuche: document.querySelector('.versuche'),
	zeit: document.querySelector('.zeit'),
	win: document.querySelector('.win')
}

const spielStatus = {
	spielGestartet: false,
	totalFlips: 0,
	totalTime: 0,
	loop: null
}



//Spiel wurde gestartet, zeit und Versuche werden jede Sekunde aktualisieren
var startGame = () => {
	spielStatus.spielGestartet = true
	spielStatus.loop = setInterval(() => {
		spielStatus.totalTime++

		//alert(document.getElementById("gewertet").innerHTML);

		if (document.getElementById("gewertet").innerHTML === "gewertetAn") {
			spielEigenschaften.versuche.innerText = `Versuche: ${spielStatus.totalFlips} `
		}

		if (document.getElementById("timerID").innerHTML === "timerAn") {
			spielEigenschaften.zeit.innerText = `Zeit: ${spielStatus.totalTime} Sekunden`
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

//Bilder-Ordnen-Idee:
//----------- Anfang ----------------------

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


//Bild loslassen 
function drop(event) {
	event.preventDefault(); // This is in order to prevent the browser default handling of the data
	event.target.classList.remove("droppable-hover");
	const draggableElementData = event.dataTransfer.getData("text");
	const droppableElementData = event.target.getAttribute("data-draggable-id");
	alert("Draggable: " + draggableElementData + " -> Droppable: " + droppableElementData);
	const isCorrectMatching = draggableElementData === droppableElementData;
	spielStatus.totalFlips++

	if (isCorrectMatching) {
		const draggableElement = document.getElementById(draggableElementData);
		//const draggableElement = document.getElementByAlt(draggableElementData);
		//alert(draggableElement)
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

			spielEigenschaften.win.innerHTML =
				`       
                    Du hast gewonnen!<br>       
            `
			clearInterval(spielStatus.loop)
			//DatenbankEintrag
			if (document.getElementById("nutzer").innerHTML !== "") {
				datenbankEintrag();
				//alert(document.getElementById("nutzer").innerHTML);
			}
		}, 1000)
	}
}

//----------------------------
//---------- Events ----------
//----------------------------

//Starten sobald Button gedrückt wird
document.addEventListener('click', event => {
	const eventTarget = event.target
	if (eventTarget.nodeName === 'BUTTON' && spielStatus.spielGestartet === false) {
		startGame()
	}
})

//Starten sobald Bild bewegt wird
document.addEventListener('drag', event => {
	const eventTarget = event.target
	if (eventTarget.nodeName === 'IMG' && spielStatus.spielGestartet === false) {
		startGame()
	}
})

//Funktionen für jedes festgehaltene Bild
draggableElements.forEach(elem => {
	elem.addEventListener("dragstart", dragStart);
});

//Funktionen für jedes losgelassene Bild
droppableElements.forEach(elem => {
	elem.addEventListener("dragenter", dragEnter);
	elem.addEventListener("dragover", dragOver);
	elem.addEventListener("dragleave", dragLeave);
	elem.addEventListener("drop", drop);
});

//Restart-Button
document.getElementById("restartButton").onclick = function() {
	window.location.reload();
}

//Datenbankeintrag
function datenbankEintrag() {

	var zeit = spielStatus.totalTime;
	var versuche = spielStatus.totalFlips;

	var sendData = "zeit=" + zeit + "&versuche=" + versuche;

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadyspielStatuschange = function() {
		if (xmlhttp.readyspielStatus == 4 && xmlhttp.status == 200) {
			document.getElementById("temp").innerHTML = xmlhttp.responseText;
		}
	};
	xmlhttp.open("POST", "BilderOrdnenAjax", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(sendData);

	//alert("Spiel in Datenbank gespeichert");
}