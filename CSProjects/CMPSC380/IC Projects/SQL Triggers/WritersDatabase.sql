CREATE TABLE Contemporaries (
    writer_id             INTEGER NOT NULL,
    contemporary_id    INTEGER NOT NULL,
    FOREIGN KEY (writer_id) REFERENCES Writers (id),
    FOREIGN KEY (contemporary_id) REFERENCES Writers (id)
);
CREATE TABLE Publication_Covers (
    work_id    INTEGER NOT NULL PRIMARY KEY,
    image        BLOB NOT NULL,
    FOREIGN KEY (work_id) REFERENCES Works (work_id)
);
CREATE TABLE Quotes (
    work_id    INTEGER NOT NULL,
    quote        CLOB NOT NULL,
    type        VARCHAR(9) NOT NULL,
    CHECK (type in ("excerpt", "full-text")),
    FOREIGN KEY (work_id) REFERENCES Works (work_id)
);
CREATE TABLE Works (
    work_id        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    author_id    INTEGER NOT NULL,
    title            VARCHAR(60) NOT NULL,
    publication_year NUMERIC(4, 0) NOT NULL,
    genre            VARCHAR(20) NOT NULL,
    form            VARCHAR(15) NOT NULL,
    CHECK (form in ("novel", "poetry", "drama",
        "short story")),
    FOREIGN KEY (author_id) REFERENCES Writers (id)
);
CREATE TABLE Writers (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    first_name    VARCHAR(15) NOT NULL,
    middle_name    VARCHAR(15),
    last_name    VARCHAR(15) NOT NULL,
    birth_date    VARCHAR(10) NOT NULL,
    death_date    VARCHAR(10),
    country_of_origin    VARCHAR(20) NOT NULL
);
CREATE TRIGGER reflexive_relationship AFTER INSERT ON Contemporaries
BEGIN
    INSERT INTO Contemporaries (writer_id, contemporary_id)
        VALUES (New.contemporary_id, New.writer_id);
END;	