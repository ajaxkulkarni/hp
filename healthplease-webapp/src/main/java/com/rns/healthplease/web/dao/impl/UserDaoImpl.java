package com.rns.healthplease.web.dao.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Query;
import org.hibernate.Session;

import com.rns.healthplease.web.dao.api.UserDao;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.RequestCollections;
import com.rns.healthplease.web.dao.domain.Users;
import com.rns.healthplease.web.dao.domain.Users1;

public class UserDaoImpl implements UserDao {

	public void addNewuser(Users user, Session session) {
		if (user.getLoginDetails() == null) {
			return;
		}
		session.persist(user.getLoginDetails());
		session.persist(user);
	}

	public Users1 getUsers1ByEmail(String email, Session session) {
		Query createQuery = session.createQuery("from Users1 where username=:email");
		createQuery.setString("email", email);
		List<Users1> users = createQuery.list();
		if (CollectionUtils.isEmpty(users)) {
			return null;
		}
		return users.get(0);
	}

	public Users getUsersByUsername(String username, Session session) {
		Query createQuery = session.createQuery("from Users where loginDetails.username=:login");
		createQuery.setString("login", username);
		List<Users> users = createQuery.list();
		if (CollectionUtils.isEmpty(users)) {
			return null;
		}
		return users.get(0);
	}

	public List<Labs> getJoinResult(int locationId, Session session) {
		Query createQuery = session.createQuery("from Labs where id=:loc_id");
		createQuery.setInteger("loc_id", locationId);
		return createQuery.list();
	}

	public void editUser(Users users, Session session) {
		session.update(users);
	}

	public void addRequestCollection(RequestCollections collections, Session session) {
		session.persist(collections);
	}

	public List<Users> getUsersForLab(int labId, Session session) {
		Query createQuery = session.createQuery("from Users where loginDetails.group.id=:admin_group AND loginDetails.labId=:lab_id");
		createQuery.setInteger("lab_id", labId);
		createQuery.setInteger("admin_group", 3);
		return createQuery.list();
	}
	
	public List<Users> getAdmins(Session session) {
		Query createQuery = session.createQuery("from Users where loginDetails.group.id=:admin_group");
		createQuery.setInteger("admin_group", 2);
		return createQuery.list();
	}

	@Override
	public List<Users> getAllUsers(Session session) {
		Query createQuery = session.createQuery("from Users");
		return createQuery.list();
	}

	public List<RequestCollections> getAllRequestCollections(String requestType, Session session) {
		Query createQuery = session.createQuery("from RequestCollections where requestedFor=:req_type");
		createQuery.setShort("req_type", Short.valueOf(requestType));
		return createQuery.list();
	}
	
}
