package com.example.socialnetwork.service;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import com.example.socialnetwork.entity.Post;
import org.json.JSONArray;
import org.json.JSONObject;

public class GetPostsService {
    public List<Post> call_me_to_get_posts(String access_token) throws Exception {
        List<Post> list_posts = new ArrayList<Post>();
        try {
            //SETUP THE CURL REQUEST
            String url = "https://graph.facebook.com/v10.0/me/posts?access_token=" + access_token;
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            System.out.println(response);
            JSONObject data_response = new JSONObject(response.toString());
            JSONArray data_array = data_response.getJSONArray("data");
            System.out.println(data_array.length());
            for (int count = 0; count < data_array.length(); count++) {
                Post obj_Post = new Post();
                obj_Post.setId(data_array.getJSONObject(count).getString("id"));
                obj_Post.setCreated_time(parseDate(data_array.getJSONObject(count).getString("created_time")));
                try {
                    obj_Post.setStory(data_array.getJSONObject(count).getString("story"));
                } catch (Exception e) {
                    System.out.println(e);
                }
                try {
                    obj_Post.setMessage(data_array.getJSONObject(count).getString("message"));
                } catch (Exception e) {
                    System.out.println(e);
                }
                list_posts.add(obj_Post);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        List<Post> filterPosts = list_posts.stream().filter(
                p -> p.getMessage() != null &&
                        p.getId() != null &&
                        p.getCreated_time() != null
        ).collect(Collectors.toList());
        return filterPosts;
    }

    public List<Post> getQaPosts(List<Post> posts){
        return posts.stream().filter(
                p-> p.getMessage().contains("#Q&A") ||
                        p.getMessage().contains("#q&a")
        ).collect(Collectors.toList());
    }

    public List<Post> getGiveAway(List<Post> posts){
        return posts.stream().filter(
                p-> p.getMessage().toLowerCase(Locale.ROOT).contains("#giveaway")
        ).collect(Collectors.toList());
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
}

