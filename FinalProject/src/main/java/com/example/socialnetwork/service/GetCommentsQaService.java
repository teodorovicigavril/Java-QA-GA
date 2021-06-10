package com.example.socialnetwork.service;

import com.example.socialnetwork.entity.Comment;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class GetCommentsQaService {
    public List<Comment> qaComments(String Id, String token) throws Exception {
        GetCommentsService commentsService = new GetCommentsService();
        List<Comment> commentList = commentsService.call_me_to_get_comments(Id,token);
        commentList = filterQuestionMark(commentList);
        commentList = filterVulgarity(commentList);
        return commentList;
    }

    //return the list of comments that have at least a question mark in them
    public List<Comment> filterQuestionMark(List<Comment> commentList){
        List<Comment> filteredList = commentList.stream()
                .filter(
                        c -> c.getMessage().contains("?") &&
                                c.getMessage() != null &&
                                c.getName() != null
                ).collect(Collectors.toList());
        return filteredList;
    }

    public Boolean hasCurseWord(String sentence){
        String fileName = "badwods.txt";
        List<String> curseWords = new ArrayList<>();

        try (BufferedReader br = Files.newBufferedReader(Paths.get(fileName))) {
            curseWords = br.lines().collect(Collectors.toList());

        } catch (IOException e) {
            e.printStackTrace();
        }

        for (String curseWord: curseWords) {
            if(sentence.contains(curseWord))
                return false;
        }
        return true;
    }

    public List<Comment> filterVulgarity(List<Comment> commentList){
        return commentList.stream().filter(c -> hasCurseWord(c.getMessage())).collect(Collectors.toList());
    }
    public Integer randomComment(List<Comment> commentList){
        do{
            Random rand = new Random();
            int index = rand.nextInt(commentList.size());
            if(!commentList.get(index).getAnswered()){
                commentList.get(index).setAnswered(true);
                return index;
            }
        } while (true);
    }
}
