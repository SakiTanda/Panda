create table categories (
    category_id int not null auto_increment primary key,
    category_name varchar(20) not null
);
insert into categories (category_name) values ('Vegitables');
insert into categories (category_name) values ('Meats');
insert into categories (category_name) values ('Daily products');
insert into categories (category_name) values ('Spring Vegitables');
insert into categories (category_name) values ('Spring Meats');


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
If you want to see the room temperature, look at [tomato]. 
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

[Tomato]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Tomato', 'tomato.jpg', category_id from categories where category_name = 'Vegitables';
/* for the days of room temperature */
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Room temperature';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Freezer';
/* for the picture & detail of room temperature */
insert into methods (method_picture, detail, food_id, place_id) select 'tomato1.jpg', '1. Wash and dry
2. Keep in the shade', foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Room temperature';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'tomato2.jpg', '1. Wash and dry
2. Put into a plastic bag
3. Put into freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Freezer';

[beef]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Beef', 'beef.jpg', category_id from categories where category_name = 'Meats';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 5, foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Refrigeraor';
/* for the days of freezer */
insert into periods (days, food_id, place_id) select 25, foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Freezer';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'beef1.jpg', '1. Wrap by rap
2. Put into refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Refrigeraor';
/* for the picture & detail of freezer */
insert into methods (method_picture, detail, food_id, place_id) select 'beef2.jpg', '1. Wrap by rap
2. Put into freezer as soon as possible', foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Freezer';

[egg]
/* for the picture on foodlist page */
insert into foods (food_name, picture, category_id) select 'Egg', 'egg.jpg', category_id from categories where category_name = 'Daily products';
/* for the days of refrigerator */
insert into periods (days, food_id, place_id) select 24, foods.food_id, places.place_id from foods, places where foods.food_name = 'Egg' and places.place_name = 'Refrigeraor';
/* for the picture & detail of refrigerator */
insert into methods (method_picture, detail, food_id, place_id) select 'egg1.jpg', '1. Put into refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Egg' and places.place_name = 'Refrigeraor';

[Fiddle Heads] (for easter egg)
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
/*End (Easter egg contents)*/
