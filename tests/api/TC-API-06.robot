*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC_API_06 Verify Destination Account Balance Credited
    [Documentation]    Verify destination account balance after transfer
    [Tags]    api   positive

    ${response}=    Get Account Details    ${ACCOUNT_ID_2}

    Verify Response Code    ${response}    200

    Log To Console    ${response.text}

    Should Contain    ${response.text}    balance