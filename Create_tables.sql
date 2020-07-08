use project;

drop table if exists cart, customer, payments, seller_contact, sellers, items_in_cart, products;

-- below code creates the databse for the ecommerce website

create table cart
    (
        cart_id VARCHAR(7) NOT NULL,
        PRIMARY KEY (cart_id)
    );

insert into cart(cart_id) values 
	('crt101'),
	('crt102'),
	('crt103'),
	('crt104'),
	('crt105'),
	('crt106'),
	('crt107'),
	('crt108'),
	('crt109'),
	('crt110');

create table customer
    (
        customer_id VARCHAR(7) NOT NULL,
		c_password VARCHAR(8) NOT NULL,
        c_name VARCHAR(20) NOT NULL,
        address VARCHAR(100) NOT NULL,
        zipcode int(5) NOT NULL,
        phone_number varchar(10) NOT NULL,
        PRIMARY KEY (Customer_id),
        cart_id VARCHAR(7) NOT NULL,
        FOREIGN KEY(cart_id) REFERENCES cart(cart_id)
    );


insert into customer (customer_id,c_password,c_name,address,zipcode,phone_number, cart_id) values
    ('cus101','Z41zS2gX','Rheanna Emery','61 Gainsway Dr','75115','5820026122','crt101') ,
	('cus102','PYUX16MR','Efe Adkins','9254 La Sierra Rd.Suite 618','11553','9654415547','crt102'),
    ('cus103','hqwt08uq','Camilla Dillon','65 Blue Spring Street','48197','4434940609','crt103'),
    ('cus104','SWKb9LfO','Frances Ferry','853 Peachtree Drive','30213','8381941360','crt104'),
    ('cus105','N35rdxyc','Ismail Landry','9402 Hilldale Road','92083','7467421164','crt105'),
    ('cus106','yNRuEhP6','Lucas Whittaker','9901 Glen Eagles Drive','10701','7202620844','crt106'),
    ('cus107','Tq6kVCMe','Woodrow Beasley','478 Bowman Court','44133','7012288718','crt107'),
    ('cus108','OKHxeHz7','Saqlain Goff','8150 Durham Rd.','06051','5735663720','crt108'),
    ('cus109','VI9D7URb','Trinity Maguire','7638 Alderwood Street','60409','7655666098','crt109'),
    ('cus110','6VEITkP1','Ayaz Randolph','22 Manor Station Dr.','50501','4918824009','crt110');
    
    
create table sellers
    (
        seller_id INT(3) NOT NULL,
        s_password VARCHAR(8) NOT NULL,
        s_name VARCHAR(30) NOT NULL,
        address VARCHAR(100) NOT NULL,
        PRIMARY KEY (seller_id)
    );

insert into sellers (seller_id,s_password,s_name,address) values
    ('101','5fBurNjj','Fern Rodriguez','70 Fairway St. '),
    ('102','hwttzXb3','Beatrix Norton','873 Acacia Lane '),
    ('103','mZTCUQ44','Liyah Gibbons','31 Foxrun Street'),
    ('104','bajoBUJ9','Jayden-James Rice','9440 Academy Ave.'),
    ('105','z23zfz1u','Kirsty Charlton','8272 Galvin St.');
    
 

create table seller_contact
    (
        phone_num varchar(10) NOT NULL,
        seller_id INT(3) NOT NULL,
        PRIMARY KEY (phone_num, seller_id),
        FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
        ON DELETE CASCADE
    );

insert into seller_contact (phone_num,seller_id) values
	('3192520244','101'),
    ('9183523503','102'),
    ('8482852982','103'),
    ('5762103389','104'),
    ('2387013179','105');
    
	
create table payments
    (
        payment_id VARCHAR(7) NOT NULL,
        payment_date DATE NOT NULL,
        customer_id VARCHAR(6) NOT NULL,
        cart_id VARCHAR(7) NOT NULL,
        PRIMARY KEY (payment_id),
        FOREIGN KEY (customer_id) REFERENCES customer(Customer_id),
        FOREIGN KEY (cart_id) REFERENCES cart(cart_id)
    );
    
insert into payments (payment_id,payment_date, customer_id,cart_id) values
	('pmt101', '2019-12-25', 'cus101', 'crt101'),
	('pmt102', '2019-10-15', 'cus102', 'crt102'),
	('pmt103', '2019-11-13', 'cus103', 'crt103'),
	('pmt104', '2020-01-24', 'cus104', 'crt104'),
	('pmt105', '2019-09-06', 'cus105', 'crt105'),
	('pmt106', '2019-09-22', 'cus106', 'crt106'),
	('pmt107', '2020-01-21', 'cus107', 'crt107'),
	('pmt108', '2019-11-12', 'cus108', 'crt108'),
	('pmt109', '2019-06-12', 'cus109', 'crt109'),
	('pmt110', '2019-06-21', 'cus110', 'crt110');

