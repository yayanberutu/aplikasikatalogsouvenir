package stud11318066.develops.UAS2020.Webservice;

import java.util.List;

import stud11318066.develops.UAS2020.Webservice.Model.ModelProduk;

public class ResponseProduk {
    private String error;
    private List<ModelProduk> hasil;
    public String getError() {
        return error;
    }
    public void setError(String error) {
        this.error = error;
    }
    public List<ModelProduk> getHasil() {
        return hasil;
    }
    public void setHasil(List<ModelProduk> hasil) {
        this.hasil = hasil;
    }

}
