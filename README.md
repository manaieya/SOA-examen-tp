 Grand Opéra de Paris - Système de Gestion des Invités

o Description du projet:

Système web complet pour la gestion des invités du Grand Opéra de Paris, développé dans le cadre d'un projet académique.
Ce projet met en œuvre une architecture Client/Serveur moderne avec un backend REST JAX-RS/JPA et un frontend JSP dynamique.
Développer une application web permettant la gestion CRUD (Create, Read, Update, Delete) des invités via une interface élégante,
consommant des services RESTful.

o Outils utilisées:

 Backend (Serveur)
- **Technologie** : Java EE avec JAX-RS (Jersey) et JPA (Hibernate)
- **Base de données** : MySQL
- **Conteneur** : Apache Tomcat 9

 Frontend (Client)
- **Technologie** : JSP (JavaServer Pages) avec JSTL
- **CSS Framework** : Bootstrap 5.1.3


o Structure du Projet:

projet_soa/
├── src/main/java/
│ ├── com/projet/
│ │ ├── api/RestRouter.java # Endpoints REST JAX-RS
│ │ ├── controller/PersonController.java # Contrôleur Frontend
│ │ ├── entity/Person.java # Entité JPA
│ │ └── service/ # Couche Service
│ │ ├── PersonService.java # Interface
│ │ └── PersonServiceImpl.java # Implémentation JPA
├── src/main/webapp/
│ ├── WEB-INF/
│ │ ├── views/ # Pages JSP
│ │ │ ├── list.jsp # Liste des invités
│ │ │ ├── add.jsp # Ajout d'invité
│ │ │ ├── edit.jsp # Modification d'invité
│ │ │ └── view.jsp # Détails d'invité
│ │ ├── web.xml # Configuration Web
│ │ └── persistence.xml # Configuration JPA
│ └── index.jsp # Page d'accueil
└── pom.xml # Dépendances Maven




o  Endpoints Disponibles:


GET `/test/persons/all` -> Liste toutes les personnes 
GET `/test/persons/get/{id}` -> Récupère une personne par ID 
POST  `/test/persons/add` -> Ajoute une nouvelle personne 
PUT  `/test/persons/update` -> Met à jour une personne existante 
DELETE `/test/persons/delete/{id}` -> Supprime une personne par ID 



o Instructions pour exécuter le projet: 

1.Configuration de la Base de Données
>>Créer une base de données MySQL

2.Modifier persistence.xml avec vos identifiants

3.Déploiement
>>Cloner le dépôt
>>Compiler avec Maven

4.Déployer le fichier WAR sur Tomcat 

5.Démarrer Tomcat

6.Accéder à l'application via :
http://localhost:8081/projet_soa/

oTechnologies Utilisées: 

>>Backend
Java EE : JAX-RS 2.1, JPA 2.2
Hibernate 5.2.6 : ORM pour la persistance
Jersey 2.35 : Implémentation JAX-RS
MySQL Connector 5.1.48 : Driver JDBC

>>Frontend
JSP 2.3 : JavaServer Pages
JSTL 1.2 : Tag Library

o Captures d’écran :pour les test de postman :
https://drive.google.com/drive/folders/1xEXiRmYCXFPke1MpvJ27_17NUuTs-JgJ?usp=drive_link

o lien video :
https://drive.google.com/file/d/1JoQRrwAps5I15YmtqiTxZuzdvQyQ-FTu/view?usp=drive_link
