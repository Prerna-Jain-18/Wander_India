from flask import render_template, request, jsonify, redirect, url_for
from app import app
from app.config import Config
import mysql.connector

# Function to get a database connection
def get_db_connection():
    return mysql.connector.connect(
        host=Config.MYSQL_HOST,
        user=Config.MYSQL_USER,
        password=Config.MYSQL_PASSWORD,
        database=Config.MYSQL_DB
    )

@app.route('/')
def index():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT destination_name, image_url, description FROM top_destinations")
    destinations = cursor.fetchall()
    conn.close()

    message = request.args.get('message')

    return render_template('index.html', destinations=destinations)


@app.route('/api/state/<int:state_id>', methods=['GET'])
def state_info(state_id):
    try:
        connection = get_db_connection()
    except mysql.connector.Error as err:
        return jsonify({'error': f"Database connection failed: {err}"}), 500

    cursor = connection.cursor(dictionary=True)

    try:
        # Fetch state information
        cursor.execute("""
            SELECT name, description, best_time_to_visit, image
            FROM States 
            WHERE state_id = %s
        """, (state_id,))
        state_data = cursor.fetchone()

        # Fetch tourist places
        cursor.execute("""
            SELECT name, description, image_url
            FROM TouristPlaces
            WHERE state_id = %s
        """, (state_id,))
        tourist_places = cursor.fetchall()

        # Fetch food recommendations
        cursor.execute("""
            SELECT name, description, image_url
            FROM FoodRecommendations
            WHERE state_id = %s
        """, (state_id,))
        food_recommendations = cursor.fetchall()

        # Fetch festivals
        cursor.execute("""
            SELECT name, description, image_url
            FROM Festivals
            WHERE state_id = %s
        """, (state_id,))
        festivals = cursor.fetchall()

    except mysql.connector.Error as err:
        return jsonify({'error': f"Failed to fetch data: {err}"}), 500
    finally:
        cursor.close()
        connection.close()

    if state_data:
        if request.headers.get('Accept') == 'application/json':
            # Return JSON if explicitly requested
            return jsonify({
                'state_data': state_data,
                'tourist_places': tourist_places,
                'food_recommendations': food_recommendations,
                'festivals': festivals
            })
        else:
            # Render the HTML template with the data
            return render_template('states.html',
                                   state_data=state_data,
                                   tourist_places=tourist_places,
                                   food_recommendations=food_recommendations,
                                   festivals=festivals)
    else:
        return jsonify({'error': 'State not found'}), 404


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        try:
            # Your form data handling
            name = request.form.get('name')
            email = request.form.get('email')
            phone = request.form.get('phone')
            place = request.form.get('place')
            start_date = request.form.get('startDate')
            end_date = request.form.get('endDate')

            # Insert data into the database
            connection = get_db_connection()
            cursor = connection.cursor()
            query = """
                INSERT INTO contact_queries (name, email, phone, place, start_date, end_date)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query, (name, email, phone, place, start_date, end_date))
            connection.commit()
            cursor.close()
            connection.close()

            return jsonify({'message': 'Thank you for reaching out. We will contact you soon.'})

        except Exception as e:
            # Return JSON response with error message
            return jsonify({'message': f'An error occurred: {e}'}), 500
