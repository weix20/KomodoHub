-- Notes!
-- This is a reference table structure.
-- The schema should be adapted as needed based on business requirements, and tables may be added, modified, or removed accordingly.
-- Please focus on maintaining the models.py file, as it will be used by the framework to automatically generate the corresponding database tables.

CREATE DATABASE  if not exists komodo_hub CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
use komodo_hub;
-- 用户表
CREATE TABLE IF NOT EXISTS user
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    username      VARCHAR(50)                                         NOT NULL UNIQUE COMMENT '用户名',
    password_hash VARCHAR(255)                                        NOT NULL COMMENT '密码哈希值',
    email         VARCHAR(100) COMMENT '邮箱地址',
    role          ENUM ('STUDENT', 'TEACHER', 'CONTRIBUTOR', 'ADMIN') NOT NULL COMMENT '用户角色',
    status        TINYINT  DEFAULT 1 COMMENT '账号状态（1=正常，0=禁用）',
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
);

-- 用户扩展信息
CREATE TABLE user_profile
(
    user_id    BIGINT PRIMARY KEY COMMENT '用户ID',
    full_name  VARCHAR(100) COMMENT '真实姓名',
    age        INT COMMENT '年龄',
    gender     ENUM ('M', 'F', 'OTHER') COMMENT '性别',
    bio        TEXT COMMENT '个人简介',
    avatar_url VARCHAR(255) COMMENT '头像URL',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- 组织表
CREATE TABLE organization
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '组织ID',
    uuno        Varchar(100) not null comment '组织唯一码',
    name        VARCHAR(100) NOT NULL COMMENT '组织名称',
    description TEXT COMMENT '组织描述',
    region      VARCHAR(100) COMMENT '地区',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
);

-- 用户与组织映射
CREATE TABLE org_member_mapping
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '映射ID',
    user_id     BIGINT COMMENT '用户ID',
    org_id      BIGINT COMMENT '组织ID',
    role_in_org VARCHAR(50) COMMENT '用户在组织内的角色',
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (org_id) REFERENCES organization (id)
);

-- 用户投稿表
CREATE TABLE user_contrib
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '投稿ID',
    user_id    BIGINT COMMENT '用户ID',
    title      VARCHAR(100) COMMENT '标题',
    content    TEXT COMMENT '正文内容',
    type       ENUM ('ARTICLE', 'REPORT', 'ESSAY') COMMENT '内容类型',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '投稿时间',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- 投稿附件表
CREATE TABLE contrib_material
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '附件ID',
    contrib_id BIGINT COMMENT '投稿ID',
    file_url   VARCHAR(255) COMMENT '附件URL',
    file_type  VARCHAR(50) COMMENT '文件类型',
    FOREIGN KEY (contrib_id) REFERENCES user_contrib (id)
);

-- 文章评论表
CREATE TABLE article_comment
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '评论ID',
    article_id BIGINT COMMENT '文章ID',
    user_id    BIGINT COMMENT '评论人ID',
    content    TEXT COMMENT '评论内容',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
    FOREIGN KEY (article_id) REFERENCES user_contrib (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- 文章标签表
CREATE TABLE article_tag
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '标签ID',
    contrib_id BIGINT COMMENT '投稿ID',
    tag        VARCHAR(50) COMMENT '标签内容',
    FOREIGN KEY (contrib_id) REFERENCES user_contrib (id)
);

-- 用户画布表
CREATE TABLE canvas
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '画布ID',
    user_id     BIGINT COMMENT '用户ID',
    title       VARCHAR(100) COMMENT '画布标题',
    description TEXT COMMENT '画布描述',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- 画布素材表
CREATE TABLE canvas_material
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '素材ID',
    canvas_id   BIGINT COMMENT '画布ID',
    file_url    VARCHAR(255) COMMENT '素材地址',
    description TEXT COMMENT '素材描述',
    FOREIGN KEY (canvas_id) REFERENCES canvas (id)
);

-- 画布分享表
CREATE TABLE canvas_share
(
    id               BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '分享ID',
    canvas_id        BIGINT COMMENT '画布ID',
    shared_with_user BIGINT COMMENT '被分享用户ID',
    permission       ENUM ('VIEW', 'COMMENT') COMMENT '权限',
    shared_at        DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '分享时间',
    FOREIGN KEY (canvas_id) REFERENCES canvas (id),
    FOREIGN KEY (shared_with_user) REFERENCES user (id)
);

