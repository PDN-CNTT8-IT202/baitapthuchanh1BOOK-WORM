CREATE DATABASE BookWorm;
USE BookWorm;

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    author_id INT,
    price DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (price >= 0),
    publish_year INT,

    CONSTRAINT fk_books_authors
        FOREIGN KEY (author_id) 
        REFERENCES authors(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    registration_date DATE 
);

INSERT INTO authors (full_name, birth_year, nationality)
VALUES ('Nguyen Nhat Anh', 1955, 'Vietnam'),
('J.K. Rowling', 1965, 'UK');

INSERT INTO books (book_name, category, author_id, price, publish_year)
VALUES('Cho toi xin mot ve di tuoi tho', 'Novel', 1, 50000, 2008),
('Harry Potter', 'Fantasy', 2, 120000, 1997);

INSERT INTO customers (full_name, email, phone)
VALUES('Nguyen Van A', 'a@gmail.com', '0123456789'),
('Tran Thi B', 'b@gmail.com', '0987654321');


