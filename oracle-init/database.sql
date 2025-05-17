-- CHALLENGE 2025 | MASTERING RELATIONAL AND NON-RELATIONAL DATABASE | 2TDSPH
-- AUTOTTU
-- André Luís Mesquita de Abreu  | RM: 558159
-- Maria Eduarda Brigidio        | RM: 55857
-- Rafael Bompadre Lima          | RM: 556459


-- Deletar dados das tabelas
DELETE from aut_t_checkin;
DELETE from aut_t_slot;
DELETE from aut_t_moto;
DELETE from aut_t_usuario;



-- Excluir tabelas
DROP TABLE aut_t_checkin cascade constraints;
DROP TABLE aut_t_moto cascade constraints;
DROP TABLE aut_t_slot cascade constraints;
DROP TABLE aut_t_usuario cascade constraints;



-- Criar tabela de Motos
CREATE TABLE aut_t_moto (
    id_moto  INTEGER NOT NULL,
    placa    VARCHAR2(10) NOT NULL,
    modelo   VARCHAR2(50) NOT NULL,
    marca    VARCHAR2(50) NOT NULL,
    status   VARCHAR2(50) NOT NULL,
    url_foto VARCHAR2(150) NOT NULL
);

ALTER TABLE aut_t_moto ADD CONSTRAINT aut_t_moto_pk PRIMARY KEY ( id_moto );

