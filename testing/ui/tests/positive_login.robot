*** Settings ***
Documentation  Positive Authentication
...     As a user
...
...     In order to benefit from all the features that the application provides,
...
...     I want to be able to easily login within the system while using valid login data

Resource    ../steps/environment_steps.robot
Resource    ../steps/landing_page_steps.robot
Resource    ../steps/login_page_steps.robot
Resource    ../steps/user_information_page_steps.robot

Force Tags    regression    login   positive

Test Setup  Given the application is running inside the browser
Test Teardown   Close Browser

*** Test Cases ***

Positive Login Test
    [Tags]  smoke
    When Home page should be properly opened
    Then Navigate to Login page
    And Attempt to login by using "${VALID USER}" as username and "${VALID PASSWORD}" as password
    Then I expect to be properly redirected to User Information Page screen
    When I Logout from the application
    Then I expect to be properly redirected to Home Page screen