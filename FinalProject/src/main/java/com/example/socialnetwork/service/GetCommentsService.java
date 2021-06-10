package com.example.socialnetwork.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.example.socialnetwork.entity.Comment;
import org.json.JSONArray;
import org.json.JSONObject;

public class GetCommentsService {
    public List<Comment> call_me_to_get_comments(String Id, String token) throws Exception {
        List<Comment> commentList = new ArrayList<Comment>();
        try {
            //SETUP THE CULR REQUEST
            String url = "https://graph.facebook.com/v10.0/" + Id + "/comments?access_token=" + token;
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", "Mozilla/5.0");
            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);
            String inputLine;
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));

            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            System.out.println(response);
            //parse string to json
            JSONObject data_response = new JSONObject(response.toString());
            JSONArray data_array = data_response.getJSONArray("data");
            for (int count = 0; count < data_array.length(); count++) {
                Comment comment = new Comment();
                comment.setCreated_time(parseDate(data_array.getJSONObject(count).getString("created_time")));
                String from = data_array.getJSONObject(count).getString("from");
                JSONObject from_response = new JSONObject(from.toString());
                comment.setName(from_response.getString("name"));
                comment.setIdUSer(from_response.getString("id"));
                comment.setMessage(data_array.getJSONObject(count).getString("message"));
                comment.setId(data_array.getJSONObject(count).getString("id"));

               commentList.add(comment);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return commentList;
    }

    public static String parseDate(String str) {
        StringBuilder result = new StringBuilder();
        for(int i =0; i <10; i++)
            result.append(str.charAt(i));
        result.append(" ");
        for(int i =11; i <19; i++)
            result.append(str.charAt(i));

        System.out.println(result.toString());
        return result.toString();
    }

    public Comment getWinner(List<Comment> comments){
        Random rand = new Random();
        return comments.get(rand.nextInt(comments.size()));
    }

}
