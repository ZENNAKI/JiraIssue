package it.com.example.plugins.tutorial.crud.servlet;

import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.junit.Test;
import org.junit.After;
import org.junit.Before;

import com.googlecode.jsu.transitionssummary.TransitionsManager;

import java.io.IOException;

import static org.junit.Assert.*;


public class IssueCRUDFuncTest {

    HttpClient httpClient;
    String baseUrl;
    String servletUrl;

    @Test
    public void setup() {
        httpClient = new DefaultHttpClient();
        baseUrl = System.getProperty("http://jira6.edifixio-online.com");
        servletUrl = baseUrl + "/plugins/servlet/issuecrud";
    }

 

    @Test
    public void testSomething() throws IOException {
        HttpGet httpget = new HttpGet(servletUrl);

         
         
        
        // Create a response handler
        ResponseHandler<String> responseHandler = new BasicResponseHandler();
        String responseBody = httpClient.execute(httpget, responseHandler);
        assertTrue(null != responseBody && !"".equals(responseBody));
    }
   
}
