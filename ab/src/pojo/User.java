package pojo;

/**
 * ¿Í»§Àà
 */
public class User {

	private int userID;
	private String author	;
	private String album;
	private String headimg;
	private String category;
	private String iscanuse;
	
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getHeadimg() {
		return headimg;
	}
	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIscanuse() {
		return iscanuse;
	}
	public void setIscanuse(String iscanuse) {
		this.iscanuse = iscanuse;
	}
}
