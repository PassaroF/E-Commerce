package Model;


public class ordini {
	

	private int id;
	private String destinatario;
	private String indirizzo;
	private String totale;
	private String prodotti;

	



	public ordini(int id, String destinatario, String indirizzo, String totale, String prodotti) {
		this.id = id;
        this.destinatario = destinatario;
        this.indirizzo = indirizzo;
        this.totale = totale;
        this.prodotti = prodotti;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDestinatario() {
		return destinatario;
	}

	public String getTotale() {
		return totale;
	}

	public void setTotale(String totale) {
		this.totale = totale;
	}

	public void setDestinatario(String destinatario) {
		this.destinatario = destinatario;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	

	public String getProdotti() {
		return prodotti;
	}

	public void setProdotti(String prodotti) {
		this.prodotti = prodotti;
	}

	

}
