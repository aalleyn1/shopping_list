/* A list of food items */
CREATE TABLE groceries(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity INTEGER, price INTEGER, aisle INTEGER);

INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Peanut Butter", 2, 5.79, 4);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Honey", 3, 14.49, 4);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Banana", 20, 0.59, 1);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Strawberries", 3, 2.59, 1);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Blueberries", 2, 3.69, 1);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Steel-cut Oats", 1, 3.99, 3);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Jasmine Rice", 1, 8.59, 5);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Carrots", 2, 2.89, 1);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Black Beans", 4, 0.79, 5);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Lettuce", 1, 1.59, 1);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Tomatoes", 4, 0.89, 1);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Dried Cranberries", 2, 2.89, 3);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Pinto Beans", 4, 0.79, 5);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Ceaser Dressing", 1, 3.79, 2);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Eggs", 1, 1.59, 1);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Passion Tea", 1, 2.17, 3);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Granola Bars 'Kind'", 4, 5.38, 3);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Lemons", 4, 0.97, 1);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Trail Mix", 2, 2.99, 3);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Sparkling Water", 10, 1.19, 2);
INSERT INTO groceries (name, quantity, price, aisle) VALUES ("Cherries", 2, 7.79, 1);

/* A list of miscellaneous items */
CREATE TABLE wellness(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity INTEGER, price INTEGER, aisle INTEGER);

INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Bath Bomb", 10, 7.99, 6);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Cotton Pads", 3, 3.99, 8);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("MultiVitamin", 2, 9.99, 7);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Moisturizer", 1, 17.99, 8);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Fish Oil", 2, 7.99, 7);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Pillows", 2, 4.99, 8);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Advil", 1, 14.99, 7);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Shampoo", 1, 5.99, 6);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Nail Filer", 1, 4.75, 8);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Face Mask", 1, 8.99, 6);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Airborne", 3, 6.99, 7);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Exfoliating Gloves", 2, 11.99, 6);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Vitmain-C Tablets", 4, 4.59, 7);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Paper Towls", 2, 5.47, 9);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Nail Clippers", 1, 6.55, 8);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Epsion Salt", 1, 6.49, 6);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Face Wash", 1, 14.99, 8);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Napkins", 1, 2.99, 9);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Toner", 1, 17.99, 8);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Eye Cream", 1, 34.99, 6);
INSERT INTO wellness (name, quantity, price, aisle) VALUES ("Conditioner", 1, 7.99, 6);


/* Orders Items from both list based on the aisle */
SELECT * FROM groceries
UNION
SELECT * FROM wellness
ORDER BY aisle ASC;

/* Multiplies the price of the item with the quantity to give total price of each item in both list*/
SELECT
        name, price, quantity, aisle,
        ROUND(price * quantity) as Total_item_price
FROM groceries
UNION
SELECT
        name, price, quantity, aisle,
        ROUND(price * quantity) as Total_item_price
FROM wellness
ORDER BY aisle;

/* Calculates the toal cost of food items */
SELECT ROUND(SUM(price)) AS Groceries FROM groceries;

/* Calculates the total cost of miscellaneous items */
SELECT ROUND(SUM(price)) AS Wellness FROM wellness;

/* Calculates total cost of all items */
SELECT ROUND(SUM(price)) AS Total
FROM (
    SELECT price FROM groceries
    UNION
    SELECT price FROM wellness
);
