*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC_API_08 Verify Invalid Account
    [Documentation]    Verify GET Account Details for Non-Existent Account ID 
    [Tags]    api   negative

    ${response}=    Get Account Details    ${INVALID_ID}

    Log To Console    Status: ${response.status_code}
    Log To Console    ${response.text}


    Should Be Equal As Integers  ${response.status_code}  200