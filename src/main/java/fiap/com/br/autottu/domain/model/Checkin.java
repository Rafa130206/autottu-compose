package fiap.com.br.autottu.domain.model;

import fiap.com.br.autottu.shared.converter.YesNoBooleanConverter;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity
@Table(name = "AUT_T_CHECKIN")
@Data
@Getter @Setter
public class Checkin {
    @Id
    @Column(name = "id_checkin")
    private Integer id;

    @Convert(converter = YesNoBooleanConverter.class)
    private Boolean violada;

    private String observacao;

    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;

    private String imagens;

    @ManyToOne @JoinColumn(name = "AUT_T_MOTO_id_moto")
    private Moto moto;

    @ManyToOne @JoinColumn(name = "AUT_T_USUARIO_id_usuario")
    private Usuario usuario;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getViolada() {
        return violada;
    }

    public void setViolada(Boolean violada) {
        this.violada = violada;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getImagens() {
        return imagens;
    }

    public void setImagens(String imagens) {
        this.imagens = imagens;
    }

    public Moto getMoto() {
        return moto;
    }

    public void setMoto(Moto moto) {
        this.moto = moto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
