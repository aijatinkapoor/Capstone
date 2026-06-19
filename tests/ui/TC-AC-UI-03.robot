*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Run Keywords  Load Environment  AND    Set GLobal Timeout
Test Setup        Open Application And Login
Test Teardown     Close Application


*** Test Cases ***
TC-AC-UI-03
    [Documentation]    Navigate to Account Details Screen via Confirmation Banner Link

    Click Open New Account
    Wait Until Location Contains    openaccount

    Select Account Type    0
    Wait Until Element Is Visible    //input[@type='button']


    Click Open Account Button

    Wait Until Page Contains    Account Opened!
    Wait Until Page Contains    Your new account number

    Click Account Details Link
    Wait Until Page Contains    Account Details
    Wait Until Location Contains    activity.htm?id=