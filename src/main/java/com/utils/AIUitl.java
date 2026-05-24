package com.utils;

import com.volcengine.ark.runtime.model.completion.chat.ChatCompletionRequest;
import com.volcengine.ark.runtime.model.completion.chat.ChatMessage;
import com.volcengine.ark.runtime.model.completion.chat.ChatMessageRole;
import com.volcengine.ark.runtime.service.ArkService;

import java.util.ArrayList;
import java.util.List;

public class AIUitl {

    public static String getResponse(String question) {
        String apiKey = "9116d92b-2210-489f-8ca2-2c83d95cbb5a";
        ArkService service = new ArkService(apiKey);
        System.out.println("\n----- standard request -----");
        final List<ChatMessage> messages = new ArrayList<>();
        final ChatMessage systemMessage = ChatMessage.builder().role(ChatMessageRole.SYSTEM).content("你是旅游推荐管理系统的专家级客服").build();
        final ChatMessage userMessage = ChatMessage.builder().role(ChatMessageRole.USER).content(question+",简略回答，一定不超过100字").build();
        messages.add(systemMessage);
        messages.add(userMessage);

        ChatCompletionRequest chatCompletionRequest = ChatCompletionRequest.builder()
                .model("ep-20251110170834-dcqdr")
                .messages(messages)
                .build();
        StringBuilder result = new StringBuilder();
        service.createChatCompletion(chatCompletionRequest).getChoices().forEach(choice -> result.append(choice.getMessage().getContent()));

        System.out.println(result);
        // shutdown service
        service.shutdownExecutor();
        return result.toString();
    }
}
