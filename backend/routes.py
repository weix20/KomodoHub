from flask import Blueprint, request, jsonify
from models import db, User, UserProfile
from werkzeug.security import generate_password_hash, check_password_hash
from sqlalchemy.exc import IntegrityError
from flask_jwt_extended import create_access_token
from schemas import RegisterSchema, LoginSchema

bp = Blueprint('main', __name__)
register_schema = RegisterSchema()
login_schema = LoginSchema()

@bp.route('/register', methods=['POST'])
def register():
    data = request.json
    errors = register_schema.validate(data)
    if errors:
        return jsonify({'errors': errors}), 400
    try:
        user = User(
            username=data['username'],
            password_hash=generate_password_hash(data['password']),
            email=data.get('email'),
            role=data['role']
        )
        db.session.add(user)
        db.session.commit()

        profile = UserProfile(
            user_id=user.id,
            full_name=data.get('full_name'),
            age=data.get('age'),
            gender=data.get('gender'),
            bio=data.get('bio'),
            avatar_url=data.get('avatar_url')
        )
        db.session.add(profile)
        db.session.commit()

        return jsonify({'message': '注册成功'}), 201
    except IntegrityError:
        db.session.rollback()
        return jsonify({'error': '用户名已存在'}), 400
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500

@bp.route('/login', methods=['POST'])
def login():
    data = request.json
    errors = login_schema.validate(data)
    if errors:
        return jsonify({'errors': errors}), 400

    user = User.query.filter_by(username=data['username']).first()
    if not user or not check_password_hash(user.password_hash, data['password']):
        return jsonify({'error': '用户名或密码错误'}), 401
    if user.status != 1:
        return jsonify({'error': '账号已禁用'}), 403

    access_token = create_access_token(identity=user.id)
    return jsonify({'access_token': access_token, 'user_id': user.id}), 200
