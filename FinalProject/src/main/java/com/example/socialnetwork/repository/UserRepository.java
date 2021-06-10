package com.example.socialnetwork.repository;

import com.example.socialnetwork.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByName(String name);

    @Query(value = "Select * From user_table where id in (SELECT id_freind FROM friends where id_user = :id)", nativeQuery = true)
    ArrayList<User> getFreinds(@Param("id") Integer id);

    @Query(value = "SELECT * from user_table where id = (SELECT id_user from friends group by id_user order by COUNT(*) DESC LIMIT 1)\t", nativeQuery = true)
    User getMostPopularUser();


}
