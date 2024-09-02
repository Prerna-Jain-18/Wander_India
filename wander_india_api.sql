CREATE database wander_india_db;

USE wander_india_db;

CREATE TABLE IF NOT EXISTS top_destinations (
    place_id INT AUTO_INCREMENT PRIMARY KEY,
    destination_name VARCHAR(255) UNIQUE NOT NULL,
    image_url varchar(255),
    description TEXT
);


-- Create the States table
CREATE TABLE States (
    state_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    best_time_to_visit VARCHAR(255),
    image_url VARCHAR(255)
);

-- Create the TouristPlaces table
CREATE TABLE TouristPlaces (
    id INT AUTO_INCREMENT PRIMARY KEY,
    state_id INT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    category VARCHAR(50),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    image_url VARCHAR(255),
    FOREIGN KEY (state_id) REFERENCES States(id) ON DELETE CASCADE
);

-- Create the FoodRecommendations table
CREATE TABLE FoodRecommendations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    state_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    FOREIGN KEY (state_id) REFERENCES States(id) ON DELETE CASCADE
);

-- Create the Festivals table
CREATE TABLE Festivals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    state_id INT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    date DATE,
    image_url VARCHAR(255),
    FOREIGN KEY (state_id) REFERENCES States(id) ON DELETE CASCADE
);

INSERT INTO States (name, description, best_time_to_visit,image_url)
VALUES 
('Tamil Nadu', 'A southern state known for its Dravidian-style Hindu temples, beaches, and cuisine.', 'November to February','https://upload.wikimedia.org/wikipedia/commons/1/13/Chennai_Montage.jpg'),
('Rajasthan', 'A northern state known for its royal palaces, desert landscapes, and vibrant culture.', 'October to March', 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Jaisalmer_Fort_view_from_Gadsisar_lake.jpg'),
('Andhra Pradesh', 'A southeastern state with a rich history, famous for its Tirupati temple and coastal beauty.', 'October to February','https://upload.wikimedia.org/wikipedia/commons/2/27/Tirupati_temple1.jpg'),
('Karnataka', 'A southwestern state known for its software industry, historical sites, and lush landscapes.', 'November to April','https://upload.wikimedia.org/wikipedia/commons/a/a0/Mysore_Palace_in_Mysore.jpg'),
('Maharashtra', 'A western state home to the Bollywood industry, famous for its diverse culture and historical sites.', 'October to March','https://upload.wikimedia.org/wikipedia/commons/8/8f/Gateway_of_India%2C_Mumbai%2C_India.jpg');


CREATE TABLE contact_queries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    place VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO top_destinations (destination_name, image_url, description) VALUES

('Kashmir', 'https://w0.peakpx.com/wallpaper/131/697/HD-wallpaper-chumathang-mountains-river-jammu-and-kashmir-india.jpg',
'Popularly known as the “Paradise on Earth”, Kashmir is a breathtaking region in Northwestern India.
Jammu & Kashmir was declared as a Union T Territory in 2019.'),


('Ladakh','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNRRc6WowzfBCZFk7LIxv7jrxnm4GGAk6RUw&s',
'Ladakh, located in the northernmost region of
India, is a high-altitude desert renowned for
its breathtaking landscapes, serene
monasteries, and unique cultural heritage.
Formerly falling in the state of Jammu &
Kashmir, Ladakh was administered a union
territory on 31st October 2019. Extending
from the Siachen Glacier to the main Great
Himalayas, Ladakh is a land like no other.
Ladakh is known as the world\'s coldest
desert.'),


('Andaman','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiJGLpv3gxXXN3a_3ryn_qm-NQ7aPyCG_BCw&s',
'Replete with turquoise blue water beaches and a bit of history,
Andaman & Nicobar Islands is a little slice of paradise tucked around 1,400 km away
from the east coast of mainland India.
Port Blair, the capital of this union territory, has a major airport and seaport
connected with the rest of the country and various tourist islands via multiple daily ferries.'),

('Manali','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSByEdeT0xnk6tTeZWyhZJ1drV_miOa6fxr-Q&s',
'With spectacular valleys, breathtaking views, snow capped mountains, and lush forests of oak, deodar,
 and pine, Manali is a magical hill station at the northern end of Kullu valley in Himachal Pradesh.'),
 
('Agra','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsqL_Yup4o9ANBKhE3H8GO1zQdZ5gtPIUk4w&s',
'Located on the banks of River Yamuna in Uttar Pradesh, Agra is a popular tourist destination as it is
home to one of the wonders of the world, the Taj Mahal. It is a sneak peek into the architectural history
and legacy of the Mughal empire.'),

('Alleppey','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMuYNHOt6ykhjpE0pj0HZmlU0RHy4NDhtj6g&s',
'Officially called Alappuzha, Alleppey is known for its network of canals and lagoons with beautiful backwaters
 and the houseboats offering overnight stays. Located in the southern part of Kerala, the coastline of Alleppey
 offers some of the best beaches with water sports.'),
 
 ('Shillong','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-dz2xQMw93wEB1lnqnIkVdUxmTVT87VUWuw&s',
 'Nestled amidst the pine-clad hills, Shillong, the capital of Meghalaya, unfolds like a picturesque canvas at
 an elevation of 1496 meters. Revered as the ‘Scotland of the East’, the city offers a delightful blend of
 captivating landscapes, pleasant weather, and rich traditions.'),
 
 ('Gulmarg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeue9nXWgVUTgrLH2SEdnxREC5074I_SqFrQ&s',
 'Situated at an altitude of 2730 m above sea level. Gulmarg is a popular skiing destination located in Pir Panjal Range
 of Union territory of Jammu and Kashmir. Surrounded by snow- covered lofty Himalayas, meadows of flowers,
 deep ravines, evergreen forested valleys.'),
 
 ('Mysore', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz38GgjoDC2mKIag8XRlOrsdawNySxnavRKQ&s',
 'Known as the "City of Palaces," Mysore in Karnataka is famous for its royal heritage and magnificent monuments. The Mysore Palace, Chamundi Hill, and the lively Dussehra festival are the highlights of this cultural city.'),


('Kanyakumari', 'https://t4.ftcdn.net/jpg/03/30/78/83/360_F_330788364_t1Bn2bQC1J6QKEkzwY9B9s8gkDgfxnSh.jpg',
 'Situated at the southernmost tip of India, Kanyakumari in Tamil Nadu is where the Indian Ocean, Arabian Sea, and Bay of Bengal meet. The town is known for its stunning sunrises and sunsets, the Vivekananda Rock Memorial, and the iconic Thiruvalluvar Statue.');

