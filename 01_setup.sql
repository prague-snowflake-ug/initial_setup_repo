use role sysadmin;
create database ADMIN;
use database ADMIN;
create schema GENERAL;
use schema GENERAL;
use role accountadmin;

CREATE OR REPLACE SECRET admin.general.git_secret_ug5
  TYPE = password
  USERNAME = 'prague-snowflake-ug'
  PASSWORD = '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'
;

CREATE OR REPLACE API INTEGRATION git_api_integration_ug5
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/prague-snowflake-ug')
  ALLOWED_AUTHENTICATION_SECRETS = (git_secret_ug5)
  ENABLED = TRUE
;

GRANT USAGE ON SECRET admin.general.git_secret_ug5 TO ROLE sysadmin;
GRANT USAGE ON INTEGRATION git_api_integration_ug5 TO ROLE sysadmin;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE public;
