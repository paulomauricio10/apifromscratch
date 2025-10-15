-- Migration: create users table and seed initial data
-- Assumindo MySQL 8+
-- Usamos BINARY(16) para armazenar UUID de forma compacta.

CREATE TABLE IF NOT EXISTS users (
    id BINARY(16) NOT NULL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(180) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    birthday DATE NULL,
    address VARCHAR(255) NULL,
    phone_number VARCHAR(20) NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    ativo BIT NOT NULL,
    CONSTRAINT uk_users_email UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- BCrypt hash da senha "123456" (gerado com fator de custo padrão 10)
-- $2a$10$Ddirow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2
-- Podemos usar a mesma hash para todos os usuários seed.

INSERT INTO users (id, nome, email, senha, birthday, address, phone_number, created_at, updated_at, ativo) VALUES
(UUID_TO_BIN(UUID()), 'Usuário 1', 'user1@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1990-01-01', 'Endereço 1', '+55 11 90000-0001', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 2', 'user2@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1991-02-02', 'Endereço 2', '+55 11 90000-0002', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 3', 'user3@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1992-03-03', 'Endereço 3', '+55 11 90000-0003', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 4', 'user4@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1993-04-04', 'Endereço 4', '+55 11 90000-0004', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 5', 'user5@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1994-05-05', 'Endereço 5', '+55 11 90000-0005', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 6', 'user6@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1995-06-06', 'Endereço 6', '+55 11 90000-0006', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 7', 'user7@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1996-07-07', 'Endereço 7', '+55 11 90000-0007', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 8', 'user8@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1997-08-08', 'Endereço 8', '+55 11 90000-0008', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 9', 'user9@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1998-09-09', 'Endereço 9', '+55 11 90000-0009', NOW(), NOW(), 1),
(UUID_TO_BIN(UUID()), 'Usuário 10', 'user10@example.com', '$2a$10$Dow1H3KO/qyH4x6Yy7Al.eQ1ytY1/6aeXOvNhbbX6YsJhBKt3vnx2', '1999-10-10', 'Endereço 10', '+55 11 90000-0010', NOW(), NOW(), 1);
