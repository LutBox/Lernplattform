//Erstellt von Lukas Theinert
//Memorie-Idee von: https://github.com/code-sketch/memory-game/

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

		selectors.moves.innerText = `${state.totalFlips} moves`
		selectors.timer.innerText = `time: ${state.totalTime} sec`
	}, 1000)
}

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

 if (flippedCards === document.querySelectorAll('.memorieKarte').length) {
 //if (isMatch) {	
        setTimeout(() => {
	        selectors.boardContainer.classList.add('flipped')
            selectors.win.innerHTML = `
                <span class="win-text">
                
                    You won!<br />
                    
                    with <span class="highlight">${state.totalFlips}</span> moves<br />
                    under <span class="highlight">${state.totalTime}</span> seconds
                </span>
            `

            clearInterval(state.loop)
        }, 1000)
    }
}

function kartenDeaktivieren() {
	ersteKarte.removeEventListener('click', karteVorneDrehen);
	zweiteKarte.removeEventListener('click', karteVorneDrehen);

	versuchFalsch();
}

function karteHintenDrehen() {
	istAufgedeckt = true;
	
	state.flippedCards--

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



karten.forEach(karte => karte.addEventListener('click', karteVorneDrehen));
attachEventListeners()
