package com.example.chat;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findBySenderAndReceiver(User sender, User receiver);
    List<Message> findAll();
    
    @Query("SELECT m FROM Message m WHERE (m.sender = ?1 AND m.receiver = ?2) OR (m.sender = ?2 AND m.receiver = ?1)")
    List<Message> findBySenderOrReceiver(User user1, User user2);
    
    @Query(value = "SELECT m.id, m.sender_id, m.receiver_id, m.content, m.timestamp " +
            "FROM ( " +
            "    SELECT m.*, " +
            "           ROW_NUMBER() OVER (PARTITION BY CASE " +
            "               WHEN sender_id = :userSender THEN receiver_id " +
            "               ELSE sender_id " +
            "           END ORDER BY timestamp DESC) as rn " +
            "    FROM message m " +
            "    WHERE sender_id = :userSender OR receiver_id = :userSender " +
            ") m " +
            "WHERE rn = 1", 
 nativeQuery = true)
List<Message> left_msg(@Param("userSender") String userSenderId);
}