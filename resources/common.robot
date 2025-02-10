*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEFAULT_BROWSER}    chrome
${DEFAULT_URL}    about:blank
${DEFAULT_HEADLESS}   True

${CHROME_EXECUTABLE}    ${CURDIR}${/}drivers${/}chromedriver    # For macOS
# ${CHROME_EXECUTABLE}    ${CURDIR}${/}drivers${/}chromedriver.exe    # For Windows

${FIREFOX_EXECUTABLE}    ${CURDIR}${/}drivers${/}geckodriver    # For macOS
# ${FIREFOX_EXECUTABLE}    ${CURDIR}${/}drivers${/}geckodriver.exe    # For Windows

*** Keywords ***
Open Browser
    [Arguments]    ${url}=${DEFAULT_URL}    ${browser}=${DEFAULT_BROWSER}    ${headless}=${DEFAULT_HEADLESS}
    Run Keyword If    '${browser}' == 'chrome'    Open Chrome Browser    ${url}    ${headless}
    Run Keyword If    '${browser}' == 'firefox'    Open Firefox Browser    ${url}    ${headless}

Open Chrome Browser
    [Arguments]    ${url}    ${headless}
    Run Keyword If    '${headless}'.lower()=='true'    Open Chrome Browser With Headless    ${url}
    ...    ELSE    Open Chrome Browser Without Headless    ${url}

Open Chrome Browser With Headless
    [Arguments]    ${url}
    ${options}=    Get Chrome Options   headless=True
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

Open Chrome Browser Without Headless
    [Arguments]    ${url}
    ${options}=    Get Chrome Options   headless=False
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

Get Chrome Options
    [Arguments]    ${headless}
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys, selenium.webdriver
    Run Keyword If    ${headless}    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    RETURN    ${options}

Open Firefox Browser
    [Arguments]    ${url}    ${headless}
    Run Keyword If    ${headless}    Open Firefox Browser With Headless    ${url}
    ...    ELSE    Open Firefox Browser Without Headless    ${url}

Open Firefox Browser With Headless
    [Arguments]    ${url}
    ${options}=    Get Firefox Options      headless=True
    Create Webdriver    Firefox    options=${options}
    Go To    ${url}

Open Firefox Browser Without Headless
    [Arguments]    ${url}
    ${options}=    Get Firefox Options    headless=False
    Create Webdriver    Firefox    options=${options}
    Go To    ${url}

Get Firefox Options
    [Arguments]    ${headless}
    ${options}=    Evaluate    sys.modules['selenium.webdriver.firefox.options'].Options()    sys, selenium.webdriver
    Run Keyword If    ${headless}    Call Method    ${options}    add_argument    --headless
    RETURN    ${options}
