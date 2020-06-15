package stud11318066.develops.UAS2020;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.TextView;

public class Splashscreen extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splashscreen);
        TextView tvSplashscreen = findViewById(R.id.txtSplashscreen);

        tvSplashscreen.animate();
        tvSplashscreen.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Handler().postDelayed(new Runnable() {

                    @Override
                    public void run() {
                        final Intent intent =  new Intent(getApplicationContext(), Login.class);
                        startActivity(intent);
                        finish();
                    }
                },2000  );
            }
        });
    }

    private void gantiwarna(){

    }
}
