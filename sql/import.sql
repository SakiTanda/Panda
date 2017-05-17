create table categories (
    category_id int not null auto_increment primary key,
    category_name varchar(20) not null
);
insert into categories (category_name) values ('Vegitables');
insert into categories (category_name) values ('Meats');
insert into categories (category_name) values ('Daily products');

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
[lettuce]
insert into foods (food_name, picture, category_id) select 'Lettuce', 'Lettuce.JPG', category_id from categories where category_name = 'Vegitables';
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Lettuce' and places.place_name = 'Refrigeraor';
insert into periods (days, food_id, place_id) select 14, foods.food_id, places.place_id from foods, places where foods.food_name = 'Lettuce' and places.place_name = 'Freezer';
insert into methods (method_picture, detail, food_id, place_id) select 'Lettuce1.JPG', '1. Do not cut the lettuce
2. Dry and wrap it in paper towel
3. Store it in a plastic bag in refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Lettuce' and places.place_name = 'Refrigeraor';
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
insert into foods (food_name, picture, category_id) select 'Tomato', 'tomato.jpg', category_id from categories where category_name = 'Vegitables';
insert into periods (days, food_id, place_id) select 7, foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Room temperature';
insert into periods (days, food_id, place_id) select 30, foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Freezer';
insert into methods (method_picture, detail, food_id, place_id) select 'tomato1.jpg', '1. Wash and dry
2. Keep in the shade', foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Room temperature';
insert into methods (method_picture, detail, food_id, place_id) select 'tomato2.jpg', '1. Wash and dry
2. Put into a plastic bag
3. Put into freezer', foods.food_id, places.place_id from foods, places where foods.food_name = 'Tomato' and places.place_name = 'Freezer';

[beef]
insert into foods (food_name, picture, category_id) select 'Beef', 'beef.jpg', category_id from categories where category_name = 'Meats';
insert into periods (days, food_id, place_id) select 5, foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Refrigeraor';
insert into periods (days, food_id, place_id) select 25, foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Freezer';
insert into methods (method_picture, detail, food_id, place_id) select 'beef1.jpg', '1. Wrap by rap
2. Put into refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Refrigeraor';
insert into methods (method_picture, detail, food_id, place_id) select 'beef2.jpg', '1. Wrap by rap
2. Put into freezer as soon as possible', foods.food_id, places.place_id from foods, places where foods.food_name = 'Beef' and places.place_name = 'Freezer';

[egg]
insert into foods (food_name, picture, category_id) select 'Egg', 'egg.jpg', category_id from categories where category_name = 'Daily products';
insert into periods (days, food_id, place_id) select 24, foods.food_id, places.place_id from foods, places where foods.food_name = 'Egg' and places.place_name = 'Refrigeraor';
insert into methods (method_picture, detail, food_id, place_id) select 'egg1.jpg', '1. Put into refrigerator', foods.food_id, places.place_id from foods, places where foods.food_name = 'Egg' and places.place_name = 'Refrigeraor';

