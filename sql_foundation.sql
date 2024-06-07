SELECT * FROM sql_foundation.food_items;

drop table orders;
drop table food_items;
drop table order_tracking;

use sql_foundation;
CREATE TABLE food_items (
  item_id int AUTO_INCREMENT ,
  name varchar(255) DEFAULT NULL,
  price decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE food_items AUTO_INCREMENT = 1001;

INSERT INTO food_items(name,price) VALUES ('Dumplings Specials',189.0),('Smoky BBQ Pizza',150.0),('Best Burger',69.00),('Mixed Pizza',199.0),('Fried chicken',169.00),('Tea',25.00),('Cheese Burger',69.00),('Ice-cream',49.00),('Egg-Salad Sandwich',59.00),('Pastry',51.00);

CREATE TABLE order_tracking (
  order_id int NOT NULL,
  status varchar(255) DEFAULT NULL,
  PRIMARY KEY (order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO order_tracking VALUES (40,'delivered'),(41,'in transit');

CREATE TABLE orders (
  order_id int NOT NULL,
  item_id int NOT NULL,
  quantity int DEFAULT NULL,
  total_price decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (order_id,item_id),
  KEY orders_ibfk_1 (item_id),
  CONSTRAINT orders_ibfk_1 FOREIGN KEY (item_id) REFERENCES food_items (item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO orders VALUES (40,1001,2,378.00),(40,1002,3,450.00),(41,1004,2,398.00),(41,1007,2,138.00),(41,1006,4,100.00);

