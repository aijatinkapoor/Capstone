*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/home_variables.robot

*** Keywords ***
Click Open New Account
    Click Element    ${OPEN_NEW_ACCOUNT_URL}

Click Transfer Funds
    Wait Until Element Is Visible    ${TRANSFER_FUNDS_URL}    timeout=10s
    Click Element    ${TRANSFER_FUNDS_URL}