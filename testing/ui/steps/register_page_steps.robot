*** Settings ***
Documentation  This abstraction is responsible with exposing generic Register Page Steps to the test implementations

Resource    ../pages/register_page.robot
Resource    ../test_data/accounts.robot

*** Keywords ***

Registration page should be open
    Location Should Be    ${REGISTER_URL}
    Title Should Be       ${REGISTER_PAGE_TITLE}
    Element Should Contain    ${REGISTER_PAGE_HEADER}   Register

And I try to register a Valid account
#    ${d} =    get time
    Define "${VALID_USER_USERNAME}" as Username
    Define "${VALID_USER_PASS}" as Password
    Define "${VALID_USER_FIRST_NAME}" as First Name
    Define "${VALID_USER_LAST_NAME}" as Last Name
    Define "${VALID_USER_PHONE}" as Phone Number
    Then Click on Register button

Define "${username_value}" as Username
    Input Text    ${REGISTER_USERNAME_INPUT}    ${username_value}

Define "${password_value}" as Password
    Input Text    ${REGISTER_PASSWORD_INPUT}    ${password_value}

Define "${f_name_value}" as First Name
    Input Text    ${REGISTER_F_NAME_INPUT}    ${f_name_value}

Define "${l_name_value}" as Last Name
    Input Text    ${REGISTER_L_NAME_INPUT}    ${l_name_value}

Define "${phone_value}" as Phone Number
    Input Text    ${REGISTER_PHONE_INPUT}    ${phone_value}

Click on Register button
    Click Button    ${REGISTER_SUBMIT_BUTTON}

Each and every input field should be marked as invalid
