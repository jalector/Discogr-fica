CREATE DATABASE discografica;

USE discografica;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Usuario(
	id 						int 		not null auto_increment,
	nombre 					varchar(50) not null,
	apellidos 				varchar(50) not null,
	contrasenia 			varchar(20) not null,
	telefono 				varchar(10),
	direccion 				varchar(80),
	correo 					varchar(30),
	tipo_usuario 			varchar(20) not null,
	id_usuario_alta 		int,
	fecha_alta 				date,
	id_usuario_modificacion int,
	fecha_modificacion 		date,
	primary key (id)
);

CREATE TABLE Disco(
	id 						int 		 not null auto_increment,
	titulo 					varchar(30)  not null,
	precio 					float(10,2)  not null,
	imagen		 			varchar(100),
	existencia 				int,
	genero	 				varchar(30),
	ubicacion 				varchar(20),
	descripcion 			varchar(50),
	id_usuario_alta 		int,
	fecha_alta 				date,
	id_usuario_modificacion int,
	fecha_modificacion 		date,
	primary key (id)
);

CREATE TABLE Almacen(
	id 				 int 		 not null auto_increment,
	tipo_movimiento	 varchar(30) not null,
	fecha_movimiento date,
	descripcion		 varchar(100),
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