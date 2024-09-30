package com.example.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageDAO {

	  List<Message> getAllMessages();
	    void insertMessage(Message message);  // 메시지 삽입 메서드
}
