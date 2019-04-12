CREATE DATABASE hozumi DEFAULT CHARACTER SET utf8;


CREATE TABLE user
 (
     id SERIAL PRIMARY KEY,
	 login_id varchar(255) UNIQUE NOT NULL ,
     name varchar(255) NOT NULL,
	 birth_date DATE NOT NULL,
     password varchar(255)NOT NULL,
	 create_date DATETIME NOT NULL, 
     update_date DATETIME NOT NULL
	 );
 
 INSERT INTO user
 (
     id,
	 login_id,
	 name,
     birth_date,
	 password,
	 create_date,
	 update_date
	 )
	 VALUES
	 (
	 1,
	 'admin',
	 'ä«óùé“',
	 '1000-10-10',
	 'password',
	  now(),
	  now()
	 );
	 
	  INSERT INTO user
 (
     id,
	 login_id,
	 name,
     birth_date,
	 password,
	 create_date,
	 update_date
	 )
	 VALUES
	 (
	 2,
	 'takano',
	 'takano',
	 '1000-10-10',
	 'password',
	  now(),
	  now()
	 );
	 INSERT INTO user
 (
     id,
	 login_id,
	 name,
     birth_date,
	 password,
	 create_date,
	 update_date
	 )
	 VALUES
	 (
	 3,
	 'himura',
	 'îÍë∫',
	 '1000-10-10',
	 'password',
	  now(),
	  now()
	 );
INSERT INTO user
 (
     id,
	 login_id,
	 name,
     birth_date,
	 password,
	 create_date,
	 update_date
	 )
	 VALUES
	 (
	 4,
	 'saitou',
	 'ç÷ì°',
	 '1000-10-10',
	 'password',
	  now(),
	  now()
	 );

