package Model;

import java.io.Serializable;

public class prodotto implements Serializable{
	private int id;
	private String nome;
	private String costo;
	private String descrizione;
	private String unita;
	private String categoria;
	private String immagine;
	private String marca;
	private String sconto;
	private int unit;
	
	public prodotto() {};
	public prodotto(int id, String nome, String costo, String descrizione, String categoria,
			String immagine,String marca,int unit) {
		super();
		this.id = id;
		this.nome = nome;
		this.costo = costo;
		this.descrizione = descrizione;
		this.categoria = categoria;
		this.immagine = immagine;
		this.marca = marca;
		this.unit = unit;
	}
	
	public prodotto(int id, String nome, String costo, String descrizione, String categoria,
			String immagine,String marca) {
		super();
		this.id = id;
		this.nome = nome;
		this.costo = costo;
		this.descrizione = descrizione;
		this.categoria = categoria;
		this.immagine = immagine;
		this.marca = marca;
	}
	
	
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
	public prodotto(int id, String nome, String costo, String descrizione, String unita,String sconto, String categoria,
			String marca,String immagine) {
		super();
		this.id = id;
		this.nome = nome;
		this.costo = costo;
		this.descrizione = descrizione;
		this.unita = unita;
		this.categoria = categoria;
		this.immagine = immagine;
		this.marca = marca;
		this.sconto = sconto;
	}
	public prodotto(String nome) {
		super();
		
		this.nome = nome;
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
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
	public String getSconto() {
		return sconto;
	}
	public void setSconto(String sconto) {
		this.sconto = sconto;
	}
	
	
}
