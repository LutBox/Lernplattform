package beans;

import java.io.Serializable;

/**
 * 
 * @author Merlin
 *
 */
public class NutzerViewBean implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final String attributname = "nutzer";
	private String name;
	private String email;
	private Integer punkte;
	private Integer admin;
	private Integer bildnr;

	public NutzerViewBean(String name, String email, Integer punkte, Integer admin, Integer bildnr) {
		super();
		this.name = name;
		this.email = email;
		this.punkte = punkte;
		this.admin = admin;
		this.bildnr = bildnr;
	}

	public NutzerViewBean() {
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

	public Integer getBildnr() {
		return bildnr;
	}

	public void setBildnr(Integer bildnr) {
		this.bildnr = bildnr;
	}



}
