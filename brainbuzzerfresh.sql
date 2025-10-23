-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS brain1;

-- Use the created database
USE brain1;

-- Create the Questions Table
CREATE TABLE IF NOT EXISTS Questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(50) NOT NULL,
    level ENUM('Easy', 'Medium', 'Hard') NOT NULL,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL CHECK (correct_option IN ('A', 'B', 'C', 'D'))
);

-- Insert data into the Questions table
INSERT INTO Questions (genre, level, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('Human Anatomy', 'Easy', 'What is the powerhouse of the cell?', 'Nucleus', 'Mitochondria', 'Ribosome', 'Golgi Apparatus', 'B'),
('Human Anatomy', 'Easy', 'How many bones are in the adult human body?', '206', '208', '210', '212', 'A'),
('Human Anatomy', 'Easy', 'Which organ pumps blood?', 'Brain', 'Lungs', 'Heart', 'Liver', 'C'),
('Human Anatomy', 'Easy', 'Which system controls body movements?', 'Digestive', 'Nervous', 'Respiratory', 'Circulatory', 'B'),
('Human Anatomy', 'Easy', 'Which organ is responsible for filtering blood?', 'Heart', 'Kidneys', 'Liver', 'Lungs', 'B'),
('Human Anatomy', 'Medium', 'Which blood type is the universal donor?', 'A', 'B', 'O', 'AB', 'C'),
('Human Anatomy', 'Medium', 'What is the largest organ in the human body?', 'Liver', 'Skin', 'Heart', 'Brain', 'B'),
('Human Anatomy', 'Medium', 'Where are red blood cells produced?', 'Lungs', 'Heart', 'Bone Marrow', 'Liver', 'C'),
('Human Anatomy', 'Medium', 'What is the function of hemoglobin?', 'Store fat', 'Carry oxygen', 'Digest proteins', 'Produce hormones', 'B'),
('Human Anatomy', 'Medium', 'Which part of the brain controls vision?', 'Cerebrum', 'Cerebellum', 'Occipital Lobe', 'Medulla', 'C'),
('Human Anatomy', 'Hard', 'Which part of the brain controls balance?', 'Cerebrum', 'Cerebellum', 'Medulla', 'Hypothalamus', 'B'),
('Human Anatomy', 'Hard', 'What is the smallest bone in the human body?', 'Femur', 'Stapes', 'Radius', 'Ulna', 'B'),
('Human Anatomy', 'Hard', 'Which hormone regulates blood sugar?', 'Insulin', 'Adrenaline', 'Cortisol', 'Estrogen', 'A'),
('Human Anatomy', 'Hard', 'What is the function of the lymphatic system?', 'Digest food', 'Transport oxygen', 'Fight infections', 'Store energy', 'C'),
('Human Anatomy', 'Hard', 'Which organ produces insulin?', 'Liver', 'Pancreas', 'Kidneys', 'Gallbladder', 'B');

INSERT INTO Questions (genre, level, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('Math Magic', 'Easy', 'What is 15 + 20?', '30', '35', '40', '25', 'B'),
('Math Magic', 'Easy', 'What is the square root of 64?', '6', '7', '8', '9', 'C'),
('Math Magic', 'Easy', 'Which number is a prime number?', '10', '15', '17', '21', 'C'),
('Math Magic', 'Easy', 'What is 5 multiplied by 6?', '30', '25', '35', '40', 'A'),
('Math Magic', 'Easy', 'What is 100 divided by 4?', '20', '25', '30', '40', 'B'),
('Math Magic', 'Medium', 'What is 25% of 200?', '50', '25', '75', '100', 'A'),
('Math Magic', 'Medium', 'Solve: 3x = 18. Find x.', '3', '6', '9', '12', 'B'),
('Math Magic', 'Medium', 'What is 9 squared?', '72', '81', '90', '99', 'B'),
('Math Magic', 'Medium', 'What is the value of π (pi) approximately?', '2.14', '3.14', '4.14', '5.14', 'B'),
('Math Magic', 'Medium', 'What is the result of 2³?', '4', '6', '8', '9', 'C'),
('Math Magic', 'Hard', 'What is the value of 3⁴?', '27', '81', '64', '49', 'B'),
('Math Magic', 'Hard', 'What is the square root of 144?', '10', '11', '12', '13', 'C'),
('Math Magic', 'Hard', 'If x² = 49, what is x?', '5', '6', '7', '8', 'C'),
('Math Magic', 'Hard', 'Solve: 2x + 5 = 15. Find x.', '2', '5', '7', '10', 'B'),
('Math Magic', 'Hard', 'Find the sum of angles in a triangle.', '90°', '120°', '180°', '360°', 'C'),
('Math Magic', 'Hard', 'What is log(100) to base 10?', '0', '1', '2', '10', 'C'),
('Math Magic', 'Hard', 'What is the factorial of 5?', '60', '100', '120', '150', 'C'),
('Math Magic', 'Hard', 'What is 8% of 200?', '12', '14', '16', '18', 'C'),
('Math Magic', 'Hard', 'If a² + b² = c², what theorem is this?', 'Euler’s Theorem', 'Fermat’s Theorem', 'Pythagorean Theorem', 'Pascal’s Theorem', 'C'),
('Math Magic', 'Hard', 'What is 1+2+3+...+10?', '50', '55', '60', '65', 'B');

INSERT INTO Questions (genre, level, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('Around the World', 'Easy', 'Which is the largest continent?', 'Europe', 'Asia', 'Africa', 'Australia', 'B'),
('Around the World', 'Easy', 'What is the capital of France?', 'Berlin', 'Madrid', 'Paris', 'Rome', 'C'),
('Around the World', 'Easy', 'Which country is known as the Land of the Rising Sun?', 'China', 'Japan', 'Korea', 'Vietnam', 'B'),
('Around the World', 'Easy', 'Which river is the longest in the world?', 'Amazon', 'Nile', 'Yangtze', 'Mississippi', 'B'),
('Around the World', 'Easy', 'What is the currency of the USA?', 'Euro', 'Dollar', 'Pound', 'Yen', 'B'),
('Around the World', 'Medium', 'Which desert is the largest in the world?', 'Sahara', 'Gobi', 'Kalahari', 'Atacama', 'A'),
('Around the World', 'Medium', 'Mount Everest is located in which country?', 'Nepal', 'India', 'China', 'Pakistan', 'A'),
('Around the World', 'Medium', 'Which ocean is the largest?', 'Atlantic', 'Indian', 'Pacific', 'Arctic', 'C'),
('Around the World', 'Medium', 'Which country has the most time zones?', 'USA', 'Russia', 'France', 'China', 'C'),
('Around the World', 'Medium', 'Which country has the Great Wall?', 'India', 'Japan', 'China', 'Mongolia', 'C'),
('Around the World', 'Hard', 'Which country has the most spoken languages?', 'India', 'China', 'USA', 'Papua New Guinea', 'D'),
('Around the World', 'Hard', 'Which city has the Colosseum?', 'Athens', 'Rome', 'Paris', 'Cairo', 'B'),
('Around the World', 'Hard', 'Which country has the most islands?', 'Indonesia', 'Sweden', 'Canada', 'Philippines', 'B'),
('Around the World', 'Hard', 'Which African country has pyramids?', 'Egypt', 'Sudan', 'Libya', 'Morocco', 'A'),
('Around the World', 'Hard', 'Which country is known for its fjords?', 'Norway', 'Denmark', 'Sweden', 'Finland', 'A'),
('Around the World', 'Hard', 'Which is the most populated city in the world?', 'New York', 'Tokyo', 'Shanghai', 'Delhi', 'B'),
('Around the World', 'Hard', 'Which country is home to Machu Picchu?', 'Brazil', 'Peru', 'Argentina', 'Chile', 'B'),
('Around the World', 'Hard', 'What is the smallest country in the world?', 'Monaco', 'San Marino', 'Vatican City', 'Liechtenstein', 'C'),
('Around the World', 'Hard', 'What is the national animal of Australia?', 'Kangaroo', 'Koala', 'Emu', 'Dingo', 'A'),
('Around the World', 'Hard', 'Which city is known as the Big Apple?', 'Los Angeles', 'New York', 'Chicago', 'San Francisco', 'B');

INSERT INTO Questions (genre, level, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('Food Feast', 'Easy', 'What is the main ingredient in guacamole?', 'Avocado', 'Tomato', 'Onion', 'Pepper', 'A'),
('Food Feast', 'Easy', 'Which fruit is known as the king of fruits?', 'Apple', 'Banana', 'Mango', 'Pineapple', 'C'),
('Food Feast', 'Easy', 'Which drink is made from fermented grapes?', 'Beer', 'Whiskey', 'Wine', 'Vodka', 'C'),
('Food Feast', 'Easy', 'What is the main ingredient in hummus?', 'Chickpeas', 'Lentils', 'Beans', 'Corn', 'A'),
('Food Feast', 'Easy', 'Which country is famous for sushi?', 'China', 'Japan', 'Thailand', 'Korea', 'B'),
('Food Feast', 'Medium', 'What is the most consumed beverage in the world?', 'Tea', 'Coffee', 'Soda', 'Juice', 'A'),
('Food Feast', 'Medium', 'What is the main ingredient in traditional pasta?', 'Rice', 'Wheat', 'Corn', 'Oats', 'B'),
('Food Feast', 'Medium', 'Which country is famous for tacos?', 'Spain', 'Mexico', 'Italy', 'Argentina', 'B'),
('Food Feast', 'Medium', 'What is the main ingredient in miso soup?', 'Rice', 'Soybeans', 'Wheat', 'Seaweed', 'B'),
('Food Feast', 'Medium', 'Which nut is used to make peanut butter?', 'Almond', 'Cashew', 'Peanut', 'Walnut', 'C'),
('Food Feast', 'Hard', 'What is the hottest chili pepper in the world?', 'Ghost Pepper', 'Carolina Reaper', 'Habanero', 'Jalapeño', 'B'),
('Food Feast', 'Hard', 'Which cheese is traditionally used in pizza?', 'Cheddar', 'Mozzarella', 'Parmesan', 'Gorgonzola', 'B'),
('Food Feast', 'Hard', 'Which country is famous for croissants?', 'Italy', 'France', 'Germany', 'Belgium', 'B'),
('Food Feast', 'Hard', 'What is the main ingredient in traditional kimchi?', 'Carrot', 'Cabbage', 'Radish', 'Spinach', 'B'),
('Food Feast', 'Hard', 'What type of food is a falafel?', 'Meat', 'Vegetable', 'Fried Chickpeas', 'Rice Dish', 'C'),
('Food Feast', 'Hard', 'What is the most expensive spice in the world?', 'Vanilla', 'Cinnamon', 'Saffron', 'Nutmeg', 'C'),
('Food Feast', 'Hard', 'What is the main ingredient in pesto sauce?', 'Tomato', 'Basil', 'Parsley', 'Oregano', 'B'),
('Food Feast', 'Hard', 'What is the most consumed meat worldwide?', 'Beef', 'Pork', 'Chicken', 'Fish', 'B'),
('Food Feast', 'Hard', 'What is tofu made from?', 'Soybeans', 'Rice', 'Corn', 'Wheat', 'A'),
('Food Feast', 'Hard', 'Which fruit has the highest water content?', 'Apple', 'Watermelon', 'Orange', 'Strawberry', 'B');

INSERT INTO Questions (genre, level, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('Movie Fest', 'Easy', 'Who played Iron Man in the Marvel movies?', 'Chris Evans', 'Robert Downey Jr.', 'Chris Hemsworth', 'Tom Holland', 'B'),
('Movie Fest', 'Easy', 'Which movie features the song "Let It Go"?', 'Frozen', 'Tangled', 'Moana', 'Brave', 'A'),
('Movie Fest', 'Easy', 'Which movie won the first-ever Oscar for Best Picture?', 'Casablanca', 'Wings', 'Gone with the Wind', 'Citizen Kane', 'B'),
('Movie Fest', 'Easy', 'Who is the main villain in "The Dark Knight"?', 'Bane', 'Joker', 'Scarecrow', 'Penguin', 'B'),
('Movie Fest', 'Easy', 'Which actor played Jack in Titanic?', 'Brad Pitt', 'Leonardo DiCaprio', 'Tom Cruise', 'Johnny Depp', 'B'),
('Movie Fest', 'Medium', 'What is the highest-grossing film of all time?', 'Avatar', 'Avengers: Endgame', 'Titanic', 'Star Wars', 'A'),
('Movie Fest', 'Medium', 'Which movie franchise features "The Boy Who Lived"?', 'Lord of the Rings', 'Harry Potter', 'Narnia', 'Percy Jackson', 'B'),
('Movie Fest', 'Medium', 'Which movie is based on the novel by J.R.R. Tolkien?', 'Harry Potter', 'Narnia', 'The Lord of the Rings', 'Eragon', 'C'),
('Movie Fest', 'Medium', 'Who directed "Inception"?', 'Steven Spielberg', 'James Cameron', 'Christopher Nolan', 'Quentin Tarantino', 'C'),
('Movie Fest', 'Medium', 'Which film features a ring that must be destroyed?', 'Harry Potter', 'The Lord of the Rings', 'Narnia', 'Eragon', 'B');

INSERT INTO Questions (genre, level, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('Game On', 'Easy', 'Which company created the PlayStation?', 'Microsoft', 'Sony', 'Nintendo', 'Sega', 'B'),
('Game On', 'Easy', 'Which game features the character Mario?', 'Zelda', 'Sonic', 'Super Mario', 'Donkey Kong', 'C'),
('Game On', 'Easy', 'Which game features the phrase "The cake is a lie"?', 'Portal', 'Half-Life', 'Bioshock', 'Doom', 'A'),
('Game On', 'Easy', 'What is the best-selling video game of all time?', 'Minecraft', 'GTA V', 'Tetris', 'Fortnite', 'A'),
('Game On', 'Easy', 'Which game features a battle royale mode?', 'GTA V', 'Fortnite', 'Need for Speed', 'The Sims', 'B'),
('Game On', 'Medium', 'Which game series is known for its hidden blade weapons?', 'Assassin’s Creed', 'Dark Souls', 'Hitman', 'Far Cry', 'A'),
('Game On', 'Medium', 'Which company developed Halo?', 'EA', 'Activision', 'Microsoft', 'Bungie', 'D'),
('Game On', 'Medium', 'What is the name of the main character in The Witcher series?', 'Geralt', 'Ezio', 'Kratos', 'Arthur', 'A'),
('Game On', 'Medium', 'Which game has the map called "Erangel"?', 'PUBG', 'Call of Duty', 'Fortnite', 'Apex Legends', 'A'),
('Game On', 'Medium', 'Which is a MOBA game?', 'Minecraft', 'Dota 2', 'Skyrim', 'Fallout', 'B'),
('Game On', 'Hard', 'Which game introduced the "Creeper" enemy?', 'Fortnite', 'Minecraft', 'Doom', 'Half-Life', 'B'),
('Game On', 'Hard', 'Which game developer created The Elder Scrolls?', 'Ubisoft', 'Bethesda', 'Rockstar', 'CD Projekt', 'B'),
('Game On', 'Hard', 'What is the rarest material in Minecraft?', 'Diamond', 'Emerald', 'Netherite', 'Obsidian', 'C'),
('Game On', 'Hard', 'Which game is set in the city of Los Santos?', 'Watch Dogs', 'Cyberpunk 2077', 'GTA V', 'Sleeping Dogs', 'C'),
('Game On', 'Hard', 'Which game franchise features Master Chief?', 'Call of Duty', 'Halo', 'Gears of War', 'Destiny', 'B'),
('Game On', 'Hard', 'What does MMORPG stand for?', 'Massive Multiplayer Online Role-Playing Game', 'Modern Military Online Role-Playing Game', 'Multi-Media Online Racing Platform', 'Massive Mecha Online Robot Play', 'A'),
('Game On', 'Hard', 'Which game features a character named Link?', 'Final Fantasy', 'The Legend of Zelda', 'Elder Scrolls', 'Fire Emblem', 'B'),
('Game On', 'Hard', 'What is the name of the AI in Halo?', 'Siri', 'Alexa', 'Cortana', 'Friday', 'C'),
('Game On', 'Hard', 'Which game first introduced a battle royale mode?', 'PUBG', 'Fortnite', 'H1Z1', 'Apex Legends', 'C'),
('Game On', 'Hard', 'Which game series features a Vault-Tec corporation?', 'Half-Life', 'Metro', 'Fallout', 'Bioshock', 'C');

INSERT INTO Questions (genre, level, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('Movie Fest', 'Medium', 'Which director is known for making "The Dark Knight" trilogy?', 'Steven Spielberg', 'Christopher Nolan', 'James Cameron', 'Quentin Tarantino', 'B'),
('Movie Fest', 'Medium', 'Which movie features the iconic line, "May the Force be with you"?', 'Star Trek', 'Guardians of the Galaxy', 'Star Wars', 'Dune', 'C'),
('Movie Fest', 'Medium', 'Which actor plays Deadpool?', 'Chris Pratt', 'Ryan Reynolds', 'Hugh Jackman', 'Chris Hemsworth', 'B'),
('Movie Fest', 'Medium', 'Which animated movie features a robot named WALL-E?', 'Big Hero 6', 'Inside Out', 'WALL-E', 'Up', 'C'),
('Movie Fest', 'Medium', 'Which movie is about a clown that haunts children in Derry?', 'A Nightmare on Elm Street', 'IT', 'Halloween', 'The Conjuring', 'B'),
('Movie Fest', 'Hard', 'Which movie won the Best Picture Oscar in 2020?', 'Joker', 'Parasite', '1917', 'Once Upon a Time in Hollywood', 'B'),
('Movie Fest', 'Hard', 'What is the name of the AI system in the Terminator movies?', 'Ultron', 'Jarvis', 'Skynet', 'HAL 9000', 'C'),
('Movie Fest', 'Hard', 'Which movie features the quote, "You talking to me?"', 'Goodfellas', 'Taxi Driver', 'Scarface', 'The Godfather', 'B'),
('Movie Fest', 'Hard', 'Which director is known for mind-bending films like "Inception" and "Tenet"?', 'Martin Scorsese', 'Christopher Nolan', 'Quentin Tarantino', 'Denis Villeneuve', 'B'),
('Movie Fest', 'Hard', 'Which horror movie villain wears a white mask and wields a knife?', 'Freddy Krueger', 'Jason Voorhees', 'Michael Myers', 'Ghostface', 'C');
