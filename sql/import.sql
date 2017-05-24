create table categories (
    category_id int not null auto_increment primary key,
    category_name varchar(20) not null
);
insert into categories (category_name) values ('Vegitables');
insert into categories (category_name) values ('Meats');
insert into categories (category_name) values ('Daily products');
insert into categories (category_name) values ('Spring Vegitables');
insert into categories (category_name) values ('Spring Meats');
insert into categories (category_name) values ('Summer Vegitables');
insert into categories (category_name) values ('Autumn Vegitables');
insert into categories (category_name) values ('Winter Meats');

----------------------------------------------------

create table temperatures (
    category_id int not null,
    place_id int not null,
    detail text,
    PRIMARY KEY(category_id, place_id),
    foreign key(category_id) references categories(category_id),
    foreign key(place_id) references places(place_id)
);
insert into temperatures (category_id, place_id, detail) value ('1', '1', 'Temperature: around 6 degree');
insert into temperatures (category_id, place_id, detail) value ('1', '2', 'Temperature: around -18 degree');
insert into temperatures (category_id, place_id, detail) value ('1', '3', 'Temperature: around 10 to 14 degree');
insert into temperatures (category_id, place_id, detail) value ('2', '1', 'Temperature: around 0 degree');
insert into temperatures (category_id, place_id, detail) value ('2', '2', 'Temperature: around -18 degree');
insert into temperatures (category_id, place_id, detail) value ('2', '3', 'Temperature: around 10 to 14 degree');
insert into temperatures (category_id, place_id, detail) value ('3', '1', 'Temperature: around 3 degree');
insert into temperatures (category_id, place_id, detail) value ('3', '2', 'Temperature: around -18 degree');
insert into temperatures (category_id, place_id, detail) value ('3', '3', 'Temperature: around 10 to 14 degree');
insert into temperatures (category_id, place_id, detail) value ('4', '1', 'Temperature: around 6 degree');
insert into temperatures (category_id, place_id, detail) value ('4', '2', 'Temperature: around -18 degree');
insert into temperatures (category_id, place_id, detail) value ('4', '3', 'Temperature: around 10 to 14 degree');
insert into temperatures (category_id, place_id, detail) value ('5', '1', 'Temperature: around 0 degree');
insert into temperatures (category_id, place_id, detail) value ('5', '2', 'Temperature: around -18 degree');
insert into temperatures (category_id, place_id, detail) value ('5', '3', 'Temperature: around 10 to 14 degree');
insert into temperatures (category_id, place_id, detail) value ('6', '1', 'Temperature: around 6 degree');
insert into temperatures (category_id, place_id, detail) value ('6', '2', 'Temperature: around -18 degree');
insert into temperatures (category_id, place_id, detail) value ('6', '3', 'Temperature: around 10 to 14 degree');
insert into temperatures (category_id, place_id, detail) value ('7', '1', 'Temperature: around 6 degree');
insert into temperatures (category_id, place_id, detail) value ('7', '2', 'Temperature: around -18 degree');
insert into temperatures (category_id, place_id, detail) value ('7', '3', 'Temperature: around 10 to 14 degree');
insert into temperatures (category_id, place_id, detail) value ('8', '1', 'Temperature: around 0 degree');
insert into temperatures (category_id, place_id, detail) value ('8', '2', 'Temperature: around -18 degree');
insert into temperatures (category_id, place_id, detail) value ('8', '3', 'Temperature: around 10 to 14 degree');

----------------------------------------------------

create table places (
    place_id int not null auto_increment primary key,
    place_name varchar(20) not null
);
insert into places (place_name) values ('Refrigeraor');
insert into places (place_name) values ('Freezer');
insert into places (place_name) values ('Room temperature');

----------------------------------------------------

create table foods (
    food_id int not null auto_increment primary key,
    food_name varchar(20) not null unique,
    picture varchar(20),
    category_id int,
    foreign key(category_id) references categories(category_id)
);

