*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
MaximizeWindow
    Maximize Browser Window

Set1SecDelay
    # Each statement will take 1 second to execute.
    Set Selenium Speed    1 seconds
