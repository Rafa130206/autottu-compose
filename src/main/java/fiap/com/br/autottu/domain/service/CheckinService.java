package fiap.com.br.autottu.domain.service;

import fiap.com.br.autottu.api.dto.CheckinRequest;
import fiap.com.br.autottu.api.mapper.CheckinMapper;
import fiap.com.br.autottu.domain.model.Checkin;
import fiap.com.br.autottu.domain.model.Moto;
import fiap.com.br.autottu.domain.model.Slot;
import fiap.com.br.autottu.domain.model.Usuario;
import fiap.com.br.autottu.domain.repository.CheckinRepository;
import fiap.com.br.autottu.domain.repository.MotoRepository;
import fiap.com.br.autottu.domain.repository.SlotRepository;
import fiap.com.br.autottu.domain.repository.UsuarioRepository;
import fiap.com.br.autottu.shared.exception.BusinessException;
import fiap.com.br.autottu.shared.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@RequiredArgsConstructor
public class CheckinService {

    private final CheckinRepository checkinRepo;
    private final MotoRepository motoRepo;
    private final SlotRepository slotRepo;
    private final UsuarioRepository usuarioRepo;
    private final CheckinMapper mapper;

    /**
     * Registra um novo check-in, vincula a moto ao slot e gera DTO de resposta.
     */
    @Transactional
    public CheckinRequest registrar(CheckinRequest req) {

        // 1. Valida Lado da Moto
        Moto moto = motoRepo.findById(req.motoId())
                .orElseThrow(() -> new NotFoundException("Moto não encontrada"));

        // 2. Valida Slot
        Slot slot = slotRepo.findById(req.slotId())
                .orElseThrow(() -> new NotFoundException("Slot não encontrado"));
        if (Boolean.TRUE.equals(slot.getOcupado())) {
            throw new BusinessException("Slot já está ocupado");
        }

        // 3. Valida Usuário
        Usuario usuario = usuarioRepo.findById(req.usuarioId())
                .orElseThrow(() -> new NotFoundException("Usuário não encontrado"));

        // 4. Cria entidade Checkin
        Checkin entity = new Checkin();
        entity.setViolada(req.violada());
        entity.setObservacao(req.observacao());
        entity.setTimestamp(new Date());
        entity.setImagens(req.imagens());
        entity.setMoto(moto);
        entity.setUsuario(usuario);

        // 5. Persiste Checkin
        Checkin salvo = checkinRepo.save(entity);

        // 6. Atualiza Slot (agora ocupado)
        slot.setMoto(moto);
        slot.setOcupado(true);
        slotRepo.save(slot);

        return mapper.toDTO(salvo);
    }
}
