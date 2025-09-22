SELECT * FROM Clientes;

SELECT * FROM Empleados;

SELECT * FROM Tiendas;

SELECT * FROM Prendas;

SELECT * FROM Clientes
WHERE nombre_cliente LIKE 'L%';

SELECT COUNT(*) AS totalclientes FROM Clientes;


SELECT * FROM Compras
WHERE fecha_compra > '2023-05-01';

UPDATE clientes
SET email_cliente = 'LAURAnuevo.email@ejemplo.com'
WHERE id_cliente = 2;

SELECT * FROM Prendas
WHERE color = 'Negro';

SELECT * FROM Tiendas
WHERE ciudad = 'Madrid';

SELECT COUNT(*) AS prendasmayores50
FROM prendas
WHERE precio > 50;

SELECT * FROM empleados
WHERE tienda_id = 1;

SELECT * FROM clientes
WHERE nombre_cliente LIKE '%Andrés%';

SELECT * FROM compras
WHERE id_cliente = 2;

SELECT * FROM Prendas
WHERE precio BETWEEN 20 AND 40;

SELECT * FROM Empleados
WHERE nombre_empleado LIKE '%a%';

SELECT * FROM Prendas
ORDER BY precio DESC
LIMIT 5;

SELECT * FROM compras
WHERE monto_total > 75;

SELECT * FROM prendas
WHERE talla = 'M';

UPDATE prendas
SET talla = 'L'
WHERE id_prenda = 3;

SELECT * FROM empleados
WHERE fecha_contratacion > '2022-01-01';

SELECT * FROM tiendas
WHERE ciudad = 'Barcelona';

SELECT * FROM compras
WHERE fecha_compra < '2023-07-01';

SELECT * FROM prendas
WHERE tipo_prenda LIKE '%eta';

SELECT * FROM clientes
WHERE email_cliente NOT LIKE '%hotmail%';

SELECT COUNT(*) AS comprasdeseptiembre
FROM compras
WHERE fecha_compra BETWEEN '2023-09-01' AND '2023-09-30';

UPDATE tiendas
SET direccion = 'Newdirection'
WHERE id_tienda = 1;

SELECT * FROM prendas
WHERE tipo_prenda = 'Camiseta';

SELECT * FROM tiendas
ORDER BY ciudad desc;

SELECT * FROM empleados
WHERE puesto = 'Vendedor';

SELECT COUNT(*) AS prendasmuyblancas
FROM prendas
WHERE color = 'blanco';

SELECT * FROM clientes
WHERE LENGTH(nombre_cliente) > 10;

SELECT * FROM compras
WHERE monto_total BETWEEN 50 AND 100;

SELECT * FROM compras
ORDER BY fecha_compra DESC
LIMIT 3;

SELECT color, COUNT(*) AS cantidadeprendasporcolor
FROM prendas
GROUP BY color;

INSERT INTO tiendas (id_tienda, nombre_tienda, direccion, ciudad, pais)
VALUES
(6, "santacristina", "diagonal", 1, "Madrid", "España"),
(7, "aifos", "Calle almeri", 44, "Madrid", "España");

UPDATE clientes
SET nombre_cliente = "Micaela", email_cliente = "micaela@email.com"
WHERE nombre_cliente = "Miguel Torres";