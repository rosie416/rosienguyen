*** Settings ***
# Resource    ${EXECDIR}/keywords/web_import.robot

*** Variables ***
${GLOBALTIMEOUT}     ${15}

*** Keywords ***

Open
    [Arguments]    ${URL}     ${BROWSER}
    Open Browser    ${URL}     ${BROWSER}       
    Maximize Browser Window

Click Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    Selenium2Library.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    Selenium2Library.Click Element  ${locator}

Click Button
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    Selenium2Library.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    Selenium2Library.Click Button  ${locator}

Input Text
    [Arguments]    ${locator}   ${text}     ${timeout}=${GLOBALTIMEOUT}
    Selenium2Library.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    Selenium2Library.Input Text  ${locator}    ${text}

Select Checkbox
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    Selenium2Library.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    Selenium2Library.Select Checkbox  ${locator}

Verify Location
    [Arguments]    ${locator}
    Selenium2Library.Location Should Be    ${locator}
    
Wait For Location
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    Selenium2Library.Wait Until Location Is    ${locator}    timeout=${timeout}

Verify Element is Visible
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    Selenium2Library.Wait Until Element Is Visible     ${locator}    timeout=${timeout}
    Selenium2Library.Element Should Be Visible   ${locator}  

Verify Element Text
    [Arguments]    ${locator}    ${text}    ${timeout}=${GLOBALTIMEOUT}
    Selenium2Library.Element Text Should Be    ${locator}    ${text}
    
Verify Page Contain Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    Selenium2Library.Page Should Contain Element    ${locator}    timeout=${timeout}


    