create table products
    (
        product_id INT(3) NOT NULL,
        product_category VARCHAR(25) NOT NULL,
        product_name VARCHAR(50) NOT NULL,
        commission decimal(7,2) NOT NULL,
        price decimal(7,2) NOT NULL,
        quantity int(3) NOT NULL,
        seller_id INT(3),
        PRIMARY KEY (product_id),
        FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
        ON DELETE SET NULL
    );
    
insert into products (product_id,product_category,product_name, commission, price, quantity, seller_id) values
	(101,'groceries', 'Pear - Asian', '11.03', '2.64', 9, '102'),
	(102,'groceries', 'Wine - Red, Lurton Merlot De', '8.15', '2.27', 10, 104),
	(103,'groceries', 'Emulsifier', '14.87', '3.46', 4, 101),
	(104,'groceries', 'Spinach - Baby', '19.26', '3.33', 3, 103),
	(105,'groceries', 'Soup - French Can Pea', '13.38', '1.23', 8, 105),
	(106,'groceries', 'Mangostein', '8.63', '2.32', 6, 104),
	(107,'groceries', 'Wine - Rioja Campo Viejo', '18.87', '1.12', 3, 102),
	(108,'groceries', 'Chicken - White Meat With Tender', '17.80', '2.00', 9, 102),
	(109,'groceries', 'Bread - Sour Batard', '11.28', '1.16', 9, 101),
	(110,'Home', 'Towel Dispenser', '22.72', '3.43', 10, 103),
	(111,'groceries', 'Bread - Petit Baguette', '10.15', '2.92', 2, 101),
	(112, 'groceries','Cheese - Grana Padano', '21.79', '2.04', 4, 105),
	(113,'groceries','Nut - Peanut, Roasted', '8.17', '3.21', 9, 102),
	(114,'groceries', '7up Diet, 355 Ml', '8.98', '1.62', 4, 104),
	(115,'groceries', 'Wine - Chenin Blanc K.w.v.', '5.47', '3.47', 9, 105),
	(116,'groceries', 'Nacho Chips', '5.06', '2.94', 3, 104),
	(117, 'groceries','Sponge Cake Mix - Vanilla', '17.29', '2.10', 10, 104),
	(119,'groceries', 'Waffle Stix', '20.11', '2.74', 4, 102),
	(120,'groceries', 'Wine - Red, Gallo, Merlot', '23.54', '2.88', 2, 103),
	(121,'Entertainment', 'Faces of Death 5', '24.67', '15.41', 4, 101),
	(122,'Entertainment', 'Far from the Madding Crowd', '15.74', '24.30', 7, 102),
	(123,'Entertainment', 'Christmas Story 2, A', '23.44', '7.36', 9, 103),
	(124,'Entertainment', 'Conspiracy of Torture, The (Beatrice Cenci)', '19.08', '17.91', 2, 104),
	(125,'Entertainment', 'Arguing the World', '8.73', '25.60', 2, 105),
	(126,'Entertainment', 'Fuel', '23.06', '19.95', 9, 101),
	(127,'Entertainment', 'Jesus'' Son', '9.71', '24.51', 8, 102),
	(128,'Entertainment', 'Rocket Gibraltar', '8.85', '26.60', 7, 103),
	(129,'Entertainment', 'Suck', '18.72', '23.77', 8, 104),
	(130,'Entertainment', 'Vai~E~Vem', '22.94', '37.11', 3, 105),
	(131,'Entertainment', 'Lola', '11.15', '48.51', 4, 101),
	(132,'Entertainment', 'Winter Soldier', '21.05', '9.82', 6, 102),
	(133,'Entertainment', 'People Like Us', '17.02', '12.90', 2, 103),
	(134,'Entertainment', 'Two Sisters from Boston', '13.41', '46.44', 10, 104),
	(135,'Entertainment', 'Steal a Pencil for Me', '13.69', '10.54', 6, 105),
	(136,'Entertainment', 'Take This Job and Shove It', '9.08', '20.98', 6, 101),
	(137,'Entertainment', 'Crew, The', '18.76', '43.55', 3, 102),
	(138,'Entertainment', 'Four Seasons, The', '3.58', '27.64', 5, 103),
	(139,'Entertainment', 'Police Academy', '6.54', '28.29', 7, 104),
	(140,'Entertainment', 'Comancheros, The', '16.37', '42.93', 10, 105),
	(141,'Entertainment', 'Blunt Broom Sedge', '13.08', '110.95', 5, 101),
	(142,'Entertainment', 'Florida Chinchweed', '12.76', '51.87', 5, 102),
	(143,'Entertainment', 'Bolander''s Milkvetch', '12.42', '453.82', 3, 103),
	(144,'Entertainment', 'Rattlesnake Fern', '16.91', '425.97', 10, 104),
	(145,'Entertainment', 'Butte County Checkerbloom', '3.75', '381.00', 7, 105),
	(146,'Entertainment','Narrowleaf Purple Everlasting', '13.01', '407.90', 6, 101),
	(147,'Entertainment', 'Texas Palafox', '17.02', '360.27', 6, 102),
	(148,'Entertainment', 'Hawai''i False Nettle', '6.17', '156.30', 9, 103),
	(149,'Entertainment', 'Stiffstem Flax', '16.82', '184.02', 5, 104),
	(150,'Entertainment', 'Vezdaea Lichen', '24.45', '244.63', 1, 105),
	(151, 'Automobile', 'Kia-Spectra', '2.65', '33243.00', 3, 102),
	(152, 'Automobile', 'Chevrolet-SSR', '3.14', '9108.84', 1, 104),
	(153, 'Automobile', 'Toyota-RAV4', '14.54', '8358.77', 10, 103),
	(154, 'Automobile', 'Cadillac-Escalade ESV', '21.87', '30759.10', 3, 105),
	(155, 'Automobile', 'Toyota-Prius', '13.96', '37115.48', 4, 102),
	(156, 'Automobile', 'Nissan-Altima', '7.23', '24764.00', 9, 102),
	(157, 'Automobile', 'Mitsubishi-Mirage', '15.25', '19620.43', 6, 102),
	(158, 'Automobile', 'Toyota-Prius', '13.46', '31872.64', 7, 101),
	(159, 'Automobile', 'Infiniti-G', '5.18', '17453.63', 3, 105),
	(160, 'Automobile', 'Isuzu-Amigo', '16.06', '7996.87', 10, 101),
	(161, 'Automobile', 'Ford-F-Series Super Duty', '12.39', '19706.90', 6, 101),
	(162, 'Automobile', 'Chevrolet-Malibu', '23.60', '27026.45', 3, 104),
	(163, 'Automobile', 'Acura-Integra', '13.96', '23487.09', 1, 105),
	(164, 'Automobile', 'Buick-LaCrosse', '6.31', '1146.24', 9, 103),
	(165, 'Automobile', 'Infiniti-QX56', '19.40', '20858.40', 3, 101);


