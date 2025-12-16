package com.example.api.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.api.model.User;

public interface UserRepository extends JpaRepository<User, String> {
    Optional<User> findByName(String nome);

    //Optional<User> findByToken(String token);

    Optional<User> findByEmail(String username);
}
