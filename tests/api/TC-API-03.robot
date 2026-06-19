*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC_API_03 Verify Account Exists In Customer Accounts List
    [Documentation]    Verify newly created account exists in customer account list
    [Tags]    api

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}

    Verify Response Code    ${response}    200

    Log To Console    ${response.text}

    Should Contain    ${response.text}    ${ACCOUNT_ID}