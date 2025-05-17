package fiap.com.br.autottu.api.mapper;

import fiap.com.br.autottu.api.dto.MotoDTO;
import fiap.com.br.autottu.domain.model.Moto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring",
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface MotoMapper {

    MotoDTO toDTO(Moto entity);
    @Mapping(target = "slot", ignore = true)
    @Mapping(target = "checkins", ignore = true)
    Moto toEntity(MotoDTO dto);
    void updateEntityFromDto(MotoDTO dto, @MappingTarget Moto entity);

}