package Model;

public class prodotto {
	private int id;
	private String nome;
	private String costo;
	private String descrizione;
	private String unita;
	private String categoria;
	private String immagine;
	private String marca;
	
	
	
	
	
	
	public prodotto(int id, String nome, String costo, String descrizione, String unita, String categoria,
			String immagine,String marca) {
		super();
		this.id = id;
		this.nome = nome;
		this.costo = costo;
		this.descrizione = descrizione;
		this.unita = unita;
		this.categoria = categoria;
		this.immagine = immagine;
		this.marca = marca;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCosto() {
		return costo;
	}
	public void setCosto(String costo) {
		this.costo = costo;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getUnita() {
		return unita;
	}
	public void setUnita(String unita) {
		this.unita = unita;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getImmagine() {
		return immagine;
	}
	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	
}
