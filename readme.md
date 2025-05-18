# Autottu – API de gestão de motos 🏍️

API REST construída como parte do **Challenge Autottu (FIAP – 1º semestre / 2025)**.  
Permite cadastrar, listar, atualizar e remover motos, slots e check-ins, integrando-se a banco **Oracle 19c**.

---

## 👥 Integrantes

| Nome | RM |
|------|----|
| André Luís Mesquita de Abreu | 558159 |
| Maria Eduarda Brigidio | 558575 |
| Rafael Bompadre Lima | 556459 |

---

## ⚙️ Stack & dependências

> Requer **Java 21** e **Maven 3.9+**

| Grupo / Artefato | Função | Versão |
|------------------|--------|--------|
| **Spring Boot 3.4.5** |
| `spring-boot-starter-web` | REST / Tomcat |
| `spring-boot-starter-data-jpa` | JPA + Hibernate 6 |
| `spring-boot-starter-validation` | Jakarta Bean Validation |
| `spring-boot-starter-test` | JUnit 5 / MockMvc (*test*) |
| **Persistência** |
| `com.oracle.database.jdbc:ojdbc11` | Driver Oracle JDBC | 23.3.0 |
| **DTO / Mapper** |
| `org.mapstruct:mapstruct` | MapStruct | 1.5.5.Final |
| `lombok` & `lombok-mapstruct-binding` | Boilerplate + bridge | 1.18.30 / 0.2.0 |
| **Documentação** |
| `springdoc-openapi-starter-webmvc-ui` | Swagger UI / OpenAPI 3 | 2.6.0 |
| **Configuração** |
| `me.paulschwarz:spring-dotenv` | Variáveis via `.env` | 2.5.4 |
| **Utilitários** |
| `org.modelmapper:modelmapper` | Conversões simples | 3.2.2 |

---

## 🏁 Como executar


# clone
git clone https://github.com/<sua-org>/autottu.git
cd autottu

# configure o banco
```bash
echo DB_URL=jdbc:oracle:thin:@//localhost:1521/ORCL > .env
echo DB_USER=SEUUSER                               >> .env
echo DB_PASS=SUASENHA                              >> .env
```
# build & run
./mvnw clean spring-boot:run

## 📚 Principais endpoints

| Método | Rota                               | Descrição                       | Corpo esperado |
|--------|------------------------------------|---------------------------------|----------------|
| GET    | `/api/v1/motos`                    | Lista paginada de motos         | —              |
| GET    | `/api/v1/motos/{id}`               | Detalha uma moto                | —              |
| POST   | `/api/v1/motos`                    | Cria nova moto                  | `MotoDTO`      |
| PUT    | `/api/v1/motos/{id}`               | Atualiza dados da moto          | `MotoDTO` (parcial ou completo) |
| DELETE | `/api/v1/motos/{id}`               | Remove moto                     | —              |
| GET    | `/api/v1/slots`                    | Lista slots de estacionamento   | —              |
| POST   | `/api/v1/checkins`                 | Registra check-in da moto       | `CheckinDTO`   |
| POST   | `/api/v1/auth/login`               | Autentica usuário e gera JWT    | `LoginDTO`     |

> Todos os endpoints — inclusive erros 400 via `ValidationExceptionHandler` —
> estão documentados em **/swagger-ui.html**.

---

## 📂 Estrutura do projeto

```bash
autottu
├─ src
│ ├─ main
│ │ ├─ java
│ │ │ └─ fiap.com.br.autottu
│ │ │ ├─ api # controllers, DTOs, mappers
│ │ │ ├─ domain # entidades, repositórios, serviços
│ │ │ └─ shared # exceções, utilidades
│ │ └─ resources
│ │ ├─ application.properties
│ │ └─ db/migration # scripts Flyway (opcional)
│ └─ test
│ └─ java … # testes JUnit / MockMvc
└─ .env # credenciais Oracle (git-ignored)
```

---

## 🏁 Execução rápida

```bash
# 1. clone e entre na pasta
git clone https://github.com/<sua-org>/autottu.git
cd autottu

# 2. defina o .env (ou exporte variáveis)
echo DB_URL=jdbc:oracle:thin:@//localhost:1521/ORCL > .env
echo DB_USER=AUTOTTU                                >> .env
echo DB_PASS=Secreta                                >> .env

# 3. build & run
./mvnw clean spring-boot:run
```

API: http://localhost:8080

Swagger: /swagger-ui.html
