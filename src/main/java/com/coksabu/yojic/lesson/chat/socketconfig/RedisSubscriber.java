package com.coksabu.yojic.lesson.chat.socketconfig;

import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.chat.model.ChatMessage;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class RedisSubscriber implements MessageListener {
	
	private final SimpMessageSendingOperations messagingTemplate;

	@Override
    public void onMessage(Message message, byte[] pattern) {
         ChatMessage chatMessage = ChatMessage.convertMessage(message.toString());
         if(chatMessage.getMessage_type().equals("chat")) {
        	 messagingTemplate.convertAndSend(chatMessage.getTopic(),chatMessage);
         }else if(chatMessage.getMessage_type().equals("createRoom")) {
        	 messagingTemplate.convertAndSend(chatMessage.getTopic(),chatMessage);
         }
            
    }
}
