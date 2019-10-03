*** Settings ***
Documentation   This abstraction is responsible with exposing the variables used inside register_page_steps.robot file

Resource    ../config/config.robot

*** Variables ***

${REGISTER_URL}                ${URL}/register
${REGISTER_PAGE_TITLE}         Register - Demo App
${REGISTER_PAGE_HEADER}        css = section h1
${REGISTER_USERNAME_INPUT}     username
${REGISTER_PASSWORD_INPUT}     password
${REGISTER_F_NAME_INPUT}       firstname
${REGISTER_L_NAME_INPUT}       lastname
${REGISTER_PHONE_INPUT}        phone
${REGISTER_SUBMIT_BUTTON}      css = form input[type=submit]