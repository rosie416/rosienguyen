*** Setting ***
Resource    ${CURDIR}/../../api_import.robot

*** Variables ***
${response}

*** Keywords ***

Call Registration Api
    [Documentation]    This method write to search currently for TV with inchs size option.
    [Arguments]    ${firstName}    ${lastName}    ${email}    ${password} 
    ${end_point}=   api_common_keywords.Catenate two Strings    ${api}[base_url]    ${api}[registrationPath]
    &{request_header}=    Create Dictionary    content-type=application/json
    ${request_body}=    JSONLibrary.Load JSON From File     ${CURDIR}/../payload/registration_payload.json
    ${request_body}=    JSONLibrary.Update Value To Json    ${request_body}    $..input.firstname    ${firstName}
    ${request_body}=    JSONLibrary.Update Value To Json    ${request_body}    $..input.lastname    ${lastName}
    ${request_body}=    JSONLibrary.Update Value To Json    ${request_body}    $..input.email    ${email}
    ${request_body}=    JSONLibrary.Update Value To Json    ${request_body}    $..input.password    ${password}
    ${body}=    Evaluate    json.dumps($request_body)    json
    ${header}=    Evaluate    json.dumps($request_header)    json
    ${response}=    REST.Post    endpoint=${end_point}    headers=${header}    body=${body}
    Set Test Variable    ${response}


Verify Successful Registration 
    [Arguments]    ${statusCode}    ${message}
    REST.Integer    response status    ${statusCode}
    ${response_body}=    REST.Output    response body
    ${actualMess}=   JSONLibrary.Get Value From Json    ${response_body}    $..message
    Should Contain   ${actualMess}    ${message}

Verify Error Message
    [Arguments]    ${statusCode}    ${detailStatus}    ${detailMessage}
    REST.Integer    response status    ${statusCode}
    ${response_body}=    REST.Output    response body
    ${actualDetailStatus}=   JSONLibrary.Get Value From Json    ${response_body}    $..response.status
    ${actualDetailStatus}=    Convert To String    ${actualDetailStatus} 
    Should Contain    ${actualDetailStatus}      ${detailStatus} 
    ${actualDetailMessage}=   JSONLibrary.Get Value From Json    ${response_body}    $..response.body.message
    Should Contain   ${actualDetailMessage}    ${detailMessage} 
 


