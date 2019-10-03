*** Settings ***
Documentation   This abstraction is responsible with exposing generic Landing Page steps to the test implementations

Resource    ../pages/landing_page.robot
Resource    register_page_steps.robot
Resource    login_page_steps.robot

*** Keywords ***

Home page should be properly opened
    Title Should Be           ${LANDING_PAGE_TITLE}

    Element Should Contain    ${LANDING_PAGE_REGISTER_ELEMENT}   Register
    Element Should Contain    ${LANDING_PAGE_LOGIN_ELEMENT}      Log In

Navigate to Registration page
    Click Link  ${LANDING_PAGE_REGISTER_LINK}
    Registration page should be open

Navigate to Login page
    Click Element  ${LANDING_PAGE_LOGIN_LINK}
    Login page should be open

Expect "${error_title}" error title be displayed on the screen
    Element Should Contain    ${ERROR_PAGE_TITLE}     ${error_title}

Expect "${error_message}" error message be displayed on the screen
    Element Should Contain    ${ERROR_PAGE_MESSAGE}   ${error_message}

I expect to be properly redirected to Home Page screen
    Home page should be properly opened
