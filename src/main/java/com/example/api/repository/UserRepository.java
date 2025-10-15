package com.example.api.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.api.model.User;

public interface UserRepository extends JpaRepository<User, UUID> {
    Optional<User> findByNome(String nome);

    UserDetails findByLogin(String login);
}
