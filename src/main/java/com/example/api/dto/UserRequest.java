package com.example.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.Email;

import java.time.LocalDate;
import java.util.UUID;

public record UserRequest(String id, @NotBlank @Size(max=40)String username, @NotBlank @Size(max=120)String name, @NotBlank @Email @Size(max=180)String email, LocalDate birthday, @Size(max=255)String address, @Size(max=20)String phoneNumber){}