create table periods (
    food_id int not null,
    place_id int not null,
    days int,
    PRIMARY KEY(food_id, place_id),
    foreign key(food_id) references foods(food_id),
    foreign key(place_id) references places(place_id)
);

create table methods (
    food_id int not null,
    place_id int not null,
    method_picture varchar(20),
    detail text,
    PRIMARY KEY(food_id, place_id),
    foreign key(food_id) references foods(food_id),
    foreign key(place_id) references places(place_id)
);


----------------------------------------------------
/* 
There is some sample of sql
If you want to see the item of dairy product, look at [egg].
If you want to see the item of meat product, look at [beef].
If you want to see the room temperature, look at [Tomato]. 
*/

[lettuce]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Lettuce', 'Lettuce.JPG', category_id from categories where category_name = 'Vegitables';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Lettuce' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 14, foods.food_id, places.place_id from foods, places where foods.food_name = 'Lettuce' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Lettuce1.JPG', '1. Do not cut the lettuce
2. Dry and wrap it in paper towel
3. Store it in a plastic bag in refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Lettuce' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Lettuce2.JPG', '1. Shred the lettuce
2. Wash and dry it 
3. Store it in a plastic bag in freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Lettuce' and places.place_name = 'Freezer';

[Broccoli]
insert into foods (food_name, picture, category_id) select 'Broccoli', 'Broccoli.JPG', category_id from categories where category_name = 'Vegitables';
insert into periods (days, food_id, place_id) select 3, foods.food_id, places.place_id from foods, places where foods.food_name = 'Broccoli' and places.place_name = 'Refrigeraor';
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Broccoli' and places.place_name = 'Freezer';
insert into methods (method_picture, detail, food_id, place_id) select 'Broccoli1.JPG', '1. Wash the broccoli
2. Loosely wrap the broccoli in damp paper towels
3. Store it in the refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Broccoli' and places.place_name = 'Refrigeraor';
insert into methods (method_picture, detail, food_id, place_id) select 'Broccoli2.JPG', '1. Cut the broccoli into smaller pieces
2. Boil them for three minutes
3. Dump them into ice-cold water
4. Drain and dry them
5. Store them in a plastic bag in freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Broccoli' and places.place_name = 'Freezer';

[Apple]
insert into foods (food_name, picture, category_id) select 'Apple', 'Apple.JPG', category_id from categories where category_name = 'Vegitables';
insert into periods (days, food_id, place_id) select 14, foods.food_id, places.place_id from foods, places where foods.food_name = 'Apple' and places.place_name = 'Refrigeraor';
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Apple' and places.place_name = 'Freezer';
insert into methods (method_picture, detail, food_id, place_id) select 'Apple1.JPG', '1. Store the Apple in a plastic bag in refrigerator (or at room tempeture out of direct sunlight)', foods.food_id, places.place_id from foods, places where foods.food_name = 'Apple' and places.place_name = 'Refrigeraor';
insert into methods (method_picture, detail, food_id, place_id) select 'Apple2.JPG', "1. Slice the apple
2. Place them on a cookie sheet in freezer
3. When they're frozen, store them in a plastic bag", foods.food_id, places.place_id from foods, places where foods.food_name = 'Apple' and places.place_name = 'Freezer';

[Orange]
insert into foods (food_name, picture, category_id) select 'Orange', 'Orange.JPG', category_id from categories where category_name = 'Vegitables';
insert into periods (days, food_id, place_id) select 14, foods.food_id, places.place_id from foods, places where foods.food_name = 'Orange' and places.place_name = 'Refrigeraor';
insert into periods (days, food_id, place_id) select 28, foods.food_id, places.place_id from foods, places where foods.food_name = 'Orange' and places.place_name = 'Freezer';
insert into methods (method_picture, detail, food_id, place_id) select 'Orange1.JPG', '1. Store the Orange in refrigerator (or at room tempeture out of direct sunlight)', foods.food_id, places.place_id from foods, places where foods.food_name = 'Orange' and places.place_name = 'Refrigeraor';
insert into methods (method_picture, detail, food_id, place_id) select 'Orange2.JPG', '1. Store the orange in any way in freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Orange' and places.place_name = 'Freezer';

