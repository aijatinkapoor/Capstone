*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/open_new_account_page.robot
Resource    ../../resources/pages/home_page.robot

Suite Setup    Load Environment And Create Session To API
Test Setup       Open Application And Login
Test Teardown    Close Application

*** Test Cases ***
TC-E2E-01
    [Documentation]    End-to-End Account Provisioning, API Retrieval, and Attribute Verification Journey

    Click Open New Account
    Sleep    1s

    Select Account Type    1
    Click Open Account Button

    ${account_id}=    Get New Account Number

    ${response}=    Get Account Details    ${account_id}

    Log To Console    ${response.text}
    Log To Console    Status=${response.status_code}

    Verify Response Code    ${response}    200

    Should Contain    ${response.text}    ${account_id}

    ${response}=    Get Account Details    ${account_id}

    Verify Response Code    ${response}    200

    Should Contain    ${response.text}    SAVINGS

