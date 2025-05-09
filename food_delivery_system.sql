create table Customer(  
    customer_id number primary key,  
    type varchar2(10),  
    firstname varchar2(10),  
    middlename varchar2(10),  
    lastname varchar2(10)  
)

create table CustPhone(  
    customer_id number,  
    phone_no number,  
    foreign key (customer_id) references Customer (customer_id),  
    primary key (customer_id,phone_no)  
)

create table CustAddress(  
    customer_id number,  
    address varchar2(30),  
    foreign key (customer_id) references Customer (customer_id),  
    primary key (customer_id,address)  
)

create table Manager( 
    manager_id number primary key, 
    name varchar2(20), 
    salary number, 
    mobile number, 
    emailid varchar(30) 
)

create table DeliveryPartner( 
    partner_id varchar2(15) primary key, 
    manager_id number, 
    name varchar2(20), 
    salary number, 
    mobile number, 
    checkin_time timestamp,
    checkout_time timestamp, 
    foreign key (manager_id) references Manager (manager_id) 
)

create table Seller( 
    seller_id number primary key, 
    name varchar2(20), 
    opening_time timestamp,
    closing_time timestamp,
    mobile number, 
    location varchar2(15),
    check (closing_time>opening_time)
)


create table Orders( 
    order_id number primary key, 
    customer_id number, 
    seller_id number, 
	item_id varchar2(15),
    foreign key (customer_id) references Customer (customer_id), 
    foreign key (seller_id) references Seller (seller_id),
	foreign key (item_id) references Item (item_id)
)

create table Feedback( 
    customer_id number,  
    seller_id number, 
    reviews varchar2(100), 
    foreign key (seller_id) references Seller (seller_id), 
    foreign key (customer_id) references Customer (customer_id), 
    primary key (seller_id,customer_id) 
)

create table Item( 
    item_id varchar2(15) primary key, 
    name varchar2(20), 
    cost number, 
    availability number(1), 
    veg_nonveg number(1), 
    bestseller number(1), 
    category varchar2(20), 
    spice_level varchar2(10), 
    rating number, 
    constraint check_rating check (rating>=0 and rating<=5) 
)

create table Catalogue( 
    order_id number, 
    customer_id number, 
    partner_id varchar2(15), 
    customer_location varchar2(20), 
    shop_location varchar2(20), 
    delivery_time timestamp, 
    payment_status number(1), 
    primary key (order_id, customer_id, partner_id), 
    foreign key (order_id) references Orders (order_id), 
    foreign key (partner_id) references DeliveryPartner (partner_id), 
    foreign key (customer_id) references Customer (customer_id) 
)

create table Rating( 
    customer_id number,  
    seller_id number, 
    customer_rating number default (2.5), 
    seller_rating number default (2.5), 
    foreign key (seller_id) references Seller (seller_id), 
    foreign key (customer_id) references Customer (customer_id), 
    primary key (seller_id,customer_id), 
    constraint check_cust_rating check(customer_rating>=0 and customer_rating<=5), 
    constraint check_sell_rating check(seller_rating>=0 and seller_rating<=5) 
)

insert into Customer values (1,'student','rehan','kumar','bansal'),
(3,'student','avni','kay','gupta'),
(2,'faculty','ankush','aman','pathania'),
(4,'faculty','prashant','singh','rana'),
(5,'student','prarthana','jenny','samal'),
(6,'faculty','harpreet','singh','bawa'),
(7,'student','atansh','ajay','dhiman'),
(8,'faculty','tarunpreet','kaur','bhatia'),
(9,'student','aashi','zoya','yadav'),
(10,'faculty','shubhra','claire','dwivedi');
select * from Customer;

insert into CustPhone values (1,4985672156),
 (1,6598745123),
 (2,4875963216),
 (2,9897562355),
 (4,5698985612),
 (5,7864554353),
 (3,3264994659),
 (4,9652313498),
 (7,7985632659),
 (6,8745315878);
select * from CustPhone;

