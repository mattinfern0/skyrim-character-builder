CREATE SEQUENCE perk_graph_column_name_seq;

ALTER SEQUENCE perk_graph_column_name_seq OWNER TO characterbuilderapi;

CREATE TABLE IF NOT EXISTS game_skill
(
    id            BIGSERIAL
        CONSTRAINT game_skill_pk
            PRIMARY KEY,
    internal_name VARCHAR(50) NOT NULL
        CONSTRAINT game_skill_unique_internal_name
            UNIQUE,
    display_name  VARCHAR(50)
);

ALTER TABLE game_skill
    OWNER TO characterbuilderapi;

CREATE TABLE IF NOT EXISTS perk
(
    id            BIGSERIAL
        CONSTRAINT perk_pk
            PRIMARY KEY,
    internal_name VARCHAR(50) NOT NULL
        CONSTRAINT perk_unique_internal_name
            UNIQUE,
    display_name  VARCHAR(100),
    skill_id      BIGINT      NOT NULL
        CONSTRAINT perk_skill_id_fk
            REFERENCES game_skill
);

ALTER TABLE perk
    OWNER TO characterbuilderapi;

CREATE TABLE IF NOT EXISTS perk_level
(
    id                  BIGSERIAL
        CONSTRAINT perk_level_pk
            PRIMARY KEY,
    perk_id             BIGINT  NOT NULL
        CONSTRAINT perk_level_perk_id_fk
            REFERENCES perk,
    description         VARCHAR(100),
    minimum_skill_level INTEGER NOT NULL
        CONSTRAINT perk_level_minimum_skill_level_gte_0
            CHECK (minimum_skill_level >= 0)
);

ALTER TABLE perk_level
    OWNER TO characterbuilderapi;

CREATE TABLE IF NOT EXISTS perk_graph
(
    id BIGINT DEFAULT NEXTVAL('perk_graph_column_name_seq'::regclass) NOT NULL
        CONSTRAINT perk_graph_pk
            PRIMARY KEY
);

ALTER TABLE perk_graph
    OWNER TO characterbuilderapi;

ALTER SEQUENCE perk_graph_column_name_seq OWNED BY perk_graph.id;

CREATE TABLE IF NOT EXISTS perk_graph_node
(
    id            BIGSERIAL
        CONSTRAINT perk_graph_node_pk
            PRIMARY KEY,
    graph_id      BIGINT NOT NULL
        CONSTRAINT perk_graph_node_perk_graph_id_fk
            REFERENCES perk_graph,
    perk_level_id BIGINT NOT NULL
        CONSTRAINT perk_graph_node_perk_level_id_fk
            REFERENCES perk_level,
    CONSTRAINT perk_graph_node_level_once_per_graph
        UNIQUE (graph_id, perk_level_id)
);

ALTER TABLE perk_graph_node
    OWNER TO characterbuilderapi;

CREATE TABLE IF NOT EXISTS perk_graph_edge
(
    id      BIGSERIAL
        CONSTRAINT perk_graph_edge_pk
            PRIMARY KEY,
    from_id BIGINT NOT NULL,
    to_id   BIGINT NOT NULL,
    CONSTRAINT perk_graph_edge_unique_from_to
        UNIQUE (from_id, to_id),
    CONSTRAINT perk_graph_edge_no_self_edge
        CHECK (to_id <> from_id)
);

ALTER TABLE perk_graph_edge
    OWNER TO characterbuilderapi;


