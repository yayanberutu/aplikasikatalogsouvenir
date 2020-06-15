package stud11318066.develops.UAS2020;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class Login extends AppCompatActivity {
    private EditText edtun;
    private EditText edtps;
    private Button btnLogin;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        edtun = findViewById(R.id.username);
        edtps = findViewById(R.id.password);
        btnLogin = findViewById(R.id.btnLogin);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String us, ps;
                us = edtun.getText().toString().toLowerCase().trim();
                ps = edtps.getText().toString();

                if(us.equals("uname11318066") && ps.equals("pwd11318066")){
                    Intent intent = new Intent(getApplicationContext(), EntryProductActivity.class);
                    startActivity(intent);
                    finish();
                }
            }
        });
    }
}