create table items_in_cart
    (
        quantity_requested int(2) NOT NULL,
        date_added DATE NOT NULL,
        cart_id VARCHAR(7) NOT NULL,
        product_id INT(3) NOT NULL,
        purchased varchar(1),
        FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
        FOREIGN KEY (product_id) REFERENCES products(product_id)
        -- Primary key(cart_id)
	);
    

insert into items_in_cart (quantity_requested, date_added, cart_id, product_id, purchased) values
	(3,'2020-06-1','crt101','101','Y'),
    (3,'2020-06-1','crt101','165','Y'),
    (3, '2020-05-27', 'crt107', '104','Y'),
	(5, '2019-10-29', 'crt106', '108','Y'),
	(10, '2019-09-24', 'crt105', '102','N'),
	(4, '2019-08-21', 'crt106', '109','Y'),
	(9, '2019-08-16', 'crt110', '108','N'),
	(2, '2019-10-17', 'crt110', '102','N'),
	(9, '2020-02-21', 'crt108', '109','Y'),
	(1, '2019-09-26', 'crt107', '107','Y'),
	(8, '2019-10-06', 'crt107', '104','Y'),
	(7, '2020-05-13', 'crt108', '110','Y'),
	(1, '2019-08-18', 'crt104', '102','N'),
	(1, '2019-07-28', 'crt101', '106','Y'),
	(6, '2019-12-02', 'crt107', '104','N'),
	(7, '2020-04-24', 'crt108', '106','Y'),
	(2, '2019-08-20', 'crt110', '110','Y'),
	(1, '2019-10-17', 'crt104', '105','N'),
	(10, '2020-03-25', 'crt107', '106','Y'),
    (10, '2019-08-20', 'crt110', '144','Y'),
	(3, '2019-12-30', 'crt109', '111','Y'),
	(1, '2020-01-29', 'crt102', '137','N'),
	(1, '2020-04-25', 'crt106', '150','Y'),
	(9, '2020-02-05', 'crt105', '149','Y'),
	(4, '2020-02-27', 'crt102', '124','Y'),
	(7, '2019-09-24', 'crt104', '142','Y'),
	(4, '2020-04-30', 'crt103', '147','Y'),
	(6, '2019-10-12', 'crt103', '146','N'),
	(8, '2020-04-05', 'crt102', '136','N'),
	(5, '2019-07-23', 'crt106', '117','Y'),
	(4, '2020-02-01', 'crt103', '112','Y'),
	(9, '2020-03-02', 'crt105', '141','Y'),
	(8, '2020-06-04', 'crt106', '115','Y'),
	(10, '2019-08-11', 'crt109', '123','N'),
	(2, '2020-04-11', 'crt101', '119','N'),
	(4, '2020-01-09', 'crt106', '125','N'),
	(3, '2019-12-08', 'crt101', '116','Y'),
	(5, '2020-03-01', 'crt101', '115','N'),
	(7, '2020-01-01', 'crt104', '135','Y'),
	(10, '2020-03-13', 'crt105', '128','Y'),
	(2, '2019-10-15', 'crt110', '142','N'),
	(6, '2019-08-25', 'crt107', '122','N'),
	(3, '2019-07-11', 'crt104', '116','N'),
	(7, '2019-07-07', 'crt109', '130','Y'),
	(4, '2020-03-25', 'crt107', '135','Y'),
	(2, '2020-01-11', 'crt110', '143','Y'),
	(8, '2020-05-14', 'crt108', '141','N'),
	(6, '2019-12-15', 'crt101', '146','Y'),
	(9, '2019-09-27', 'crt108', '139','N'),
	(8, '2019-12-05', 'crt110', '136','Y'),
	(9, '2020-02-24', 'crt101', '130','N'),
	(8, '2020-01-23', 'crt104', '121','N'),
	(7, '2020-04-26', 'crt108', '131','N'),
	(4, '2020-05-14', 'crt109', '123','Y'),
	(6, '2020-01-21', 'crt108', '111','Y'),
	(3, '2019-12-22', 'crt109', '117','Y'),
	(5, '2020-03-20', 'crt108', '143','N'),
	(7, '2020-05-07', 'crt103', '111','N'),
	(2, '2019-08-19', 'crt108', '112','N'),
	(6, '2019-06-28', 'crt103', '139','Y'),
	(8, '2019-11-07', 'crt110', '150','Y'),
	(10, '2020-03-14','crt109', '131','N'),
    (3, '2019-09-15', 'crt107', '113','Y'),
	(3, '2019-12-19', 'crt103', '111','N'),
	(7, '2019-11-02', 'crt101', '114','Y'),
	(8, '2020-04-16', 'crt108', '137','N'),
	(8, '2019-11-20', 'crt109', '121','Y'),
	(2, '2019-06-25', 'crt110', '150','Y'),
	(1, '2020-05-11', 'crt106', 155,'Y'),
	(1, '2019-11-17', 'crt109', 161,'N'),
	(1, '2020-02-26', 'crt106', 165,'Y'),
	(1, '2019-09-20', 'crt102', 158,'Y'),
	(1, '2020-02-19', 'crt110', 154,'N'),
	(1, '2019-07-13', 'crt101', 156,'Y'),
	(1, '2019-11-27', 'crt104', 162,'N'),
	(1, '2019-08-14', 'crt103', 157,'N'),
	(1, '2020-02-05', 'crt107', 161,'Y'),
	(1, '2019-10-20', 'crt110', 163,'Y'),
	(1, '2019-11-21', 'crt105', 153,'N'),
	(1, '2020-01-09', 'crt104', 157,'Y'),
	(1, '2019-08-10', 'crt108', 160,'N'),
	(1, '2019-12-01', 'crt106', 163,'Y'),
	(1, '2020-02-02', 'crt108', 165,'N');
	

-- names https://www.name-generator.org.uk/quick/
-- address https://www.randomlists.com/random-addresses?qty=10
-- number https://www.random.org/strings/?num=10&len=15&digits=on&unique=on&format=html&rnd=new
-- password https://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=html&rnd=new
-- data generated using Mockaroo
