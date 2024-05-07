#!/bin/bash
set -x
export PATH=/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
liquibase -execute-sql --sql="create schema if not exists myschema"
liquibase update
