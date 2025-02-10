*** Settings ***
Library           SeleniumLibrary

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Variables ***
${SERVER}         http://127.0.0.1:5000
${BROWSER}        Chrome

*** Test Cases ***
Open Website
    [Documentation]    Verify that the main website page opens.
    Open Main Website Page
    Main Page Should Be Open

Valid Login
    [Documentation]    Tests a valid login scenario.
    Input Text    id:username    test
    Input Text    id:password    123456
    Click Button    css:button[type='submit']
    Page Should Contain    Login successful

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${SERVER}/static/login.html    ${BROWSER}
    Maximize Browser Window

Open Main Website Page
    Go To    ${SERVER}/static/login.html 

Main Page Should Be Open
    Wait Until Page Contains   Log in   10s
