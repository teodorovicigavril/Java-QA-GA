package com.example.socialnetwork.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private String story;
    private String created_time;
    private String name;
    private String idUSer;
    private String message;
    private String id;
    private String paging_previous;
    private String paging_next;
    private Boolean answered = false;
}
