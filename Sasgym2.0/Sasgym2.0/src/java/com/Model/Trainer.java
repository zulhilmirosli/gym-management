package com.Model;

/**
 *
 * @author Muhammad Ariq Iskandar S62678
 */
public class Trainer {

    protected int id;
    protected String name;
    protected String phone;
    protected String email;
    protected String course;
    protected String shift;

     public Trainer() {
    }

    public Trainer(String name,String phone, String email,String course,String shift) {
        super();
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.course = course;
        this.shift = shift;
    }

    public Trainer(int id, String name,String phone, String email,String course,String shift) {
        super();
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.course = course;
        this.shift = shift;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

  
}
