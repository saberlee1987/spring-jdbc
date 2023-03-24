package com.saber.springjdbc.entity;

import java.sql.Timestamp;
import java.util.Objects;

public class User {
    private Long id;
    private String name;
    private String username;
    private String password;
    private City city;
    private Byte statusCode;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private Timestamp deletedAt;

    public User() {
    }

    public User(String name, String username, String password, City city, Byte statusCode, Timestamp createdAt, Timestamp updatedAt, Timestamp deletedAt) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.city = city;
        this.statusCode = statusCode;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.deletedAt = deletedAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Byte getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(Byte statusCode) {
        this.statusCode = statusCode;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Timestamp getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(Timestamp deletedAt) {
        this.deletedAt = deletedAt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(id, user.id) && Objects.equals(name, user.name) && Objects.equals(username, user.username) && Objects.equals(password, user.password) && Objects.equals(city, user.city) && Objects.equals(statusCode, user.statusCode) && Objects.equals(createdAt, user.createdAt) && Objects.equals(updatedAt, user.updatedAt) && Objects.equals(deletedAt, user.deletedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, username, password, city, statusCode, createdAt, updatedAt, deletedAt);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", city=" + city +
                ", statusCode=" + statusCode +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", deletedAt=" + deletedAt +
                '}';
    }
}