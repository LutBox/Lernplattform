//Erstellt von Lukas Theinert

package beans;

import java.io.Serializable;

public class Bestenliste implements Serializable {
	private static final long serialVersionUID = 1L;

	private int platz;
	private int punkte;
	private String nutzer;
	private int spieleInsgesamt;
	private int durchschnittZeitLeicht, durchschnittZeitMittel, durchschnittZeitSchwer;


	public Bestenliste() { 
		
	}

	public int getPlatz() {
		return platz;
	}

	public void setPlatz(int platz) {
		this.platz = platz;
	}

	public int getPunkte() {
		return punkte;
	}

	public void setPunkte(int punkte) {
		this.punkte = punkte;
	}

	public String getNutzer() {
		return nutzer;
	}

	public void setNutzer(String nutzer) {
		this.nutzer = nutzer;
	}

	public int getSpieleInsgesamt() {
		return spieleInsgesamt;
	}

	public void setSpieleInsgesamt(int spieleInsgesamt) {
		this.spieleInsgesamt = spieleInsgesamt;
	}

	public int getDurchschnittZeitLeicht() {
		return durchschnittZeitLeicht;
	}

	public void setDurchschnittZeitLeicht(int durchschnittZeitLeicht) {
		this.durchschnittZeitLeicht = durchschnittZeitLeicht;
	}

	public int getDurchschnittZeitMittel() {
		return durchschnittZeitMittel;
	}

	public void setDurchschnittZeitMittel(int durchschnittZeitMittel) {
		this.durchschnittZeitMittel = durchschnittZeitMittel;
	}

	public int getDurchschnittZeitSchwer() {
		return durchschnittZeitSchwer;
	}

	public void setDurchschnittZeitSchwer(int durchschnittZeitSchwer) {
		this.durchschnittZeitSchwer = durchschnittZeitSchwer;
	}


}