insert into CustAddress values (1,'hostel-c'),
 (1,'thapar'),
 (2,'model town'),
 (2,'patiala'),
 (4,'adarsh nagar'),
 (5,'hostel-n'),
 (3,'hostel-q'),
 (4,'patiala'),
 (7,'hostel-o'),
 (6,'puda colony patiala');
select * from CustAddress;


insert into Manager values(100,'raman',50000,1288912998,'rmn@gmail.com');
insert into Manager values(200,'manan',35600,6708567900,'mn@gmail.com');
insert into Manager values(300,'daman',67800,7859376748,'dmn@gmail.com');
insert into Manager values(400,'chaman',98230,3248967898,'chmn@gmail.com');
insert into Manager values(500,'aman',40000,9824382970,'amn@gmail.com');
insert into Manager values(600,'kim jon',30000,2324384570,'kj@gmail.com');
insert into Manager values(700,'julius',70000,4324384450,'jl@gmail.com');
insert into Manager values(800,'dinesh',82300,7552438200,'dn@gmail.com');
select * from Manager;

insert into Seller (seller_id,name,mobile,location) values(10,'fashion point',349843897,'cos');
insert into Seller (seller_id,name,mobile,location) values(15,'honey cafe',89735983,'cos');
insert into Seller (seller_id,name,mobile,location) values(20,'sip n bites',09378529307,'cos');
insert into Seller (seller_id,name,mobile,location) values(25,'pizza nation',43678423,'cos');
insert into Seller (seller_id,name,mobile,location) values(30,'the dessert club',234632498,'cos');
insert into Seller (seller_id,name,mobile,location) values(35,'jp foods',230947329,'G block');
insert into Seller (seller_id,name,mobile,location) values(40,'patiala shahi',9865897597,'G block');
insert into Seller (seller_id,name,mobile,location) values(45,'kulcha zone',152345612,'H block');
select * from Seller;
update  Seller set name = 'Wrapchik' where seller_id = 15;


insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('fp1',100,'ajay',4000,9238643289);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('fp2',100,'ramu',7400,3847783444);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('hc1',200,'kundan',7700,432478893);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('hc2',200,'sukhbir',3300,8997849454);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('snb1',300,'laadi',3000,4523403285);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('snb2',300,'munna',4010,6584893324);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('pn1',400,'arsh',5500,544521555);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('pn2',400,'lokesh',5000,7853889437);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('dc1',500,'rahul',8000,763298479843);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('dc2',500,'mike',4500,5638793298);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('jp1',600,'john',5000,7538984987);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('jp2',600,'keval',4000,989563235);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('ps1',700,'tejas',6700,664584635);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('ps2',700,'shobhit',5000,33242398954);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('kz1',800,'mayank',3200,673898645);
insert into DeliveryPartner (partner_id,manager_id,name,salary,mobile) values('kz2',800,'bhuvi',4500,93847903);
select * from DeliveryPartner;

insert into Item values ('hc1','spring roll',70,1,1,0,'snacks','medium',3);
insert into Item values ('hc2','noodles',45,0,0,0,'snacks','low',2.5);		
insert into Item values ('hc3','manchurian',50,1,1,1,'snacks','high',4);
insert into Item values ('snb1','spicy paneer',70,0,1,0,'wrap','medium',2);
insert into Item values ('snb2','grilled chicken',70,1,0,1,'wrap','high',4.3);
insert into Item values ('snb3','big sumo',60,1,1,1,'burger','low',5);
insert into Item values ('snb4','fried chicken',80,1,0,0,'burger','medium',2.3);
insert into Item values ('dc1','oreo king',200,1,1,0,'bubble waffle','low',3.7);
insert into Item values ('dc2','ferrero king',200,1,1,1,'bubble waffle','low',5);
insert into Item values ('dc3','brownie queen',120,1,1,0,'square waffle','low',1.5);
insert into Item values ('kz1','garlic',140,1,0,1,'chaap','high',4.6);
insert into Item values ('kz2','paneer',60,0,1,0,'kulcha','medium',3);
select * from Item;

