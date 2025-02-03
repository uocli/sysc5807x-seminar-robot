*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${INITIAL_URL}    about:blank
# ${USER_DATA_DIR_SUFFIX}=    Generate Random String    10    ${EMPTY}    lowercase
# ${USER_DATA_DIR}=    ~/tmp/chrome_user_data_${USER_DATA_DIR_SUFFIX}


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
HEADLESS_CHROME_OPTIONS
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    headless
    Call Method    ${options}    add_argument    disable-gpu
    Return From Keyword    ${options}

Sleep3Seconds
    Sleep    3s

Ouvrir le navigateur
    ${headless_options}=    HEADLESS_CHROME_OPTIONS
    Open Browser    ${INITIAL_URL}    ${BROWSER}    options=${headless_options}

关闭浏览器
    Close All Browsers
