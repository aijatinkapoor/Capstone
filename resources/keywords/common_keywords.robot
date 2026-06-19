*** Settings ***
Library  SeleniumLibrary
Library  ../../config/environment.py
Resource    ../../variables/login_variables.robot
Resource    api_keywords.robot

*** Variables ***
${BROWSER}  chrome
${ENV}  qa

*** Keywords ***
Load Environment
    Load Env    ${ENV}  
    ${url}=  Get Env    baseurl
    ${username}=  Get Env    user_id
    ${password}=  Get Env    user_password

    Set Global Variable    ${BASE_URL}    ${url}
    Set Global Variable    ${USERNAME}  ${username}
    Set Global Variable    ${PASSWORD}  ${password}

Open Application
    [Documentation]  Opens the application
    Should Not Be Empty    ${BASE_URL}    Base URL must not be empty. Please set it in config/environment.yaml
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window
    Sleep    2s


Close Application
    [Documentation]  Closing the application
    Close All Browsers

Login
    [Documentation]    Logs in to the parabank with the provided username and password
    Input Text    ${USERNAME_FIELD}  ${USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}
    Sleep    2s

Open Application And Login
    Open Application
    Login

Load Environment And Create Session To API
    Load Environment
    Create Session To API

Set GLobal Timeout
    Set Selenium Timeout    10s