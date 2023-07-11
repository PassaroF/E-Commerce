package ma.mar;

public class MarBean {
    private int ID;
    private String nome, immagine;
    private float prezzo;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getimg() {
        return immagine;
    }

    public void setimg(String immagine) {
        this.immagine = immagine;
    }

    public float getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(float prezzo) {
        this.prezzo = prezzo;
    }


    @Override
    public String toString() {
        return "MarBean{" +
                "ID=" + ID +
                ", nome='" + nome + '\'' +
                ", immagine='" + immagine + '\'' +
                ", prezzo=" + prezzo +
                '}';
    }
}