package beans;

import java.io.Serializable;

public class SpielStartenBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String schwierigkeit;
	private String spielart;
	
	public SpielStartenBean() {
		
	}
	
	public SpielStartenBean(String schwierigkeit, String spielart) {
		super();
		this.schwierigkeit = schwierigkeit;
		this.spielart = spielart;
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
