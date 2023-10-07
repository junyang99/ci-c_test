from flask import Flask, render_template, request, redirect, url_for, flash
import re
import mysql.connector

# Database connection details
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'hr portal'
}

# Create a connection to the database
try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
except mysql.connector.Error as err:
    print(f"Error: {err}")
    conn.close()

# Execute a SELECT statement to retrieve data from the 'email' column
cursor.execute("SELECT Staff_ID FROM staff")

# Fetch all rows of data from the executed query
staff_ids = cursor.fetchall()
# print(staff_ids)

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Change this to a secret key for session management

def validate_name(name):
    if not re.match(r'^[A-Za-z\'\s-]+$', name):
        return False
    return True

def validate_email(email):
    if not re.match(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', email):
        return False
    return True

@app.route('/')
def index():
    # Prepopulate sample data
    sample_data = {
        'staff_id': '123',
        'staff_fname': 'John',
        'staff_lname': 'Doe',
        'department': 'HR',
        'email': 'johndoe@example.com',
    }
    
    return render_template('index.html', sample_data=sample_data)

@app.route('/submit', methods=['POST'])
def submit():
    staff_id = request.form.get('staff_id')
    staff_fname = request.form.get('staff_fname')
    staff_lname = request.form.get('staff_lname')
    department = request.form.get('department')
    email = request.form.get('email')
    cover_letter = request.form.get('cover_letter')
    
    if not all([staff_id, staff_fname, staff_lname, department, email, cover_letter]):
        flash("Please fill in all required fields.")
        return redirect(url_for('index'))
    
    if not validate_name(staff_fname):
        flash("Invalid First Name. Please enter a valid name.")
        return redirect(url_for('index'))
    
    if not validate_name(staff_lname):
        flash("Invalid Last Name. Please enter a valid name.")
        return redirect(url_for('index'))
    
    if not validate_email(email):
        flash("Invalid email address. Please enter a valid email.")
        return redirect(url_for('index'))
    
    # Insert data into the application table, including the cover letter field
    try:
        cursor.execute('''
            INSERT INTO application
            (Application_ID, Position_ID, Staff_ID, Application_Date, Cover_Letter, Application_Status)
            VALUES (1, 1, %s, NOW(), %s, 1)
        ''', (staff_id, cover_letter))
        conn.commit()

        flash("Thank you! Your application has been submitted.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        flash(f"Error: {err}")
        flash("An error occurred while submitting your application.")

    return redirect(url_for('index'))

    
if __name__ == "__main__":
    app.run(debug=True)


