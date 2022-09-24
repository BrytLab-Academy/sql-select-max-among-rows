 CREATE TABLE `sales` (
  `year` int NOT NULL,
  `product` varchar(50) NOT NULL,
  `quantity_sold` int NOT NULL,
  PRIMARY KEY (`year`,`product`)
)


insert into sales(year,product,quantity_sold)
    values
        (2010,"dell",210),
        (2010,"hp",130),
        (2010,"toshiba",30),
        (2011,"dell",410),
        (2011,"hp",500),
        (2011,"macbook",60),
        (2011,"toshiba",70),
        (2012,"dell",360),
        (2012,"hp",600),
        (2012,"macbook",200),
        (2012,"toshiba",150),
        (2013,"accer",80),
        (2013,"dell",400),
        (2013,"hp",580),
        (2013,"macbook",310),
        (2013,"toshiba",120);


select * from sales order by year, product, quantity_sold;


mysql> select year,product, quantity_sold , max(quantity_sold )  over(partition by year) as max_sales from sales;


mysql> select * from
        (select year,product, quantity_sold , max(quantity_sold )  over(partition by year) as max_sales from sales)
            as inner_tbl
        where inner_tbl.quantity_sold = inner_tbl.max_sales;