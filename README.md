
# Wander India API

Welcome to the **Wander India API** project! This project aims to provide an interactive platform showcasing India's diverse culture, tourist attractions, culinary delights, and festivals. The website serves as a gateway for exploring the various states of India, with detailed information on each state's tourism highlights.

## Project Structure

```bash
wander_india_api/
├── app/
│   ├── static/
│   │   ├── assets/
│   │   ├── css/
│   │   ├── js/
│   ├── templates/
│   │   ├── base.html
│   │   ├── index.html
│   │   └── states.html
│   ├── __init__.py
│   ├── config.py
│   ├── db_connection.py
│   ├── models.py
│   ├── routes.py
├── run.py
├── output/
├── .venv/
├── requirements.txt
├── README.md
└── wander_india_api.sql
  
```

## Features

- **State-wise Information**: Detailed descriptions of Indian states, including best time to visit, tourist attractions, culinary delights, and festivals.
- **Interactive UI**: A user-friendly interface with creative sections for each state's tourism and cultural highlights.
- **Database-Driven Content**: All information is fetched from a MySQL database using raw SQL queries.
- **API Endpoints**: RESTful API endpoints to fetch state information and popular places across India.

## Installation

## Prerequisites

Before running the project, make sure you have the following installed:

- **Python 3.x**: The programming language used for the backend.
- **MySQL Database**: To store and manage the data.
- **Git**: For version control.
- **Flask**: Web framework for Python. Install using `pip install flask`.
- **Postman**: For testing API endpoints.


### Installation Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/wander_india_api.git
   cd wander_india_api
   ```

2. **Set up the virtual environment:**

   ```bash
   python -m venv .venv
   ```

3. **Activate the virtual environment:**

   - **On Windows:**

     ```bash
     .venv\Scripts\activate
     ```

   - **On macOS/Linux:**

     ```bash
     source .venv/bin/activate
     ```

4. **Install the required packages:**

   ```bash
   pip install -r requirements.txt
   ```

5. **Set up the database:**

   - Import the database schema and initial data using the provided SQL file:

     ```bash
     mysql -u your-username -p your-database-name < wander_india_api.sql
     ```

   Replace `your-username` with your MySQL username and `your-database-name` with the name of your database.

6. **Run the application:**

   ```bash
   python run.py
   ```

   The application will be available at `http://127.0.0.1:5000`.

## Database Schema

The project uses a MySQL database with the following tables:

- **States**: Stores information about each state.
- **TouristPlaces**: Stores information about popular tourist places.
- **FoodRecommendations**: Stores culinary recommendations for each state.
- **Festivals**: Stores information about festivals in each state.

## API Endpoints

- **`/api/state/<int:state_id>`**: Fetch information about a specific state.
- **`/api/popular_places`**: Fetch information about popular places across India.
- **`/api/contact` [POST]**: Submit a contact form. Expects a JSON payload with the following fields:
  - `name`: Name of the person submitting the form.
  - `email`: Email address of the person submitting the form.
  - `subject`: Subject of the query.
  - `message`: Message content.


## Usage

### Home Page
The home page features an overview of India’s tourism highlights, including popular places and a state-wise dropdown menu. Users can navigate to individual state pages for more detailed information.

### State Information Pages

Each state page includes:
- **Masthead**: Overview of the state with a background image and description.
- **Tourist Attractions**: A carousel of tourist places.
- **Culinary Delights**: Information on the state's cuisine.
- **Festivals**: A creative section showcasing festivals.
- **ContactForm**: Stores information submitted via the contact form.
  
### Contact Form
Users can submit their queries via the contact form available on the home page. The form submission is handled via a POST request to the `/api/contact` endpoint, which stores the information in the `ContactForm` table in the database.

## Screenshots

### Home Page
![Home Page](https://github.com/Prerna-Jain-18/Wander_India/blob/main/output/home_page.JPG)

### State Page
![State Page](https://github.com/Prerna-Jain-18/Wander_India/blob/main/output/state_page.JPG)

### Tourist Attractions
![Tourist Attractions](https://github.com/Prerna-Jain-18/Wander_India/blob/main/output/top_destinations_state.JPG)

### Culinary Delights
![Culinary Delights](https://github.com/Prerna-Jain-18/Wander_India/blob/main/output/culinary_delights.JPG)

### Festivals
![Festivals](https://github.com/Prerna-Jain-18/Wander_India/blob/main/output/festivals.JPG)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
