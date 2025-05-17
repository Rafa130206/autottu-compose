package fiap.com.br.autottu.api.mapper;

import fiap.com.br.autottu.api.dto.UsuarioDTO;
import fiap.com.br.autottu.domain.model.Usuario;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UsuarioMapper {
    UsuarioDTO toDTO(Usuario entity);
}