[Leek]
insert into foods (food_name, picture, category_id) select 'Leek', 'Leek.JPG', category_id from categories where category_name = 'Vegitables';
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Leek' and places.place_name = 'Refrigeraor';
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Leek' and places.place_name = 'Freezer';
insert into methods (method_picture, detail, food_id, place_id) select 'Leek1.JPG', '1. Wrap the leek in damp paper towels
2. Store the Leek in a plastic bag in refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Leek' and places.place_name = 'Refrigeraor';
insert into methods (method_picture, detail, food_id, place_id) select 'Leek2.JPG', '1. Wash, dry and slice the leek
2. Store it in a plastic bag in freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Leek' and places.place_name = 'Freezer';

[Green Pepper]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'GreenPepper', 'Greenpepper.JPG', category_id from categories where category_name = 'Vegitables';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Green pepper' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Green pepper' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Greenpepper1.JPG', '1. Dry it well, put it into a seal bag
2. Not fresh one should be removed from the bag(It affects others)
3. Put into a fridge', foods.food_id, places.place_id from foods, places where foods.food_name = 'Green pepper' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Greenpepper2.JPG', '1. Cut into a half, remove stem end, and inside of it
2. Put it into a seal bag or wrap it 
3. Put it into freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Green pepper' and places.place_name = 'Freezer';

[Tomato]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Tomato', 'Tomato.JPG', category_id from categories where category_name = 'Vegitables';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Tomato1.JPG', '1. Put them in a sealable plastic bag
2. Seal the bag(suck out as much excess air as possible)
3. Put it in a fridge', foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Tomato2.JPG', '1. Put them in a sealable plastic bag
2. Seal the bag(suck out as much excess air as possible) 
3. Put it in a freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Freezer';

[Ginger]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Ginger', 'Ginger.JPG', category_id from categories where category_name = 'Vegitables';
/* for the days of room temperature */
insert into periods (days, food_id, place_id) select 10, foods.food_id, places.place_id from foods, places where foods.food_name = 'Ginger' and places.place_name = 'Room temperature';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Ginger' and places.place_name = 'Refrigeraor';
/* for the picture & detail of room temperature */
insert into methods (method_picture, detail, food_id, place_id) select 'Ginger1.JPG', '1. Put them in a sealable plastic bag
2. Seal the bag(suck out as much excess air as possible)
3. Place it in dark place in a room', foods.food_id, places.place_id from foods, places where foods.food_name = 'Ginger' and places.place_name = 'Room temperature';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Ginger2.JPG', '1. Put them in a sealable plastic bag 
2. Seal the bag(suck out as much excess air as possible)
3. Put it in a Fridge', foods.food_id, places.place_id from foods, places where foods.food_name = 'Ginger' and places.place_name = 'Refrigeraor';

[Chinese Cabbage]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'ChineseCabbage', 'Chinesecabbage.JPG', category_id from categories where category_name = 'Vegitables';
/* for the days of room temperature */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Chinese cabbage' and places.place_name = 'Room temperature';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 21, foods.food_id, places.place_id from foods, places where foods.food_name = 'Chinese cabbage' and places.place_name = 'Refrigeraor';
/* for the picture & detail of room temperature */
insert into methods (method_picture, detail, food_id, place_id) select 'Chinesecabbage1.jPG', '1. Wrap it by newspaper or a plastic wrap
2. Place it in the dark place in a room', foods.food_id, places.place_id from foods, places where foods.food_name = 'Chinese cabbage' and places.place_name = 'Room temperature';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Chinesecabbage2.JPG', '1. Wrap it by newspaper or a plastic wrap
2. Put it into fridge', foods.food_id, places.place_id from foods, places where foods.food_name = 'Chinese cabbage' and places.place_name = 'Refrigeraor';

