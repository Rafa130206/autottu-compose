package fiap.com.br.autottu.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class UsuarioDTO {

    Integer id;

    @NotNull(message="O nome não pode ser nulo")
    @NotBlank(message="O nome não pode ser vazio")
    String  nome;

    @NotNull(message="O email não pode ser nulo")
    @NotBlank(message="O email não pode ser vazio")
    String  email;

    String  telefone;

}