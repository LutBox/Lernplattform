package beans.modelbeans;

import java.io.Serializable;

public class NutzerBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private String email;
	private int punkte;
	private String passwort;
	private int admin;
	private String dateiname;
	private Object bild;
	
	public NutzerBean() {
		this.name = null;
		this.email = null;
		this.punkte = 0;
		this.admin = 0;
		this.dateiname = null;
		this.bild = null;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPunkte() {
		return punkte;
	}
	public void setPunkte(int punkte) {
		this.punkte = punkte;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getDateiname() {
		return dateiname;
	}
	public void setDateiname(String dateiname) {
		this.dateiname = dateiname;
	}
	public Object getBild() {
		return bild;
	}
	public void setBild(Object bild) {
		this.bild = bild;
	}
	public String getPasswort() {
		return passwort;
	}
	public void setPasswort(String passwort) {
		this.passwort = passwort;
	}
}
