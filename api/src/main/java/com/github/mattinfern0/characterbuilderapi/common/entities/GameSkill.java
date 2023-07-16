package com.github.mattinfern0.characterbuilderapi.common.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "game_skill")
public class GameSkill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "internal_name")
    private String internalName;

    @Column(name = "display_name")
    private String displayName;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getInternalName() {
        return internalName;
    }

    public void setInternalName(String internalName) {
        this.internalName = internalName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
}
