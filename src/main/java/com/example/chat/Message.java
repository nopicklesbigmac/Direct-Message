package com.example.chat;


import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import java.util.UUID;
@Entity
@Table(name = "message")
public class Message {
    @Id
   
    private String  id;
    @ManyToOne
    private User sender;
    @ManyToOne
    private User receiver;

    private String content;
    private Timestamp timestamp;

    public String  getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public User getReceiver() {
		return receiver;
	}
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	   public Message() {
	        this.id = UUID.randomUUID().toString(); // UUID를 생성하여 id에 할당
	        this.timestamp = new Timestamp(System.currentTimeMillis()); // 현재 시간으로 타임스탬프 초기화
	    }

    // getters and setters
}