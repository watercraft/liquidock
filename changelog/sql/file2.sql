-- liquibase formatted sql 

-- changeset alan:create_group
create table _group (
        id uuid primary key,
        create_time timestamp default now() not null,
        create_user_id uuid not null,
        modify_time timestamp default now() not null,
        modify_user_id uuid not null,
        customer text not null,
        name text not null,
        data jsonb not null,
        deployment_ids jsonb default '[]' not null
        );
create unique index _group_customer_name_unique on _group(customer,name);

--rollback drop table _group cascade