update Seller set opening_time=TO_DATE('09:30:00', 'HH24:MI:SS'),closing_time=TO_DATE('20:00:00', 'HH24:MI:SS') where seller_id=10;
update Seller set opening_time=TO_DATE('13:30:00', 'HH24:MI:SS'),closing_time=TO_DATE('16:00:00', 'HH24:MI:SS') where seller_id=45;
update Seller set opening_time=TO_DATE('10:00:00', 'HH24:MI:SS'),closing_time=TO_DATE('21:30:00', 'HH24:MI:SS') where seller_id=15;
update Seller set opening_time=TO_DATE('10:30:00', 'HH24:MI:SS'),closing_time=TO_DATE('21:30:00', 'HH24:MI:SS') where seller_id=20;
update Seller set opening_time=TO_DATE('11:00:00', 'HH24:MI:SS'),closing_time=TO_DATE('23:59:00', 'HH24:MI:SS') where seller_id=25;
update Seller set opening_time=TO_DATE('13:00:00', 'HH24:MI:SS'),closing_time=TO_DATE('22:00:00', 'HH24:MI:SS') where seller_id=30;
update Seller set opening_time=TO_DATE('09:00:00', 'HH24:MI:SS'),closing_time=TO_DATE('20:30:00', 'HH24:MI:SS') where seller_id=35;
update Seller set opening_time=TO_DATE('11:00:00', 'HH24:MI:SS'),closing_time=TO_DATE('23:00:00', 'HH24:MI:SS') where seller_id=40;

insert into Feedback values (1,10,'quality was good. a bit spicy. lower the sugar content next time');
insert into Feedback values (1,20,'quality was poor. highly spicy. food was uncooked');
insert into Feedback values (2,10,'quality was not good. food was smelly. lower the sugar content next time');
insert into Feedback values (3,15,'ice cream flavour was very unique. good presentation');
insert into Feedback values (3,20,'overall nice experience. satisfied. tasty food');
insert into Feedback values (6,30,'delivery was late. delivery partner was rude');
insert into Feedback values (7,40,'insects found in food');
insert into Feedback values (4,35,'got wrong order');
insert into Feedback values (6,40,'quality was good. a bit spicy.');
select * from Feedback;

insert into Rating values (1,10,4.2,4.5);
insert into Rating values (2,10,3.2,4);
insert into Rating values (2,35,5,2);
insert into Rating values (5,40,1.2,4.8);
insert into Rating values (5,45,2.2,3.3);
insert into Rating values (9,20,1.7,4.5);
insert into Rating values (8,20,5,5);
insert into Rating values (8,35,3.9,2);
insert into Rating values (9,40,4.9,3.9);
insert into Rating values (10,15,4,5);
select * from Rating;

insert into Orders values (000,5,15,'hc1');
insert into Orders values (001,4,15,'hc2');
insert into Orders values (010,3,20,'snb2');
insert into Orders values (011,5,20,'snb2');
insert into Orders values (100,7,30,'dc1');
insert into Orders values (101,7,30,'dc3');
insert into Orders values (110,2,45,'kz2');
insert into Orders values (111,3,20,'snb4');
insert into Orders values (1000,1,15,'hc3');
insert into Orders values (1001,6,45,'kz2');
insert into Orders values (1010,6,45,'kz1');
select * from Orders;

insert into Catalogue values (000,5,'hc1','hostel-n','cos',to_date('00:15:00','HH24:MI:SS'),1);
insert into Catalogue values (001,4,'hc2','adarsh nagar','cos',to_date('00:10:00','HH24:MI:SS'),0);
insert into Catalogue values (010,3,'snb1','hostel-q','cos',to_date('00:20:00','HH24:MI:SS'),0);
insert into Catalogue values (011,5,'snb1','hostel-n','cos',to_date('00:25:00','HH24:MI:SS'),1);
insert into Catalogue values (100,7,'dc1','hostel-o','cos',to_date('00:15:00','HH24:MI:SS'),0);
insert into Catalogue values (101,7,'dc2','hostel-o','cos',to_date('00:10:00','HH24:MI:SS'),1);
insert into Catalogue values (110,2,'kz2','patiala','H block',to_date('00:30:00','HH24:MI:SS'),1);
insert into Catalogue values (111,3,'snb2','hostel-q','cos',to_date('00:05:00','HH24:MI:SS'),0);
insert into Catalogue values (1000,1,'hc1','hostel-c thapar','cos',to_date('00:10:00','HH24:MI:SS'),1);
insert into Catalogue values (1001,6,'kz1','puda colony patiala','H block',to_date('00:20:00','HH24:MI:SS'),1);
insert into Catalogue values (1010,6,'kz1','puda colony patiala','H block',to_date('00:35:00','HH24:MI:SS'),1);
select * from Catalogue;


