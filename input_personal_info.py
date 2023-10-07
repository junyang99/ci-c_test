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
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    staff_id = request.form.get('staff_id')
    staff_fname = request.form.get('staff_fname')
    staff_lname = request.form.get('staff_lname')
    department = request.form.get('department')
    email = request.form.get('email')
    
    if not all([staff_id, staff_fname, staff_lname, department, email]):
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
    
    flash("Thank you! Your information has been successfully submitted.")
    # Insert data into the staff table
    cursor.execute('''
        INSERT INTO staff (Staff_ID, Staff_FName, Staff_LName, Dept, Country, Email, Access_ID)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    ''', (staff_id, staff_fname, staff_lname, department, "Singapore", email, "2"))
    conn.commit()

    flash("Thank you! Your information has been successfully submitted.")
    return redirect(url_for('index'))
    
if __name__ == "__main__":
    app.run(debug=True)


