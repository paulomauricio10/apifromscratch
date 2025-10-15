# apifromscratch
API de usuários do zero

## Docker / Compose

1. (Opcional) Copie `.env.example` para `.env` e ajuste credenciais.
2. Suba os serviços:

```powershell
docker compose up --build -d
```

3. Acessar:
	 - Aplicação: http://localhost:8080
	 - MySQL: localhost:3306

Logs da aplicação:
```powershell
docker compose logs -f app
```

Encerrar:
```powershell
docker compose down
```

Volume persistente: `mysql_data`.

## Variáveis de Ambiente Principais
- MYSQL_HOST
- MYSQL_PORT
- MYSQL_DB
- MYSQL_USER
- MYSQL_PASSWORD

## Estrutura do Projeto
```
Dockerfile
docker-compose.yml
.dockerignore
api/
	pom.xml
	src/main/java/... (código fonte)
	src/main/resources/application.properties
	src/main/resources/db/migration/V1__create_users.sql
```

## Próximos passos sugeridos
- Adicionar `spring-boot-starter-actuator` para health endpoint (usado no healthcheck do compose).
- Montar código fonte no container em dev para hot reload.
- Implementar hashing real de senha com BCrypt no fluxo de criação de usuário.
- Adicionar testes automatizados e pipeline CI.
