*** Settings ***

Library  Selenium2Library
Library  String

*** Variables ***

${FF_PROFILE_DIR}  ${CURDIR}/profile

*** Keywords ***

Open WAVE browser
    [Documentation]  Open Firefox with WAVE-toolbar extension installed.
    Open browser  about:  browser=firefox  ff_profile_dir=${FF_PROFILE_DIR}

Check URL for accessibility errors
    [Documentation]  Open the given URL and check it for accessibility errors.
    [Arguments]  ${URL}
    Go to  ${URL}
    Check accessibility errors

Check accessibility errors
    [Documentation]  Check the current page for accessibility errors
    Show errors, features and alerts
    ${errors} =  Get errors
    Run keyword if  '${errors}' != '${EMPTY}'  Log errors  ${errors}
    ${url} =  Get location
    Should be equal  ${errors}  ${EMPTY}  Wave reported errors for ${url}
    Hide errors, features and alerts

Log errors
    [Arguments]  ${errors}
    Set tags  Accessibility issues
    Capture page screenshot
    Log  ${errors}  level=ERROR

Get errors
    ${source} =  Get source
    ${source} =  Replace string  ${source}  \n  ${EMPTY}
    ${source} =  Replace string  ${source}  "  \n
    ${source} =  Get lines matching regexp  ${source}  ^ERROR:.*
    [return]  ${source}

Show errors, features and alerts
    Execute Javascript
    ...    return (function(){ window.wave_viewIcons(); return true; })();

Hide errors, features and alerts
    Execute Javascript
    ...    return (function(){ window.wave_viewReset(); return true; })();
