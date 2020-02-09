package appli;

import business.Pizza;
import model.CommandeUtil;

public class Main {

	public static void main(String[] args) {
		for (Pizza p : CommandeUtil.getMenu()) {
			System.out.println(p);
		}
		System.out.println();
		CommandeUtil.printFicheLivraison(1);
		System.out.println();
		CommandeUtil.printBestClients();
	}

}
