package fiap.com.br.autottu.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data

public class MotoDTO{

    @NotNull(message="O id da placa não pode ser nulo")
    private Integer id;

    @NotNull(message="A placa não pode ser nulo")
    @NotBlank(message="A placa não pode ser vazia")
    private String placa;
    private String modelo;
    private String marca;
    private String status;
    private String urlFoto;

}

