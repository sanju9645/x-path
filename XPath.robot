*** Settings ***
Resource    ../resource/keywords/Keywords.robot
Resource    ../resource/variables/Variables.robot

*** Test Cases ***
TC to Demonstrate Web Locators in Robot Framework
  [Documentation]  This is a sample test case to demonstrate web locators in Robot Framework.
  Open Browser  ${URL}  ${BROWSER}
  Input Text  xpath://input[@id='username']  TestUser
  Sleep  2s
  Close Browser


starts-with Function in XPath
  Open Browser  ${URL}  ${BROWSER}
  Input Text  xpath://input[starts-with(@placeholder, 'Enter your username')]  Anonymus
  Sleep  2s
  Close Browser


contains Function in XPath
  Open Browser  ${URL}  ${BROWSER}
  Input Text  xpath://input[contains(@placeholder, 'your username')]  On Your Left
  Sleep  2s
  Close Browser


text Function in XPath
  Open Browser  ${URL}  ${BROWSER}
  Wait Until Element Is Visible  xpath://label[text()='Profile Picture:']
  Sleep  2s
  Close Browser


AND & OR in XPath
  Open Browser  ${URL}  ${BROWSER}
  Input Text  xpath://input[contains(@placeholder, 'your username') or @id='username1' ]  Tom and Jerry
  Sleep  2s
  Input Text  xpath://input[contains(@placeholder, 'your username') and @id='username' ]  Tom and Jerry
  Sleep  2s
  Close Browser


XPath Axes Methods: parent, child, and self
  Open Browser  ${URL}  ${BROWSER}
  Wait Until Element Is Visible  xpath://select[@id='preferences']//parent::div[contains(@id, 'parent_of_select')]
  Sleep  2s
  Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//child::select[@id='preferences']
  Sleep  2s
  Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//self::div[@class='Parent of select']
  Sleep  2s
  Close Browser


XPath Axes Methods: descendant and descendant-or-self
  Open Browser  ${URL}  ${BROWSER}
  # # Use descendant to locate all option tags within select#preferences
  Wait Until Element Is Visible  xpath://select[@id='preferences']//descendant::option
    
  # Use descendant-or-self to locate 'parent_of_select' div and all descendants
  Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//descendant-or-self::*
  Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//descendant-or-self::option | //div[@id='parent_of_select']//descendant-or-self::label 
  Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//descendant-or-self::select[@id='preferences']
  Close Browser


XPath Axes Methods: ancestor and ancestor-or-self
  Open Browser  ${URL}  ${BROWSER}
  Wait Until Element Is Visible  xpath://label[@for='preferences']//ancestor::div
  Wait Until Element Is Visible  xpath://select[@id='preferences']//ancestor-or-self::*
  Wait Until Element Is Visible  xpath://select[@id='preferences']//ancestor-or-self::div[@id='parent_of_select']
  Sleep  2s
  Close Browser


XPath Axes Methods: following and following-sibling
  Open Browser  ${URL}  ${BROWSER}
  Wait Until Element Is Visible  xpath://div[@id='first_child_of_country_select']//following::label
  # Wait Until Element Is Visible  xpath://div[@id='first_child_of_country_select']//following::html  #Error
  Wait Until Element Is Not Visible  xpath://div[@id='first_child_of_country_select']//following::html

  Wait Until Element Is Visible  xpath://div[@id='second_child_of_country_select']//following-sibling::select[@id='country']
  Wait Until Element Is Not Visible  xpath://div[@id='second_child_of_country_select']//following-sibling::select[@id='preferences']
  Wait Until Element Is Not Visible  xpath://div[@id='second_child_of_country_select']//following-sibling::div[@id='first_child_of_country_select']
  # Wait Until Element Is Visible  xpath://div[@id='second_child_of_country_select']//following-sibling::div[@id='first_child_of_country_select']  #Error
  Close Browser


XPath Axes Methods: preceding and preceding-sibling
  Open Browser  ${URL}  ${BROWSER}
  Wait Until Element Is Visible  xpath://div[@id='second_child_of_country_select']//preceding::select[@id="country"]
  Wait Until Element Is Not Visible  xpath://div[@id='second_child_of_country_select']//preceding::div[@id="first_child_of_country_select"]
  Wait Until Element Is Not Visible  xpath://div[@id='first_child_of_country_select']//preceding::select[@id="preferences"]
  # Wait Until Element Is Visible  xpath://select[@id='country']//preceding-sibling::div[@id='second_child_of_country_select']  #Error
  Wait Until Element Is Visible  xpath://select[@id='country']//preceding-sibling::label[@id='country_label']
  Sleep  2s
  Close Browser
