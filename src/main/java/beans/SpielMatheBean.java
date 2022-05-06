//Erstellt von Lukas Theinert

package beans;

public class SpielMatheBean {
	private static final long serialVersionUID = 1L;
	
	private int zahl1, zahl2, zahl3, zahl4, zahl5, zahl6;
	private int ergebnis1, ergebnis2, ergebnis3;
	private int nutzerErgebnis1, nutzerErgebnis2, nutzerErgebnis3;
	private String aufgabe;
	
	public SpielMatheBean() { 
		super();
	}

	public SpielMatheBean(int zahl1, int zahl2, int zahl3, int zahl4, int zahl5, int zahl6) {
		super();
		this.zahl1 = zahl1;
		this.zahl2 = zahl2;
		this.zahl3 = zahl3;
		this.zahl4 = zahl4;
		this.zahl5 = zahl5;
		this.zahl6 = zahl6;
	}

	
	
	public String getAufgabe() {
		return aufgabe;
	}

	public void setAufgabe(String aufgabe) {
		this.aufgabe = aufgabe;
	}

	public int getZahl1() {
		return zahl1;
	}

	public void setZahl1(int zahl1) {
		this.zahl1 = zahl1;
	}

	public int getZahl2() {
		return zahl2;
	}

	public void setZahl2(int zahl2) {
		this.zahl2 = zahl2;
	}

	public int getZahl3() {
		return zahl3;
	}

	public void setZahl3(int zahl3) {
		this.zahl3 = zahl3;
	}

	public int getZahl4() {
		return zahl4;
	}

	public void setZahl4(int zahl4) {
		this.zahl4 = zahl4;
	}

	public int getZahl5() {
		return zahl5;
	}

	public void setZahl5(int zahl5) {
		this.zahl5 = zahl5;
	}

	public int getZahl6() {
		return zahl6;
	}

	public void setZahl6(int zahl6) {
		this.zahl6 = zahl6;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getErgebnis1() {
		return ergebnis1;
	}

	public void setErgebnis1(int ergebnis1) {
		this.ergebnis1 = ergebnis1;
	}

	public int getErgebnis2() {
		return ergebnis2;
	}

	public void setErgebnis2(int ergebnis2) {
		this.ergebnis2 = ergebnis2;
	}

	public int getErgebnis3() {
		return ergebnis3;
	}

	public void setErgebnis3(int ergebnis3) {
		this.ergebnis3 = ergebnis3;
	}

	public int getNutzerErgebnis1() {
		return nutzerErgebnis1;
	}

	public void setNutzerErgebnis1(int nutzerErgebnis1) {
		this.nutzerErgebnis1 = nutzerErgebnis1;
	}

	public int getNutzerErgebnis2() {
		return nutzerErgebnis2;
	}

	public void setNutzerErgebnis2(int nutzerErgebnis2) {
		this.nutzerErgebnis2 = nutzerErgebnis2;
	}

	public int getNutzerErgebnis3() {
		return nutzerErgebnis3;
	}

	public void setNutzerErgebnis3(int nutzerErgebnis3) {
		this.nutzerErgebnis3 = nutzerErgebnis3;
	}


	
}
