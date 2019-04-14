INSERT INTO lecture(name,subject) VALUES ('Week 1: Overview, HTML5, CSS, JavaScript','Overview of Web Applications');
INSERT INTO lecture(name,subject) VALUES ('Week 2: Servlet, XML, JSON','Servlet');
INSERT INTO lecture(name,subject) VALUES ('Week 3: JSP, JavaBean','JSP, JavaBean');
INSERT INTO lecture(name,subject) VALUES ('Week 4: Session','Session');

INSERT INTO users VALUES ('keith', 'keithpw');
INSERT INTO user_roles(userName, role) VALUES ('keith', 'ROLE_STUDENT');
INSERT INTO user_roles(userName, role) VALUES ('keith', 'ROLE_LECTURER');

INSERT INTO users VALUES ('andrewlui', 'andrewluipw');
INSERT INTO user_roles(userName, role) VALUES ('andrewlui', 'ROLE_LECTURER');

INSERT INTO users VALUES ('oliver', 'oliverpw');
INSERT INTO user_roles(userName, role) VALUES ('oliver', 'ROLE_STUDENT');


INSERT INTO comment(userName,lecture_id,comment) VALUES ('keith',1,'Welcome to COMPS 380F!');

INSERT INTO poll(question,chooseoption1,chooseoption2,chooseoption3,chooseoption4) VALUES ('Which date do you prefer for the mid-term test?','1st April','2nd April','3rd April','4th April');
INSERT INTO pollchooseoption(poll_id,userName,chooseoption) VALUES (1,'andrewlui','2nd April');
