# Autottu – Conteinerização da API de gestão de motos 🏍️
 
API REST contanerizada como parte do **Chekpoint 1 de DevOps & Cloud Computing (FIAP – 2º semestre / 2025)**.  
Permite cadastrar, listar, atualizar e remover motos, slots e check-ins, integrando-se a banco **MySQL** a partir de docker compose.
 
---
 
## 👥 Integrantes
 
| Nome | RM |
|------|----|
| André Luís Mesquita de Abreu | 558159 |
| Maria Eduarda Brigidio | 558575 |
| Rafael Bompadre Lima | 556459 |
 
---
 
## ⚙️ Stack & dependências
 
> Requer **Java 21**, **Maven 3.9+**, **Docker 28.1**, **Docker Compose v2.35.1**
 
| Grupo / Artefato | Função | Versão |
|------------------|--------|--------|
| **Spring Boot 3.4.5** |
| `spring-boot-starter-web` | REST / Tomcat |
| `spring-boot-starter-data-jpa` | JPA + Hibernate 6 |
| `spring-boot-starter-validation` | Jakarta Bean Validation |
| `spring-boot-starter-test` | JUnit 5 / MockMvc (*test*) |
| **Persistência** |
| `com.mysql:mysql-connector-j` | Driver MySQL JDBC |
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
```bash
git clone https://github.com/Rafa130206/autottu-compose.git
```
```bash
cd autottu-compose
```
 
# Subir os containers
```bash
docker compose up -d --build
```
 
## 📚 Principais endpoints
 
**Teste via Swagger: http://<seuip>:8081/swagger-ui/index.html**
 
| Método | Rota                               | Descrição                       | Corpo esperado |
|--------|------------------------------------|---------------------------------|----------------|
| GET    | `/api/v1/motos`                    | Lista paginada de motos         | —              |
| GET    | `/api/v1/motos/{id}`               | Detalha uma moto                | —              |
| POST   | `/api/v1/motos`                    | Cria nova moto                  | `MotoDTO`      |
| PUT    | `/api/v1/motos/{id}`               | Atualiza dados da moto          | `MotoDTO` (parcial ou completo) |
| DELETE | `/api/v1/motos/{id}`               | Remove moto                     | —              |
 
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
│ │ 
│ └─ test
│ └─ java … # testes JUnit / MockMvc
└─ .env # credenciais Oracle (git-ignored)
```
 
---

## 🛠️ Possíveis Falhas
### 1. Pré-Requisitos corretos
- **Java 21** e **Maven 3.9+**. Se você compilar com JDK 17, verá `release version 21 not supported.`
**Checagem**
```bash 
java -version
mvn -v               # precisa mostrar Java 21
```
Se não estiver em 21:
```bash 
sudo dnf install -y java-21-openjdk java-21-openjdk-devel
sudo alternatives --config java
sudo alternatives --config javac
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH="$JAVA_HOME/bin:$PATH"
```

### 2. `mvn clean` falhando para apagar `target/`
Se aparecer algo como **Failed to clean project: Failed to delete target/classes/application.properties:**
```bash 
docker compose down
sudo lsof +D target || true
sudo chown -R $USER:$USER .
sudo rm -rf target
mvn clean package -DskipTests
```
### 3. URL do Swagger vs. Adminer (portas)
- O Adminer publica 8080, então http://<seuip>:8080/swagger-ui/index.html# abre o Adminer.
- A API publica 8081:8080 no Compose, então o Swagger está em:
```bash 
http://<seuip>:8081/swagger-ui/index.html
```
Se quiser a API no 8080 e Adminer no 8082, altere no docker compose:
```bash 
adminer:
  ports: ["8082:8080"]
crud-app:
  ports: ["8080:8080"]
```
Depois
```bash 
docker compose down
docker compose up -d --build
```
### 4. Adminer não conecta: `“getaddrinfo for db failed”`
No Compose, o serviço do banco se chama `mysql`, então o Servidor no Adminer deve ser `mysql` (não `db`).
Campos no Adminer:
- Sistema: `MySQL`
- Servidor/host: `mysql`
- Usuário: `autottu`
- Senha: `autottu`
- Base de dados: `autottu`

## 🏁 Execução rápida

```bash
# 1. clone e entre na pasta
git clone git clone https://github.com/Rafa130206/autottu-compose.git
cd autottu-compose
 
# 2. build & run
docker compose up -d --build
```
 
API: http://<seuip>:8080/swagger-ui/index.html#
 
Swagger: http://<seuip>:8081/swagger-ui/index.html#
