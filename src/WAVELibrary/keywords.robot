*** Settings ***

Library  Selenium2Library
Library  String

*** Variables ***

${FF_PROFILE_DIR}  ${CURDIR}/profile

*** Keywords ***

Open WAVE-browser
    [Documentation]  Open Firefox with WAVE-toolbar extension installed.
    Open browser  about:  browser=firefox  ff_profile_dir=${FF_PROFILE_DIR}

Open WAVE browser
    [Documentation]  Open Firefox with WAVE-toolbar extension installed.
    Open browser  about:  browser=firefox  ff_profile_dir=${FF_PROFILE_DIR}

Validate
    [Documentation]  Validate URL for accessibility errors.
    [Arguments]  ${URL}
    Go to  ${URL}
    Show errors, features and alerts
    Capture page screenshot
    ${errors} =  Get errors
    Log  ${errors}
    Should be equal  ${errors}  ${EMPTY}  Wave reported errors for ${URL}

Get errors
    ${source} =  Get source
    ${source} =  Replace string  ${source}  \n  ${EMPTY}
    ${source} =  Replace string  ${source}  "  \n
    ${source} =  Get lines matching regexp  ${source}  ^ERROR:.*
    [return]  ${source}

Show errors, features and alerts
    Execute Javascript
    ...    return (function(){
    ...        window.wave_viewIcons();
    ...        return true;
    ...    })();
