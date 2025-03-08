#!/bin/sh
# dbt deps
dbt debug
dbt build
dbt run 
dbt snapshot