INSERT INTO lecture(name,subject) VALUES ('Week 1: Overview, HTML5, CSS, JavaScript','Overview of Web Applications');
INSERT INTO lecture(name,subject) VALUES ('Week 2: Servlet, XML, JSON','Servlet');
INSERT INTO lecture(name,subject) VALUES ('Week 3: JSP, JavaBean','JSP, JavaBean');
INSERT INTO lecture(name,subject) VALUES ('Week 4: Session','Session');
INSERT INTO lecture(name,subject) VALUES ('Week 5: EL, JSTL, Custom tag','EL, JSTL, Custom tag');
INSERT INTO lecture(name,subject) VALUES ('Week 6: MVC Model 1 & Model 2','MVC Model 1 & Model 2');
INSERT INTO lecture(name,subject) VALUES ('Week 7: Spring MVC Web Framework','Spring MVC Web Framework');
INSERT INTO lecture(name,subject) VALUES ('Week 8: Filter, Spring Security','Filter, Spring Security');

INSERT INTO users VALUES ('keith', 'keithpw');
INSERT INTO user_roles(userName, role) VALUES ('keith', 'ROLE_STUDENT');
INSERT INTO user_roles(userName, role) VALUES ('keith', 'ROLE_LECTURER');

INSERT INTO users VALUES ('andrewlui', 'andrewluipw');
INSERT INTO user_roles(userName, role) VALUES ('andrewlui', 'ROLE_LECTURER');

INSERT INTO users VALUES ('oliver', 'oliverpw');
INSERT INTO user_roles(userName, role) VALUES ('oliver', 'ROLE_STUDENT');


INSERT INTO comment(userName,lecture_id,comment) VALUES ('keith',1,'Welcome to COMPS 380F!');
INSERT INTO comment(userName,lecture_id,comment) VALUES ('keith',1,'This course aims to teach you how to develop web applications based on mainly Java technologies.');
INSERT INTO comment(userName,lecture_id,comment) VALUES ('keith',1,'Hope you enjoy studying this course!');

INSERT INTO poll(question,chooseoption1,chooseoption2,chooseoption3,chooseoption4) VALUES ('Which date do you prefer for the mid-term test?','1st April','2nd April','3rd April','4th April');
INSERT INTO pollchooseoption(poll_id,userName,chooseoption) VALUES (1,'andrewlui','2nd April');
INSERT INTO poll(question,chooseoption1,chooseoption2,chooseoption3,chooseoption4) VALUES ('How are you?','very good','good','bad','very bad');
INSERT INTO pollchooseoption(poll_id,userName,chooseoption) VALUES (2,'keith','very good');
