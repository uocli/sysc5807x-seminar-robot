*** Settings ***
Library    ../libs/python/UtilityLibrary.py

*** Test Cases ***
Concatenate Strings Test
    ${result}=    Concatenate Strings    Hello    World    This    is    a    test
    Should Be Equal    ${result}    Hello World This is a test

Split String Test
    ${result}=    Split String    Hello-World-This-is-a-test    -
    Should Be Equal    ${result[0]}    Hello
    Should Be Equal    ${result[1]}    World
    Should Be Equal    ${result[2]}    This
    Should Be Equal    ${result[3]}    is
    Should Be Equal    ${result[4]}    a
    Should Be Equal    ${result[5]}    test

Get File Extension Test
    ${extension}=    Get File Extension    example.txt
    Should Be Equal    ${extension}    .txt

    ${extension}=    Get File Extension    image.jpg
    Should Be Equal    ${extension}    .jpg

    ${extension}=    Get File Extension    document.pdf
    Should Be Equal    ${extension}    .pdf
