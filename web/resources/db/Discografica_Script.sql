CREATE DATABASE discografica;

USE discografica;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Usuario(
	id 						int 		not null auto_increment,
	nombre 					nvarchar(50) not null,
	apellidos 				nvarchar(50) not null,
	contrasenia 			nvarchar(20) not null,
	telefono 				nvarchar(10),
	direccion 				nvarchar(80),
	correo 					nvarchar(30),
	tipo_usuario 			nvarchar(20) not null,
	id_usuario_alta 		int,
	fecha_alta 				nvarchar(10),
	id_usuario_modificacion int,
	fecha_modificacion 		nvarchar(10),
	primary key (id)
);

INSERT INTO `usuario` (`id`, `nombre`, `apellidos`, `contrasenia`, `telefono`, `direccion`, `correo`, `tipo_usuario`, `id_usuario_alta`, `fecha_alta`, `id_usuario_modificacion`, `fecha_modificacion`) VALUES
(1, 'Luis Saul', 'Ornelas Perez', '1234', '4773548504', 'barcenas 602', 'saulop97@outlook.com', 'Administrador', 1, '2019-05-24', 1, '2019-05-24'),
(2, 'Petronilo', 'Sanchez', '1234', '4773548504', 'Madrid', 'petr@outlook.com', 'Cliente', 1, '2019-05-24', 1, '2019-05-24'),
(3, 'Rafael', 'Paniagua Soto', '1234', '4773548504', 'bosque 110', 'rpaniagua@outlook.com', 'Empleado', 1, '2019-05-28', 1, '2019-05-28');

CREATE TABLE Disco(
	id 						int 		 not null auto_increment,
	titulo 					nvarchar(30)  not null,
	artista					nvarchar(50) not null,
	precio 					float(10,2)  not null,
	imagen		 			text,
	existencia 				int,
	genero	 				nvarchar(30),
	ubicacion 				nvarchar(20),
	descripcion 			text,
	id_usuario_alta 		int,
	fecha_alta 				nvarchar(10),
	id_usuario_modificacion int,
	fecha_modificacion 		nvarchar(10),
	primary key (id)
);

INSERT INTO `disco` (`id`, `titulo`, `artista`, `precio`, `imagen`, `existencia`, `genero`, `ubicacion`, `descripcion`, `id_usuario_alta`, `fecha_alta`, `id_usuario_modificacion`, `fecha_modificacion`) VALUES
(1, 'Revival', 'Eminem', 400.00, 'Eminem_Revival.jpg', 10, 'Hip hop', 'Bla bla', 'Disco chidote', 1, '2019-05-10', 1, '2019-05-28'),
(2, 'Abbey Road', 'The Beatles', 110.00, 'Beatles_Abbey_Road.jpg', 10, 'Rock', 'Alguna', 'Classic of classics', 1, '2019-05-28', 1, '2019-05-28'),
(3, 'Yellow Submarine', 'The Beatles', 399.00, 'Beatles_Yellow_Submarine.jpg', 15, 'Rock', 'Alguna', 'Another classic', 1, '2019-05-28', 1, '2019-05-28'),
(4, 'Black Ice', 'AC DC', 385.00, 'AC_DC_Black_Ice.jpg', 2, 'Rock', 'Otra', 'Rockear', 1, '2019-05-28', 1, '2019-05-28'),
(5, 'A Night At The Opera', 'Queen', 615.00, 'Queen_A_Night_At_The_Opera.jpg', 4, 'Rock', 'Otra', 'The Queen', 1, '2019-05-28', 1, '2019-05-28'),
(6, 'Master Of Puppets', 'Metallica', 333.00, 'Metallica_Master_Of_Puppets.jpg', 8, 'Rock', 'Su ubicacion', 'Metal de metales', 1, '2019-05-28', 1, '2019-05-28');

CREATE TABLE Almacen(
	id 				 int 		 not null auto_increment,
	tipo_movimiento	 nvarchar(30) not null,
	fecha_movimiento nvarchar(10),
	descripcion		 text,
	id_usuario 		 int,
	id_cliente		 int,
	primary key (id),
	foreign key (id_usuario) references Usuario(id) on delete cascade on update cascade,
	foreign key (id_cliente) references Usuario(id) on delete cascade on update cascade
);

CREATE TABLE Detalle(
	id 			  int not null auto_increment,
	cantidad	  int not null,
	id_disco	  int,
	id_movimiento int,
	primary key (id),
	foreign key (id_disco) 		references Disco(id) on delete cascade on update cascade,
	foreign key (id_movimiento) references Almacen(id) on delete cascade on update cascade
);

#select * from Usuario;
#select * from Disco;
