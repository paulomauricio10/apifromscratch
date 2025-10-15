package com.example.api.dto;

import java.time.LocalDate;
import java.util.UUID;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UserRequest(
        UUID id,
        @NotBlank @Size(max = 120) String nome,
        @NotBlank @Email @Size(max = 180) String email,
        LocalDate birthday,
        @Size(max = 255) String address,
        @Size(max = 20) String phoneNumber) {
}
