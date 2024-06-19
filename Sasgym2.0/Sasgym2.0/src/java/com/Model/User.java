package com.Model;

/**
 *
 * @author Muhamad Syahmi S62602
 */
public class User {

    protected int id;
    protected String username;
    protected String password;
    protected String name;
    protected String age;
    protected String gender;
    protected String phoneNo;
    
      public User() {
    }

    public User(String username,String password,String name,String age, String gender,String phoneNo) 
    {
        super();
        this.username = username;
        this.password = password;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.phoneNo = phoneNo;
    }
    
     public User(int id, String name,String age, String gender,String phoneNo) 
    {
        super();
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.phoneNo = phoneNo;
    }

    public User(int id, String username,String password,String name,String age, String gender,String phoneNo) 
    {
        super();
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.phoneNo = phoneNo;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

 
}
