package exceptions;

import jakarta.servlet.ServletException;

@SuppressWarnings("serial")
public class NichtAngemeldetException extends ServletException {
	public NichtAngemeldetException() {
		super("Sie sind nicht angemeldet. Bitte melden sie sich an!");
	}
}
