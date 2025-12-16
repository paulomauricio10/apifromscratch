package com.example.api.service;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.api.dto.UserRequest;
import com.example.api.model.User;
import com.example.api.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional(readOnly = true)
    public List<UserRequest> getAllUsers() {
        return userRepository.findAll()
                .stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public UserRequest getById(String id) {
        return userRepository.findById(id)
                .map(this::toDto)
                .orElse(null);
    }

    @Transactional
    public UserRequest create(UserRequest req, String senhaHash) {
        User user = new User();
        user.setName(req.name());
        user.setEmail(req.email());
        user.setPassword(senhaHash); // A senha deve ser hash (ex: BCrypt)
        user.setBirthday(req.birthday());
        user.setAddress(req.address());
        user.setPhoneNumber(req.phoneNumber());
        User saved = userRepository.save(user);
        return toDto(saved);
    }

    @Transactional
    public UserRequest update(String id, UserRequest req) {
        return userRepository.findById(id)
                .map(existing -> {
                    existing.setName(req.name());
                    existing.setEmail(req.email());
                    existing.setBirthday(req.birthday());
                    existing.setAddress(req.address());
                    existing.setPhoneNumber(req.phoneNumber());
                    return toDto(userRepository.save(existing));
                })
                .orElse(null);
    }

    @Transactional
    public boolean delete(String id) {
        if (!userRepository.existsById(id))
            return false;
        userRepository.deleteById(id);
        return true;
    }

    private UserRequest toDto(User u) {
        return new UserRequest(
                u.getId(),
                u.getUsername(),
                u.getName(),
                u.getEmail(),
                u.getBirthday(),
                u.getAddress(),
                u.getPhoneNumber());
    }
}