-- Inserts para tabela AUT_T_MOTO
INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (1, 'JSK4A48', 'CB500', 'Honda', 'violada', 'https://bancofotos.com/fotoJSK4A48.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (2, 'LFO2P92', 'Fazer 250', 'Yamaha', 'violada', 'https://bancofotos.com/fotoLFO2P92.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (3, 'HFN2P56', 'Titan 160', 'Honda', 'ok', 'https://bancofotos.com/fotoHFN2P56.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (4, 'LSP2F27', 'XRE 300', 'Honda', 'violada', 'https://bancofotos.com/fotoLSP2F27.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (5, 'OBA2K58', 'MT-03', 'Yamaha', 'ok', 'https://bancofotos.com/fotoOBA2K58.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (6, 'KSD3P11', 'Hornet 600', 'Honda', 'ok', 'https://bancofotos.com/fotoKSD3P11.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (7, 'MSA9L88', 'Twister 250', 'Honda', 'violada', 'https://bancofotos.com/fotoMSA9L88.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (8, 'TRE1D66', 'Z400', 'Kawasaki', 'ok', 'https://bancofotos.com/fotoTRE1D66.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (9, 'JPL7C22', 'NMax 160', 'Yamaha', 'violada', 'https://bancofotos.com/fotoJPL7C22.jpg');

INSERT INTO aut_t_moto (id_moto, placa, modelo, marca, status, url_foto)
VALUES (10, 'BGO3Z99', 'Versys 650', 'Kawasaki', 'ok', 'https://bancofotos.com/fotoBGO3Z99.jpg');



-- Criar tabela de Usuário
CREATE TABLE aut_t_usuario (
    id_usuario INTEGER NOT NULL,
    nome       VARCHAR2(100) NOT NULL,
    email      VARCHAR2(50) NOT NULL,
    senha      VARCHAR2 (50)  NOT NULL ,
    telefone   VARCHAR2(15) NOT NULL
);

ALTER TABLE aut_t_usuario ADD CONSTRAINT aut_t_usuario_pk PRIMARY KEY ( id_usuario );

-- Inserts para tabela AUT_T_USUARIO
INSERT INTO aut_t_usuario (id_usuario, nome, email, senha, telefone)
VALUES (1, 'Pedro de Almeida', 'pedroalmeida@gmail.com', '4465258PA*', '11995749284');

-- Inserts na tabela AUT_T_USUARIO
INSERT INTO aut_t_usuario (id_usuario, nome, email, senha, telefone)
VALUES (2, 'Maria Oliveira', 'maria.oliveira@gmail.com', 'mariOlive1999', '11948252850');

INSERT INTO aut_t_usuario (id_usuario, nome, email, senha, telefone)
VALUES (3, 'Joao Santos', 'joaosantos1@gmail.com', '86425JOAO%', '11958274019');

INSERT INTO aut_t_usuario (id_usuario, nome, email, senha, telefone)
VALUES (4, 'Ana Costa', 'costaana@gmail.com', '@nacost@2056', '11940284917');

INSERT INTO aut_t_usuario (id_usuario, nome, email, telefone)
VALUES (5, 'Lucas Pereira', 'lucaspereira@gmail.com', 'lukP365*', '11993785027');



-- Criar tabela de Slots
CREATE TABLE aut_t_slot (
    id_slot            INTEGER NOT NULL,
    ocupado            CHAR(1) NOT NULL,
    aut_t_moto_id_moto INTEGER NULL
);

CREATE UNIQUE INDEX aut_t_slot__idx ON
    aut_t_slot (
        aut_t_moto_id_moto
    ASC );

ALTER TABLE aut_t_slot ADD CONSTRAINT aut_t_slot_pk PRIMARY KEY ( id_slot );

ALTER TABLE aut_t_slot
    ADD CONSTRAINT aut_t_slot_aut_t_moto_fk FOREIGN KEY (aut_t_moto_id_moto)
        REFERENCES aut_t_moto (id_moto)
        ON DELETE SET NULL;

-- Inserts para tabela AUT_T_SLOT
INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (1, 'S', 1);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (2, 'S', 2);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (3, 'S', 3);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (4, 'S', 4);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (5, 'S', 5);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (6, 'N', null);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (7, 'N', null);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (8, 'N', null);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (9, 'N', null);

INSERT INTO aut_t_slot (id_slot, ocupado, aut_t_moto_id_moto)
VALUES (10, 'N', null);



-- Criar tabela de Checkin
CREATE TABLE aut_t_checkin (
    id_checkin               INTEGER NOT NULL,
    violada                  CHAR(1) NOT NULL,
    observacao               VARCHAR2(150) NOT NULL,
    timestamp                DATE NOT NULL,
    imagens                  VARCHAR2(150) NOT NULL,
    aut_t_moto_id_moto       INTEGER NOT NULL,
    aut_t_usuario_id_usuario INTEGER NOT NULL
);

ALTER TABLE aut_t_checkin ADD CONSTRAINT aut_t_checkin_pk PRIMARY KEY ( id_checkin );

ALTER TABLE aut_t_checkin
    ADD CONSTRAINT aut_t_checkin_aut_t_moto_fk FOREIGN KEY ( aut_t_moto_id_moto )
        REFERENCES aut_t_moto ( id_moto );

ALTER TABLE aut_t_checkin
    ADD CONSTRAINT aut_t_checkin_aut_t_usuario_fk FOREIGN KEY ( aut_t_usuario_id_usuario )
        REFERENCES aut_t_usuario ( id_usuario );

-- Inserts para tabela AUT_T_CHECKIN
INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (1, 'S', 'Pneu frontal furado', TO_DATE('2025-04-28 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto1.jpg', 1, 1);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (2, 'S', 'Moto sem motor', TO_DATE('2025-04-29 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto2.jpg', 2, 2);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (3, 'N', 'Check-in realizado corretamente', TO_DATE('2025-04-30 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto3.jpg', 3, 3);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (4, 'S', 'Moto sem IoT', TO_DATE('2025-05-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto4.jpg', 4, 4);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (5, 'N', 'Check-in efetuado corretamente', TO_DATE('2025-05-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto5.jpg', 5, 5);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (6, 'N', 'Check-in realizado com sucesso', TO_DATE('2025-05-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto6.jpg', 6, 1);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (7, 'S', 'Tanque perfurado', TO_DATE('2025-05-04 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto7.jpg', 7, 2);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (8, 'N', 'Check-in concluído com sucesso', TO_DATE('2025-05-05 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto8.jpg', 8, 3);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (9, 'S', 'Moto sem painel', TO_DATE('2025-05-06 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto9.jpg', 9, 4);

INSERT INTO aut_t_checkin (id_checkin, violada, observacao, timestamp, imagens, aut_t_moto_id_moto, aut_t_usuario_id_usuario)
VALUES (10, 'N', 'Check-in normal', TO_DATE('2025-05-07 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'fotosmoto10.jpg', 10, 5);



-- BLOCOS PLSQL
set serveroutput on

-- BLOCO 1: Check-ins por status da moto
DECLARE
    CURSOR c_checkins_por_status IS SELECT
        m.status, COUNT(c.id_checkin) AS total_checkins
    FROM aut_t_moto m JOIN aut_t_checkin c ON m.id_moto = c.aut_t_moto_id_moto 
    GROUP BY m.status 
    ORDER BY m.status;
    
    v_status aut_t_moto.status%TYPE;
    v_total_checkins NUMBER;

BEGIN
    OPEN c_checkins_por_status;
    LOOP
        FETCH c_checkins_por_status INTO v_status, v_total_checkins;
        EXIT WHEN c_checkins_por_status%NOTFOUND;
        dbms_output.put_line('Status: '|| v_status || ' | Total de Check-Ins: '|| v_total_checkins);
    END LOOP;
    CLOSE c_checkins_por_status;
END;

-- BLOCO 2: Slots ocupados e motos violadas por marca
DECLARE
    CURSOR c_slots_ocupados IS SELECT s.id_slot, m.placa, m.modelo, m.marca, m.status
        FROM aut_t_slot s
        JOIN aut_t_moto m ON s.aut_t_moto_id_moto = m.id_moto
        WHERE s.ocupado = 'S'
        ORDER BY s.id_slot;
        
    v_id_slot aut_t_slot.id_slot%TYPE;
    v_placa aut_t_moto.placa%TYPE;
    v_modelo aut_t_moto.modelo%TYPE;
    v_marca aut_t_moto.marca%TYPE;
    v_status aut_t_moto.status%TYPE;

    CURSOR c_motos_violadas IS SELECT m.marca,
        COUNT(*) AS qtd_violadas
        FROM aut_t_moto m
        WHERE m.status = 'violada'
        GROUP BY m.marca
        ORDER BY qtd_violadas DESC;

    v_marca_violada aut_t_moto.marca%TYPE;
    v_qtd NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- SLOTS OCUPADOS COM MOTOS ---');
    OPEN c_slots_ocupados;
    LOOP
        FETCH c_slots_ocupados INTO v_id_slot, v_placa, v_modelo, v_marca, v_status;
        EXIT WHEN c_slots_ocupados%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Slot: ' || v_id_slot || ' | Placa: ' || v_placa || ' | Modelo: ' || v_modelo || ' | Marca: ' || v_marca || ' | Status: ' || v_status);
    END LOOP;
    CLOSE c_slots_ocupados;

    DBMS_OUTPUT.PUT_LINE('--- QUANTIDADE DE MOTOS VIOLADAS POR MARCA ---');
    OPEN c_motos_violadas;
    LOOP
        FETCH c_motos_violadas INTO v_marca_violada, v_qtd;
        EXIT WHEN c_motos_violadas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Marca: ' || v_marca_violada || ' | Qtde Violadas: ' || v_qtd);
    END LOOP;
    CLOSE c_motos_violadas;
END;

-- BLOCO 3: Linha do tempo de check-ins
DECLARE
     CURSOR c_checkins IS
        SELECT timestamp
        FROM aut_t_checkin
        ORDER BY timestamp;

    TYPE t_datas IS TABLE OF aut_t_checkin.timestamp%TYPE INDEX BY BINARY_INTEGER;

    v_datas t_datas;
    v_total INTEGER := 0;
BEGIN
    FOR dia IN c_checkins LOOP
        v_total := v_total + 1;
        v_datas(v_total) := dia.timestamp;
    END LOOP;
    
    dbms_output.put_line('Anterior               | Atual                  | Proximo');
    dbms_output.put_line('-----------------------|------------------------|------------------------');
    
    FOR i IN 1 .. v_total LOOP
        IF i = 1 THEN
            dbms_output.put('Vazio' || '                  | ');
        ELSE
            dbms_output.put(TO_CHAR(v_datas(i - 1), 'DD/MM/YYYY HH24:MI:SS') || '    | ');
        END IF;
        dbms_output.put(TO_CHAR(v_datas(i), 'DD/MM/YYYY HH24:MI:SS') || '    | ');
        IF i = v_total THEN
            dbms_output.put_line('Vazio');
        ELSE
            dbms_output.put_line(TO_CHAR(v_datas(i + 1), 'DD/MM/YYYY HH24:MI:SS'));
        END IF;
    END LOOP;
END;