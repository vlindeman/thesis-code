package com.example.mycnnapp;

import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.os.Build;
import android.provider.MediaStore;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
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

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class MainActivity extends AppCompatActivity {

    private TextView mTextViewResult;
    private Button clickButton, buttonPost, buttonCamera;
    private ImageView imgView;
    private String result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("Traffic Sign Recognition App");
        result = "";

        mTextViewResult = findViewById(R.id.textView_result);
        clickButton = (Button) findViewById(R.id.button);
        buttonPost = (Button) findViewById(R.id.button_post);
        buttonCamera = (Button) findViewById(R.id.button_camera);
        imgView = (ImageView) findViewById(R.id.imageView2);

        // Button for GET request
        HttpCall httpCall = new HttpCall();
        httpCall.setMethodtype(HttpCall.GET);
        httpCall.setUrl("http://18.221.217.161:80");
        HashMap<String,String> params = new HashMap<>();
        params.put("name","James Bond");
        params.put("test","Knut Svensson");
        httpCall.setParams(params);
        clickButton.setOnClickListener( new OnClickListener() {
            @Override
            public void onClick(View v) {
                new HttpRequest(){
                    public void onResponse(String response) {
                        super.onResponse(response);
                        mTextViewResult.setText( response);
                        Log.i("TAG", response);
                    }
                }.execute(httpCall);
            }
        });

        // Button for POST request
        HttpCall httpCallPost = new HttpCall();
        httpCallPost.setMethodtype(HttpCall.POST);
        httpCallPost.setUrl("http://18.221.217.161:80");
        HashMap<String,String> paramsPost = new HashMap<>();
        paramsPost.put("name","Julius Cesar");
        paramsPost.put("file", "abc");
        httpCallPost.setParams(paramsPost);
        buttonPost.setOnClickListener( new OnClickListener() {
            @Override
            public void onClick(View v) {
                new HttpRequest(){
                    public void onResponse(String response) {
                        super.onResponse(response);
                        mTextViewResult.setText( response);
                        Log.i("TAG", response);
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
        Log.i("IAMGE", result);
    }

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
