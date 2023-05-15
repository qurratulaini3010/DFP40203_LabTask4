from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# Connect to the MySQL database
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="python"
)


# Define a function to calculate the estimated revenue
def calculate_revenue(ticket_price, capacity):
    return ticket_price * capacity


# Define a route for the home page
@app.route('/')
def home():
    return render_template('home.html')


# Define a route for the movie form
@app.route('/movie', methods=['POST'])
def movie():
    mycursor = mydb.cursor()

    # Get the user inputs from the form
    title = request.form['title']
    genre = request.form['genre']
    duration = request.form['duration']
    ticket_price = float(request.form['ticket_price'])
    review = request.form['review']
    production = request.form['production']
    hall = request.form['hall']
    capacity = int(request.form['capacity'])
    synopsis = request.form['synopsis']
    agree = request.form.get('agree')

    # Check if the user agreed to the terms and conditions
    if not agree:
        return render_template('error.html', message='Please agree to the terms and conditions')

    # Calculate the estimated revenue
    revenue = calculate_revenue(ticket_price, capacity)

    # Insert the movie information into the database
    sql = "INSERT INTO movie(title, genre, duration, ticket_price, review, production, hall, " \
          "capacity, sysnopsis, estimated_money) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    val = (title, genre, duration, ticket_price, review, production, hall, capacity, synopsis, revenue)
    mycursor.execute(sql, val)
    mydb.commit()

    # Redirect to the movie list page
    return redirect(url_for('movie_list'))


# Define a route for the movie list page
@app.route('/movies')
def movie_list():
    mycursor = mydb.cursor()

    # Retrieve the list of movies from the database
    mycursor.execute("SELECT * FROM movie")
    movies = mycursor.fetchall()

    # Render the movie list template with the list of movies
    return render_template('movie_list.html', movies=movies)


if __name__ == "__main__":
    app.run(debug=True)
