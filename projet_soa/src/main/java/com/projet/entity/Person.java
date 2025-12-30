package com.projet.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Persons")
public class Person {
	@Id
	/*j'ai changer auto pour la strategy car elle m'a causé des 
	 * conflits de ID donc j'ai opté pour identity qui correspond à 
	 * l'auto increment natif de MySql */
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@Column(name="userName",nullable=false)
	private String nom;
	@Column(name="userSurname",nullable=false)
	private String prenom;
	@Column(length=3)
	private int age;
	@Column(name="gender")
	private String sexe;
	@Column(length=225)
	private String email;
	
	
	
	
	public String getSexe() {
		return sexe;
	}
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
 