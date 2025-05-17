package fiap.com.br.autottu.api.dto;

import lombok.Data;

@Data
public class UsuarioDTO {
    Integer id;
    String  nome;
    String  email;
    String  telefone;
}