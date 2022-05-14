//Erstellt von Lukas Theinert

package beans;

import java.io.Serializable;

public class SpielStartenBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String schwierigkeit;
	private String spielart;
	private String timer;
	private String gewertet;
	private int zeit;
	private int versuche;


	public SpielStartenBean() { 
		
	}
	
	
	
	public int getZeit() {
		return zeit;
	}



	public void setZeit(int zeit) {
		this.zeit = zeit;
	}



	public int getVersuche() {
		return versuche;
	}



	public void setVersuche(int versuche) {
		this.versuche = versuche;
	}



	public SpielStartenBean(String schwierigkeit, String spielart) {
		super();
		this.schwierigkeit = schwierigkeit;
		this.spielart = spielart;
	}
	
	
	public String getTimer() {
		return timer;
	}

	public void setTimer(String timer) {
		this.timer = timer;
	}

	public String getGewertet() {
		return gewertet;
	}

	public void setGewertet(String gewertet) {
		this.gewertet = gewertet;
	}

	public String getSpielart() {
		return spielart;
	}
	
	public void setSpielart(String spielart) {
		this.spielart = spielart;
	}
	
	public String getSchwierigkeit() {
		return schwierigkeit;
	}
	
	public void setSchwierigkeit(String schwierigkeit) {
		this.schwierigkeit = schwierigkeit;
	}

}
