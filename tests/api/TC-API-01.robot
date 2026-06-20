*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API


*** Test Cases ***

TC_API_01 Verify Customer Accounts List
    [Documentation]    Verify accounts API
    [Tags]    api   positive

    
    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}

    Verify Response Code    ${response}    200

    ${body}=    Set Variable    ${response.json()}

    Should Not Be Empty    ${body}

    Log To Console    ${body}
