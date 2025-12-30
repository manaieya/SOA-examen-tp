package com.projet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.projet.entity.Person;

public class PersonServiceImpl implements PersonService{
	//factory pour creer un entitymanager appelé projet tel qu'il est mentionné dans persistence.xml
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("projet");
	//cet entitymanager permet de communiquer avec la base de donnée
	EntityManager em = emf.createEntityManager();
	@Override
    public Map<String, Object> addPerson(Person p) {
        Map<String, Object> result = new HashMap<>();

        try {
        	/*cette ligne existe pratiquement dans toutes les operation pour la securité: s'assurer 
        	qu'il n ya pas autre transaction ouverte */
            if (!em.getTransaction().isActive())
            	//demarrage de la transaction 
                em.getTransaction().begin();
            //pour l'enregistrement de l'objet Person dans la base ->equivalentde insert into 
            em.persist(p);
            //validation de la transaction 
            em.getTransaction().commit();
            //pour vider l'objet de l'entitymanager 
            em.clear();

            result.put("Status", "OK");
            result.put("Person", p);
        } catch (Exception e) {
            e.printStackTrace();

            if (em.getTransaction().isActive())
            	//annuler toute modification apportée pour assurer la coherance du traitement et de la base 
                em.getTransaction().rollback();

            result.put("Status", "KO");
        }

        return result;
    }

    @Override
    public boolean deletePerson(long id) {
        try {
            if (!em.getTransaction().isActive())
                em.getTransaction().begin();
            //effectue la recherche d'une personne sinon retourne null si elle n'existe pas 
            Person p = em.find(Person.class, id);
            if (p != null) {
                em.remove(p);//l'equivalent de l'operation delete 
                em.getTransaction().commit();
                return true;
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();

            if (em.getTransaction().isActive())
                em.getTransaction().rollback();
        }

        return false;
    }

    @Override
    public Map<String, Object> updatePerson(Person p) {
        Map<String, Object> result = new HashMap<>();

        try {
            if (!em.getTransaction().isActive())
                em.getTransaction().begin();
            //met à jour les données et retourne un obje géré par JPA 
            Person updatedPerson = em.merge(p);//l'equivalent de l'update 
            em.getTransaction().commit();
            em.clear();

            result.put("Status", "OK");
            result.put("Person", updatedPerson);
        } catch (Exception e) {
            e.printStackTrace();

            if (em.getTransaction().isActive())
                em.getTransaction().rollback();

            result.put("Status", "KO");
        }

        return result;
    }

    @Override
    public Map<String, Object> getPersonById(long id) {
        Map<String, Object> result = new HashMap<>();

        try {
            Person p = em.find(Person.class, id);

            if (p != null) {
                result.put("Status", "OK");
                result.put("Person", p);
            } else {
                result.put("Status", "NOT_FOUND");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("Status", "KO");
        }

        return result;
    }

    @Override
    public Map<String, Object> getAllPersons() {
        Map<String, Object> result = new HashMap<>();
        /* il s'agit d'une requete JPQL qui recupere toutes les personnes 
         * et les retourne dans une liste */
        try {
            List<Person> persons = em
                    .createQuery("SELECT p FROM Person p", Person.class)
                    .getResultList();

            result.put("Status", "OK");
            //affecte le resultat à un map 
            result.put("Persons", persons);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("Status", "KO");
        }

        return result;
    }
}