[Onion]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Onion', 'Onion.JPG', category_id from categories where category_name = 'Vegitables';
/* for the days of room temperature */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Onion' and places.place_name = 'Room temperature';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 14, foods.food_id, places.place_id from foods, places where foods.food_name = 'Onion' and places.place_name = 'Freezer';
/* for the picture & detail of room temperature */
insert into methods (method_picture, detail, food_id, place_id) select 'Onion1.JPG', '1. Wrap it one by one by newspaper
2.Place it in the dark place in a room', foods.food_id, places.place_id from foods, places where foods.food_name = 'Onion' and places.place_name = 'Room temperature';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Onion2.JPG', '1. Slice or chop it into small pieces
2. Put it into sealable bag
3. Put it into freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Onion' and places.place_name = 'Freezer';


[beef]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Beef', 'beef.jpg', category_id from categories where category_name = 'Meats';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 2, foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 180, foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'beef1.jpg', '1. slices into the quantity of each time you want to eat
2. get a good tight wrap of plastic wrap around it and store in the bottom of your fridge', foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'beef2.jpg', '1. Wrap by rap
2. Put into freezer as soon as possible', foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Freezer';

[lamb]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Lamb', 'lamb.jpg', category_id from categories where category_name = 'Meats';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 2, foods.food_id, places.place_id from foods, places where foods.food_name = 'Lamb' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 85, foods.food_id, places.place_id from foods, places where foods.food_name = 'Lamb' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'lamb1.jpg', '1. Fresh lamb should be refrigerated at or below 4 degrees
2. Ground lamb and stew meat should be used within 2 days
3. Use chops and roasts in 3 to 5 days', foods.food_id, places.place_id from foods, places where foods.food_name = 'Lamb' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'lamb2.jpg', '1. wrap it in its original packaging with airtight freezer wrap
2. place it in an airtight freezer bag to prevent freezer burn
3. use frozen lamb in 3 to 4 months', foods.food_id, places.place_id from foods, places where foods.food_name = 'Lamb' and places.place_name = 'Freezer';

[pork]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Pork', 'pork.jpg', category_id from categories where category_name = 'Meats';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 2, foods.food_id, places.place_id from foods, places where foods.food_name = 'Pork' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 180, foods.food_id, places.place_id from foods, places where foods.food_name = 'Pork' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'pork1.jpg', '1. Split the packaging of pre-packaged fresh meats to allow air to circulate
2. Place raw meat in a container, cover loosely with plastic wrap and place on the lowest shelf
3. Put cooked meats on a plate, cover loosely and place on a high shelf, well away from raw meat', foods.food_id, places.place_id from foods, places where foods.food_name = 'Pork' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'pork2.jpg', '1. use packaging recommended for freezers such as heavy duty plastic bags
2. Remove the air and seal with a twist tie
3. Do not use thin plastic wrap, greaseproof or brown paper, unless the package is placed in a plastic bag
4. Label and date all foods before freezing', foods.food_id, places.place_id from foods, places where foods.food_name = 'Pork' and places.place_name = 'Freezer';

[salmon]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Salmon', 'salmon.jpg', category_id from categories where category_name = 'Meats';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 2, foods.food_id, places.place_id from foods, places where foods.food_name = 'Salmon' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 60, foods.food_id, places.place_id from foods, places where foods.food_name = 'Salmon' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'salmon1.jpg', '1. Unwrap the salmon, and gently pat dry
2. Put two or three slices of lemon on top of the fish and wrap tightly in plastic wrap
3. Store the fish in the bottom of the refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Salmon' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'salmon2.jpg', '1. The lower the temperature you can keep the fish at, the longer it will keep', foods.food_id, places.place_id from foods, places where foods.food_name = 'Salmon' and places.place_name = 'Freezer';

