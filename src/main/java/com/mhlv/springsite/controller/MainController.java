package com.mhlv.springsite.controller;

import com.mhlv.springsite.domain.Message;
import com.mhlv.springsite.domain.User;
import com.mhlv.springsite.repos.MessagesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    private MessagesRepo messagesRepo;

    @Value("${upload.path}")
    private String uploadPath;


    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       @RequestParam(required = false, defaultValue = "") String filterHasImage,
                       Model model) {
        Iterable<Message> messages = messagesRepo.findAll();
        if (filter != null && filter.isEmpty()) {
            messages = messagesRepo.findAll();
        } else {
            messages = messagesRepo.findByTag(filter);
        }
        if (filterHasImage != null && filterHasImage.equals("on")) {
            List<Message> messagesWithImage = new ArrayList<>();
            messages.forEach(a -> {
                if (a.getFileName() != null) {
                    messagesWithImage.add(a);
                }
            });
            model.addAttribute("messages", messagesWithImage);
        } else {
            model.addAttribute("messages", messages);
        }

        model.addAttribute("filter", filter);
        model.addAttribute("filterHasImage", filterHasImage);
        return "main";
    }

    @PostMapping("/main")
    public String add(@AuthenticationPrincipal User user,
                        @RequestParam String text,
                            @RequestParam String tag, Map<String, Object> model,
                                @RequestParam("file") MultipartFile file) {
        Message message = new Message(text, tag, user);
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            try {
                Path uploadDir = Paths.get(uploadPath);
                if (!Files.exists(uploadDir)) {
                    Files.createDirectory(uploadDir);
                }
                String uuidFile = UUID.randomUUID().toString();
                String newFileName = uuidFile + file.getOriginalFilename();

                file.transferTo(Paths.get(uploadDir + "/" + newFileName));
                message.setFileName(newFileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        messagesRepo.save(message);
        Iterable<Message> messages = messagesRepo.findAll();
        model.put("messages", messages);
        return "main";
    }

}
