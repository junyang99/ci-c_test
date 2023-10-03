from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import relationship

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+mysqlconnector://root@localhost:3306/SPM"
db = SQLAlchemy(app)

class Role(db.Model):
    role_name = db.Column(db.String(20), primary_key=True)
    role_desc = db.Column(db.Text, nullable=False)
    role_dept = db.Column(db.String(20), nullable=False)
    skills = db.relationship('RoleSkill', backref='role', lazy=True)

class RoleSkill(db.Model):
    role_name = db.Column(db.String(20), db.ForeignKey('role.role_name'), primary_key=True)
    skill_name = db.Column(db.String(50), primary_key=True)

def field_check(field):
    min_length = 2
    if isinstance(field, list):
        if not field or all(item.strip() == '' for item in field):
            return "Missing fields"
        elif all(len(item) <= min_length for item in field):
            return "Need to input at least "+ str(min_length) +" letters for each skill"

    else:
        if not field or field.strip() == '':
            return "Missing fields"
        elif len(field) <= min_length:
            return "Need to input at least "+ str(min_length) +" letters"
    return None

@app.route('/HR/role_admin', methods=['POST'])
def create_role():
    if request.is_json:
        try:
            data = request.get_json()
            title = data.get('role_name')
            description = data.get('description')
            department = data.get('department')
            skills = data.get('skills')

            # Check if title is unique
            if Role.query.filter_by(role_name=title).first():
                return jsonify({
                    'message': 'Role name already exists',
                    'data': {"role_name": title}
                }), 400

            fields_error = {}

            title_error = field_check(title)
            if title_error:
                fields_error['role_name'] = title_error

            description_error = field_check(description)
            if description_error:
                fields_error['description'] = description_error

            department_error = field_check(department)
            if department_error:
                fields_error['department'] = department_error

            if isinstance(skills, list):
                skills_error = field_check(skills)
                if skills_error:
                    fields_error['skills'] = skills_error
            else:
                fields_error['skills'] = "Skills should be a list"

            # print(fields_error)

            # Check if any field is missing
            if fields_error:
                return jsonify({
                    'message': 'Required fields are missing or invalid',
                    'data': fields_error
                }), 400

            # Create the role listing
            role = Role(role_name=title, role_desc=description, role_dept=department)
            db.session.add(role)

            for skill in skills:
                role_skill = RoleSkill(role_name=title, skill_name=skill)
                db.session.add(role_skill)

            db.session.commit()

            return jsonify({
                'message': 'Role listing created successfully'
            }), 201

        except Exception as e:
            # Unexpected error in code
            # exc_type, exc_obj, exc_tb = sys.exc_info()
            # fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            # ex_str = str(e) + " at " + str(exc_type) + ": " + fname + ": line " + str(exc_tb.tb_lineno)
            # print(ex_str)
            print(str(e))

            return jsonify({
                "code": 500,
                "message": "internal error: " + str(e)
            }), 500
        
    # if reached here, not a JSON request.
    return jsonify({
        "code": 400,
        "message": "Please use a valid json request"
    }), 400

@app.route('/HR/role_admin', methods=['GET'])
def get_role():
    pass

@app.route('/HR/role_admin', methods=['PUT'])
def update_role():
    pass

if __name__ == '__main__':
    app.run(port = 5000, debug=True)

