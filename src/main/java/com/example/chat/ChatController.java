package com.example.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;

@Controller
public class ChatController {
	@Autowired
	private MessageService messageService; // ObjectMapper 주입
	private final SimpMessagingTemplate messagingTemplate;

	public ChatController(SimpMessagingTemplate messagingTemplate) {
		this.messagingTemplate = messagingTemplate;
	}

	@MessageMapping("/sendMessage")
	public void sendMessage(@Payload Message message) {
		messagingTemplate.convertAndSend("/topic/messages", message);
		messageService.saveMessage(message); // DB에 저장
	}

	@GetMapping("/chat")
	public String chat(Model model) {
		List<Message> messages = messageService.getAllMessages();
		model.addAttribute("messages", messages);
		return "chat"; // JSP 파일명
	}
}
