package com.mhlv.springsite.repos;

import com.mhlv.springsite.domain.Message;
import org.springframework.data.repository.CrudRepository;

public interface MessagesRepo extends CrudRepository<Message, Long> {
}
