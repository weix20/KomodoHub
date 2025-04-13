-- Notes!
-- This is a reference table structure.
-- The schema should be adapted as needed based on business requirements, and tables may be added, modified, or removed accordingly.
-- Please focus on maintaining the models.py file, as it will be used by the framework to automatically generate the corresponding database tables.

CREATE DATABASE IF NOT EXISTS komodo_hub CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE komodo_hub;

-- User Table
CREATE TABLE IF NOT EXISTS user
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'User ID',
    username      VARCHAR(50) NOT NULL UNIQUE COMMENT 'Username',
    password_hash VARCHAR(255) NOT NULL COMMENT 'Password hash',
    email         VARCHAR(100) COMMENT 'Email address',
    role          ENUM ('STUDENT', 'TEACHER', 'CONTRIBUTOR', 'ADMIN') NOT NULL COMMENT 'User role',
    status        TINYINT DEFAULT 1 COMMENT 'Account status (1=active, 0=disabled)',
    created_at    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time'
);

-- User Profile
CREATE TABLE user_profile
(
    user_id    BIGINT PRIMARY KEY COMMENT 'User ID',
    full_name  VARCHAR(100) COMMENT 'Full name',
    age        INT COMMENT 'Age',
    gender     ENUM ('M', 'F', 'OTHER') COMMENT 'Gender',
    bio        TEXT COMMENT 'Bio',
    avatar_url VARCHAR(255) COMMENT 'Avatar URL',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Organization Table
CREATE TABLE organization
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Organization ID',
    uuno        VARCHAR(100) NOT NULL COMMENT 'Unique organization code',
    name        VARCHAR(100) NOT NULL COMMENT 'Organization name',
    description TEXT COMMENT 'Organization description',
    region      VARCHAR(100) COMMENT 'Region',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time'
);

-- Organization Membership
CREATE TABLE org_member_mapping
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Mapping ID',
    user_id     BIGINT COMMENT 'User ID',
    org_id      BIGINT COMMENT 'Organization ID',
    role_in_org VARCHAR(50) COMMENT 'Role in organization',
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (org_id) REFERENCES organization (id)
);

-- User Contributions
CREATE TABLE user_contrib
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Contribution ID',
    user_id    BIGINT COMMENT 'User ID',
    title      VARCHAR(100) COMMENT 'Title',
    content    TEXT COMMENT 'Content',
    type       ENUM ('ARTICLE', 'REPORT', 'ESSAY') COMMENT 'Content type',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Submission time',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Contribution Materials
CREATE TABLE contrib_material
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Attachment ID',
    contrib_id BIGINT COMMENT 'Contribution ID',
    file_url   VARCHAR(255) COMMENT 'File URL',
    file_type  VARCHAR(50) COMMENT 'File type',
    FOREIGN KEY (contrib_id) REFERENCES user_contrib (id)
);

-- Article Comments
CREATE TABLE article_comment
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Comment ID',
    article_id BIGINT COMMENT 'Article ID',
    user_id    BIGINT COMMENT 'Commenter ID',
    content    TEXT COMMENT 'Comment content',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Comment time',
    FOREIGN KEY (article_id) REFERENCES user_contrib (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Article Tags
CREATE TABLE article_tag
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Tag ID',
    contrib_id BIGINT COMMENT 'Contribution ID',
    tag        VARCHAR(50) COMMENT 'Tag',
    FOREIGN KEY (contrib_id) REFERENCES user_contrib (id)
);

-- Canvas Table
CREATE TABLE canvas
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Canvas ID',
    user_id     BIGINT COMMENT 'User ID',
    title       VARCHAR(100) COMMENT 'Canvas title',
    description TEXT COMMENT 'Canvas description',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Canvas Materials
CREATE TABLE canvas_material
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Material ID',
    canvas_id   BIGINT COMMENT 'Canvas ID',
    file_url    VARCHAR(255) COMMENT 'Material URL',
    description TEXT COMMENT 'Material description',
    FOREIGN KEY (canvas_id) REFERENCES canvas (id)
);

-- Canvas Sharing
CREATE TABLE canvas_share
(
    id               BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Share ID',
    canvas_id        BIGINT COMMENT 'Canvas ID',
    shared_with_user BIGINT COMMENT 'Shared user ID',
    permission       ENUM ('VIEW', 'COMMENT') COMMENT 'Permission type',
    shared_at        DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Share time',
    FOREIGN KEY (canvas_id) REFERENCES canvas (id),
    FOREIGN KEY (shared_with_user) REFERENCES user (id)
);

