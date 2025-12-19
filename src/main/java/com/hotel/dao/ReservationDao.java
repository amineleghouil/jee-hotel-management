package com.hotel.dao;

import com.hotel.model.Reservation;
import jakarta.persistence.EntityManager;
import java.time.LocalDate;
import java.util.List;

public class ReservationDao {
    public boolean isRoomAvailable(Long roomId, LocalDate start, LocalDate end) {
        return findConflictingReservations(roomId, start, end).isEmpty();
    }

    public List<Reservation> findConflictingReservations(Long roomId, LocalDate start, LocalDate end) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            // Check for overlaps: (StartA < EndB) and (EndA > StartB)
            String jpql = "SELECT r FROM Reservation r WHERE r.room.id = :roomId " +
                    "AND r.status = 'CONFIRMED' " +
                    "AND r.startDate < :end AND r.endDate > :start";

            return em.createQuery(jpql, Reservation.class)
                    .setParameter("roomId", roomId)
                    .setParameter("start", start)
                    .setParameter("end", end)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void save(Reservation res) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            if (res.getId() == null)
                em.persist(res);
            else
                em.merge(res);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Reservation> findByUser(Long userId) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery("SELECT r FROM Reservation r WHERE r.user.id = :uid", Reservation.class)
                    .setParameter("uid", userId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Reservation> findAll() {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery("SELECT r FROM Reservation r", Reservation.class).getResultList();
        } finally {
            em.close();
        }
    }

    public void cancel(Long id) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            Reservation r = em.find(Reservation.class, id);
            if (r != null) {
                r.setStatus("CANCELLED");
                em.merge(r);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
