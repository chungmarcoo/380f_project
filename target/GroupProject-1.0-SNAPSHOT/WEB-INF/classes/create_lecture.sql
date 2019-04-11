CREATE TABLE lecture (
    lectureId int,
    lectureName VARCHAR(50) NOT NULL,
    PRIMARY KEY (lectureId),
    foreign key(lectureName) references users(username)
);

create table attachments(
    attachmentId int,
    attachmentName varchar(50) not null,
    attachmentContent blob not null,
    lectureId int,
    primary key(attachmentId),
    foreign key(lectureId) references lecture(lectureId)
);

create table poll(
    pollId int,
    lectureId int,
    primary key(pollId),
    foreign key(lectureId) references lecture(lectureId)
);
    
create table comments(
    commentId int,
    cName varchar(50) not null,
    content varchar(255) not null,
    lectureId int,
    primary key(commentId),
    foreign key(lectureId) references lecture(lectureId)
);

