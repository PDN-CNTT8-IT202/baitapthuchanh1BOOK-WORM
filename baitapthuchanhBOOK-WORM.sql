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
('Agatha Christie', 1890, 'UK'),
('J.K. Rowling', 1965, 'UK');

INSERT INTO books (book_name, category, author_id, price, publish_year)
VALUES('Cho toi xin mot ve di tuoi tho', 'Novel', 1, 50000, 2008),
('Mat biec', 'Van hoc', 1, 60000, 2010),
('Toi thay hoa vang tren co xanh', 'Van hoc', 1, 55000, 2011),
('Murder on the Orient Express', 'Trinh tham', 2, 80000, 1934),
('And Then There Were None', 'Trinh tham', 2, 75000, 1939),
('How to Win Friends and Influence People', 'Ky nang', 3, 90000, 1936),
('Stop Worrying and Start Living', 'Ky nang', 3, 85000, 1948),
('Tu duy nhanh va cham', 'Ky nang', 3, 95000, 2011);

INSERT INTO customers (full_name, email, phone)
VALUES('Nguyen Van A', 'a@gmail.com', '0123456789'),
('Test Trung Email', 'a@gmail.com', '0999999999'),
('Tran Thi B', 'b@gmail.com', '0987654321');

-- Giai thich:
-- Truong email trong customer duoc thiet lap rang buoc unipue. Vi vay, khi co gang chen 1 ban ghi cs email đa ton tai ('a@gmail.com').
-- Thi he quan tri CSDL se tu choi va bao loi Duplicate entry.
-- Dieu nay dam bao du lieu ko bi trug lap va giu tinh toan ven.




