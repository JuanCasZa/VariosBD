create database VariosBD;

go
use VariosBD;
go

create table productos(
	id int identity,
	nombre varchar(30)not null,
	cantidad int not null default 0,
	precio decimal(10,2) not null default 0.0,
	categoria varchar(30) not null,
	seccion varchar(30) not null,
	distribuidor varchar(30) not null,
	primary key(id)
);

insert into productos(nombre, cantidad, precio, categoria, seccion, distribuidor)
values
('Leche Alpina', 50, 3200.50, 'Lácteos', 'A1', 'Alpina'),
('Queso Campesino', 20, 7800.00, 'Lácteos', 'A1', 'Colanta'),
('Leche Colanta', 80, 3100.00, 'Lácteos', 'A1', 'Colanta'),
('Yogurt Alpina', 45, 2500.00, 'Lácteos', 'A1', 'Alpina'),
('Pan Bimbo', 60, 4500.00, 'Panadería', 'B1', 'Bimbo'),
('Galletas Festival', 100, 2500.00, 'Panadería', 'B1', 'Nabisco'),
('Jugo Hit', 200, 2500.00, 'Bebidas', 'C1', 'Postobón'),
('Agua Cristal', 200, 1200.00, 'Bebidas', 'C1', 'Postobón'),
('Gaseosa Colombiana', 150, 3200.00, 'Bebidas', 'C1', 'Postobón'),
('Café Sello Rojo', 30, 12000.00, 'Café', 'D1', 'Nutresa'),
('Aceite Premier', 40, 8500.00, 'Aceites', 'D2', 'Team Foods'),
('Sal Refisal', 70, 1200.00, 'Condimentos', 'D3', 'Refisal'),
('Arroz Diana', 90, 2800.00, 'Granos', 'E1', 'Diana'),
('Frijol Cargamanto', 60, 5400.00, 'Granos', 'E1', 'Nutresa'),
('Harina Haz de Oros', 80, 4300.00, 'Harinas', 'E2', 'Molinos Roa'),
('Chocolate Luker', 50, 5600.00, 'Chocolates', 'F1', 'CasaLuker'),
('Arequipe Alpina', 50, 5200.00, 'Dulces', 'F1', 'Alpina'),
('Cereal Zucaritas', 35, 9800.00, 'Cereales', 'F2', 'Kelloggs'),
('Aceitunas La Española', 25, 8700.00, 'Enlatados', 'F3', 'La Española'),
('Pasta Doria', 100, 3600.00, 'Pasta', 'F4', 'Doria');


select * from productos;

/*1.*/
select count(*) as 'Lácteos' from productos
	where categoria='Lácteos';
/*2.*/
select distribuidor,count(*) as 'Productos' from productos
	group by distribuidor;
/*3.*/
select categoria,seccion,sum(cantidad) as 'Cantidad' from productos
	group by categoria,seccion;
/*4.*/
select seccion,min(precio)as 'Minimo',max(precio)as 'Maximo' from productos
	group by seccion;

/*5.*/
select categoria,seccion,avg(precio) as 'Promedio' from productos
	group by categoria,seccion;

select distribuidor,categoria,avg(cantidad) as 'Promedio distribuido' from productos
	group by distribuidor,categoria;


select nombre,distribuidor,(cantidad*precio) as 'Promedio Total inventario' from productos;

select distribuidor,sum(cantidad) as 'Productos distribuidos' from productos
	group by distribuidor;

	/*6.*/
		/*Consultas Santiago G*/

		/*Consultas Santiago B*/
		select distribuidor, avg (precio) as 'Precio promedio distribuidores' 
		from Productos group by distribuidor order by 'Precio promedio distribuidores' desc;

		select  distribuidor, max(precio) as 'este es el mas caro', min (precio) as 'este es el mas barato' from productos 
		group by distribuidor;

		/*Consultas Juan Pablo R*/
		select categoria, count(*) as total_productos, sum(cantidad) as cantidad_total, 
		avg(precio) as precio_promedio from productos
		where precio > 3000 and cantidad >= 40 and seccion <> 'F1'
		group by categoria
		order by categoria;

		select categoria, distribuidor, count(*) as total_productos, sum(cantidad) as inventario,
		avg(precio) as precio_promedio, max(precio) as precio_maximo from productos
		where (categoria = 'Lácteos' or categoria = 'Panadería' or categoria = 'Granos')
		and precio <= 3000 and cantidad between 20 and 100 and distribuidor <> 'Bimbo'
		group by categoria, distribuidor
		order by categoria, inventario desc;

		/*Consultas Julian V*/
		select seccion, distribuidor, count(*) as 'Total # de Productos', min(cantidad) as 'Cantidad minima', 
		max(cantidad) as 'Cantidad maxima' from productos where distribuidor = 'Colanta' or distribuidor= 'Alpina' and cantidad>=35
		group by seccion, distribuidor
		order by seccion;

		select categoria, seccion, count(*) as '# Productos', sum(precio) as 'Total precio de los productos', 
		avg(precio) as 'Promedio precio de los productos' from productos where seccion= 'A1' or seccion= 'C1'
		group by seccion, categoria
		order by categoria;

		/*Consultas Juan José C*/
		select nombre, distribuidor, avg(cantidad*precio) as 'Precio promedio por cantidad', 
		COUNT(categoria) as 'Cantidad de categorias por distribuidor' 
		from productos where cantidad>35 group by nombre, distribuidor order by avg(cantidad*precio) desc;



