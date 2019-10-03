*** Settings ***
Documentation  Negative Authentication
...     As an Admin
...
...     In order to limit the access of unauthorised accounts inside of the application
...
...     I want to check if invalid login data are rejected by any mean
...
Resource    ../pages/error_page.robot
Resource    ../steps/environment_steps.robot
Resource    ../steps/landing_page_steps.robot
Resource    ../steps/login_page_steps.robot
Resource    ../steps/error_page_steps.robot

Force Tags    regression    login   negative

Test Setup     Given the application is running inside the browser
Test Teardown   Close Browser
Test Template   Authentication process should fail

*** Test Cases ***               USER_NAME                  PASSWORD
Invalid Username                 invalid_username           validPassword
Invalid Password                 valid_username             $#$#%^&*(NMUKO8
Invalid Username And Password    $%^%&B^FN*GMJ(Y1UJKU(      ()KJ*HT*%&1255EG&^H%)

*** Keywords ***

Authentication process should fail
    [Arguments]    ${username}    ${pass}

    When Navigate to Login page
    Then Define "${username}" as Account Username
    And Define "${pass}" as Account Password
    When Click Log In button
    Then I should be redirected to error page screen
    And I expect "${ERROR_HEADER}" error title be displayed on the screen
    And I expect "${ERROR_MESSAGE}" error message be displayed on the screen