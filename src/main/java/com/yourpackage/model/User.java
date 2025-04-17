// User.java
package com.yourpackage.model;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String about;
    private String avatarPath;
    private String password;
    private String userType;
    
    // Constructors
    public User() {}
    
    public User(int id, String name, String email, String phone, String userType) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.userType = userType;
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getAbout() { return about; }
    public void setAbout(String about) { this.about = about; }
    
    public String getAvatarPath() { return avatarPath; }
    public void setAvatarPath(String avatarPath) { this.avatarPath = avatarPath; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getUserType() { return userType; }
    public void setUserType(String userType) { this.userType = userType; }
}