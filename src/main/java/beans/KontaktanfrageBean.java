package beans;

import java.io.Serializable;

/**
 * @author Merlin
 *
 */
public class KontaktanfrageBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer kanr;
	private Integer gelesen;
	private String email;
	private String nachricht;

	public KontaktanfrageBean(Integer kanr, Integer gelesen, String email, String nachricht) {
		this.kanr = kanr;
		this.email = email;
		this.nachricht = nachricht;
	}

	public KontaktanfrageBean() {
	}

	public Integer getKanr() {
		return kanr;
	}

	public void setKanr(Integer kanr) {
		this.kanr = kanr;
	}

	public Integer getGelesen() {
		return gelesen;
	}

	public void setGelesen(Integer gelesen) {
		this.gelesen = gelesen;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNachricht() {
		return nachricht;
	}

	public void setNachricht(String nachricht) {
		this.nachricht = nachricht;
	}

}
