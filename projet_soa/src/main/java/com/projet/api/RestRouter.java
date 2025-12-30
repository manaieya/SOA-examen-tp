package com.projet.api;
import javax.ws.rs.core.Response;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.projet.entity.Person;
import com.projet.service.PersonService;
import com.projet.service.PersonServiceImpl;

// classe contenant l'ensemble des URI (routes REST)
 
@Path("/persons")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class RestRouter {

    // Injection manuelle du service
    PersonService personService = new PersonServiceImpl();

    /*
     URL : /test/persons/add
     */
    @POST
    @Path("/add")
    public Map<String, Object> addPerson(Person p) {
        return personService.addPerson(p);
    }

    /*
      URL : /test/persons/delete/{id}
     */
    @DELETE
    @Path("/delete/{id}")
    public boolean deletePerson(@PathParam("id") long id) {
        return personService.deletePerson(id);
    }

    /*
      URL : /test/persons/update
     */
    @PUT
    @Path("/update")
    public Map<String, Object> updatePerson(Person p) {
        return personService.updatePerson(p);
    }

    /*
      URL : /test/persons/get/{id}
     */
    @GET
    @Path("/get/{id}")
    public Map<String, Object> getPersonById(@PathParam("id") long id) {
        return personService.getPersonById(id);
    }

    /*
     URL : /test/persons/all
     */
    @GET
    @Path("/all")
    public Map<String, Object> getAllPersons() {
        return personService.getAllPersons();
    }
}

