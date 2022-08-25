######################################################
# Name: lamp
#
# Description: install basic lamp stack
#
# verified OS: CentOS 6.5, Ubuntu 14.04
#
# usage:
# salt <target> state.sls lamp
#
######################################################
# import variables from apache.sls
{% import 'apache/init.sls' as vars %}
# other variable items
{% set db_user = salt['pillar.get']('db-user', 'dbuser') %}
{% set db_name = salt['pillar.get']('db-name', 'dbname') %}
{% set db_pass = salt['pillar.get']('db-pass', 'password') %}
{% set db_host = salt['pillar.get']('db-host', 'localhost') %}

######################################################
# this uses MySQL, PHP and Apche
# 
###################################################### 
include:
  - mysql
  - php
  - apache

######################################################
# setup the database
# 
######################################################       
{{ db_name }}:
  mysql_database.present
  
######################################################
# setup the database user
# 
######################################################       
{{ db_user }}:  
  mysql_user.present:
    - host: {{ db_host }}
    - password: {{ db_pass }}

######################################################
# setup the database user permissions
# 
###################################################### 
db-permissions:
  mysql_grants.present:
    - grant: ALL PRIVILEGES
    - database: {{ db_name }}.*
    - user: {{ db_user }}
    - host: {{ db_host }}
