# app.py

from flask import Flask
from config import SQLALCHEMY_DATABASE_URI, SQLALCHEMY_TRACK_MODIFICATIONS, SECRET_KEY, JWT_SECRET_KEY
from models import db
from routes import bp
from models import db, User, UserProfile  # 导入模型
from flask_jwt_extended import JWTManager


def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = SQLALCHEMY_DATABASE_URI
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = SQLALCHEMY_TRACK_MODIFICATIONS
    app.config['SECRET_KEY'] = SECRET_KEY
    app.config['JWT_SECRET_KEY'] = JWT_SECRET_KEY

    db.init_app(app)
    JWTManager(app)
    app.register_blueprint(bp)

    return app


# 用于开发时本地启动
if __name__ == '__main__':
    app = create_app()

    with app.app_context():
        db.create_all()  # 初始化表结构（仅首次）
    app.run(host='0.0.0.0', port=9898, debug=True)
