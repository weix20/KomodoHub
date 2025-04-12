# models.py

from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


# 用户表
class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='用户ID')
    username = db.Column(db.String(50), nullable=False, unique=True, comment='用户名')
    password_hash = db.Column(db.String(255), nullable=False, comment='密码哈希值')
    email = db.Column(db.String(100), comment='邮箱地址')
    role = db.Column(db.Enum('STUDENT', 'TEACHER', 'CONTRIBUTOR', 'ADMIN'), nullable=False, comment='用户角色')
    status = db.Column(db.SmallInteger, default=1, comment='账号状态（1=正常，0=禁用）')
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='创建时间')

    user_profile = db.relationship('UserProfile', backref='user', uselist=False)
    user_contrib = db.relationship('UserContrib', backref='user', lazy=True)
    org_member_mapping = db.relationship('OrgMemberMapping', backref='user', lazy=True)
    canvas = db.relationship('Canvas', backref='user', lazy=True)
    audit_log = db.relationship('AuditLog', backref='user', lazy=True)
    dashboard = db.relationship('Dashboard', backref='user', lazy=True)
    activity_log = db.relationship('ActivityLog', backref='user', lazy=True)
    activity_enroll = db.relationship('ActivityEnroll', backref='user', lazy=True)


# 用户扩展信息表
class UserProfile(db.Model):
    __tablename__ = 'user_profile'
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), primary_key=True, comment='用户ID')
    full_name = db.Column(db.String(100), comment='真实姓名')
    age = db.Column(db.Integer, comment='年龄')
    gender = db.Column(db.Enum('M', 'F', 'OTHER'), comment='性别')
    bio = db.Column(db.Text, comment='个人简介')
    avatar_url = db.Column(db.String(255), comment='头像URL')


# 组织表
class Organization(db.Model):
    __tablename__ = 'organization'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='组织ID')
    uuno = db.Column(db.String(100), nullable=False, comment='组织唯一码')
    name = db.Column(db.String(100), nullable=False, comment='组织名称')
    description = db.Column(db.Text, comment='组织描述')
    region = db.Column(db.String(100), comment='地区')
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='创建时间')


# 用户与组织映射表
class OrgMemberMapping(db.Model):
    __tablename__ = 'org_member_mapping'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='映射ID')
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='用户ID')
    org_id = db.Column(db.BigInteger, db.ForeignKey('organization.id'), comment='组织ID')
    role_in_org = db.Column(db.String(50), comment='用户在组织内的角色')


# 用户投稿表
class UserContrib(db.Model):
    __tablename__ = 'user_contrib'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='投稿ID')
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='用户ID')
    title = db.Column(db.String(100), comment='标题')
    content = db.Column(db.Text, comment='正文内容')
    type = db.Column(db.Enum('ARTICLE', 'REPORT', 'ESSAY'), comment='内容类型')
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='投稿时间')


# 投稿附件表
class ContribMaterial(db.Model):
    __tablename__ = 'contrib_material'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='附件ID')
    contrib_id = db.Column(db.BigInteger, db.ForeignKey('user_contrib.id'), comment='投稿ID')
    file_url = db.Column(db.String(255), comment='附件URL')
    file_type = db.Column(db.String(50), comment='文件类型')


# 文章评论表
class ArticleComment(db.Model):
    __tablename__ = 'article_comment'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='评论ID')
    article_id = db.Column(db.BigInteger, db.ForeignKey('user_contrib.id'), comment='文章ID')
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='评论人ID')
    content = db.Column(db.Text, comment='评论内容')
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='评论时间')


# 文章标签表
class ArticleTag(db.Model):
    __tablename__ = 'article_tag'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='标签ID')
    contrib_id = db.Column(db.BigInteger, db.ForeignKey('user_contrib.id'), comment='投稿ID')
    tag = db.Column(db.String(50), comment='标签内容')


# 用户画布表
class Canvas(db.Model):
    __tablename__ = 'canvas'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='画布ID')
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='用户ID')
    title = db.Column(db.String(100), comment='画布标题')
    description = db.Column(db.Text, comment='画布描述')
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='创建时间')


# 画布素材表
class CanvasMaterial(db.Model):
    __tablename__ = 'canvas_material'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='素材ID')
    canvas_id = db.Column(db.BigInteger, db.ForeignKey('canvas.id'), comment='画布ID')
    file_url = db.Column(db.String(255), comment='素材地址')
    description = db.Column(db.Text, comment='素材描述')


# 画布分享表
class CanvasShare(db.Model):
    __tablename__ = 'canvas_share'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='分享ID')
    canvas_id = db.Column(db.BigInteger, db.ForeignKey('canvas.id'), comment='画布ID')
    shared_with_user = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='被分享用户ID')
    permission = db.Column(db.Enum('VIEW', 'COMMENT'), comment='权限')
    shared_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='分享时间')


