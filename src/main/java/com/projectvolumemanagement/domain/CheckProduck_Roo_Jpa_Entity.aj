// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.projectvolumemanagement.domain;

import com.projectvolumemanagement.domain.CheckProduck;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect CheckProduck_Roo_Jpa_Entity {
    
    declare @type: CheckProduck: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long CheckProduck.id;
    
    @Version
    @Column(name = "version")
    private Integer CheckProduck.version;
    
    public Long CheckProduck.getId() {
        return this.id;
    }
    
    public void CheckProduck.setId(Long id) {
        this.id = id;
    }
    
    public Integer CheckProduck.getVersion() {
        return this.version;
    }
    
    public void CheckProduck.setVersion(Integer version) {
        this.version = version;
    }
    
}