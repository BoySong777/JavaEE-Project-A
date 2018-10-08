drop database if exists db_a;
create database db_a;

drop table if exists db_a.user;
create table db_a.user (
  id       int auto_increment primary key
  comment 'id PK',
  email    varchar(255) not null unique
  comment 'email NN UN',
  username varchar(255) not null
  comment 'username NN',
  password varchar(255) not null
  comment 'password NN'
)
  comment 'user table';

select *
from db_a.user;

truncate table db_a.user;