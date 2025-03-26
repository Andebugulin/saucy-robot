*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Page elements
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      id=login-button     
${ERROR_MESSAGE}     id=error-message

*** Keywords ***
Verify Login Page Loaded
    Wait Until Element Is Visible    ${USERNAME_FIELD}
    Element Should Be Visible        ${USERNAME_FIELD}
    Element Should Be Visible        ${PASSWORD_FIELD}
    Element Should Be Visible        ${LOGIN_BUTTON}
Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Element    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button

Verify Error Message
    [Arguments]    ${expected_message}
    Element Should Contain    ${ERROR_MESSAGE}    ${expected_message}