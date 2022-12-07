SELECT subject_type, description FROM subjects
FULL OUTER JOIN sub_answer ON subjects.subject_id = sub_answer.subject_id
FULL OUTER JOIN answers ON sub_answer.answer_id = answers.answer_id

START TRANSACTION;

DROP TABLE IF EXISTS cat_question, question_sub, sub_answer, users, categories, questions, subjects, answers;
DROP SEQUENCE IF EXISTS seq_user_id, seq_cat_id, seq_question_id, seq_subject_id, seq_answer_id;

CREATE SEQUENCE seq_subject_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE subjects (
	subject_id INT NOT NULL DEFAULT nextval('seq_subject_id'),
	subject_type VARCHAR(36) NOT NULL,
	
	CONSTRAINT PK_subjects PRIMARY KEY (subject_id)
);

CREATE SEQUENCE seq_answer_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE answers (
	answer_id INT NOT NULL DEFAULT nextval('seq_answer_id'),
	description VARCHAR(255) NOT NULL,
	
	CONSTRAINT PK_answers PRIMARY KEY (answer_id)
);

CREATE TABLE sub_answer (
	subject_id INT NOT NULL,
	answer_id INT NOT NULL,
	
	CONSTRAINT PK_sub_answer PRIMARY KEY (subject_id, answer_id),
	CONSTRAINT FK_sub_answer_subject_id FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
	CONSTRAINT FK_sub_answer_answer_id FOREIGN KEY (answer_id) REFERENCES answers(answer_id)
);

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);
										 
INSERT INTO subjects (subject_type)
VALUES ('networking'), ('resumes'), ('interviews'),('cover'), ('imposter'), ('stress'), ('job offer'), ('relocation'), ('elevator'), ('negotiation'), ('phone'), ('behavioral'),
('benefits'), ('linkedin'), ('alumni'), ('matchmaking'), ('job search'), ('technical'), ('positions'), ('side'), ('time');
										   
INSERT INTO answers (description)
VALUES('https://drive.google.com/file/d/1q_spUYbGgL7Vi1SbFnDVSjv2sl9t_B16/view Networking is going to be a vital part of your new career in technology');

INSERT INTO answers (description)
VALUES('Your resume will serve as your first impression when applying to jobs and we want to ensure that youre putting your best foot forward with your resume as you begin applying to jobs in the technology industry.');

INSERT INTO answers (description)
VALUES ('Interviewing begins the moment you receive a call or email from the recruiter informing you that theyre interested in scheduling an interview.');

INSERT INTO answers (description)
VALUES ('https://drive.google.com/file/d/1HLd3jBgWWtcHxl5HcRdBt3edBuxd6ndL/view');

INSERT INTO answers (description)
VALUES ('Strategies to cope with imposter feelings include talking about what you are experiencing, questioning your negative thoughts, and avoiding comparing yourself to others.');

INSERT INTO answers (description)
VALUES ('Make and keep to a schedule
-While youre at it, schedule breaks into your day
-Remind yourself you are here to learn
-Dont compare yourself to others
-Move your body
-Drink water
-Celebrate your wins!');

INSERT INTO answers (description)
VALUES ('As a Tech Elevator student, you will log all job offers (not just the position you accept). For quick access to the Job Offer Form and the Attestation form, visit the "Logging Your Offer" lesson within this unit');

INSERT INTO answers (description)
VALUES ('Looking at relocation opportunities is a great way to expand your job search and cast a wider net when applying for jobs!');

INSERT INTO answers (description)
VALUES ('Your Elevator Pitch will serve as your first impression when meeting new people - both professionally and personally');

INSERT INTO answers (description)
VALUES ('The worst thing that can happen when you negotiate is that you are told "no" and you are left with your original offer... not a bad outcome!');

INSERT INTO answers (description)
VALUES ('Confirm the scheduled time. Before the day of your interview, confirm the date and time so youre sure to pick up when the call comes in.');

INSERT INTO answers (description)
VALUES ('https://www.glassdoor.com/blog/guide/how-to-prepare-for-a-behavioral-interview/');

INSERT INTO answers (description)
VALUES ('https://resources.workable.com/tutorial/employee-benefits-guide');

INSERT INTO answers (description)
VALUES ('https://theundercoverrecruiter.com/how-optimize-your-linkedin-profile-job-search/');

INSERT INTO answers (description)
VALUES ('https://www.linkedin.com/groups/7026303/');


INSERT INTO answers (description)
VALUES ('Matchmaking can be a nerve-racking experience, but it is not designed to be so!');


INSERT INTO answers (description)
VALUES ('Simply applying to a job is not enough -- your application could easily fall into the infamous "Black Hole" of the applicant tracking system (ATS), especially at a larger company.');

INSERT INTO answers (description)
VALUES ('Know your audience - if youre meeting with a recruiter or non-technical person, highlight your soft skills and dont get too technical. If youre meeting with a Software Developer or someone more technical');

INSERT INTO answers (description)
VALUES ('Application Programmers  write programs to handle a specific job, such as a program to track inventory within an organization.');

INSERT INTO answers (description)
VALUES ('There are many things that you can do that give you something to talk about in answer to the �What have you done...�');

INSERT INTO answers (description)
VALUES ('Get a to-do list and a timer.');
  

INSERT INTO sub_answer (subject_id, answer_id) VALUES (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10), (11,11), (12,12), (13,13), (14,14),(15,15), (16,16), (17,17),
(18,18), (19,19), (20,20), (21,21);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');





COMMIT TRANSACTION;


SELECT categories.name, question_text, subject_type, description FROM categories
FULL OUTER JOIN cat_question ON categories.cat_id = cat_question.cat_id
FULL OUTER JOIN questions ON cat_question.question_id = questions.question_id
FULL OUTER JOIN question_sub ON questions.question_id = question_sub.question_id
FULL OUTER JOIN subjects ON question_sub.subject_id = subjects.subject_id
FULL OUTER JOIN sub_answer ON subjects.subject_id = sub_answer.subject_id
FULL OUTER JOIN answers ON sub_answer.answer_id = answers.answer_id
