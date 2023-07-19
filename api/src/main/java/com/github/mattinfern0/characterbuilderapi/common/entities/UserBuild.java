package com.github.mattinfern0.characterbuilderapi.common.entities;

import java.time.ZonedDateTime;
import java.util.List;

public class UserBuild {
    Long id;

    ZonedDateTime createdAt;
    ZonedDateTime updatedAt;

    String uuid;
    String displayName;
    String description;

    Integer characterLevel;

    Integer totalHealth;
    Integer totalMagicka;
    Integer totalStamina;

    List<PerkLevel> perks;
    List<UserBuildSkills> skills;


}
