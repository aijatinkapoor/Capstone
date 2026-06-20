*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/register_variables.robot

*** Keywords ***
Register btn
    Click Element    ${register}
    Sleep    2s

Registration
    Wait Until Element Is Visible    ${fn}    timeout=20s
    Input Text    ${fn}    Jatin
    Input Text    ${ln}    Kapoor
    Input Text    ${add}    jaipur
    Input Text    ${city}    Jaipur
    Input Text    ${state}    Rajasthan
    Input Text    ${zip}    302033
    Input Text    ${phone}    9876543212
    Input Text    ${ssn}    223455
    Input Text    ${user}    jatin123
    Input Text    ${pass}    Jatin@123
    Input Text    ${conf_pass}    Jatin@123

    Click Element    ${rgstr_btn}