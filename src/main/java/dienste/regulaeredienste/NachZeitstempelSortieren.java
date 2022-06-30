package dienste.regulaeredienste;

import java.util.Comparator;

import beans.Neuigkeit;

/**
 * 
 * @author Merlin
 *
 */
public class NachZeitstempelSortieren implements Comparator<Neuigkeit> {

	@Override
	public int compare(Neuigkeit a, Neuigkeit b) {
		return -1* a.getZeitstempel().compareTo(b.getZeitstempel());
	}
}
