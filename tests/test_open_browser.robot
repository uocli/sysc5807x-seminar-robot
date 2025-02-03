*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${INITIAL_URL}    about:blank

*** Test Cases ***
Open Browser
    [Documentation]    This is a documentation line for test casse 10001
    [Tags]    100001    Login    Smoke
    Ouvrir le navigateur
    Maximize Browser Window
    Sleep3Seconds
    Go To    url=https://google.ca
    Sleep3Seconds
    关闭浏览器



*** Keywords ***

Sleep3Seconds
    Sleep    3s

Ouvrir le navigateur
    Open Browser    ${INITIAL_URL}    ${BROWSER}    --headless

关闭浏览器
    Close All Browsers