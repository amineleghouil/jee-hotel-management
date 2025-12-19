package com.hotel.dao;

import com.hotel.model.User;
import jakarta.persistence.EntityManager;

import jakarta.persistence.TypedQuery;
import java.util.List;

public class UserDao {
    public User findByUsername(String username) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.username = :username", User.class);
            query.setParameter("username", username);
            List<User> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } finally {
            em.close();
        }
    }

    public User findById(Long id) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.find(User.class, id);
        } finally {
            em.close();
        }
    }

    public List<User> findAll() {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery("SELECT u FROM User u", User.class).getResultList();
        } finally {
            em.close();
        }
    }

    public void save(User user) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            if (user.getId() == null) {
                em.persist(user);
            } else {
                em.merge(user);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            User u = em.find(User.class, id);
            if (u != null) {
                // First delete all reservations associated with this user
                int deletedCount = em.createQuery("DELETE FROM Reservation res WHERE res.user.id = :uid")
                        .setParameter("uid", id)
                        .executeUpdate();
                System.out.println("Deleted " + deletedCount + " reservations for user " + id);

                em.remove(u);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