# 审计日志表
class AuditLog(db.Model):
    __tablename__ = 'audit_log'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='日志ID')
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='操作用户ID')
    action = db.Column(db.String(255), comment='操作内容')
    ip_address = db.Column(db.String(45), comment='IP地址')
    device_info = db.Column(db.Text, comment='设备信息')
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='记录时间')


# 仪表盘配置表
class Dashboard(db.Model):
    __tablename__ = 'dashboard'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='仪表盘ID')
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='所属用户ID')
    config_json = db.Column(db.Text, comment='配置内容（JSON）')
    last_updated = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='最后更新时间')


# 仪表盘指标采样
class DashboardMetric(db.Model):
    __tablename__ = 'dashboard_metric'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='指标ID')
    dashboard_id = db.Column(db.BigInteger, db.ForeignKey('dashboard.id'), comment='仪表盘ID')
    metric_key = db.Column(db.String(100), comment='指标键')
    metric_value = db.Column(db.Float, comment='指标值')
    timestamp = db.Column(db.DateTime, comment='采样时间')


# 濒危物种档案表
class EndangeredSpecies(db.Model):
    __tablename__ = 'endangered_species'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='濒危物种唯一标识')
    species_name = db.Column(db.String(255), nullable=False, comment='物种名称')
    scientific_name = db.Column(db.String(255), nullable=False, comment='学名')
    status = db.Column(db.Enum('Critical', 'Endangered', 'Vulnerable', 'Near Threatened', 'Least Concern'),
                       nullable=False, comment='保护状态')
    habitat = db.Column(db.Text, comment='栖息地')
    population_estimate = db.Column(db.Integer, comment='当前估计数量')
    distribution = db.Column(db.Text, comment='分布区域')
    conservation_measures = db.Column(db.Text, comment='保护措施')
    photo_url = db.Column(db.String(255), comment='物种照片URL')
    description = db.Column(db.Text, comment='物种描述')
    last_observed = db.Column(db.Date, comment='最后观察时间')
    created_at = db.Column(db.TIMESTAMP, default=db.func.current_timestamp(), comment='记录创建时间')
    updated_at = db.Column(db.TIMESTAMP, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp(),
                           comment='记录最后更新时间')


# 社区贡献表
class CommunityContributions(db.Model):
    __tablename__ = 'community_contributions'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='贡献记录唯一标识')
    community_id = db.Column(db.Integer, nullable=False, comment='社区ID')
    species_id = db.Column(db.Integer, db.ForeignKey('endangered_species.id'), nullable=False, comment='物种ID')
    contribution_type = db.Column(db.Enum('Article', 'Sightings', 'Fundraising', 'Research'), nullable=False,
                                  comment='贡献类型')
    description = db.Column(db.Text, comment='贡献描述')
    created_at = db.Column(db.TIMESTAMP, default=db.func.current_timestamp(), comment='创建时间')
    updated_at = db.Column(db.TIMESTAMP, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp(),
                           comment='更新时间')


# 活动表
class Activity(db.Model):
    __tablename__ = 'activity'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='活动ID')
    species_id = db.Column(db.Integer, db.ForeignKey('endangered_species.id'), nullable=False, comment='关联物种ID')
    title = db.Column(db.String(100), comment='活动标题')
    description = db.Column(db.Text, comment='活动描述')
    type = db.Column(db.Enum('CLASS', 'OUTDOOR', 'ONLINE'), comment='活动类型')
    start_time = db.Column(db.DateTime, comment='开始时间')
    end_time = db.Column(db.DateTime, comment='结束时间')
    created_by = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='创建者ID')


# 活动报名表
class ActivityEnroll(db.Model):
    __tablename__ = 'activity_enroll'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='报名记录ID')
    activity_id = db.Column(db.BigInteger, db.ForeignKey('activity.id'), comment='活动ID')
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='用户ID')
    status = db.Column(db.Enum('PENDING', 'APPROVED', 'REJECTED'), comment='报名状态')
    enrolled_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='报名时间')


# 活动参与日志
class ActivityLog(db.Model):
    __tablename__ = 'activity_log'
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, comment='日志ID')
    activity_id = db.Column(db.BigInteger, db.ForeignKey('activity.id'), comment='活动ID')
    user_id = db.Column(db.BigInteger, db.ForeignKey('user.id'), comment='用户ID')
    action = db.Column(db.String(100), comment='用户行为')
    logged_at = db.Column(db.DateTime, default=db.func.current_timestamp(), comment='记录时间')
