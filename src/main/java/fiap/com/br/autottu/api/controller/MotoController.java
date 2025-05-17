package fiap.com.br.autottu.api.controller;

import fiap.com.br.autottu.api.dto.MotoDTO;
import fiap.com.br.autottu.domain.model.Moto;
import fiap.com.br.autottu.domain.service.MotoService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/motos")
@RequiredArgsConstructor
public class MotoController {

    private final MotoService service;

    @GetMapping("/{id}")
    public MotoDTO getById(@PathVariable Integer id) {
        return service.buscarPorId(id);
    }

    @GetMapping
    public Page<MotoDTO> listAll(@RequestParam int pagina, @RequestParam int itens ) {
        return service.listarTodas(pagina, itens);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public MotoDTO create(@RequestBody MotoDTO dto) {
        return service.criar(dto);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public MotoDTO update(@PathVariable Integer id, @RequestBody MotoDTO dto) {return service.atualizar(id, dto); }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) { service.excluir(id); }
}
