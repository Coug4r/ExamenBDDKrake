CREATE TABLE vuelos (
    id SERIAL PRIMARY KEY, -- Identificador único autoincremental
    codigo VARCHAR(10) NOT NULL UNIQUE, -- Código identificador del vuelo (ej. 'AA-123', 'LA-456')
    precio_boleto NUMERIC(10,2) NOT NULL CHECK (precio_boleto >= 0), -- Costo del boleto individual
    asientos_disponibles INTEGER NOT NULL CHECK (asientos_disponibles >= 0) -- Número de asientos vacíos en el avión
);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AA-101', 250.00, 120);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LA-202', 180.50, 95);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('UA-303', 320.75, 60);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('DL-404', 150.00, 200);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('IB-505', 450.90, 30);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AF-606', 380.00, 80);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('KL-707', 275.25, 110);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LH-808', 500.00, 50);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('EK-909', 600.00, 25);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('CM-010', 220.00, 150);

INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AV-111', 175.00, 90);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('UX-222', 340.00, 70);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('IB-333', 410.00, 40);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AA-444', 280.00, 85);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LA-555', 195.00, 120);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('UA-666', 310.00, 65);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('DL-777', 160.00, 180);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('AF-888', 370.00, 75);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('KL-999', 260.00, 100);
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES ('LH-123', 480.00, 45);

SELECT * FROM vuelos
WHERE asientos_disponibles < 5;

UPDATE vuelos
SET precio_boleto = precio_boleto * 1.15
WHERE id = 3;

DELETE FROM vuelos
WHERE asientos_disponibles = 0;

select * from vuelos

ALTER TABLE vuelos ADD COLUMN destino VARCHAR(100);
