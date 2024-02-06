CREATE TABLE users(
   user_id INT AUTO_INCREMENT,
   mail VARCHAR(50),
   password VARCHAR(150),
   firstname VARCHAR(50),
   lastname VARCHAR(50),
   PRIMARY KEY(user_id)
);

CREATE TABLE session(
   session_id INT AUTO_INCREMENT,
   name VARCHAR(50),
   PRIMARY KEY(session_id),
   UNIQUE(name)
);

CREATE TABLE student(
   user_id INT,
   profilPicture BLOB,
   session_id INT,
   PRIMARY KEY(user_id),
   FOREIGN KEY(user_id) REFERENCES users(user_id),
   FOREIGN KEY(session_id) REFERENCES session(session_id)
);

CREATE TABLE teacher(
   user_id INT AUTO_INCREMENT,
   PRIMARY KEY(user_id),
   FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE course(
   course_id INT AUTO_INCREMENT,
   name VARCHAR(50),
   start_date DATETIME,
   end_date DATETIME,
   content TEXT,
   user_id INT,
   PRIMARY KEY(course_id),
   FOREIGN KEY(user_id) REFERENCES teacher(user_id)
);

CREATE TABLE evaluation(
   evaluation_id INT AUTO_INCREMENT,
   course_id INT,
   user_id INT NOT NULL,
   PRIMARY KEY(evaluation_id),
   FOREIGN KEY(course_id) REFERENCES course(course_id),
   FOREIGN KEY(user_id) REFERENCES teacher(user_id)
);

CREATE TABLE sessionCourse(
   session_id INT,
   course_id INT,
   PRIMARY KEY(session_id, course_id),
   FOREIGN KEY(session_id) REFERENCES session(session_id),
   FOREIGN KEY(course_id) REFERENCES course(course_id)
);

CREATE TABLE note(
   note_id INT,
   evaluation_id INT,
   PRIMARY KEY(note_id),
   FOREIGN KEY(evaluation_id) REFERENCES evaluation(evaluation_id)
);

CREATE TABLE evaluationCategory(
   evaluation_id INT,
   category_id INT,
   PRIMARY KEY(category_id, evaluation_id),
   FOREIGN KEY(evaluation_id) REFERENCES evaluation(evaluation_id)
   FOREIGN KEY(category_id) REFERENCES category(category_id)
);