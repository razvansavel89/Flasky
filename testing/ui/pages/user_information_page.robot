*** Settings ***
Documentation   This abstraction is responsible with exposing the variables used inside home_page_steps.robot file

Resource    ../config/config.robot

*** Variables ***

${USER_INFORMATION_PAGE_TITLE}      User Information - Demo App
${LOGOUT_LINK}      xpath = //nav//a[text()='Log Out']

${USER_NAME_VALUE_CONTAINER}      username
${FIRST_NAME_VALUE_CONTAINER}     firstname
${LAST_NAME_VALUE_CONTAINER}      lastname
${PHONE_VALUE_CONTAINER}          phone
