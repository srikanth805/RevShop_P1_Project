package com.revature.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@Entity
@ToString
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 500)
	private String title;

	@Column(length = 5000)
	private String description;

	private String category;

	private Double price;

	private int stock;

	private String image;

	private int discount;

	private Double discountPrice;

	private Boolean isActive;

	// New columns added
	@Column(length = 50)
	private String type; // male, female, kids

	@Column(length = 100)
	private String subCategory; // e.g., kurta, sherwani

	@Column(length = 20)
	private String size; // e.g., S, M, L, XL



	public Product(Integer id) {
		this.id = id;
	}


	public Product() {
		super();
	}
//
// public Integer getId() {
// return id;
// }
//
// public void setId(Integer id) {
// this.id = id;
// }
//
// public String getTitle() {
// return title;
// }
//
// public void setTitle(String title) {
// this.title = title;
// }
//
// public String getDescription() {
// return description;
// }
//
// public void setDescription(String description) {
// this.description = description;
// }
//
// public String getCategory() {
// return category;
// }
//
// public void setCategory(String category) {
// this.category = category;
// }
//
// public Double getPrice() {
// return price;
// }
//
// public void setPrice(Double price) {
// this.price = price;
// }
//
// public int getStock() {
// return stock;
// }
//
// public void setStock(int stock) {
// this.stock = stock;
// }
//
// public String getImage() {
// return image;
// }
//
// public void setImage(String image) {
// this.image = image;
// }
//
// public int getDiscount() {
// return discount;
// }
//
// public void setDiscount(int discount) {
// this.discount = discount;
// }
//
// public Double getDiscountPrice() {
// return discountPrice;
// }
//
// public void setDiscountPrice(Double discountPrice) {
// this.discountPrice = discountPrice;
// }
//
// public Boolean getIsActive() {
// return isActive;
// }
//
// public void setIsActive(Boolean isActive) {
// this.isActive = isActive;
// }

}