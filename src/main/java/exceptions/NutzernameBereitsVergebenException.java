package exceptions;

@SuppressWarnings("serial")
public class NutzernameBereitsVergebenException extends Exception {
	public NutzernameBereitsVergebenException() {
		super("Der Gew�hlte Nutzername existiert bereits!");
	}
}
