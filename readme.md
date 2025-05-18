Autottu – API de gestão de motos 🏍️
API REST construída como parte do Challenge Autottu (FIAP – 1º semestre 2025).
Permite cadastrar, listar, atualizar e remover motos, slots e check-ins, integrando-se a banco Oracle 19c.

👥 Integrantes
Nome	RM
André Luís Mesquita de Abreu	558159
Maria Eduarda Brigidio	558575
Rafael Bompadre Lima	556459

⚙️ Stack & dependências principais
Grupo / Artefato	Função	Versão
Spring Boot		
spring-boot-starter-web	REST / Tomcat embutido	3.4.5
spring-boot-starter-data-jpa	JPA + Hibernate 6	3.4.5
spring-boot-starter-validation	Jakarta Bean Validation	3.4.5
spring-boot-starter-test	JUnit 5 + MockMvc	scope test
Persistência		
com.oracle.database.jdbc:ojdbc11	Driver Oracle JDBC	23.3.0
Mapper / DTO		
org.mapstruct:mapstruct	Mapeamento DTO↔Entity	1.5.5.Final
org.projectlombok:lombok	Boilerplate getters/setters	1.18.30 (provided)
lombok-mapstruct-binding	Integra Lombok + MapStruct	0.2.0 (provided)
Documentação		
springdoc-openapi-starter-webmvc-ui	Swagger UI / OpenAPI 3	2.6.0
Configuração		
me.paulschwarz:spring-dotenv	Carrega variáveis de .env	2.5.4
Utilitários		
org.modelmapper:modelmapper	Conversões simples	3.2.2

Java 21 e Maven 3.9+ são pré-requisitos.