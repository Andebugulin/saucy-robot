*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource          ./resources/pages/login_page.robot
Resource          ./resources/pages/home_page.robot
Resource          ./resources/pages/cart_page.robot

*** Variables ***
${URL}  http://localhost:8000/docs/
${BROWSER}   headlessfirefox

*** Keywords ***
open browsers
    open browser    ${URL}    ${BROWSER}
    Set Selenium Speed    0.1
    Maximize Browser Window

*** Test Cases ***
Test Case User Journey
    [Documentation]    Test Case User flow
    [Tags]    test
    open browsers

    Verify Login Page Loaded
    Login With Credentials    standard_user    secret_sauce
    Verify Home Page Loading
    Buy N Product    1
    Buy N Product    2
    Go To Cart
    Verify Cart Page Loaded
    Remove N Product from Cart    1
    Fill Information and Complete Purchase  Andrei    Surname    123456
    Verify Purchase Completed
    Sleep    2

    Close All Browsers