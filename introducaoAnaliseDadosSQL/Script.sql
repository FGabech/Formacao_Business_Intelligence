SELECT * FROM Album a ;
SELECT count(*) as Records FROM Album a ;

SELECT AlbumId , Title FROM Album a;

SELECT COUNT(*) FROM Album a WHERE Column1 is NOT NULL ;
SELECT AlbumId, Title FROM Album a WHERE Column1 is NULL ;

SELECT * FROM Artist a;
-- Caracterizando os registros dos artistas --
SELECT a.AlbumId, a2.Name FROM Album a INNER JOIN Artist a2;
SELECT a2.ArtistId, a2.Name, count(*) as Records FROM Album a INNER JOIN Artist a2 GROUP BY 1;
SELECT a2.ArtistId, a2.Name, count(*) as Records FROM Album a INNER JOIN Artist a2 GROUP BY 1 ORDER BY Records LIMIT 1;

--Vendo os clentes--
SELECT * FROM Customer c LIMIT 10 ;
SELECT COUNT(*) FROM Customer c2 ; 
SELECT State, COUNT(*) AS Total FROM Customer c GROUP BY 1 ORDER BY Total DESC LIMIT 10;

-- Selecionar clientes em um endereço especifico -- 
SELECT FirstName , Address FROM Customer c ;
SELECT COUNT(*)  FROM Customer c WHERE Address like '%Broadway%';

--Verificar Company dos clientes 

SELECT * FROM Customer c ;
SELECT FirstName, Company FROM Customer c ORDER BY Company DESC;
SELECT count(*) FROM Customer c WHERE Company IS NOT NULL ;

-- Selecionar Nome dos funcionário sem Empresa

SELECT FirstName, LastName FROM Customer c WHERE Company ISNULL ;

-- Quem é colaborador e também é cliente, com subquery

SELECT c.FirstName, c.LastName FROM Customer c 
	WHERE Company ISNULL AND c.FirstName IN 
		(SELECT e.FirstName FROM Employee e) ; 

-- Quem de é colaborador e também é cliente, com Join**

	SELECT c.FirstName, c.LastName FROM Customer c INNER JOIN Employee e WHERE c.FirstName = e.FirstName ; 

-- Verificando o Invoice, bom por limite para não travarmos o banco de dados

SELECT * FROM Invoice i LIMIT 10;

SELECT * FROM InvoiceLine il ORDER BY Quantity DESC LIMIT 10 ;

-- Descobrir quantos produtos são vendidos a quais preços -- 

SELECT UnitPrice, count(*) AS Record FROM InvoiceLine il GROUP BY UnitPrice ;

-- Clientes que possuem Invoice associados e a quantidade para cada cliente

SELECT i.CustomerId, c.FirstName,  COUNT(*) AS Record FROM Invoice i
		INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
		GROUP BY 1 ORDER BY Record DESC ; 


--Verificando a estrutura da QUERY	
SELECT i.InvoiceId, il.InvoiceLineId FROM Invoice i
	INNER JOIN InvoiceLine il  			
	INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
	GROUP BY 1 ORDER BY 2 ASC 
	LIMIT 100; 


