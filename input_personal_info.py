import re

def validate_name(name):
    if not re.match(r'^[A-Za-z\'\s-]+$', name):
        return False
    return True

def validate_email(email):
    if not re.match(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', email):
        return False
    return True

def main():
    print("Please enter your personal information:")
    
    staff_id = input("Staff ID: ")
    
    staff_fname = input("First Name: ")
    if not validate_name(staff_fname):
        print("Invalid First Name. Please enter a valid name.")
        return
    
    staff_lname = input("Last Name: ")
    if not validate_name(staff_lname):
        print("Invalid Last Name. Please enter a valid name.")
        return
    
    department = input("Department: ")
    
    email = input("Email Address: ")
    if not validate_email(email):
        print("Invalid email address. Please enter a valid email.")
        return
    
    print("Thank you! Your information has been successfully submitted.")

if __name__ == "__main__":
    main()
