*** Settings ***
Library    RequestsLibrary
Resource    ../../variables/api_variables.robot

*** Keywords ***
Create Session To API
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session  parabank    ${API_BASE_URL}  headers=${headers}  verify=${False}

Get Customer Accounts
    [Arguments]    ${customerId}

    ${headers}=    Create Dictionary    Accept=application/json

    ${response}=    GET On Session  parabank    /customers/${customerId}/accounts  headers=${headers}  expected_status=any

    RETURN    ${response}

Verify Response Code
    [Arguments]    ${response}    ${code}

    Should Be Equal As Integers  ${response.status_code}    ${code}

Get Account Details
    [Arguments]    ${accountId}

    ${headers}=    Create Dictionary    Accept=application/json

    ${response}=    GET On Session  parabank    /accounts/${accountId}  headers=${headers}  expected_status=any

    RETURN    ${response}

Transfer Funds API
    [Arguments]    ${fromAccountId}    ${toAccountId}    ${amount}

    ${headers}=    Create Dictionary    Accept=application/json

    ${url}=    Set Variable    /transfer?fromAccountId=${fromAccountId}&toAccountId=${toAccountId}&amount=${amount}

    ${response}=    POST On Session  parabank  url=${url}  headers=${headers}

    RETURN    ${response}

Get Account Transactions
    [Arguments]    ${accountId}

    ${headers}=    Create Dictionary    Accept=application/json

    ${response}=    GET On Session  parabank    /accounts/${accountId}/transactions  headers=${headers}

    RETURN    ${response}