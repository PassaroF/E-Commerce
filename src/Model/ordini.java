package Model;


public class ordini {
	

	private int id;
	private String destinatario;
	private String indirizzo;
	private String totale;
	private String prodotti;
	private String data;
	private int id_u;

	



	public ordini(int id, String destinatario, String indirizzo, String totale, String prodotti, String data,int id_u) {
		super();
		this.id = id;
		this.destinatario = destinatario;
		this.indirizzo = indirizzo;
		this.totale = totale;
		this.prodotti = prodotti;
		this.data = data;
		this.id_u = id_u;
	}

	
	public String getData() {
		return data;
	}


	public void setData(String data) {
		this.data = data;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getId_u() {
		return id_u;
	}

	public void setId_u(int id_u) {
		this.id_u = id_u;
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
