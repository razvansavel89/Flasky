*** Settings ***
Documentation   This abstraction is responsible with exposing the variables used inside login_page_steps.robot file

Resource    ../config/config.robot

*** Variables ***

${LOGIN_URL}                ${URL}/login
${LOGIN_PAGE_TITLE}         Log In - Demo App
${LOGIN_PAGE_HEADER}        css = section h1
${LOGIN_USERNAME_INPUT}     css = input#username
${LOGIN_PASSWORD_INPUT}     css = input#password
${LOGIN_SUBMI_BUTTON}       xpath = //input[@value='Log In']