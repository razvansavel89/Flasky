*** Settings ***
Documentation   This file is responsible with exposing the TEST DATA
Library           SeleniumLibrary

*** Variables ***
${d} =    get time
${VALID_USER_USERNAME}           test_account_B${d}
${VALID_USER_PASS}               test_account_password
${VALID_USER_FIRST_NAME}         Account First Name
${VALID_USER_LAST_NAME}          Account Last Name
${VALID_USER_PHONE}              123124123123