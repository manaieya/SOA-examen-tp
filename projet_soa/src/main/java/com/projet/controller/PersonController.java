package com.projet.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;

import com.projet.entity.Person;


public class PersonController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // URL de base de votre API REST (respecte votre pattern /test/*)
    private static final String API_BASE_URL = "http://localhost:8081/projet_soa/test/persons";
    
    private Client client;
    
    @Override
    public void init() throws ServletException {
        client = ClientBuilder.newClient();
    }
    
    @Override
    public void destroy() {
        if (client != null) {
            client.close();
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getPathInfo();
        System.out.println("DEBUG - Action reçue: " + action); // Log
        System.out.println("DEBUG - URL complète: " + request.getRequestURL()); // Log
        System.out.println("DEBUG - Query string: " + request.getQueryString()); // Log
        
        try {
            if (action == null || action.equals("/") || action.equals("/list")) {
                // Vérifier si c'est une recherche
                String searchId = request.getParameter("searchId");
                if (searchId != null && !searchId.trim().isEmpty()) {
                    searchPersonById(request, response);
                } else {
                    listPersons(request, response);
                }
            } else if (action.equals("/add")) {
                showAddForm(request, response);
            } else if (action.equals("/edit")) {
                System.out.println("DEBUG - Édition demandée, ID: " + request.getParameter("id")); // Log
                showEditForm(request, response);
            } else if (action.startsWith("/view/")) {
                viewPerson(request, response);
            } else if (action.startsWith("/delete/")) {
                deletePerson(request, response);
            } else {
                listPersons(request, response);
            }
        } catch (Exception e) {
            System.out.println("DEBUG - Erreur dans doGet: " + e.getMessage()); // Log
            e.printStackTrace(); // Log
            throw new ServletException(e);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getPathInfo();
        System.out.println("DEBUG - Action POST reçue: " + action); // Log
        
        try {
            if (action.equals("/add")) {
                addPerson(request, response);
            } else if (action.equals("/update")) {
                updatePerson(request, response);
            } else if (action.equals("/edit")) {
                // Rediriger vers la méthode doGet pour afficher le formulaire d'édition
                // Cette approche permet de garder la même logique d'affichage
                System.out.println("DEBUG - Redirection vers doGet pour l'édition, ID: " + request.getParameter("id"));
                showEditForm(request, response);
            } else {
                listPersons(request, response);
            }
        } catch (Exception e) {
            System.out.println("DEBUG - Erreur dans doPost: " + e.getMessage()); // Log
            throw new ServletException(e);
        }
    }
    
    private void listPersons(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // Appel à votre API REST existante via /test/persons/all
            Map<String, Object> result = client.target(API_BASE_URL + "/all")
                    .request(MediaType.APPLICATION_JSON)
                    .get(new GenericType<Map<String, Object>>() {});
            
            if ("OK".equals(result.get("Status"))) {
                List<Person> persons = (List<Person>) result.get("Persons");
                request.setAttribute("persons", persons);
            }
            
            request.getRequestDispatcher("/WEB-INF/views/list.jsp").forward(request, response);
            
        } catch (Exception e) {
            request.setAttribute("error", "Erreur: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/list.jsp").forward(request, response);
        }
    }
    
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/add.jsp").forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        System.out.println("DEBUG - showEditForm - ID reçu: " + idParam);
        
        if (idParam == null || idParam.trim().isEmpty()) {
            request.setAttribute("error", "ID manquant pour l'édition");
            response.sendRedirect(request.getContextPath() + "/persons/list");
            return;
        }
        
        try {
            // Appel à l'API REST via JAX-RS - obtention d'une Map
            Map<String, Object> result = client.target(API_BASE_URL + "/get/" + idParam)
                    .request(MediaType.APPLICATION_JSON)
                    .get(new GenericType<Map<String, Object>>() {});
            
            if (result != null && "OK".equals(result.get("Status"))) {
                // Extraire les données de la personne depuis la Map
                @SuppressWarnings("unchecked")
                Map<String, Object> personData = (Map<String, Object>) result.get("Person");
                
                // Créer l'objet Person à partir des données
                Person person = new Person();
                
                // Convertir les valeurs en fonction de leur type
                Object idValue = personData.get("id");
                if (idValue instanceof Number) {
                    person.setId(((Number) idValue).longValue());
                } else if (idValue != null) {
                    person.setId(Long.parseLong(idValue.toString()));
                }
                
                person.setNom((String) personData.get("nom"));
                person.setPrenom((String) personData.get("prenom"));
                
                Object ageValue = personData.get("age");
                if (ageValue instanceof Number) {
                    person.setAge(((Number) ageValue).intValue());
                } else if (ageValue != null) {
                    person.setAge(Integer.parseInt(ageValue.toString()));
                }
                
                person.setSexe((String) personData.get("sexe"));
                person.setEmail((String) personData.get("email"));
                
                request.setAttribute("person", person);
                request.getRequestDispatcher("/WEB-INF/views/edit.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Personne non trouvée avec l'ID: " + idParam);
                response.sendRedirect(request.getContextPath() + "/persons/list");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors du chargement: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/persons/list");
        }
    }
    
    private void viewPerson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo();
        String id = pathInfo.substring("/view/".length());
        
        try {
            // Appel à l'API REST via JAX-RS - obtention d'une Map
            Map<String, Object> result = client.target(API_BASE_URL + "/get/" + id)
                    .request(MediaType.APPLICATION_JSON)
                    .get(new GenericType<Map<String, Object>>() {});
            
            if (result != null && "OK".equals(result.get("Status"))) {
                // Extraire les données de la personne depuis la Map
                @SuppressWarnings("unchecked")
                Map<String, Object> personData = (Map<String, Object>) result.get("Person");
                
                // Créer l'objet Person à partir des données
                Person person = new Person();
                
                // Convertir les valeurs en fonction de leur type
                Object idValue = personData.get("id");
                if (idValue instanceof Number) {
                    person.setId(((Number) idValue).longValue());
                } else if (idValue != null) {
                    person.setId(Long.parseLong(idValue.toString()));
                }
                
                person.setNom((String) personData.get("nom"));
                person.setPrenom((String) personData.get("prenom"));
                
                Object ageValue = personData.get("age");
                if (ageValue instanceof Number) {
                    person.setAge(((Number) ageValue).intValue());
                } else if (ageValue != null) {
                    person.setAge(Integer.parseInt(ageValue.toString()));
                }
                
                person.setSexe((String) personData.get("sexe"));
                person.setEmail((String) personData.get("email"));
                
                request.setAttribute("person", person);
                request.getRequestDispatcher("/WEB-INF/views/view.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Personne non trouvée avec l'ID: " + id);
                request.getRequestDispatcher("/WEB-INF/views/view.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
            request.setAttribute("error", "Erreur lors du chargement: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/view.jsp").forward(request, response);
        }
    }
    
    private void addPerson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Person person = new Person();
        person.setNom(request.getParameter("nom"));
        person.setPrenom(request.getParameter("prenom"));
        person.setAge(Integer.parseInt(request.getParameter("age")));
        person.setSexe(request.getParameter("sexe"));
        person.setEmail(request.getParameter("email"));
        
        try {
            Map<String, Object> result = client.target(API_BASE_URL + "/add")
                    .request(MediaType.APPLICATION_JSON)
                    .post(Entity.entity(person, MediaType.APPLICATION_JSON), 
                          new GenericType<Map<String, Object>>() {});
            
            if ("OK".equals(result.get("Status"))) {
                response.sendRedirect(request.getContextPath() + "/persons/list");
            } else {
                request.setAttribute("error", "Erreur lors de l'ajout");
                request.setAttribute("person", person);
                request.getRequestDispatcher("/WEB-INF/views/add.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Erreur: " + e.getMessage());
            request.setAttribute("person", person);
            request.getRequestDispatcher("/WEB-INF/views/add.jsp").forward(request, response);
        }
    }
    
    private void updatePerson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Person person = new Person();
        
        try {
            // Récupérer et valider les données du formulaire
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.trim().isEmpty()) {
                throw new IllegalArgumentException("ID manquant");
            }
            
            person.setId(Long.parseLong(idStr));
            person.setNom(request.getParameter("nom"));
            person.setPrenom(request.getParameter("prenom"));
            person.setAge(Integer.parseInt(request.getParameter("age")));
            person.setSexe(request.getParameter("sexe"));
            person.setEmail(request.getParameter("email"));
            
            // Validation basique
            if (person.getNom() == null || person.getNom().trim().isEmpty() ||
                person.getPrenom() == null || person.getPrenom().trim().isEmpty() ||
                person.getEmail() == null || person.getEmail().trim().isEmpty()) {
                throw new IllegalArgumentException("Tous les champs obligatoires doivent être remplis");
            }
            
            if (person.getAge() < 0 || person.getAge() > 150) {
                throw new IllegalArgumentException("Âge invalide");
            }
            
            // Appel à l'API REST via JAX-RS pour la mise à jour
            Map<String, Object> result = client.target(API_BASE_URL + "/update")
                    .request(MediaType.APPLICATION_JSON)
                    .put(Entity.entity(person, MediaType.APPLICATION_JSON), 
                         new GenericType<Map<String, Object>>() {});
            
            if (result != null && "OK".equals(result.get("Status"))) {
                // Redirection vers la liste après succès
                response.sendRedirect(request.getContextPath() + "/persons/list");
            } else {
                // En cas d'échec, réafficher le formulaire avec l'erreur
                String errorMsg = (String) result.get("message");
                if (errorMsg == null) errorMsg = "Échec de la mise à jour";
                
                request.setAttribute("error", errorMsg);
                request.setAttribute("person", person);
                request.getRequestDispatcher("/WEB-INF/views/edit.jsp").forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Format de données invalide: " + e.getMessage());
            request.setAttribute("person", person);
            request.getRequestDispatcher("/WEB-INF/views/edit.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Données invalides: " + e.getMessage());
            request.setAttribute("person", person);
            request.getRequestDispatcher("/WEB-INF/views/edit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la mise à jour: " + e.getMessage());
            request.setAttribute("person", person);
            request.getRequestDispatcher("/WEB-INF/views/edit.jsp").forward(request, response);
        }
    }
    
    private void deletePerson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo();
        String id = pathInfo.substring("/delete/".length());
        
        try {
            Response apiResponse = client.target(API_BASE_URL + "/delete/" + id)
                    .request(MediaType.APPLICATION_JSON)
                    .delete();
            
            if (apiResponse.getStatus() == 200) {
                response.sendRedirect(request.getContextPath() + "/persons/list");
            } else {
                request.setAttribute("error", "Échec de suppression");
                listPersons(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Erreur: " + e.getMessage());
            listPersons(request, response);
        }
    }
    
    private void searchPersonById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("searchId");
        
        if (idParam == null || idParam.trim().isEmpty()) {
            listPersons(request, response);
            return;
        }
        
        try {
            long id = Long.parseLong(idParam);
            
            // Appel à votre API REST existante via /test/persons/get/{id}
            Map<String, Object> result = client.target(API_BASE_URL + "/get/" + id)
                    .request(MediaType.APPLICATION_JSON)
                    .get(new GenericType<Map<String, Object>>() {});
            
            if ("OK".equals(result.get("Status"))) {
                // Récupérer la map qui contient les données de la personne
                @SuppressWarnings("unchecked")
                Map<String, Object> personData = (Map<String, Object>) result.get("Person");
                
                // Créer un objet Person à partir des données de la map
                Person person = new Person();
                person.setId(((Number) personData.get("id")).longValue());
                person.setNom((String) personData.get("nom"));
                person.setPrenom((String) personData.get("prenom"));
                person.setAge(((Number) personData.get("age")).intValue());
                person.setSexe((String) personData.get("sexe"));
                person.setEmail((String) personData.get("email"));
                
                List<Person> persons = new ArrayList<>();
                persons.add(person);
                request.setAttribute("persons", persons);
                request.setAttribute("searchPerformed", true);
                request.setAttribute("searchId", idParam);
            } else {
                request.setAttribute("persons", new ArrayList<Person>());
                request.setAttribute("searchPerformed", true);
                request.setAttribute("searchId", idParam);
                request.setAttribute("error", "Aucune personne trouvée avec l'ID: " + idParam);
            }
            
            request.getRequestDispatcher("/WEB-INF/views/list.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID invalide. Veuillez entrer un nombre valide.");
            listPersons(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Erreur lors de la recherche: " + e.getMessage());
            listPersons(request, response);
        }
    }
}
