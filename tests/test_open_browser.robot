*** Settings ***
Resource    ../resources/common.robot

*** Test Cases ***
Open Browser
    [Documentation]    This is a documentation line for test casse 10001
    [Tags]    100001    Login    Smoke
    common.Open browser
    Go To    url=https://google.ca
    Close All Browsers

*** Keywords ***
