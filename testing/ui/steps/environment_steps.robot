*** Settings ***
Documentation  This abstraction is responsible with exposing a @BeforeEach test method the test implementations

Resource    ../config/config.robot

*** Keywords ***
The application is running inside the browser
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Implicit Wait   ${IMPLICIT_WAIT_INTERVAL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}