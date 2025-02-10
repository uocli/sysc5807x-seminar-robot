*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${BASE_URL}  https://dog.ceo/api
${ENDPOINT}  /breeds/image/random

*** Test Cases ***
Get a Random Dog Image
    [Documentation]  Test if the API returns a valid random dog image URL.
    [Tags]  API  Dog
    ${response}  GET  ${BASE_URL}${ENDPOINT}
    Status Should Be  200  ${response}
    Log  ${response.json()}

    # Verify the response structure
    Dictionary Should Contain Key  ${response.json()}  message
    Dictionary Should Contain Key  ${response.json()}  status

    # Validate the status value
    Should Be Equal As Strings  ${response.json()['status']}  success

    # Validate that the message field contains a URL
    Should Contain  ${response.json()['message']}  https://