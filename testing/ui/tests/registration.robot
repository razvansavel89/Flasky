*** Settings ***
Documentation   As a user
...
...     In order to benefit from all the features that the application provides,
...
...     I want to be able to easily register within the system

Resource    ../test_data/accounts.robot
Resource    ../steps/environment_steps.robot
Resource    ../steps/landing_page_steps.robot
Resource    ../steps/login_page_steps.robot
Resource    ../steps/register_page_steps.robot
Resource    ../steps/user_information_page_steps.robot

Force Tags    regression    registration

Test Setup  Given the application is running inside the browser
Test Teardown   Close Browser

*** Test Cases ***

Positive Registration Test
    [Tags]  positive    smoke
    When Home page should be properly opened
    Then Navigate to Registration page
    And I try to register a Valid account
    Then I expect to be properly redirected to Login Page screen
    And Attempt to login by using "${VALID_USER_USERNAME}" as username and "${VALID_USER_PASS}" as password
    Then I expect to be properly redirected to User Information Page screen
    And I check if previously defined user information can be found on User Information screen
    I Logout from the application

Negative Registration Test
    [Tags]  negative
    When Home page should be properly opened
    Then Navigate to Registration page
    And Click on Register button
    Then Registration page should be open