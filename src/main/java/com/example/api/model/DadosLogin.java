package com.example.api.model;

import jakarta.validation.constraints.NotBlank;

public record DadosLogin(@NotBlank String email,
                         @NotBlank String senha) {
}
