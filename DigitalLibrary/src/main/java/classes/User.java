package classes;

public class User {
	private int UID;
	private String Username;
	private String Password;
	private String Admin;
	public User(int UID , String Username , String Password , String Admin) {
		this.UID = UID;
		this.Username = Username;
		this.Password = Password;
		this.Admin = Admin;
	}
	
	public int getUID() {
		return UID;
	}
	
	public String getUsername() {
		return Username;
	}
	
	public String getPassword() {
		return Password;
	}
	
	public String getAdmin() {
		return Admin;
	}
	
}
