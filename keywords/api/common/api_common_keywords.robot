*** Keywords ***
Generate a random Interger
    ${number}    Evaluate    random.randint(1, 1000000)    random
    [Return]    ${number}      

Catenate two Strings
    [Arguments]    ${text1}    ${text2}
    ${output}=    Catenate    SEPARATOR=    ${text1}    ${text2}
    [Return]    ${output}    

Catenate three Strings
    [Arguments]    ${text1}    ${text2}    ${text3}
    ${output}=    Catenate    SEPARATOR=      ${text1}    ${text2}    ${text3}
    [Return]    ${output}   
    