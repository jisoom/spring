package kr.or.ddit.item.vo;

import org.springframework.web.multipart.MultipartFile;


//자바빈 클래스
//Data어노테이션 : lombok에서 제공해줌. getter, setter 자동처리
//@Getter, @Setter 어노테이션 : getter, setter 자동 처리
public class Item {
	private int itemId;
	private String itemName;
	private int price;
	private String description;
	private String pictureUrl; //파일명
	//이미지 업로드를 위한 필드
	private MultipartFile picture;
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemName=" + itemName + ", price=" + price + ", description=" + description
				+ ", pictureUrl=" + pictureUrl + ", picture=" + picture + "]";
	}
	
	
	
}
