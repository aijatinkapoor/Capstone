*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC_API_07 Verify Debit Transaction History
    [Documentation]    Verify transaction history for source account
    [Tags]    api   positive

    ${response}=    Get Account Transactions    ${ACCOUNT_ID}

    Verify Response Code    ${response}    200

    Log To Console    ${response.text}

    Should Contain    ${response.text}    Debit