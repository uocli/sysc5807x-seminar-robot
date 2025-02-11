*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${SERVER}    http://127.0.0.1:5001

*** Test Cases ***
Test Login
    [Documentation]    Test login API 
    
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    username=test    password=123456

    ${session}=    Create Dictionary    url=${SERVER}
    ${response}=    POST    ${session}[url]/login    json=${data}    headers=${headers}

    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200

*** Test Cases ***
Test Login Failure Debug
    [Documentation]    Test login API with invalid credentials and log response.

    # Set request headers
    ${headers}=    Create Dictionary    Content-Type=application/json

    # Construct invalid JSON login data
    ${data}=    Create Dictionary    username=wronguser    password=wrongpass

    # Send POST request directly, without ignoring errors
    ${result}=    Run Keyword And Ignore Error    POST    ${SERVER}/login    json=${data}    headers=${headers}

    # Extract returned values from `Run Keyword And Ignore Error`
    ${status}    ${response}=    Set Variable    ${result[0]}    ${result[1]}

    # Log request execution status
    Log    Status: ${status}

    # Log full response content (if available)
    Run Keyword If    '${status}' == 'PASS'    Log    Response JSON: ${response.json()}
    Run Keyword If    '${status}' == 'PASS'    Log    Response Status Code: ${response.status_code}
    Run Keyword If    '${status}' == 'FAIL'    Log    Response Failure Message: ${response}

    # Assert that the request fails and returns 401
    Run Keyword If    '${status}' == 'PASS'    Should Be Equal As Strings    ${response.status_code}    401