-- Migration: create users table and seed initial data
-- Assumindo MySQL 8+
-- Usamos BINARY(16) para armazenar UUID de forma compacta.

CREATE TABLE IF NOT EXISTS users (
    id BINARY(16) NOT NULL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(180) NOT NULL,
    password VARCHAR(255) NOT NULL,
    birthday DATE NULL,
    address VARCHAR(255) NULL,
    phone_number VARCHAR(20) NULL,
    created_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    updated_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    CONSTRAINT uk_users_email UNIQUE (email),
    INDEX idx_users_name (name),
    INDEX idx_users_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- BCrypt hash válido da password "123456" (custo 10)

INSERT INTO users (id, name, email, password, birthday, address, phone_number, created_at, updated_at, is_active) VALUES
(UUID_TO_BIN(UUID()), 'Usuário 1', 'user1@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1990-01-01', 'Endereço 1', '+55 11 90000-0001', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 2', 'user2@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1991-02-02', 'Endereço 2', '+55 11 90000-0002', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 3', 'user3@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1992-03-03', 'Endereço 3', '+55 11 90000-0003', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 4', 'user4@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1993-04-04', 'Endereço 4', '+55 11 90000-0004', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 5', 'user5@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1994-05-05', 'Endereço 5', '+55 11 90000-0005', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 6', 'user6@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1995-06-06', 'Endereço 6', '+55 11 90000-0006', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 7', 'user7@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1996-07-07', 'Endereço 7', '+55 11 90000-0007', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 8', 'user8@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1997-08-08', 'Endereço 8', '+55 11 90000-0008', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 9', 'user9@example.com',   '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1998-09-09', 'Endereço 9', '+55 11 90000-0009', NOW(6), NOW(6), 1),
(UUID_TO_BIN(UUID()), 'Usuário 10','user10@example.com', '$2a$12$h7Vccdj3wrgTLr47q5mKh.f/0kfKDnN0r7TkM4HiR9iENtjp9N8pm', '1999-10-10', 'Endereço 10', '+55 11 90000-0010', NOW(6), NOW(6), 1);
