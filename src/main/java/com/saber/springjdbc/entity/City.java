package com.saber.springjdbc.entity;


import java.sql.Timestamp;
import java.util.Objects;

public class City {
    private Long id;
    private String name;
    private Byte statusCode;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private Timestamp deletedAt;

    public City() {
    }

    public City(String name, Byte statusCode, Timestamp createdAt, Timestamp updatedAt) {
        this.name = name;
        this.statusCode = statusCode;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public City(Long id, String name, Byte statusCode, Timestamp createdAt, Timestamp updatedAt, Timestamp deletedAt) {
        this.id = id;
        this.name = name;
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
        City city = (City) o;
        return Objects.equals(id, city.id) && Objects.equals(name, city.name) && Objects.equals(statusCode, city.statusCode) && Objects.equals(createdAt, city.createdAt) && Objects.equals(updatedAt, city.updatedAt) && Objects.equals(deletedAt, city.deletedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, statusCode, createdAt, updatedAt, deletedAt);
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", statusCode=" + statusCode +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", deletedAt=" + deletedAt +
                '}';
    }
}
