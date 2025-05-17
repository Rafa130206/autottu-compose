package fiap.com.br.autottu.domain.repository;

import fiap.com.br.autottu.domain.model.Checkin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CheckinRepository extends JpaRepository<Checkin,Integer> {}
