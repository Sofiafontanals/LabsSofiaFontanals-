CREATE DATABASE IF NOT EXISTS TikTokDB;
 
USE TikTokDB;
 
CREATE TABLE IF NOT EXISTS usuarios (
	id_usuario INT NOT NULL UNIQUE,
    nombre VARCHAR (100),
    correo VARCHAR (100),
    fecha date,
    pais VARCHAR (100) NOT NULL,
    PRIMARY KEY (id_usuario)) ;
    
    
    CREATE TABLE IF NOT EXISTS videos (
    id_video INT NOT NULL UNIQUE,
    id_usuario INT,
    titulo VARCHAR (100),
    descripcion VARCHAR (100),
    fecha DATE,
    duracion TIME,
	CONSTRAINT fk_usuarios_videos
	FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario));
    
    
	CREATE TABLE IF NOT EXISTS comentarios (
    id_comentario INT NOT NULL UNIQUE,
    id_usuario INT,
    id_video INT,
    texto VARCHAR (100),
    fecha DATE,
	CONSTRAINT fk_usuarios_videos_comentarios
	FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_video) REFERENCES videos (id_video));
    
     
CREATE TABLE  IF NOT EXISTS Likes (
    id_like  INT NOT NULL UNIQUE,
    id_video INT NOT NULL,                   
    id_usuario INT NOT NULL,                  
    fechalike DATE NOT NULL,       
    CONSTRAINT fk_video_usuario_Likes
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),      
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) 
);
 
CREATE TABLE IF NOT EXISTS Seguidores (
id_seguidor INT PRIMARY KEY AUTO_INCREMENT,  
id_usuario_seguidor INT NOT NULL,             
id_usuario_seguido INT NOT NULL,             
fecha_inicio DATE NOT NULL,                  
CONSTRAINT fk_usuario_seguidor 
FOREIGN KEY (id_usuario_seguidor) REFERENCES Usuarios(id_usuario),
FOREIGN KEY (id_usuario_seguido) REFERENCES Usuarios(id_usuario)

);
 INSERT INTO usuarios (id_usuario, nombre, correo, fecha, pais) 
 VALUES
(1, "sofia", "sofia.perez@email.com", "2024-01-15", "España"),
(2, "carla", "carla.@email.com", "2023-02-10", "España"),
(3, "Marta", "marta.@email.com", "2025-03-05", "España");

INSERT INTO videos (id_video, id_usuario, titulo, descripcion, fecha, duracion) 
VALUES
(1, 1, "BD", "Baile divertido", "2023-04-01", "00:01:30"),
(2, 2, "RF", "Cómo", "2023-04-03", "00:02:00"),
(3, 3, "TP", "Consejos para mejorar", "2023-04-05", "00:02:30");

INSERT INTO comentarios (id_comentario, id_usuario, id_video, texto, fecha) 
VALUES
(1, 2, 1, "Muy buen", "2022-04-02"),
(2, 3, 2, "Gracias", "2023-04-04"),
(3, 1, 3, "Muy utiles", "2024-04-06");

INSERT INTO Likes (id_like, id_video, id_usuario, fechalike) 
VALUES
(1, 1, 3, "2022-04-02"),
(2, 2, 1, "2023-04-04"),
(3, 3, 2, "2024-04-06");

INSERT INTO Seguidores (id_usuario_seguidor, id_usuario_seguido, fecha_inicio) 
VALUES
(1, 2, "2022-04-01"), 
(2, 3, "2023-04-02"),  
(3, 1, "2024-04-03");

SELECT * FROM usuarios;

SELECT * FROM videos;

SELECT c.id_comentario, u.nombre AS usuario, v.titulo AS video, c.texto, c.fecha
FROM comentarios c
JOIN usuarios u ON c.id_usuario = u.id_usuario
JOIN videos v ON c.id_video = v.id_video;

SELECT l.id_like, u.nombre AS usuario, v.titulo AS video, l.fechalike
FROM Likes l
JOIN usuarios u ON l.id_usuario = u.id_usuario
JOIN videos v ON l.id_video = v.id_video;

SELECT su.nombre AS seguidor, se.nombre AS seguido, s.fecha_inicio
FROM Seguidores s
JOIN usuarios su ON s.id_usuario_seguidor = su.id_usuario
JOIN usuarios se ON s.id_usuario_seguido = se.id_usuario;

SELECT nombre FROM usuarios;

SELECT titulo, fecha FROM videos WHERE fecha > '2023-04-01';

SELECT texto, fecha FROM comentarios WHERE id_usuario = 1;
  
  


