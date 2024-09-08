package com.example.chat;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ChatController {
    @Autowired
    private ChatService chatService;
    @Autowired
    private UserRepository userRepository;

	/*
	 * @GetMapping("/") public String chatPage(Model model) {
	 * model.addAttribute("messages", chatService.getAllMessages()); // 메시지 목록을 모델에
	 * 추가 // 사용자 목록 및 대화 내용 로드 return "chat"; }
	 */
    @GetMapping("/dm")
    public String dm(Model model,HttpSession session) {
    	session.setAttribute("Sender", "zxc777a");//test
    	String Sender = (String) session.getAttribute("Sender");
    	User userSender = userRepository.findByUsername(Sender);
    	List<Message> left_msg = chatService.getleftmsg(userSender);
    	 model.addAttribute("left_msg", left_msg); 
    	// 메시지 목록을 모델에 추가
        // 사용자 목록 및 대화 내용 로드
        return "dm";
    }
    @GetMapping("/dm/value")
    public String dm2(Model model,HttpSession session,@RequestParam("value") String value) {
    	session.setAttribute("Sender", "zxc777a");//test
    	String Sender = (String) session.getAttribute("Sender");
    	User userSender = userRepository.findByUsername(Sender);
    	User userReceiver = userRepository.findByUsername(value);
    	List<Message> left_msg = chatService.getleftmsg(userSender);
    	 model.addAttribute("left_msg", left_msg); 
    	 model.addAttribute("receiver", value); 
    	 model.addAttribute("messages", chatService.getConversation(userSender,userReceiver)); // 메시지 목록을 모델에 추가
    	// 메시지 목록을 모델에 추가
        // 사용자 목록 및 대화 내용 로드
        return "dm";
    }
    @PostMapping("/send")
    public String sendMessage(HttpSession session, @RequestParam String receiver, @RequestParam String content) {
    	String Sender = (String) session.getAttribute("Sender");
    	User userSender = userRepository.findByUsername(Sender);
        User userReceiver = userRepository.findByUsername(receiver);
        
        chatService.sendMessage(userSender, userReceiver, content);
        return "redirect:/dm/value?value="+receiver;
    }

}
