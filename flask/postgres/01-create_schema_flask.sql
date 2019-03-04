\c flask

drop table if exists users;

create table if not exists users(
   userid serial primary key,
   username varchar(25) not null,
   password varchar(200) not null
);

insert into users(username, password) values ('ahg','plaintext');

select * from users;
