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

CREATE TABLE Disco(
	id 						int 		 not null auto_increment,
	titulo 					nvarchar(30)  not null,
	artista					nvarchar(50) not null,
	precio 					float(10,2)  not null,
	imagen		 			nvarchar(100),
	existencia 				int,
	genero	 				nvarchar(30),
	ubicacion 				nvarchar(20),
	descripcion 			nvarchar(50),
	id_usuario_alta 		int,
	fecha_alta 				nvarchar(10),
	id_usuario_modificacion int,
	fecha_modificacion 		nvarchar(10),
	primary key (id)
);

CREATE TABLE Almacen(
	id 				 int 		 not null auto_increment,
	tipo_movimiento	 nvarchar(30) not null,
	fecha_movimiento nvarchar(10),
	descripcion		 nvarchar(100),
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


insert into Usuario values(null,'Luis Saul', 'Ornelas Pérez','1234','4773548504','barcenas 602','saulop97@outlook.com','Administrador',1,'2019-05-24',1,'2019-05-24');
insert into Usuario values(null,'Petronilo', 'Sanchez','1234','4773548504','Madrid','petr@outlook.com','Cliente',1,'2019-05-24',1,'2019-05-24');

insert into Disco values(null,'Revival','Eminem',400,'https://i1.cdn.hhv.de/catalog/475x475/00588/588736.jpg',
                         10,'Hip hop','Bla bla','Disco chidote',1,'2019-05-10',1,'2019-05-24');

insert into Disco values(null,'Revival 2','Patito',400,'https://i1.cdn.hhv.de/catalog/475x475/00588/588736.jpg',
                         10,'Hip hop','Bla bla','Disco chidote',1,'2019-05-10',1,'2019-05-24');

insert into Disco values(null,'Revival 3','Zaratrustra',400,'https://i1.cdn.hhv.de/catalog/475x475/00588/588736.jpg',
                         10,'Hip hop','Bla bla','Disco chidote',1,'2019-05-10',1,'2019-05-24');

#Registro de almacen
insert into almacen values(null, 'Salida', '2019-04-15', 'Venta de discos chidos', 1, 2)insert into almacen values(null, 'Salida', '2019-04-15', 'Venta de discos chidos', 1, 2)
    insert into detalle values 
	(null, 3, 1, 1),
	(null, 1, 2, 1), 
        (null, 2, 3, 1);

insert into almacen values(null, 'Salida', '2019-04-15', 'Venta de discos de Selena', 1, 2)
insert into almacen values(null, 'Salida', '2019-04-15', 'Venta de discos de Carlos', 1, 2)


#select * from Usuario;
#select * from Disco;
