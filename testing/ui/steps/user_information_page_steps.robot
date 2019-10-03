*** Settings ***
Documentation  This abstraction is responsible with exposing generic Home Page Steps to the test implementations

Resource    ../pages/user_information_page.robot

*** Keywords ***
I expect to be properly redirected to User Information Page screen
#    Wait For Condition      return document.body.querySelector("nav a[href='/logout']") == "Log Out"
    Element Should Be Visible   ${LOGOUT_LINK}
    Title Should Be     ${USER_INFORMATION_PAGE_TITLE}

I Logout from the application
    Click Link  ${LOGOUT_LINK}

I check if previously defined user information can be found on User Information screen
    Element Should Contain    ${USER_NAME_VALUE_CONTAINER}       ${VALID_USER_USERNAME}
    Element Should Contain    ${FIRST_NAME_VALUE_CONTAINER}      ${VALID_USER_FIRST_NAME}
    Element Should Contain    ${LAST_NAME_VALUE_CONTAINER}       ${VALID_USER_LAST_NAME}
    Element Should Contain    ${PHONE_VALUE_CONTAINER}           ${VALID_USER_PHONE}