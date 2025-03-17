*** Settings ***
Library    SeleniumLibrary

# *** Variables ***
# ${BROWSER}    chromium
# ${HEADLESS}    false

*** Keywords ***

Set Chrome Options
    [Arguments]    ${prefs}
    Create Dictionary    args=--use-fake-ui-for-media-stream    prefs=${prefs}
    Set Variable    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chrome_options}    add_argument    --use-fake-ui-for-media-stream
    [Return]    ${chrome_options}

Start Chrome With Media Permissions
    [Arguments]    ${url}
    ${prefs}    Create Dictionary    profile.default_content_setting_values.media_stream_camera=1    profile.default_content_setting_values.media_stream_mic=1
    ${chrome_options}    Set Chrome Options    ${prefs}
    Open Browser    ${url}    browser=chrome    options=${chrome_options}
    Maximize Browser Window

Setup Chat Flow
    [Arguments]    ${url}    ${username}    ${room}    ${msg}
    Open Browser    url=${url}   browser=chrome
    # Start Chrome With Media Permissions
    # ${caps}=    Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.CHROME    sys, selenium
    # # Set To Dictionary    ${caps}    goog:loggingPrefs    {"browser": "ALL"}
    # Create WebDriver    Chrome    desired_capabilities=${caps}
    Maximize Browser Window
    Input Text    username    ${username}
    Input Text    room    ${room}
    Input Text    message    ${msg}
    Click Button     id:setUsername
    Click Button     id:join
    Click Button     id:dm
    Click Button     id:startButton
    Sleep    10s
    # Sleep    5s
    # Close Browser