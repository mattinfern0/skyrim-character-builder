package com.github.mattinfern0.characterbuilderapi.common.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "perk_level")
public class PerkLevel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "description")
    private String description;

    @Column(name = "minimum_skill_level")
    private int minimumSkillLevel;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMinimumSkillLevel() {
        return minimumSkillLevel;
    }

    public void setMinimumSkillLevel(int minimumSkillLevel) {
        this.minimumSkillLevel = minimumSkillLevel;
    }
}
