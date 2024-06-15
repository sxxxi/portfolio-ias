-- For auth-service
CREATE SCHEMA IF NOT EXISTS auth;
CREATE TABLE IF NOT EXISTS auth.credentials(
    id SERIAL PRIMARY KEY,
    username VARCHAR UNIQUE NOT NULL,
    hash VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS auth.permissions(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS auth.credential_permissions(
    credential_id SERIAL REFERENCES auth.credentials(id),
    permission_id SERIAL REFERENCES auth.permissions(id)
);

-- For portfolio-service
CREATE SCHEMA portfolio;
CREATE TABLE IF NOT EXISTS portfolio.projects(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(50) NULL,
    imagePath VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS portfolio.blogs(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    body VARCHAR
);