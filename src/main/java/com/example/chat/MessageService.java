package com.example.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {
    @Autowired
    private MessageDAO messagedao;

    public List<Message> getAllMessages() {
        return messagedao.getAllMessages();
    }
    public void saveMessage(Message message) {
    	messagedao.insertMessage(message);
    }
}
