DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;


CREATE TABLE project (
  project_id INT AUTO_INCREMENT NOT NULL,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL (7,2),
  actual_hours DECIMAL (7,2),
  difficulty INT,
  notes TEXT,
  PRIMARY KEY (project_id)
);

CREATE TABLE category (
  category_id INT AUTO_INCREMENT NOT NULL,
  category_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
  project_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
  UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step (
  step_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  PRIMARY KEY (step_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
  material_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT,
  cost DECIMAL(7, 2),
  PRIMARY KEY (material_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
  );
  
insert into category (category_name)
values ('Doors and Windows');
select * from project;

insert into material (project_id, material_name, num_required)
values 
(1, '2-inch screws', 20);

insert into step (project_id, step_text, step_order)
values 
(1, 'Screw door hangers on the top and bottom of each side of the door frame', 1);

insert into project_category (project_id, category_id)
values
(1, 1);

insert into category (category_id, category_name) values(2, 'Repairs');
insert into category (category_id, category_name) values(3, 'Gardening');

insert into material (project_id, material_name, num_required, cost) values (2, 'faucet', 30, 4.55);
insert into material (project_id, material_name, num_required, cost) values (3, 'power point', 225, 19.99);

insert into step (project_id, step_text, step_order) values (2, 'Repair all of the old parts', 2);
insert into step (project_id, step_text, step_order) values (3, 'Clear the garbege in the garden', 3);

insert into project_category (project_id, category_id)
values
(2, 2);

insert into project_category (project_id, category_id)
values
(3, 3);


  
