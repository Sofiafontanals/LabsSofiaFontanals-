
Use bands;

/*Objetivo: Sacar para cada década y género, las bandas con:

Número de álbumes.

Ventas totales.

Clasificación en “Alta venta” (≥ 10,000) o “Baja venta”.*/

 
SELECT FLOOR(YEAR(a.release_date)/10)*10 AS decada, b.band_name AS Banda, 
COUNT(DISTINCT a.album_id) AS albumes_totales, 
SUM(a.sales_amount) AS ventas_totales,

CASE
WHEN SUM(a.sales_amount) >= 50000 THEN 'Venta alta'
WHEN SUM(a.sales_amount) BETWEEN 10000 AND 49999 THEN 'Venta media'
ELSE 'Venta baja'
END AS ranking_ventas
FROM band AS b
JOIN album AS a ON b.band_id = a.band_id
GROUP BY decada, banda
ORDER BY decada, ventas_totales DESC;

/*Objetivo: Encontrar músicos que han participado en bandas con ventas acumuladas altísimas.

Se suman las ventas de todos los álbumes de las bandas en las que tocó cada músico, y se clasifica en categorías.*/
 
SELECT m.musician_id,
GROUP_CONCAT(DISTINCT mn.musician_name ORDER BY mn.musician_name) AS nombres,
SUM(a.sales_amount) AS ventas_totales,

CASE 
WHEN SUM(a.sales_amount) >= 20000000 THEN 'Leyenda'
WHEN SUM(a.sales_amount) BETWEEN 1500000 AND 19999999 THEN 'Estrella'
ELSE 'Emergente'
END AS ranking
FROM musician AS m
JOIN musician_name AS mn ON m.musician_id = mn.musician_id
JOIN band_musician As bm ON m.musician_id = bm.musician_id
JOIN band AS b ON bm.band_id = b.band_id
JOIN album a ON b.band_id = a.band_id
GROUP BY m.musician_id
ORDER BY ventas_totales DESC;
 
/*Objetivo: Encontrar la década con más ventas para cada género, y marcarla como “época dorada”.*/
 
SELECT g.genre_name,
FLOOR(YEAR(a.release_date)/10)*10 AS decade,
SUM(a.sales_amount) AS total_sales
FROM album AS a
JOIN band AS b ON a.band_id = b.band_id
JOIN band_genre AS g ON b.band_id = g.band_id
GROUP BY g.genre_name, FLOOR(YEAR(a.release_date)/10)*10
ORDER BY g.genre_name, total_sales DESC;
 