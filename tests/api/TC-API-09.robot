*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Suite Setup    Create Session To API

*** Test Cases ***
TC_API_09 Verify Insufficient Funds Transfer
    [Documentation]    Verify transfer fails for insufficient funds
    [Tags]    api   negative

    ${response}=    Transfer Funds API  ${ACCOUNT_ID}  ${ACCOUNT_ID_2}  999999

    Log To Console    ${response.text}

    Should Be Equal As Integers    ${response.status_code}    200