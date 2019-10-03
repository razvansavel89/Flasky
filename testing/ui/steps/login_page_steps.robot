*** Settings ***
Documentation  This abstraction is responsible with exposing generic Login Page Steps to the test implementations

Resource    ../pages/login_page.robot

*** Variables ***
${VALID USER}     test_user
${VALID PASSWORD}    CRFTest1234!

${INVALID USER}     My_invalid_user
${INVALID PASSWORD}    My_invalid_password

*** Keywords ***

Login page should be open
    Location Should Be    ${LOGIN_URL}
    Title Should Be     ${LOGIN_PAGE_TITLE}
    Element Should Contain    ${LOGIN_PAGE_HEADER}   Log In

I expect to be properly redirected to Login Page screen
    Location Should Be    ${LOGIN_URL}
    Title Should Be     ${LOGIN_PAGE_TITLE}
    Element Should Contain    ${LOGIN_PAGE_HEADER}   Log In

Attempt to login by using "${username}" as username and "${password}" as password
    Define "${username}" as Account Username
    Define "${password}" as Account Password
    Click Log In button

Type "${username}" as Account username and "${password}" as Account password
    Define "${username}" as Account Username
    Define "${password}" as Account Password

Define "${username}" as Account Username
    Input Text    ${LOGIN_USERNAME_INPUT}    ${username}

Define "${password}" as Account Password
    Input Text    ${LOGIN_PASSWORD_INPUT}    ${password}

Click Log In button
    Click Button  ${LOGIN_SUBMI_BUTTON}

