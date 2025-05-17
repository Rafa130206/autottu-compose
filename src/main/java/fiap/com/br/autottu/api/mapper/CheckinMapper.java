    package fiap.com.br.autottu.api.mapper;

    import fiap.com.br.autottu.api.dto.CheckinRequest;
    import fiap.com.br.autottu.domain.model.Checkin;
    import org.mapstruct.Mapper;
    import org.mapstruct.Mapping;

    @Mapper(componentModel = "spring", uses = { MotoMapper.class, UsuarioMapper.class })
    public interface CheckinMapper {

        // Entity ➜ DTO
        @Mapping(source = "moto.id",     target = "motoId")
        @Mapping(source = "usuario.id",  target = "usuarioId")
        @Mapping(source = "moto.slot.id",  target = "slotId")
        CheckinRequest toDTO(Checkin entity);


    }