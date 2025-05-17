package fiap.com.br.autottu.api.dto;

import jakarta.validation.constraints.NotNull;

public record CheckinRequest(
        @NotNull Integer motoId,
        @NotNull Integer slotId,
        @NotNull Integer usuarioId,
        Boolean violada,
        String observacao,
        String imagens
) { }
