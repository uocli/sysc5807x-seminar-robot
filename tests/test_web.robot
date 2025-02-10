*** Settings ***
Documentation       This is a test suite for the web application
Resource        ../resources/common.robot
*** Variables ***

*** Test Cases ***
Should be able to add new customer
    [Documentation]     This is a documentation for the test case
    [Tags]      web    smoke       # tags are used to categorize test cases

    # Slow down selenium for demo
    Set selenium speed   0.2

    # Open browser
    Log     This is a log message
    Open browser    https://automationplayground.com/crm/   chrome
    Maximize browser window

    # Verification
    Page should contain     Customers Are Priority One

    # Go to Login page
    Click link      id=SignIn
    Page should contain     Login

    # Login with credentials
    Input text  id=email-id     robot@framework.com
    Input text  id=password     RoBotFrAmEwOrK
    Click button    id=submit-id
    Page should contain     Our Happy Customers

    Click link  id=new-customer
    Page should contain     Add Customer

    Input text  id=EmailAddress     jdoe@example.com
    Input text  id=FirstName    Jane
    Input text  id=LastName     Doe
    Input text  id=City     Dallas
    Select from list by value   id=StateOrRegion    TX
    Select radio button     gender  female
    Select checkbox     name=promos-name
    Click button    Submit
    Wait until page contains    Success! New customer added.

    Click link  Sign Out
    Wait until page contains    Signed Out

    Close browser

*** Keywords ***
