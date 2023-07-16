package com.github.mattinfern0.characterbuilderapi.common.entities;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class Perk {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "internal_name")
    private String internalName;

    @Column(name = "display_name")
    private String displayName;
}
