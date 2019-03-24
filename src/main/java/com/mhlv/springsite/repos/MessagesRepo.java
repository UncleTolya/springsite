package com.mhlv.springsite.repos;

import com.mhlv.springsite.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessagesRepo extends CrudRepository<Message, Long> {
    List<Message> findByTag(String filter);
}
