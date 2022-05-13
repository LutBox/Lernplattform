package exceptions;

@SuppressWarnings("serial")
public class NutzernameBereitsVergebenException extends Exception {
	public NutzernameBereitsVergebenException() {
		super("Der Gewählte Nutzername existiert bereits!");
	}
}
