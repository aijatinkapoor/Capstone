*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/transfer_funds_variables.robot

*** Keywords ***
Select From Account
    Select From List By Index    ${FROM_ACCOUNT_DROPDOWN}    0
    Sleep    1s

Select To Account
    Select From List By Index    ${TO_ACCOUNT_DROPDOWN}    1
    Sleep    1s

Enter Amount
    [Arguments]    ${amount}
    Input Text    ${AMOUNT_FIELD}    ${amount}
    Sleep    1s

Click Transfer Button
    Click Element    ${TRANSFER_BUTTON}
    Sleep    2s