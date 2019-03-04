\c flask

drop table if exists users;

create table if not exists users(
   userid serial primary key,
   username varchar(25) not null,
   userpwdhash varchar(200) not null
);

insert into users(username, userpwdhash) values ('ahg','plaintext');

select * from users;
