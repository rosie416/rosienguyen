*** Setting ***
Resource    ${CURDIR}/../../web_import.robot

*** Variables ***
${randomNumber}=    0
${firstName}
${input}


***Keyword***
Generate a random Interger
    ${randomNumber} =      Evaluate    random.randint(1, 1000000)    random
    Set Suite Variable    ${randomNumber}   

Input First Name
    [Arguments]    ${locator}    ${value}
    ${firstName} =    Catenate    SEPARATOR=      ${value}    ${randomNumber}
    Set Test Variable    ${firstName} 
    common_keywords.Input Text    ${locator}    ${firstName}

Input Last Name
    [Arguments]    ${locator}    ${value}
    ${input} =    Catenate    SEPARATOR=      ${value}    ${randomNumber}
    common_keywords.Input Text    ${locator}    ${input}

Input Email
    [Arguments]    ${locator}    ${name}    ${domain}
    ${input} =    Catenate    SEPARATOR=     ${name}   ${randomNumber}    ${domain}
    common_keywords.Input Text    ${locator}    ${input}


Verify Error Message
    [Arguments]    ${locator}    ${error}
    common_keywords.Verify Element is Visible    ${locator}    120
    common_keywords.Verify Element Text    ${locator}    ${error}    

Verify Register Successfully
    #wait until register sussessfully and redirect to home page
    common_keywords.Wait For Location     ${powerbuy}[homePageUrl]    120
    #verify page contains account name
    common_keywords.Verify Page Contain Element    ${homePage}[hrefAccount]
    ${input} =    Catenate    ${firstName}    ${confirmation}[account]
    common_keywords.Verify Element Text    ${homePage}[hrefAccount]    ${input}
    #verify page contains logout link
    common_keywords.Verify Page Contain Element    ${homePage}[hrefLogout]
    common_keywords.Verify Element Text    ${homePage}[hrefLogout]    ${confirmation}[logout]

    
    
    



    



    