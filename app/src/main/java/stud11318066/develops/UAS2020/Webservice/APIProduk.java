package stud11318066.develops.UAS2020.Webservice;

import retrofit2.Call;
import retrofit2.http.POST;

public interface APIProduk {
    @POST("/produk")
    Call<ResponseProduk> getProduk();

    @POST("/produk")
    Call<ResponseProduk> getAkun();
}
