#Connected
import os
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root@localhost:3306/HR Portal'  # Adjust the database name here
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
CORS(app)

class Role(db.Model):
    __tablename__ = 'Role'

    Role_Name = db.Column(db.String(20), nullable=False, primary_key=True)
    Role_Desc = db.Column(db.String(100), nullable=False)
    Department = db.Column(db.String(100), nullable=False)

    def __init__(self, Role_Name, Role_Desc, Department):
        self.Role_Name = Role_Name
        self.Role_Desc = Role_Desc
        self.Department = Department

    def json(self):
        return {
            'Role_Name': self.Role_Name,
            'Role_Desc': self.Role_Desc,
            'Department' : self.Department
        }

class Open_Position(db.Model):
    __tablename__ = 'Open_Position'

    Position_ID = db.Column(db.Integer, nullable=False, primary_key=True)
    Role_Name = db.Column(db.String(20),db.ForeignKey('Role.Role_Name'), nullable=False)
    Starting_Date = db.Column(db.Date, nullable=False)
    Ending_Date = db.Column(db.Date, nullable=False)

    def __init__(self, Position_ID, Role_Name, Starting_Date, Ending_Date):
        self.Position_ID = Position_ID
        self.Role_Name = Role_Name
        self.Starting_Date = Starting_Date
        self.Ending_Date = Ending_Date

    def json(self):
        return {
            'Position_ID': self.Position_ID,
            'Role_Name': self.Role_Name,
            'Starting_Date': self.Starting_Date,
            'Ending_Date': self.Ending_Date
        }


@app.route('/Open_Position')
def get_all():
    Open_PositionList = Open_Position.query.all()
    if Open_PositionList:
        return jsonify({
            'code': 200,
            'data': {
                'Open Position': [Open_Position.json() for Open_Position in Open_PositionList]
            }
        }
        )
    return {
        'code': 400,
        'message': 'There are is no Open Position'
    }

# get open roles based on selected department
@app.route('/Open_Position/Dept', methods=['GET'])
def get_open_roles_for_dept():
    # department_names = request.get_json()['departments'] # input format -- {"departments": [dept1, dept2]}
    department_names = request.args.get('departments')

    if department_names:
        response = get_all()

        if response.status_code == 200:
            filtered_open_positions = []

            open_positions = response.get_json()['data']['Open Position']

            for opening in open_positions:
                opening_role_name = opening['Role_Name'] # get the role name of the opening
                opening_role_info = Role.query.filter_by(Role_Name = opening_role_name).first() # match Role_Name in Role table to get the other data

                if opening_role_info.Department in department_names: # check if the opening is part of the departments selected in the filter
                    filtered_open_positions.append({"Ending_Date": opening["Ending_Date"], "Position_ID": opening["Position_ID"], "Role_Name": opening["Role_Name"], "Starting_Date": opening["Starting_Date"], "Department": opening_role_info.Department, "Role_Desc": opening_role_info.Role_Desc})

            if filtered_open_positions:
                return jsonify({
                    'code': 200,
                    'data':
                        {
                            'open_positions': [listing for listing in filtered_open_positions]
                        }
                })
        
            return jsonify({
                'code': 400,
                'message': 'No matching roles are open for application based on your selection.'
            }), 400
        
        return jsonify({
                'code': 400,
                'message': 'There are is no Open Position.'
            }), 400

    return jsonify({
        'code': 400,
        'message': 'No departments selected for the filter.'
    }), 400

# search function 
@app.route('/Open_Position/Search', methods=['GET'])
def search_for_roles():
    # keyword = request.get_json()['search_input'] # input format -- {"search_input": keyword}
    keyword = request.args.get('search_input')
    
    if keyword:
        response = get_all()

        if response.status_code == 200:
            matching_open_positions = []

            open_positions = response.get_json()['data']['Open Position']

            for opening in open_positions:
                opening_role_name = opening['Role_Name'] # get the role name of the opening
                opening_role_info = Role.query.filter_by(Role_Name = opening_role_name).first()

                if keyword.lower() in opening_role_name.lower() or keyword.lower() in opening_role_info.Role_Desc.lower():
                    matching_open_positions.append({"Ending_Date": opening["Ending_Date"], "Position_ID": opening["Position_ID"], "Role_Name": opening["Role_Name"], "Starting_Date": opening["Starting_Date"], "Department": opening_role_info.Department, "Role_Desc": opening_role_info.Role_Desc})

                
            if matching_open_positions:
                return jsonify({
                    'code': 200,
                    'data':
                        {
                            'open_positions': [listing for listing in matching_open_positions]
                        }
                })
        
            return jsonify({
                'code': 400,
                'message': 'No matching roles are open for application based on your search.'
            }), 400
        
        return jsonify({
                'code': 400,
                'message': 'There are is no Open Position.'
            }), 400

    return jsonify({
        'code': 400,
        'message': 'No keywords entered in search box.'
    }), 400

if __name__ == '__main__':
    app.run(port=5006, debug=True)
