package com.example.socialnetwork.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {
    private String story;
    private String message;
    private String created_time;
    private String id;
    private String paging_previous;
    private String paging_next;

}
