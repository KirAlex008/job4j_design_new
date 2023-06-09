create table devices(
     id serial primary key,
     names varchar(255),
     price real
);

create table people(
     id serial primary key,
     names varchar(255)
);

create table devices_people(
                               id serial primary key,
                               device_id int references devices(id),
                               people_id int references people(id)
);

select * from devices_people;
insert into people(names) values ('name1'), ('name2'), ('name3'), ('name4');
insert into devices(names, price) values ('div1', 10000), ('div2', 4000), ('div3', 6000);
insert into devices_people (device_id, people_id) values (1, 3), (2, 1), (3, 2), (3, null), (1, 2), (2, 3);

drop table devices_people;

select avg(d.price) from devices d;

select p.names, avg(d.price)
from people p
         join devices_people dp on p.id = dp.people_id
         join devices d on d.id = dp.device_id
group by p.names;

select p.names, avg(d.price)
from people p
join devices_people dp on p.id = dp.people_id
join devices d on d.id = dp.device_id
group by p.names
having avg(d.price) > 5000;
