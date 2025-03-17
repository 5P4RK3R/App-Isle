*** Settings ***
Library    Process
# Library    SeleniumLibrary
Library    AppiumLibrary

# Resource    ../resources/keywords/chat.robot
# *** Variables ***
# ${BROWSER}    chromium
# ${HEADLESS}    false


# *** Keywords ***
# Set Chrome Options
#     [Arguments]    ${prefs}
#     Create Dictionary    args=--use-fake-ui-for-media-stream    prefs=${prefs}
#     Set Variable    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#     Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
#     Call Method    ${chrome_options}    add_argument    --use-fake-ui-for-media-stream
#     [Return]    ${chrome_options}

# Start Chrome With Media Permissions
#     [Arguments]    ${url}
#     ${prefs}    Create Dictionary    profile.default_content_setting_values.media_stream_camera=1    profile.default_content_setting_values.media_stream_mic=1
#     ${chrome_options}    Set Chrome Options    ${prefs}
#     Open Browser    ${url}    browser=chrome    options=${chrome_options}
# # Get Console Logs
# #     ${logs}=    Get WebDriver Logs    browser
# #     [Return]    ${logs}
# Setup Chat Flow
#     [Arguments]    ${url}    ${username}    ${room}    ${msg}
#     Open Browser    url=${url}   browser=chrome
#     ${caps}=    Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.CHROME    sys, selenium
#     # Set To Dictionary    ${caps}    goog:loggingPrefs    {"browser": "ALL"}
#     Create WebDriver    Chrome    desired_capabilities=${caps}
#     Maximize Browser Window
#     Input Text    username    ${username}
#     Input Text    room    ${room}
#     Input Text    message    ${msg}
#     Click Button     id:setUsername
#     Click Button     id:join
#     Click Button     id:dm
#     Click Button     id:startButton
#     Sleep    10s
#     # Sleep    5s
#     # Close Browser

# *** Test Cases ***
# Open Browser
#     Setup Chat Flow    url=http://localhost/   room=test    msg=hi    username=customer 
#     Setup Chat Flow    url=http://localhost/   room=test    msg=hey    username=support 
#     Click Button     id:stopButton
#     Close All Browsers


*** Variables ***
${AUTOMATION_NAME}    APPISLE
${PLATFORM_NAME}    iOS
${PLATFORM_VERSION}    14.4
${DEVICE_NAME}    iPhone 12
${APP}    ../output/macos/MacOS/app_isle.app
${UDID}    your_device_udid

*** Test Cases ***
Launch App and Verify
    # Open Application    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    app=${APP}    udid=${UDID}
    # Open Application    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    app=${APP}    udid=${UDID}
    Open Application  http://127.0.0.1:4723/wd/hub  automationName=${AUTOMATION_NAME}
    ...  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}
    ...  app=${APP}  appPackage=io.appium.android.apis  appActivity=.app.SearchInvok
    # Your test steps go here
    Close Application