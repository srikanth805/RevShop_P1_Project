package com.revature.dao;


import java.util.List;

import com.revature.model.Product;
import com.revature.model.Wishlist;

public interface WishlistDAO {
	void addToWishlist(Wishlist wishlist);
    List<Wishlist> getWishlistByUserId(Long userId);
    void removeFromWishlist(Long userId, Long productId);


}
