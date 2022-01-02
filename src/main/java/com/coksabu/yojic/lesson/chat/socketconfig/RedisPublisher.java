package com.coksabu.yojic.lesson.chat.socketconfig;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.chat.model.ChatMessage;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class RedisPublisher {
	
	private final RedisTemplate<String,Object> redisTemplate;

    public void publish(ChannelTopic topic, ChatMessage message){
    	this.redisTemplate.convertAndSend(topic.getTopic(), message);
    }
}
