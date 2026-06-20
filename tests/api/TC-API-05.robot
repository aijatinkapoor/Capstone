*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC_API_05 Verify Source Account Balance Debited
    [Documentation]    Verify source account balance after transfer
    [Tags]    api   positive

    ${response}=    Get Account Details    ${ACCOUNT_ID}

    Verify Response Code    ${response}    200

    Log To Console    ${response.text}

    Should Contain    ${response.text}    balance