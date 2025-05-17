package fiap.com.br.autottu.domain.model;

import fiap.com.br.autottu.shared.converter.YesNoBooleanConverter;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "AUT_T_SLOT")
@Data
@Getter @Setter
public class Slot {
    @Id
    @Column(name = "id_slot")
    private Integer id;

    @Convert(converter = YesNoBooleanConverter.class)
    private Boolean ocupado;

    @OneToOne
    @JoinColumn(name = "AUT_T_MOTO_id_moto")
    private Moto moto;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getOcupado() {
        return ocupado;
    }

    public void setOcupado(Boolean ocupado) {
        this.ocupado = ocupado;
    }

    public Moto getMoto() {
        return moto;
    }

    public void setMoto(Moto moto) {
        this.moto = moto;
    }
}
