package fiap.com.br.autottu.domain.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "AUT_T_MOTO")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class Moto {

    @Id
    @Column(name = "id_moto")
    private Integer id;

    private String placa;
    private String modelo;
    private String marca;
    private String status;

    @Column(name = "url_foto")
    private String urlFoto;

    /* ➊ Relacionamento 1:1 com Slot (opcional) */
    @OneToOne(mappedBy = "moto", fetch = FetchType.LAZY)
    private Slot slot;

    /* ➋ Relacionamento 1:N com Checkin */
    @OneToMany(mappedBy = "moto", fetch = FetchType.LAZY)
    private List<Checkin> checkins = new ArrayList<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUrlFoto() {
        return urlFoto;
    }

    public void setUrlFoto(String urlFoto) {
        this.urlFoto = urlFoto;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }

    public List<Checkin> getCheckins() {
        return checkins;
    }

    public void setCheckins(List<Checkin> checkins) {
        this.checkins = checkins;
    }
}