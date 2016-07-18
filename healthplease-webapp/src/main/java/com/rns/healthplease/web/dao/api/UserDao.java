package com.rns.healthplease.web.dao.api;

import java.util.List;

import org.hibernate.Session;

import com.rns.healthplease.web.dao.domain.RequestCollections;
import com.rns.healthplease.web.dao.domain.Users;
import com.rns.healthplease.web.dao.domain.Users1;

public interface UserDao {
	
	void addNewuser(Users users, Session session);
	Users1 getUsers1ByEmail(String email, Session session);
	Users getUsersByUsername(String username, Session session);
	void editUser(Users users, Session session);
	void addRequestCollection(RequestCollections collections, Session session);
	List<Users> getUsersForLab(int labId, Session session);
	List<Users> getAdmins(Session session);
	List<Users> getAllUsers(Session session);
	List<RequestCollections> getAllRequestCollections(String string, Session session);
	
}
