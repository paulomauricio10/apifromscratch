package com.example.api.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.api.model.DadosLogin;
import com.example.api.model.DadosRefreshToken;
import com.example.api.model.DadosToken;
import com.example.api.model.User;
import com.example.api.repository.UserRepository;
import com.example.api.security.TokenService;

import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
public class AutenticacaoController {

    private static final Logger log = LoggerFactory.getLogger(AutenticacaoController.class);

    private final AuthenticationManager authenticationManager;
    private final TokenService tokenService;
    private final UserRepository userRepository;

    public AutenticacaoController(AuthenticationManager authenticationManager, TokenService tokenService, UserRepository userRepository) {
        this.authenticationManager = authenticationManager;
        this.tokenService = tokenService;
        this.userRepository = userRepository;
    }

    //Recebe um objeto DadosLogin com e-mail e senha
    //Cria um UsernamePasswordAuthenticationToken com o e-mail e senha fornecidos.
    //Autentica usando o AuthenticationManager (que usa o UserDetailsService configurado para a entity User do MySQL).
    //Gera um token de acesso (JWT) e um refresh token usando o TokenService, passando o usuário autenticado.
    @PostMapping("/login")
    public ResponseEntity<DadosToken> efetuarLogin(@Valid @RequestBody DadosLogin dados){

        var autenticationToken = new UsernamePasswordAuthenticationToken(dados.email(), dados.senha());
        try {
            var authentication = authenticationManager.authenticate(autenticationToken);
            Object principal = authentication.getPrincipal();

            String tokenAcesso = tokenService.gerarToken((User) authentication.getPrincipal());
            String refreshToken = tokenService.gerarRefreshToken((User) authentication.getPrincipal());
            return ResponseEntity.ok(new DadosToken(tokenAcesso, refreshToken));
        } catch (Throwable t) {
            throw t;
        }
    }

    @PostMapping("/atualizar-token")
    public ResponseEntity<DadosToken> atualizarToken(@Valid @RequestBody DadosRefreshToken dados){
        var refreshToken = dados.refreshToken();
        String idUsuario = tokenService.verificarToken(refreshToken);
        var usuario = userRepository.findById(idUsuario).orElseThrow();

        String tokenAcesso = tokenService.gerarToken(usuario);
        String tokenAtualizacao = tokenService.gerarRefreshToken(usuario);

        return ResponseEntity.ok(new DadosToken(tokenAcesso, tokenAtualizacao));
    }
}
