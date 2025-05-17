package fiap.com.br.autottu.api.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data

public class MotoDTO{

    private Integer id;

    @NotBlank
    private String placa;

    private String modelo;
    private String marca;
    private String status;
    private String urlFoto;
}

