package com.hotel.dao;

import com.hotel.model.Room;
import jakarta.persistence.EntityManager;
import java.util.List;

public class RoomDao {
    public List<Room> findAll() {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery("SELECT r FROM Room r", Room.class).getResultList();
        } finally {
            em.close();
        }
    }

    public Room findById(Long id) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.find(Room.class, id);
        } finally {
            em.close();
        }
    }

    public void save(Room room) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            if (room.getId() == null) {
                em.persist(room);
            } else {
                em.merge(room);
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
            Room r = em.find(Room.class, id);
            if (r != null) {
                // First delete all reservations associated with this room to avoid FK
                // constraint violation
                int deletedCount = em.createQuery("DELETE FROM Reservation res WHERE res.room.id = :rid")
                        .setParameter("rid", id)
                        .executeUpdate();
                System.out.println("Deleted " + deletedCount + " reservations for room " + id);

                em.remove(r);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
