-- Задача 1
SELECT SUM(Amount) AS total_amount, Users.username
FROM Donations
LEFT JOIN Users ON Donations.user_id = Users.user_id
GROUP BY Donations.user_id
ORDER BY total_amount DESC
LIMIT 1;

-- Задача 2
SELECT SUM(Amount) AS total_amount, Users.username
FROM Donations
LEFT JOIN Users ON Donations.user_id = Users.user_id
GROUP BY Donations.stream_id
ORDER BY total_amount DESC
LIMIT 3;

--Задача 3
-- Создание таблицы Users
CREATE TABLE Users (
  user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  date_time DATETIME default CURRENT_TIMESTAMP,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
);

-- Создание таблицы Chats
CREATE TABLE Chats (
  chat_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id_1 INT,
  user_id_2 INT,
  date_created DATETIME default CURRENT_TIMESTAMP,
  chat_name VARCHAR(255) NOT NULL,
  FOREIGN KEY (user_id_1) REFERENCES Users(user_id),
  FOREIGN KEY (user_id_2) REFERENCES Users(user_id)
);

-- Создание таблицы Messages
CREATE TABLE Messages (
  message_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  chat_id INT,
  datetime DATETIME default CURRENT_TIMESTAMP,
  text VARCHAR(255) NOT NULL,
  reactions_count INT,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (chat_id) REFERENCES Chats(chat_id)
);

-- Создание таблицы Reactions
CREATE TABLE Reactions (
  reaction_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  message_id INT,
  reaction_type VARCHAR(255) NOT NULL,
  datetime DATETIME default CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (message_id) REFERENCES Messages(message_id)
);