[chicken]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Chicken', 'chicken.jpg', category_id from categories where category_name = 'Meats';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 2, foods.food_id, places.place_id from foods, places where foods.food_name = 'Chicken' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 180, foods.food_id, places.place_id from foods, places where foods.food_name = 'Chicken' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'chicken1.jpg', '1. Uncooked chicken meat should be stored in a refrigerator at a maximum temperature of 4 degrees
2. being wrapped in plastic
3. raw meats should be placed on a tray or plate
4. placed on a lower shelf in the fridge', foods.food_id, places.place_id from foods, places where foods.food_name = 'Chicken' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'chicken2.jpg', '1. Do not freeze raw meat which is not completely fresh
2. put in plastic', 
foods.food_id, places.place_id from foods, places where foods.food_name = 'Chicken' and places.place_name = 'Freezer';

[egg]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Egg', 'egg.jpg', category_id from categories where category_name = 'Daily products';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 40, foods.food_id, places.place_id from foods, places where foods.food_name = 'Egg' and places.place_name = 'Refrigeraor';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'egg1.jpg', '1.Use airtight bags and put eggs in(2-5 degree).
2.Blunt side up and sharp side down.
3.Don’t ever wash eggs.', foods.food_id, places.place_id from foods, places where foods.food_name = 'Egg' and places.place_name = 'Refrigeraor';


/*--------------------------Dairy----------------------------------------*/
[Cheese]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Cheese', 'Cheese.jpg', category_id from categories where category_name = 'Daily products';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 180, foods.food_id, places.place_id from foods, places where foods.food_name = 'Cheese' and places.place_name = 'Refrigeraor';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Cheese1.jpg', '1.Cut whole cheese to small part about 225g-500g(option)
2.Cover with airtight plastic bag(-1-1 degree)
3.Use food expire date tracker to track food', foods.food_id, places.place_id from foods, places where foods.food_name = 'Cheese' and places.place_name = 'Refrigeraor';

[Milk]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Milk', 'Milk.jpg', category_id from categories where category_name = 'Daily products';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 3, foods.food_id, places.place_id from foods, places where foods.food_name = 'Milk' and places.place_name = 'Refrigeraor';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Milk1.jpg', '1.Store mile in a container
2.Keep milk away from any light during storing(2-6 degree)
3.Heat milk fast before drinking it', foods.food_id, places.place_id from foods, places where foods.food_name = 'Milk' and places.place_name = 'Refrigeraor';

[Cream]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Cream', 'Cream.jpg', category_id from categories where category_name = 'Daily products';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Cream' and places.place_name = 'Refrigeraor';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Cream1.jpg', '1.Clean up cream around the open after finish using cream.
2.Press the air out and seal the box.
3.Put it in the regenerator in around 3 degree.', foods.food_id, places.place_id from foods, places where foods.food_name = 'Cream' and places.place_name = 'Refrigeraor';

[Butter]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Butter', 'Butter.jpg', category_id from categories where category_name = 'Daily products';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 365, foods.food_id, places.place_id from foods, places where foods.food_name = 'Butter' and places.place_name = 'Refrigeraor';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Butter1.jpg', '1.Always store in proper under proper temperature(2-8 degree).
2.Cover with tin foil or plastic wrap.', foods.food_id, places.place_id from foods, places where foods.food_name = 'Butter' and places.place_name = 'Refrigeraor';

/*---------------------Daiy----------------------------------------------*/

/*---------------------easter egg----------------------------------------------*/
[Fiddle Heads] 
insert into foods (food_name, picture, category_id) select 'Fiddle Heads', 'Fiddle.JPG', category_id from categories where category_name = 'Spring Vegitables';
insert into periods (days, food_id, place_id) select 3, foods.food_id, places.place_id from foods, places where foods.food_name = 'Fiddle Heads' and places.place_name = 'Refrigeraor';
insert into periods (days, food_id, place_id) select 60, foods.food_id, places.place_id from foods, places where foods.food_name = 'Fiddle Heads' and places.place_name = 'Freezer';
insert into methods (method_picture, detail, food_id, place_id) select 'Fiddle1.JPG', '1. Wrap the Fiddle Heads in damp paper towels
2. Store the Fiddle Heads in a plastic bag in refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Fiddle Heads' and places.place_name = 'Refrigeraor';
insert into methods (method_picture, detail, food_id, place_id) select 'Fiddle2.JPG', '1. Boil the fiddle Heads for one minute
2. Drain and Place them on a cookie sheet in freezer
3. Store them in a plastic bag', foods.food_id, places.place_id from foods, places where foods.food_name = 'Fiddle Heads' and places.place_name = 'Freezer';

