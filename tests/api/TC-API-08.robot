*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC_API_08 Verify Invalid Account
    [Documentation]    Known defect BUG-001
    [Tags]    api

    ${response}=    Get Account Details    ${INVALID_ID}

    Log To Console    Status: ${response.status_code}
    Log To Console    ${response.text}

    Should Not Be Empty    ${response.text}