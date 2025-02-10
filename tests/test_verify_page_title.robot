*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.wikipedia.org
${BROWSER}        chrome
${EXPECTED_TITLE}  Wikipedia

*** Test Cases ***
Verify Page Title
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    ${EXPECTED_TITLE}
    [Teardown]    Close Browser
