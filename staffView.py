from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root@localhost:3306/role'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Role(db.Model):
    __tablename__ = 'role'
    role_name_char = db.Column(db.String(20), primary_key=True)
    role_desc = db.Column(db.Text, nullable=False)
    role_dept = db.Column(db.String(20), nullable=False) # edit this later

    def __init__(self, role_name_char, role_desc, role_dept):
        self.role_name_char = role_name_char
        self.role_desc = role_desc
        self.role_dept = role_dept # edit this later 

    def json(self):
        return {"role_name_char": self.role_name_char, "role_desc": self.role_desc, "role_dept": self.role_dept}
    
# get all open roles
@app.route('/rolelisting', methods=['GET'])
def get_open_roles():
    open_roles = Role.query.all()
    if open_roles:
        return {
            'code': 200,
            'data':
                {
                    'open roles': [role.json() for role in open_roles]
                }
        }
    return {
        'code': 400,
        'message': 'There are no roles open for application'
    }

# get open roles based on selected department
@app.route('/rolelisting/dept', methods=['GET'])
def get_open_roles_for_dept():
    department_names = request.get_json()['departments']
    print(department_names)

    if department_names:
        open_roles_all = []

        for departmentName in department_names:
            open_roles_filtered_dept = Role.query.filter_by(role_dept = departmentName).all()
            if open_roles_filtered_dept:
                open_roles_all.extend(open_roles_filtered_dept)
        
        if open_roles_all:
            return {
                'code': 200,
                'data':
                    {
                        'open roles': [role.json() for role in open_roles_all]
                    }
            }
        return {
            'code': 400,
            'message': 'No matching roles are open for application based on your selection.'
        }

    return {
        'code': 400,
        'message': 'No departments selected for the filter.'
    }

# change port number later 
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5001, debug=True)
