package Model.mar;

public class mao {
    private MarBean marBean;
    private int quantita;

    public mao(MarBean marBean) {
        this.marBean = marBean;
        quantita = 1;
    }

    public MarBean getMarBean() {
        return marBean;
    }

    public void setMarBean(MarBean marBean) {
        this.marBean = marBean;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public void incrementaQuantita() {
        quantita++;
    }

    public void decremenetaQuantita() {
        quantita--;
    }

    public float getPrezzoTotale() {
        return quantita * marBean.getPrezzo();
    }
}