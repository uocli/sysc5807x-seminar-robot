*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEFAULT_BROWSER}    Chrome
${DEFAULT_URL}    about:blank
${DEFAULT_OPTIONS}    HEADLESS_CHROME_OPTIONS

*** Keywords ***
Open broswer
    [Arguments]    ${url}=${DEFAULT_URL}    ${browser}=${DEFAULT_BROWSER}
    ${options}=    HEADLESS_CHROME_OPTIONS
    Open Browser    ${url}    ${browser}    options=${options}
    Maximize Browser Window

*** Keywords ***
HEADLESS_CHROME_OPTIONS
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    headless
    Call Method    ${options}    add_argument    disable-gpu
    Return From Keyword    ${options}