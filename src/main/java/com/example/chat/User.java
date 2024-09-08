package com.example.chat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "i_user") // 테이블 이름을 i_user로 설정
public class User {
    @Id
    private String id;
    
    private String username;

    public User() {}

    public User(String id, String username) {
        this.id = id; // 이메일 주소를 ID로 설정
        this.username = username;
    }
    // getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}