-- liquibase formatted sql 

-- changeset alan:create_uuid_ext
CREATE EXTENSION "uuid-ossp";

--rollback drop extension "uuid-ossp"

-- changeset alan:create_user
create table _user (
        id uuid primary key default uuid_generate_v1(),
        create_time timestamp default now() not null,
        create_user_id uuid not null,
        modify_time timestamp default now() not null,
        modify_user_id uuid not null,
        name text not null,
        first_name text not null,
        last_name text not null,
        password bytea not null,
        data jsonb not null,
        customer text not null,
        deployment_id text not null,
        disable boolean not null,
        features jsonb not null,
        validation_token text not null,
        phone_number text default '' not null,
        phone_number_candidate text default '' not null,
        phone_verify_code text default '' not null,
        phone_verify_code_expiry_time timestamp default now() not null,
        group_ids jsonb default '[]' not null,
        role text not null
        );
create unique index _user_name_unique on _user(name);

--rollback drop table _group cascade
