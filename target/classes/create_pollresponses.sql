CREATE TABLE pollchooseoption(
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    poll_id INTEGER NOT NULL,
    userName VARCHAR(50) NOT NULL,
    chooseoption VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
    --FOREIGN KEY poll_id REFERENCES poll(poll_id),
    --FOREIGN KEY userName REFERENCES users(userName)
);