-- Audit Logs
CREATE TABLE audit_log
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Log ID',
    user_id     BIGINT COMMENT 'User ID',
    action      VARCHAR(255) COMMENT 'Action content',
    ip_address  VARCHAR(45) COMMENT 'IP address',
    device_info TEXT COMMENT 'Device info',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Log time',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Dashboard Configuration
CREATE TABLE dashboard
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Dashboard ID',
    user_id      BIGINT COMMENT 'User ID',
    config_json  TEXT COMMENT 'Configuration content (JSON)',
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Last updated',
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Dashboard Metrics
CREATE TABLE dashboard_metric
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Metric ID',
    dashboard_id BIGINT COMMENT 'Dashboard ID',
    metric_key   VARCHAR(100) COMMENT 'Metric key',
    metric_value DOUBLE COMMENT 'Metric value',
    timestamp    DATETIME COMMENT 'Sample time',
    FOREIGN KEY (dashboard_id) REFERENCES dashboard (id)
);

-- Endangered Species Archive
CREATE TABLE endangered_species
(
    id                    INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Species ID',
    species_name          VARCHAR(255) NOT NULL COMMENT 'Species name',
    scientific_name       VARCHAR(255) NOT NULL COMMENT 'Scientific name',
    status                ENUM ('Critical', 'Endangered', 'Vulnerable', 'Near Threatened', 'Least Concern') NOT NULL COMMENT 'Conservation status',
    habitat               TEXT COMMENT 'Habitat',
    population_estimate   INT COMMENT 'Estimated population',
    distribution          TEXT COMMENT 'Distribution',
    conservation_measures TEXT COMMENT 'Conservation measures',
    photo_url             VARCHAR(255) COMMENT 'Photo URL',
    description           TEXT COMMENT 'Description',
    last_observed         DATE COMMENT 'Last observed',
    created_at            TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
    updated_at            TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last updated'
) COMMENT='Endangered Species Archive';

-- Community Contributions
CREATE TABLE community_contributions
(
    id                INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Contribution ID',
    community_id      INT NOT NULL COMMENT 'Community ID (FK)',
    species_id        INT NOT NULL COMMENT 'Species ID (FK)',
    contribution_type ENUM ('Article', 'Sightings', 'Fundraising', 'Research') NOT NULL COMMENT 'Type of contribution',
    description       TEXT COMMENT 'Description',
    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
    updated_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
    FOREIGN KEY (species_id) REFERENCES endangered_species (id)
) COMMENT='Community Contribution Table';

-- Activity Table
CREATE TABLE activity
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Activity ID',
    species_id  INT NOT NULL COMMENT 'Linked species ID',
    title       VARCHAR(100) COMMENT 'Activity title',
    description TEXT COMMENT 'Activity description',
    type        ENUM ('CLASS', 'OUTDOOR', 'ONLINE') COMMENT 'Activity type',
    start_time  DATETIME COMMENT 'Start time',
    end_time    DATETIME COMMENT 'End time',
    created_by  BIGINT COMMENT 'Creator ID',
    FOREIGN KEY (created_by) REFERENCES user (id),
    FOREIGN KEY (species_id) REFERENCES endangered_species (id)
);

-- Activity Enrollments
CREATE TABLE activity_enroll
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Enrollment ID',
    activity_id BIGINT COMMENT 'Activity ID',
    user_id     BIGINT COMMENT 'User ID',
    status      ENUM ('PENDING', 'APPROVED', 'REJECTED') COMMENT 'Enrollment status',
    enrolled_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Enrollment time',
    FOREIGN KEY (activity_id) REFERENCES activity (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);

-- Activity Logs
CREATE TABLE activity_log
(
    id          BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Log ID',
    activity_id BIGINT COMMENT 'Activity ID',
    user_id     BIGINT COMMENT 'User ID',
    action      VARCHAR(100) COMMENT 'User action',
    logged_at   DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Log time',
    FOREIGN KEY (activity_id) REFERENCES activity (id),
    FOREIGN KEY (user_id) REFERENCES user (id)
);
