Jeux Olympiques 2024 - Applications de gestion des billets

Bienvenue sur le dépôt GitHub de l'application de gestion des billets pour les jeux Olympiques 2024.
Cette application permet aux utilisateurs de naviguer, sélectionner et acheter des billets pour divers évènements sportifs.
Elle est conçue avec le framework Django et utilise MySQL comme base de données.

# Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine : 

  - Python 3.8 ou supérieur
  - GIT
  - MysSQL
  - un environnement virtuel Python (optionnel masi recommandé

# Installation

1. Cloner le projet :
   git clone https://github.com/Jean97483/JeuxOlympiques24.git
   cd JeuxOlympiques24

2. Créer un environnement virtuel :
   python3 -m venv venv
   source venv/bin/activate  #Sur Windows, Utilisez `venv\Scripts\activate`

3. Installer les dépendances :
   pip install -r requirements.txt

# Configuration de la Base de Données

1. Créer la base de données MySQL :
   Connectez-vous à MySQL et créez une base de données:
   CREATE DATABASE jeuxolympiques24
2. Mettre à jour les informations de connexion à la base de données dans settings.py:
   DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'jeuxolympiques24',
        'USER': 'votre-nom-utilisateur',
        'PASSWORD': 'votre-mot-de-passe',
        'HOST': 'localhost',
        'PORT': '3306',
    }

   3. Appliquer les migrations de la base de données :
      python3 manage.py makemigrations
      python3 manage.py migrate

  # Lancer le projet en local
  1. Créer un superutilisateur pour accéder à l'interface d'administration:
     python3 manage.py createsuperuser
  2. Démarrer le serveur local
     python3 manage.py runserver
  3. Accédez à l'application dans votre navigateur à l'adresse http://127.0.0.1:8000


#Charte Graphique

La charte graphique de l'application est inspirée par un design moderne et épuré, avec les éléments suivants : 

    - Couleurs principales :
      - Bleu : #0056b3 (pour les boutons et les éléments interactifs)
      - Rouge : #ff4d4d (pour les boutons d'alerte comme "Supprimer")
      - Vert : #4CAF50 (pour les actions positives comme "Procéder au paiement")
      - Gris : #f8f9fa (pour le fond)
    - Typographie : Arial, Helvetica, sans-serif
    - Style général: Utilisation de l'ombrage et des bords arrondis pour un aspect plus convivial.

    Les fichiers CSS utilisés pour styliser l'application se trouvent dans le répertoire static/CSS/.

# Fonctionnalités
  - Navigation par sport : Les utilisateurs peuvent parcourir les événements en fonction  des sports
  - Panier : Ajout et suppression de billets au panier
  - Paiement : Simuler le paiement et finaliser l'achat des billets
  - Gestion par l'administrateur : Accéder à l'interface d'administration pour gérer les événements et les billets vendus.


# Contribuer

Les contributions sont les bienvenus ! Pour contribuer au projet :

1. Fork le dépôt.
2. Clone votre fork localement :
   git clone https://github.com/Jean97483/JeuxOlympiques24.git
3. Créer une branche pour votre fonctionnalité ou correction :
   git checkout -b nouvelle-fonctionnalite
4. Commitez vos modifications :
   git commit -m "Ajouter une nouvelle fonctionnalite"
5. Poussez vers la branche
   git push origin nouvell-fonctionnalite
6. Ouvrez une Pull Request sur GitHub.
   
