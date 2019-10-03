*** Settings ***
Documentation  This abstraction is responsible with exposing generic Home Page Steps to the test implementations

Resource    ../pages/error_page.robot

*** Keywords ***
I should be redirected to error page screen
      Wait For Condition      return document.title== "Login Failure - Demo App"
      Title Should Be     ${ERROR_PAGE_TITLE}

I expect "${error_title}" error title be displayed on the screen
    Element Should Contain   ${ERROR_PAGE_TITLE_ELEMENT}   ${error_title}

I expect "${error_message}" error message be displayed on the screen
    Element Should Contain    ${ERROR_PAGE_MESSAGE_ELEMENT}     ${error_message}