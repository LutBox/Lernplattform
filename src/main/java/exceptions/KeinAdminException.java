package exceptions;

import jakarta.servlet.ServletException;

@SuppressWarnings("serial")
public class KeinAdminException extends ServletException {
	public KeinAdminException() {
		super("Sie sind nicht mit einem Administratoraccount angemeldet. Bitte melden sie sich für diese Aktion mit einem Administratoraccount an!");
	}
}
