CREATE TABLE item (
    itemId int,
    customerName VARCHAR(50) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    expectedPrice varchar(255) NOT NULL,
    status varchar(20) not null,
    noOfBids integer default 0,
    description varchar(255),
    winnerName varchar(50),
    winnerPrice varchar(50),
    PRIMARY KEY (itemId),
    foreign key(customerName) references users(username)
);

create table attachments(
    attachmentId int,
    attachmentName varchar(50) not null,
    attachmentContent blob not null,
    itemId int,
    primary key(attachmentId),
    foreign key(itemId) references item(itemId)
);

create table bidPrices(
    bidPriceId int,
    bidder varchar(50) not null,
    bidderPrice varchar(50) not null,
    itemId int,
    primary key(bidPriceId),
    foreign key(itemId) references item(itemId)
);
    
create table comments(
    commentId int,
    cName varchar(50) not null,
    content varchar(255) not null,
    itemId int,
    primary key(commentId),
    foreign key(itemId) references item(itemId)
);

