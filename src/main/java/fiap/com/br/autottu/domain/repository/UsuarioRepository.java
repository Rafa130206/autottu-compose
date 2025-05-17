package fiap.com.br.autottu.domain.repository;

import fiap.com.br.autottu.domain.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario,Integer> {}
