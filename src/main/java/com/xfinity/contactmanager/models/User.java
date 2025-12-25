package com.xfinity.contactmanager.models;

import com.xfinity.contactmanager.util.StringHasher;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity // Create a table in database for respective object
public class User {
    @Id
    @GeneratedValue
    private Integer id;
    
    @Column(
        unique = true
    )
    private String name;
    
    @Column
    private String password;

    private Boolean isAdmin = false;

    private Boolean canView = true;

    private Boolean canAdd = false;

    private Boolean canUpdate = false;

    private Boolean canDelete = false;

    
    
    public User() {
    }

    public User(String name, String password) {
        this.name = name;
        this.password = StringHasher.hashStringSHA256(password);
    }

    public User(Integer id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = StringHasher.hashStringSHA256(password);
    }

    public User(String name, String password, Boolean isAdmin) {
        this.name = name;
        this.password = StringHasher.hashStringSHA256(password);
        this.isAdmin = isAdmin;
    }

    public User(Integer id, String name, String password, Boolean isAdmin) {
        this.id = id;
        this.name = name;
        this.password = StringHasher.hashStringSHA256(password);
        this.isAdmin = isAdmin;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = StringHasher.hashStringSHA256(password);
    }


    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Boolean getCanView() {
        return canView;
    }

    public void setCanView(Boolean canView) {
        this.canView = canView;
    }

    public Boolean getCanAdd() {
        return canAdd;
    }

    public void setCanAdd(Boolean canAdd) {
        this.canAdd = canAdd;
    }

    public Boolean getCanUpdate() {
        return canUpdate;
    }

    public void setCanUpdate(Boolean canUpdate) {
        this.canUpdate = canUpdate;
    }

    public Boolean getCanDelete() {
        return canDelete;
    }

    public void setCanDelete(Boolean canDelete) {
        this.canDelete = canDelete;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((password == null) ? 0 : password.hashCode());
        result = prime * result + ((isAdmin == null) ? 0 : isAdmin.hashCode());
        result = prime * result + ((canView == null) ? 0 : canView.hashCode());
        result = prime * result + ((canAdd == null) ? 0 : canAdd.hashCode());
        result = prime * result + ((canUpdate == null) ? 0 : canUpdate.hashCode());
        result = prime * result + ((canDelete == null) ? 0 : canDelete.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        User other = (User) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (password == null) {
            if (other.password != null)
                return false;
        } else if (!password.equals(other.password))
            return false;
        if (isAdmin == null) {
            if (other.isAdmin != null)
                return false;
        } else if (!isAdmin.equals(other.isAdmin))
            return false;
        if (canView == null) {
            if (other.canView != null)
                return false;
        } else if (!canView.equals(other.canView))
            return false;
        if (canAdd == null) {
            if (other.canAdd != null)
                return false;
        } else if (!canAdd.equals(other.canAdd))
            return false;
        if (canUpdate == null) {
            if (other.canUpdate != null)
                return false;
        } else if (!canUpdate.equals(other.canUpdate))
            return false;
        if (canDelete == null) {
            if (other.canDelete != null)
                return false;
        } else if (!canDelete.equals(other.canDelete))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + name + ", password=" + password + ", isAdmin=" + isAdmin + ", canView="
                + canView + ", canAdd=" + canAdd + ", canUpdate=" + canUpdate + ", canDelete=" + canDelete + "]";
    }

}
