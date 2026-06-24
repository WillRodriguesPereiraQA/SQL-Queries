USE exercises;

CREATE TABLE user_define (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE role_define (
  id INT PRIMARY KEY,
  label VARCHAR(50) NOT NULL
);

CREATE TABLE action_define (
  id INT PRIMARY KEY,
  description VARCHAR(100) NOT NULL
);

CREATE TABLE user_role_rela (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user_define (id),
  FOREIGN KEY (role_id) REFERENCES role_define (id)
);

CREATE TABLE role_action_rela (
  id INT PRIMARY KEY,
  role_id INT NOT NULL,
  action_id INT NOT NULL,
  FOREIGN KEY (role_id) REFERENCES role_define (id),
  FOREIGN KEY (action_id) REFERENCES action_define (id)
);
