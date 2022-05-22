package dienste.sqldienste;

import javax.sql.DataSource;

/**
 * @author Merlin 
 * Pattern von Matthias Reimann
 * Diese Klasse wird einmal instanziiert und legt die URI der Datenquelle fest.
 * Abgeleitete Klassen können auf diese Datenquelle zugreifen und beinhalten dann nur noch die entsprechenden Datenbankaufrufe.
 */
public class SQLDienst {
	protected static DataSource ds;
	
	public static void setDataSource(DataSource ds) {
		SQLDienst.ds = ds;
	}
}
