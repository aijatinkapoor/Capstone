*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC_API_04 Execute Fund Transfer Via API
    [Documentation]    Verify fund transfer API
    [Tags]    api   positive

    ${response}=    Transfer Funds API  ${ACCOUNT_ID}  ${ACCOUNT_ID_2}  150

    Verify Response Code    ${response}    200

    Log To Console    ${response.text}

    Should Contain    ${response.text}    Successfully