package com.example.mycnnapp;

import android.graphics.Bitmap;
import android.provider.MediaStore;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Base64;
import android.view.View;
import android.content.Intent;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.os.Bundle;
import android.util.Log;
import android.view.View.OnClickListener;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;

public class MainActivity extends AppCompatActivity {

    private TextView mTextViewResult;
    private Button testButton, buttonSendImg, buttonCamera;
    private ImageView imgView;
    private String result = "";
    long tStart = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("Traffic Sign Recognition App");
        result = "";
        mTextViewResult = findViewById(R.id.textView_result);
        testButton = (Button) findViewById(R.id.button);
        buttonSendImg = (Button) findViewById(R.id.button_sendimage);
        buttonCamera = (Button) findViewById(R.id.button_camera);
        imgView = (ImageView) findViewById(R.id.imageView2);

        // Public DNS address to AWS instance
        String address = "http://ec2-3-16-55-64.us-east-2.compute.amazonaws.com:80";


        // Button for test
        HttpCall httpCall = new HttpCall();
        httpCall.setMethodtype(HttpCall.GET);
        httpCall.setUrl(address);
        testButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                HashMap<String,String> params = new HashMap<>();
                params.put("msg", "get_result");
                params.put("file", "None");
                httpCall.setParams(params);

                new HttpRequest(){
                    public void onResponse(String response) {
                        super.onResponse(response);
                        mTextViewResult.setText( response );
                    }
                }.execute(httpCall);
            }
        });


        // Button for sending taken image
        HttpCall httpCallPost = new HttpCall();
        httpCallPost.setMethodtype(HttpCall.GET);
        httpCallPost.setUrl(address);
        buttonSendImg.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                tStart = System.currentTimeMillis(); // Start time
                HashMap<String,String> paramsPost = new HashMap<>();
                paramsPost.put("msg", "ul_file");
                paramsPost.put("file", result);
                httpCallPost.setParams(paramsPost);

                new HttpRequest(){
                    public void onResponse(String response) {
                        super.onResponse(response);

                        // End time
                        long tEnd = System.currentTimeMillis();
                        long tDelta = tEnd - tStart;
                        double elapsedSeconds = tDelta / 1000.0;

                        // Display response and time (from msg sent to received result)
                        mTextViewResult.setText( response + "\n" + elapsedSeconds + " sec");
                    }
                }.execute(httpCallPost);
            }
        });


        // Button "Camera" pressed
        buttonCamera.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                startActivityForResult(intent, 0);
            }
        });

    }

    
    // Intent for camera, take picture and display in ImageView
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Bitmap bitmap = (Bitmap) data.getExtras().get("data");
        imgView.setImageBitmap(bitmap);
        result = BitmapToString(bitmap);
        mTextViewResult.setText("New Picture Taken");
    }


    // Function for converting Bitmap to base64 String
    protected String BitmapToString(Bitmap bitmap){
        // convert bitmap to byte array
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream .toByteArray();

        // encode base64 from byte array
        String encoded = Base64.encodeToString(byteArray, Base64.DEFAULT);
        return encoded;
    }

}
