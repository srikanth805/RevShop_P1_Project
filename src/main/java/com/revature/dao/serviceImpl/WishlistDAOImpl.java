package com.revature.dao.serviceImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.revature.dao.WishlistDAO;
import com.revature.model.Wishlist;

@Repository
public class WishlistDAOImpl implements WishlistDAO {


	@Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addToWishlist(Wishlist wishlist) {
        sessionFactory.getCurrentSession().saveOrUpdate(wishlist);
    }

    @Override
    public List<Wishlist> getWishlistByUserId(Long userId) {
        return sessionFactory.getCurrentSession()
            .createQuery("from Wishlist where userId = :userId", Wishlist.class)
            .setParameter("userId", userId)
            .list();
    }

    @Override
    public void removeFromWishlist(Long userId, Long productId) {
        sessionFactory.getCurrentSession()
            .createQuery("delete from Wishlist where userId = :userId and productId = :productId")
            .setParameter("userId", userId)
            .setParameter("productId", productId)
            .executeUpdate();
    }


}
