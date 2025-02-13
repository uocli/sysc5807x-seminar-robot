from flask import Flask, jsonify, request  # type: ignore
from flask_sqlalchemy import SQLAlchemy  # type: ignore

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///login.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(80), nullable=False)

@app.route('/login', methods=['POST'])
def login():
    try:
        data = request.get_json(silent=True)
        if not data:
            data = request.form.to_dict()

        if not data or 'username' not in data or 'password' not in data:
            return jsonify({"message": "Missing credentials", "status": "fail"}), 400

        username = data['username']
        password = data['password']
        user = User.query.filter_by(username=username, password=password).first()

        if user:
            return jsonify({"message": "Login successful", "status": "success"}), 200
        else:
            return jsonify({"message": "Invalid credentials", "status": "fail"}), 401
    except Exception as e:
        return jsonify({"message": f"Error: {str(e)}", "status": "fail"}), 500

def add_user(username, password):
    user_exists = User.query.filter_by(username=username).first()
    if not user_exists:
        new_user = User(username=username, password=password)
        db.session.add(new_user)
        db.session.commit()
        print(f"User {username} added to the database.")
    else:
        print(f"User {username} already exists in the database.")

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
        add_user('test', '123456') 
    app.run(host='127.0.0.1', port=5001) 
