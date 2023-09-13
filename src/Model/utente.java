package Model;

public class utente {
	private int id;
	private String nome;
	private String cognome;
	private String via;
	private String civico;
	private String nazione;
	private String provincia;
	private String cap;
	private String citta;
	private String email;
	private String telefono;
	
	
	public utente(int id, String nome, String cognome, String via, String civico, String nazione, String provincia,
			String cap, String citta, String email, String telefono) {
		super();
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.via = via;
		this.civico = civico;
		this.nazione = nazione;
		this.provincia = provincia;
		this.cap = cap;
		this.citta = citta;
		this.email = email;
		this.telefono = telefono;
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
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getVia() {
		return via;
	}
	public void setVia(String via) {
		this.via = via;
	}
	public String getCivico() {
		return civico;
	}
	public void setCivico(String civico) {
		this.civico = civico;
	}
	public String getNazione() {
		return nazione;
	}
	public void setNazione(String nazione) {
		this.nazione = nazione;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getCap() {
		return cap;
	}
	public void setCap(String cap) {
		this.cap = cap;
	}
	public String getCitta() {
		return citta;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	
}
