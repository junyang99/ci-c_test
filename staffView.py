from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root@localhost:3306/role'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Role(db.Model):
    __tablename__ = 'Role'

    Role_Name = db.Column(db.String(20), nullable=False, primary_key=True)
    Role_Desc = db.Column(db.String(100), nullable=False)
    Dept = db.Column(db.String(100), nullable=False)

    def __init__(self, Role_Name, Role_Desc, Dept):
        self.Role_Name = Role_Name
        self.Role_Desc = Role_Desc
        self.Dept = Dept

    def json(self):
        return {
            'Role_Name': self.Role_Name,
            'Role_Desc': self.Role_Desc,
            'Dept' : self.Dept
        }
    
# get all open roles
@app.route('/rolelisting', methods=['GET'])
def get_open_roles():
    open_roles = Role.query.all()
    if open_roles:
        return jsonify(
            {
            'code': 200,
            'data':
                {
                    'open roles': [role.json() for role in open_roles]
                }
            })
    return jsonify(
        {
        'code': 400,
        'message': 'There are no roles open for application'
        }), 400

# get open roles based on selected department
@app.route('/rolelisting/dept', methods=['GET'])
def get_open_roles_for_dept():
    department_names = request.get_json()['departments'] # input format -- {"departments": [dept1, dept2]}
    print(department_names)

    if department_names:
        open_roles_all = []

        for departmentName in department_names:
            open_roles_filtered_dept = Role.query.filter_by(Dept = departmentName).all()
            if open_roles_filtered_dept:
                open_roles_all.extend(open_roles_filtered_dept)
        
        if open_roles_all:
            return jsonify({
                'code': 200,
                'data':
                    {
                        'open roles': [role.json() for role in open_roles_all]
                    }
            })
        return jsonify({
            'code': 400,
            'message': 'No matching roles are open for application based on your selection.'
        }), 400

    return jsonify({
        'code': 400,
        'message': 'No departments selected for the filter.'
    }), 400

# TO DO -- need to do combined filter for dept + skill 
@app.route('/rolelisting/filtered', methods=['GET'])
def get_filted_roles():
    pass

# search function 
@app.route('/rolelisting/search', methods=['GET'])
def search_for_roles():
    keyword = request.get_json()['search_input'] # input format -- {"search_input": keyword}
    
    if keyword:
        roles = Role.query.filter((Role.Role_Name.like(f'%{keyword}%')) | (Role.Role_Desc.like(f'%{keyword}%'))).all()
        if roles:
            return jsonify({
                'code': 200,
                'data':
                    {
                        'roles': [role.json() for role in roles]
                    }
            })
        return jsonify({
            'code': 400,
            'message': 'No matching roles found based on your search.'
        }), 400

    return jsonify({
        'code': 400,
        'message': 'No keywords entered in search box.'
    }), 400


# change port number later 
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5001, debug=True)
