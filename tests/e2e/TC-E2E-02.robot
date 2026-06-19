*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot

Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup       Load Environment And Create Session To API
Test Setup        Open Application And Login
Test Teardown     Close Application

*** Test Cases ***
TC-E2E-02
    [Documentation]    End-to-End Funds Transfer and API Validation Journey

    Click Transfer Funds

    Enter Amount    120

    Select From Account
    
    Select To Account

    Click Transfer Button
    Page Should Contain    Transfer Complete!

    ${response}=    Get Account Transactions    ${ACCOUNT_ID}

    Verify Response Code    ${response}    200

    Should Contain    ${response.text}    120