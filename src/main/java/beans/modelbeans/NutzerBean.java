package beans.modelbeans;

import java.io.Serializable;

public class NutzerBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private String email;
	private Integer punkte;
	private String passwort;
	private Integer admin;
	private String dateiname;
	private Object bild;
	
	public NutzerBean(String name, String email, Integer punkte, String passwort, Integer admin, String dateiname,
			Object bild) {
		super();
		this.name = name;
		this.email = email;
		this.punkte = punkte;
		this.passwort = passwort;
		this.admin = admin;
		this.dateiname = dateiname;
		this.bild = bild;
	}
	public NutzerBean() {
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
	public Integer getPunkte() {
		return punkte;
	}
	public void setPunkte(Integer punkte) {
		this.punkte = punkte;
	}
	public Integer getAdmin() {
		return admin;
	}
	public void setAdmin(Integer admin) {
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
