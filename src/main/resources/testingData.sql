INSERT INTO lecture(name,subject) VALUES ('Week 1: Overview, HTML5, CSS, JavaScript','Overview of Web Applications');
INSERT INTO lecture(name,subject) VALUES ('Week 2: Servlet, XML, JSON','Servlet');
INSERT INTO lecture(name,subject) VALUES ('Week 3: JSP, JavaBean','JSP, JavaBean');
INSERT INTO lecture(name,subject) VALUES ('Week 4: Session','Session');

INSERT INTO users VALUES ('keith', 'keithpw');
INSERT INTO user_roles(userName, role) VALUES ('keith', 'ROLE_STUDENT');
INSERT INTO user_roles(userName, role) VALUES ('keith', 'ROLE_LECTURER');

INSERT INTO users VALUES ('tsli', 'tslipw');
INSERT INTO user_roles(userName, role) VALUES ('tsli', 'ROLE_LECTURER');

INSERT INTO users VALUES ('kevin', 'kevinpw');
INSERT INTO user_roles(userName, role) VALUES ('kevin', 'ROLE_STUDENT');

INSERT INTO users VALUES ('oliver', 'oliverpw');
INSERT INTO user_roles(userName, role) VALUES ('oliver', 'ROLE_STUDENT');


INSERT INTO comment(userName,lecture_id,comment) VALUES ('keith',1,'Welcome to my class!');

INSERT INTO poll(question,chooseoption1,chooseoption2,chooseoption3,chooseoption4) VALUES ('What date do you prefer for the midterm test?','1st Apr,2019','2nd Apr,2019','3rd Apr,2019','4th Apr,2019');
INSERT INTO pollchooseoption(poll_id,userName,chooseoption) VALUES (1,'oliver','2nd Apr,2019');