-- 审计日志表
CREATE TABLE audit_log
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '日志ID',
    user_id     BIGINT COMMENT '操作用户ID',
    action      VARCHAR(255) COMMENT '操作内容',
    ip_address  VARCHAR(45) COMMENT 'IP地址',
    device_info TEXT COMMENT '设备信息',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- 仪表盘配置表
CREATE TABLE dashboard
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '仪表盘ID',
    user_id      BIGINT COMMENT '所属用户ID',
    config_json  TEXT COMMENT '配置内容（JSON）',
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- 仪表盘指标采样
CREATE TABLE dashboard_metric
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '指标ID',
    dashboard_id BIGINT COMMENT '仪表盘ID',
    metric_key   VARCHAR(100) COMMENT '指标键',
    metric_value DOUBLE COMMENT '指标值',
    timestamp    DATETIME COMMENT '采样时间',
    FOREIGN KEY (dashboard_id) REFERENCES dashboard (id)
);

CREATE TABLE endangered_species
(
    id                    INT AUTO_INCREMENT PRIMARY KEY COMMENT '濒危物种唯一标识',
    species_name          VARCHAR(255)                                                                      NOT NULL COMMENT '物种名称',
    scientific_name       VARCHAR(255)                                                                      NOT NULL COMMENT '学名',
    status                ENUM ('Critical', 'Endangered', 'Vulnerable', 'Near Threatened', 'Least Concern') NOT NULL COMMENT '保护状态',
    habitat               TEXT COMMENT '栖息地',
    population_estimate   INT COMMENT '当前估计数量',
    distribution          TEXT COMMENT '分布区域',
    conservation_measures TEXT COMMENT '保护措施',
    photo_url             VARCHAR(255) COMMENT '物种照片URL',
    description           TEXT COMMENT '物种描述',
    last_observed         DATE COMMENT '最后观察时间',
    created_at            TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    updated_at            TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后更新时间'
) COMMENT ='濒危物种档案表';

CREATE TABLE community_contributions
(
    id                INT AUTO_INCREMENT PRIMARY KEY COMMENT '贡献记录唯一标识',
    community_id      INT                                                      NOT NULL COMMENT '社区ID，外键关联到社区表',
    species_id        INT                                                      NOT NULL COMMENT '物种ID，外键关联到濒危物种表',
    contribution_type ENUM ('Article', 'Sightings', 'Fundraising', 'Research') NOT NULL COMMENT '贡献类型',
    description       TEXT COMMENT '贡献描述',
    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (species_id) REFERENCES endangered_species (id)
) COMMENT ='社区贡献表';

-- 活动表
CREATE TABLE activity
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '活动ID',
    species_id  INT NOT NULL COMMENT '关联物种ID',
    title       VARCHAR(100) COMMENT '活动标题',
    description TEXT COMMENT '活动描述',
    type        ENUM ('CLASS', 'OUTDOOR', 'ONLINE') COMMENT '活动类型',
    start_time  DATETIME COMMENT '开始时间',
    end_time    DATETIME COMMENT '结束时间',
    created_by  BIGINT COMMENT '创建者ID',
    FOREIGN KEY (created_by) REFERENCES user (id),
    FOREIGN KEY (species_id) REFERENCES endangered_species (id)

);

-- 活动报名表
CREATE TABLE activity_enroll
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '报名记录ID',
    activity_id BIGINT COMMENT '活动ID',
    user_id     BIGINT COMMENT '用户ID',
    status      ENUM ('PENDING', 'APPROVED', 'REJECTED') COMMENT '报名状态',
    enrolled_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '报名时间',
    FOREIGN KEY (activity_id) REFERENCES activity (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- 活动参与日志
CREATE TABLE activity_log
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '日志ID',
    activity_id BIGINT COMMENT '活动ID',
    user_id     BIGINT COMMENT '用户ID',
    action      VARCHAR(100) COMMENT '用户行为',
    logged_at   DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
    FOREIGN KEY (activity_id) REFERENCES activity (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);
