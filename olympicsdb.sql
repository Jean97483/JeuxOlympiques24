-- auth_group
DROP TABLE IF EXISTS auth_group;

CREATE TABLE auth_group (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
);

COPY auth_group (id, name) FROM stdin;
1   Admin
2   User
\.

-- auth_permission
DROP TABLE IF EXISTS auth_permission;

CREATE TABLE auth_permission (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    content_type_id INT NOT NULL,
    codename VARCHAR(100) NOT NULL,
    UNIQUE (content_type_id, codename),
    FOREIGN KEY (content_type_id) REFERENCES django_content_type (id)
);

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1   "Can add sport" 1   "add_sport"
2   "Can change sport"  1   "change_sport"
3   "Can delete sport"  1   "delete_sport"
4   "Can view sport"    1   "view_sport"
\.

-- auth_user
DROP TABLE IF EXISTS auth_user;

CREATE TABLE auth_user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    email VARCHAR(254) NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    is_superuser BOOLEAN NOT NULL,
    is_staff BOOLEAN NOT NULL,
    is_active BOOLEAN NOT NULL,
    date_joined TIMESTAMP NOT NULL
);

COPY auth_user (id, username, password, email, first_name, last_name, is_superuser, is_staff, is_active, date_joined) FROM stdin;
1   Admin   password   admin@example.com   Admin   User    t   t   t   2024-05-29 00:00:00
\.

-- django_content_type
DROP TABLE IF EXISTS django_content_type;

CREATE TABLE django_content_type (
    id SERIAL PRIMARY KEY,
    app_label VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    UNIQUE (app_label, model)
);

COPY django_content_type (id, app_label, model) FROM stdin;
1   auth    permission
2   auth    group
\.

-- offres_sport
DROP TABLE IF EXISTS offres_sport;

CREATE TABLE offres_sport (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

COPY offres_sport (id, nom) FROM stdin;
1   Athlétisme
2   Natation
\.

-- offres_evenement
DROP TABLE IF EXISTS offres_evenement;

CREATE TABLE offres_evenement (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    sport_id INT,
    FOREIGN KEY (sport_id) REFERENCES offres_sport (id)
);

COPY offres_evenement (id, date, sport_id) FROM stdin;
1   2024-05-01  1
\.

-- offres_offre
DROP TABLE IF EXISTS offres_offre;

CREATE TABLE offres_offre (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    image VARCHAR(255) NOT NULL,
    sport_id INT,
    date DATE,
    prix DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (sport_id) REFERENCES offres_sport (id)
);

COPY offres_offre (id, titre, description, image, sport_id, date, prix) FROM stdin;
1   Athlétisme   "Description athlétisme"  "athletisme.jpg"   1   2024-08-01  0.00
\.

-- offres_panier
DROP TABLE IF EXISTS offres_panier;

CREATE TABLE offres_panier (
    id SERIAL PRIMARY KEY,
    user_id INT,
    offre_id INT,
    evenement_id INT,
    quantite INT DEFAULT 1,
    type_offre VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES auth_user (id),
    FOREIGN KEY (offre_id) REFERENCES offres_offre (id)
);

COPY offres_panier (id, user_id, offre_id, evenement_id, quantite, type_offre) FROM stdin;
1   1   1   1   1   Solo
\.