-- track order status


CREATE OR REPLACE PROCEDURE track_order_status (
    p_order_id IN NUMBER
) AS
    v_customer_id   NUMBER;
    v_partner_id    VARCHAR2(15);
    v_customer_loc  VARCHAR2(20);
    v_shop_loc      VARCHAR2(20);
    v_delivery_time TIMESTAMP;
    v_payment_stat  NUMBER(1);
BEGIN
    
    
    SELECT customer_id, partner_id, customer_location, shop_location, delivery_time, payment_status
    INTO v_customer_id, v_partner_id, v_customer_loc, v_shop_loc, v_delivery_time, v_payment_stat
    FROM Catalogue
    WHERE order_id = p_order_id;

   
    DBMS_OUTPUT.PUT_LINE('Order ID: ' || p_order_id);
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
    DBMS_OUTPUT.PUT_LINE('Partner ID: ' || v_partner_id);
    DBMS_OUTPUT.PUT_LINE('Customer Location: ' || v_customer_loc);
    DBMS_OUTPUT.PUT_LINE('Shop Location: ' || v_shop_loc);
    DBMS_OUTPUT.PUT_LINE('Delivery Time: ' || TO_CHAR(v_delivery_time, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Payment Status: ' || v_payment_stat);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No matching order found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

EXEC track_order_status(0);


-- Item details
CREATE OR REPLACE PROCEDURE get_item_details (
    p_item_id IN VARCHAR2
) AS
    v_name         VARCHAR2(20);
    v_cost         NUMBER;
    v_avail        NUMBER(1);
    v_veg_nonveg   NUMBER(1);
    v_bestseller   NUMBER(1);
    v_category     VARCHAR2(20);
    v_spice_level  VARCHAR2(10);
    v_rating       NUMBER;
BEGIN
    

    SELECT name, cost, availability, veg_nonveg, bestseller,
           category, spice_level, rating
    INTO v_name, v_cost, v_avail, v_veg_nonveg, v_bestseller,
         v_category, v_spice_level, v_rating
    FROM Item
    WHERE item_id = p_item_id;

    DBMS_OUTPUT.PUT_LINE('Item ID: ' || p_item_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Cost: ' || v_cost);
    DBMS_OUTPUT.PUT_LINE('Availability: ' || CASE WHEN v_avail = 1 THEN 'true' ELSE 'false' END);
    DBMS_OUTPUT.PUT_LINE('Veg/Non-Veg: ' || CASE WHEN v_veg_nonveg = 1 THEN 'Veg' ELSE 'Non-Veg' END);
    DBMS_OUTPUT.PUT_LINE('Bestseller: ' || CASE WHEN v_bestseller = 1 THEN 'true' ELSE 'false' END);
    DBMS_OUTPUT.PUT_LINE('Category: ' || v_category);
    DBMS_OUTPUT.PUT_LINE('Spice Level: ' || v_spice_level);
    DBMS_OUTPUT.PUT_LINE('Rating: ' || v_rating);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No item found for ID: ' || p_item_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
EXEC get_item_details('hc1');

-- place order 
CREATE OR REPLACE PROCEDURE place_order_if_available (
    p_customer_id IN NUMBER,
    p_item_id IN VARCHAR2
) AS
    v_availability NUMBER;
    v_new_order_id NUMBER;
    v_seller_id NUMBER;
BEGIN
    -- Check availability
    SELECT availability INTO v_availability
    FROM Item
    WHERE item_id = p_item_id;

    IF v_availability = 1 THEN
        -- Get seller_id from Orders (if fixed relationship) or choose from Item/any other logic
        SELECT seller_id INTO v_seller_id
        FROM Orders
        WHERE item_id = p_item_id
        AND ROWNUM = 1;

        -- Generate new order_id (should use a sequence ideally)
        SELECT NVL(MAX(order_id), 0) + 1 INTO v_new_order_id FROM Orders;

        -- Insert order
        INSERT INTO Orders(order_id, customer_id, seller_id, item_id)
        VALUES (v_new_order_id, p_customer_id, v_seller_id, p_item_id);

        DBMS_OUTPUT.PUT_LINE('Order placed successfully. Order ID: ' || v_new_order_id);
        DBMS_OUTPUT.PUT_LINE('Order Status: Order placed successfully. Order ID: ' || v_new_order_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Item with ID ' || p_item_id || ' is not available.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Item ID not found or seller not linked.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/
BEGIN
    place_order_if_available(5, 'hc1');
END;
/
Select * from orders;

-- COD
select * from Customer;
ALTER TABLE Customer ADD cod_allowed NUMBER(1) DEFAULT 1;
CREATE OR REPLACE PROCEDURE update_cod_based_on_rating (
    p_customer_id IN NUMBER
) AS
    v_rating NUMBER;
BEGIN
    -- Calculate average rating for the customer
    SELECT AVG(customer_rating)
    INTO v_rating
    FROM Rating
    WHERE customer_id = p_customer_id;

    IF v_rating < 2 THEN
        UPDATE Customer
        SET cod_allowed = 0
        WHERE customer_id = p_customer_id;
        DBMS_OUTPUT.PUT_LINE('Customer ID ' || p_customer_id || ' has low rating (' || v_rating || '). COD disabled.');
    ELSE
        UPDATE Customer
        SET cod_allowed = 1
        WHERE customer_id = p_customer_id;
        DBMS_OUTPUT.PUT_LINE('Customer ID ' || p_customer_id || ' has sufficient rating (' || v_rating || '). COD enabled.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No rating found for customer ID ' || p_customer_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
BEGIN
    update_cod_based_on_rating(5);
END;
/
-- CheckSpecificRestaurantRisk

CREATE OR REPLACE PROCEDURE CheckSpecificRestaurantRisk(
    p_seller_id IN NUMBER
) IS
    v_avg_rating NUMBER := 0;
    v_negative_feedback_count NUMBER := 0;
BEGIN
    -- Get average rating (use NVL to avoid null)
    SELECT NVL(AVG(seller_rating), 0)
    INTO v_avg_rating
    FROM Rating
    WHERE seller_id = p_seller_id;

    -- Count negative feedbacks
    SELECT COUNT(*)
    INTO v_negative_feedback_count
    FROM Feedback
    WHERE seller_id = p_seller_id
      AND (
            LOWER(reviews) LIKE '%poor%' OR
            LOWER(reviews) LIKE '%smelly%' OR
            LOWER(reviews) LIKE '%wrong%' OR
            LOWER(reviews) LIKE '%insects%'
          );

    -- Debug: print the values
    DBMS_OUTPUT.PUT_LINE('Average Rating: ' || v_avg_rating);
    DBMS_OUTPUT.PUT_LINE('Negative Feedback Count: ' || v_negative_feedback_count);

    -- Risk evaluation
    IF v_avg_rating < 2.5 OR v_negative_feedback_count > 2 THEN
        DBMS_OUTPUT.PUT_LINE('Restaurant ' || p_seller_id || ' is At Risk of Removal');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Restaurant ' || p_seller_id || ' is Not At Risk');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the specified restaurant ID: ' || p_seller_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/


EXEC CheckSpecificRestaurantRisk(35);
-- Delivery Partner Info
CREATE OR REPLACE PROCEDURE GetDeliveryPartnerInfoByOrderID(
    p_order_id IN NUMBER  -- Input parameter for order_id
) IS
    v_partner_id VARCHAR2(15);
    v_partner_name VARCHAR2(20);
    v_partner_mobile NUMBER;
    v_partner_salary NUMBER;
    v_partner_manager_id NUMBER;
BEGIN
    -- Get the delivery partner information for the given order_id
    SELECT 
        dp.partner_id, 
        dp.name AS partner_name, 
        dp.mobile AS partner_mobile, 
        dp.salary AS partner_salary, 
        dp.manager_id
    INTO 
        v_partner_id, v_partner_name, v_partner_mobile, v_partner_salary, v_partner_manager_id
    FROM 
        Catalogue c
    JOIN 
        DeliveryPartner dp ON c.partner_id = dp.partner_id
    WHERE 
        c.order_id = p_order_id;

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Delivery Partner ID: ' || v_partner_id);
    DBMS_OUTPUT.PUT_LINE('Partner Name: ' || v_partner_name);
    DBMS_OUTPUT.PUT_LINE('Partner Mobile: ' || v_partner_mobile);
    DBMS_OUTPUT.PUT_LINE('Partner Salary: ' || v_partner_salary);
    DBMS_OUTPUT.PUT_LINE('Manager ID: ' || v_partner_manager_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No delivery partner found for the specified order ID: ' || p_order_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while fetching delivery partner info.');
END GetDeliveryPartnerInfoByOrderID;
/
Exec GetDeliveryPartnerInfoByOrderID(0);

-- Best custimer bsed on rating for discount on next order
-- A customer is eligible if:

-- Their average customer rating (as given by sellers) is ≥ 4.0, and

-- They have placed at least 2 orders, or

-- They have given consistently high ratings to sellers (i.e., are active & positive)
CREATE OR REPLACE PROCEDURE CheckCustomerDiscountEligibility(
    p_customer_id IN NUMBER
) IS
    v_avg_rating NUMBER := 0;
    v_order_count NUMBER := 0;
BEGIN
    -- Get the average customer rating (rated by sellers)
    SELECT NVL(AVG(customer_rating), 0)
    INTO v_avg_rating
    FROM Rating
    WHERE customer_id = p_customer_id;

    -- Get number of orders placed
    SELECT COUNT(*)
    INTO v_order_count
    FROM Orders
    WHERE customer_id = p_customer_id;

    -- Show details
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || p_customer_id);
    DBMS_OUTPUT.PUT_LINE('Average Rating by Sellers: ' || ROUND(v_avg_rating, 2));
    DBMS_OUTPUT.PUT_LINE('Total Orders: ' || v_order_count);

    -- Check eligibility
    IF v_avg_rating >= 3.0 AND v_order_count >= 1 THEN
        DBMS_OUTPUT.PUT_LINE(' Customer is eligible for a discount on the next order!');
    ELSE
        DBMS_OUTPUT.PUT_LINE(' Customer is not eligible for a discount.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Customer ID: ' || p_customer_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/
EXEC CheckCustomerDiscountEligibility(2);

-- Best Restaurant
CREATE OR REPLACE PROCEDURE GetBestRestaurant IS
    v_seller_id Seller.seller_id%TYPE;
    v_name Seller.name%TYPE;
    v_avg_rating NUMBER;
BEGIN
    SELECT s.seller_id, s.name, AVG(r.seller_rating)
    INTO v_seller_id, v_name, v_avg_rating
    FROM Seller s
    JOIN Rating r ON s.seller_id = r.seller_id
    GROUP BY s.seller_id, s.name
    ORDER BY AVG(r.seller_rating) DESC
    FETCH FIRST 1 ROWS ONLY;

    DBMS_OUTPUT.PUT_LINE(' Best Restaurant: ' || v_name || ' (ID: ' || v_seller_id || ')');
    DBMS_OUTPUT.PUT_LINE('Average Rating: ' || ROUND(v_avg_rating, 2));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No restaurant rating data found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

exec GETBESTRESTAURANT;