/*Haruna : Easter Egg contents*/
[Bamboo shoot]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Bamboo shoot', 'Bambooshoot.JPG', category_id from categories where category_name = 'Spring Vegitables';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Bamboo shoot' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Bamboo shoot' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Bambooshoot1.JPG', '1. Boil it first
2. After boiled it, remain it into water until it becomes cold
3. Remove peers. Put it into sealable container with water
4. Put it into a fridge', foods.food_id, places.place_id from foods, places where foods.food_name = 'Bamboo shoot' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Bambooshoot2.JPG', '1.After removing harshness, slice it
2. Make it dry 
3. Put it into a sealable plastic bag
4. Put it into a freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Bamboo shoot' and places.place_name = 'Freezer';

[Spot prawn]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Spot prawn', 'Spotprawn.jpg', category_id from categories where category_name = 'Spring Meats';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 3, foods.food_id, places.place_id from foods, places where foods.food_name = 'Spot prawn' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Spot prawn' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Spotprawn1.jpg', '1.Put in a box which is filled with icy water 
2. Put into refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Spot prawn' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Spotprawn2.jpg', '1. Put in a box which is filled with icy water
2. Put into freezer as soon as possible', foods.food_id, places.place_id from foods, places where foods.food_name = 'Spot prawn' and places.place_name = 'Freezer';

[Apricot]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Apricot', 'Apricot.jpg', category_id from categories where category_name = 'Summer Vegitables';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 3, foods.food_id, places.place_id from foods, places where foods.food_name = 'Apricot' and places.place_name = 'Room temperature';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Apricot' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Apricot1.jpg', '1. Keep apricots in a paper bag
(Unripe apricots can be stored up to 5 days)', foods.food_id, places.place_id from foods, places where foods.food_name = 'Apricot' and places.place_name = 'Room temperature';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Apricot2.jpg', '1. Peel and cut up the apricots
2. Sprinkle lemon juice
3. Store them in a plastic bag in freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Apricot' and places.place_name = 'Freezer';

[Chestnuts]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Chestnuts', 'Chestnuts.JPG', category_id from categories where category_name = 'Autumn Vegitables';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 90, foods.food_id, places.place_id from foods, places where foods.food_name = 'Chestnuts' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 180, foods.food_id, places.place_id from foods, places where foods.food_name = 'Chestnuts' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Chestnuts1.JPG', '1. Dry them in the sun for a day
2. Wrap by newspaper and put it into a plastic bag
3. Put it into a fridge(The most cold place is preferable)', foods.food_id, places.place_id from foods, places where foods.food_name = 'Chestnuts' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Chestnuts2.JPG', '1. 4 to 6 weeks keep preserve in fridge(follow process for preservation method in a fridge)
2. Put it into a freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Chestnuts' and places.place_name = 'Freezer';

[Goose]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Goose', 'Goose.JPG', category_id from categories where category_name = 'Winter Meats';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 3, foods.food_id, places.place_id from foods, places where foods.food_name = 'Goose' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 365, foods.food_id, places.place_id from foods, places where foods.food_name = 'Goose' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'Goose1.JPG', '1. Wrap it by a plastic wrap
2. Put it into a fridge', foods.food_id, places.place_id from foods, places where foods.food_name = 'Goose' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'Goose2.JPG', '1. Wrap it by a plastic wrap
2. Put it into a freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Goose' and places.place_name = 'Freezer';

/*End (Easter egg contents)*/
