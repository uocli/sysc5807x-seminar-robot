*** Settings ***
Resource    ../resources/common.robot

*** Test Cases ***
Test Open Browser
    [Documentation]    This is a documentation line for test case 10001
    [Tags]    100001    Login    Smoke
    common.Open Browser
    Go To    url=https://google.ca
    Close All Browsers

*** Keywords ***
