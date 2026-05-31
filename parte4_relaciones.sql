-- Tabla proyectos
CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dias_estimados INTEGER NOT NULL CHECK (dias_estimados > 0)
);

-- Tabla tecnologias
CREATE TABLE tecnologias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(30) NOT NULL
);

-- Tabla intermedia para la relación muchos a muchos
CREATE TABLE proyectos_tecnologias (
    id_proyecto INT NOT NULL,
    id_tecnologia INT NOT NULL,
    PRIMARY KEY (id_proyecto, id_tecnologia),
    FOREIGN KEY (id_proyecto) REFERENCES proyectos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_tecnologia) REFERENCES tecnologias(id) ON DELETE CASCADE
);

INSERT INTO proyectos (nombre, dias_estimados) VALUES ('Sistema de Ventas', 45);
INSERT INTO proyectos (nombre, dias_estimados) VALUES ('App Móvil Bancaria', 90);
INSERT INTO proyectos (nombre, dias_estimados) VALUES ('Plataforma E-learning', 120);

INSERT INTO tecnologias (nombre, categoria) VALUES ('Java', 'Backend');
INSERT INTO tecnologias (nombre, categoria) VALUES ('React', 'Frontend');
INSERT INTO tecnologias (nombre, categoria) VALUES ('PostgreSQL', 'Base de Datos');
INSERT INTO tecnologias (nombre, categoria) VALUES ('Spring Boot', 'Backend');
INSERT INTO tecnologias (nombre, categoria) VALUES ('Docker', 'DevOps');


-- Sistema de Ventas usa Java y PostgreSQL
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (1, 1);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (1, 3);

-- App Móvil Bancaria usa Java, React y PostgreSQL
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (2, 1);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (2, 2);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (2, 3);

-- Plataforma E-learning usa Java, Spring Boot, React y Docker
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (3, 1);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (3, 2);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (3, 4);
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES (3, 5);


SELECT t.nombre AS tecnologia, t.categoria FROM proyectos p
INNER JOIN proyectos_tecnologias pt ON p.id = pt.id_proyecto
INNER JOIN tecnologias t ON t.id = pt.id_tecnologia
WHERE p.nombre = 'Sistema de Ventas';

SELECT p.nombre AS proyecto, p.dias_estimados FROM proyectos p
INNER JOIN proyectos_tecnologias pt ON p.id = pt.id_proyecto
INNER JOIN tecnologias t ON t.id = pt.id_tecnologia
WHERE t.id = 1; 


SELECT t.nombre AS tecnologia, COUNT(pt.id_proyecto) AS proyectos_usando FROM tecnologias t
LEFT JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
GROUP BY t.nombre ORDER BY proyectos_usando DESC;






