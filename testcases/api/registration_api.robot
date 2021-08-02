*** Setting ***
Resource        ${CURDIR}/../../keywords/api_import.robot 


*** Test Cases ***
TC01: Registration Api Successfully
    # set data test
    ${randomInt}=    api_common_keywords.Generate a random Interger
    ${userFirstName}=    api_common_keywords.Catenate two Strings    ${user}[fistName]    ${randomInt}
    ${userLastName}=    api_common_keywords.Catenate two Strings    ${user}[lastName]    ${randomInt}
    ${userEmail}=    api_common_keywords.Catenate three Strings    ${user}[emailUser]    ${randomInt}    ${user}[emailDomain]

    # call API
    registration_api.Call Registration Api    ${userFirstName}    ${userLastName}    ${userEmail}    ${user}[password]   
    #validate
    registration_api.Verify Successful Registration    ${apiCode}[ok]    ${apiMessage}[success]    

TC02: Registration Api failed with existed email
    # set data test
    ${userEmail}=    api_common_keywords.Catenate two Strings    ${user}[emailUser]    ${user}[emailDomain]
    # call API
    registration_api.Call Registration Api    ${user}[fistName]    ${user}[lastName]    ${userEmail}    ${user}[password]   
    #validate
    registration_api.Verify Error Message    ${apiCode}[ok]    ${apiCode}[badRequest]    ${apiMessage}[errExistedEmail]

TC03: Registration Api failed with empty first name
    # set data test
    ${randomInt}=    api_common_keywords.Generate a random Interger
    ${userLastName}=    api_common_keywords.Catenate two Strings    ${user}[lastName]    ${randomInt}
    ${userEmail}=    api_common_keywords.Catenate three Strings    ${user}[emailUser]    ${randomInt}    ${user}[emailDomain]
    # call API
    registration_api.Call Registration Api    ${EMPTY}    ${userLastName}    ${userEmail}    ${user}[password]   
    #validate
    registration_api.Verify Error Message    ${apiCode}[ok]    ${apiCode}[badRequest]    ${apiMessage}[errEmptyFirstName]  

TC04: Registration Api failed with invalid email
    # call API
    registration_api.Call Registration Api    ${user}[fistName]    ${user}[lastName]    ${user}[emailUser]    ${user}[password]   
    #validate
    registration_api.Verify Error Message    ${apiCode}[ok]    ${apiCode}[badRequest]    ${apiMessage}[errInvalidEmail]  