//Erstellt von Lukas Theinert

package beans;

import java.io.Serializable;

public class Bestenliste implements Serializable {
	private static final long serialVersionUID = 1L;

	private int platz;
	private int punkteJumpnrun, punkteMathe, punkteBilderBilderWort, punkteBilderOrdnen, punkteBilderMemorie, gesamtPunkte;
	private String nutzer, kategorie;
	private int spieleInsgesamt;
	private int durchschnittZeitLeicht, durchschnittZeitMittel, durchschnittZeitSchwer;

	public Bestenliste() {
		super();
	}
	
	public String getKategorie() {
		return kategorie;
	}

	public void setKategorie(String kategorie) {
		this.kategorie = kategorie;
	}

	public int getPlatz() {
		return platz;
	}

	public void setPlatz(int platz) {
		this.platz = platz;
	}

	public int getGesamtPunkte() {
		return gesamtPunkte;
	}

	public void setGesamtPunkte(int gesamptPunkte) {
		this.gesamtPunkte = gesamptPunkte;
	}

	public int getPunkteJumpnrun() {
		return punkteJumpnrun;
	}

	public void setPunkteJumpnrun(int punkteJumpnrun) {
		this.punkteJumpnrun = punkteJumpnrun;
	}

	public int getPunkteMathe() {
		return punkteMathe;
	}

	public void setPunkteMathe(int punkteMathe) {
		this.punkteMathe = punkteMathe;
	}

	public int getPunkteBilderBilderWort() {
		return punkteBilderBilderWort;
	}

	public void setPunkteBilderBilderWort(int punkteBilderBilderWort) {
		this.punkteBilderBilderWort = punkteBilderBilderWort;
	}

	public int getPunkteBilderOrdnen() {
		return punkteBilderOrdnen;
	}

	public void setPunkteBilderOrdnen(int punkteBilderOrdnen) {
		this.punkteBilderOrdnen = punkteBilderOrdnen;
	}

	public int getPunkteBilderMemorie() {
		return punkteBilderMemorie;
	}

	public void setPunkteBilderMemorie(int punkteBilderMemorie) {
		this.punkteBilderMemorie = punkteBilderMemorie;
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
