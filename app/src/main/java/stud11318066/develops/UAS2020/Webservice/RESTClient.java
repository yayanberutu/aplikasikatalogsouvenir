package stud11318066.develops.UAS2020.Webservice;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class RESTClient {
    private static APIProduk REST_CLIENT;
    static {
        setupRestClient();
    }
    private RESTClient() {}
    public static APIProduk get() {
        return REST_CLIENT;
    }
    private static void setupRestClient() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://localhost:8080/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        REST_CLIENT = retrofit.create(APIProduk.class);
    }
}
