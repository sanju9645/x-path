# x-path
The only place where slashes mean something other than 'cut here'!

# XPath Tutorials

 - To execute the XPath.robot file, open sampleForm.html on a live server and update the URL with ${URL} in resources/variables/Variable.robot

## Basic Format of XPath
```xpath
XPath = //tagname[@Attribute='Value']
Example: //input[@id='first_name'] (RCVAcademy)
```

---

## Types of XPath
1. **Absolute XPath**
   - Starts with a single `/`
   - Goes from the root node to the desired node

2. **Relative XPath**
   - Starts with double `//`
   - Starts from any node in the HTML structure

---

## 1 `starts-with()` Function in XPath
```xpath
XPath = //tagname[starts-with(@Attribute, 'Value')]
Example: //input[starts-with(@placeholder, 'Enter your username')]
```

Example HTML:
```html
<input type="text" id="username" name="username" placeholder="Enter your username..">
```

Usage:
```xpath
Input Text: xpath://input[starts-with(@placeholder, 'Enter your username')] (Anonymous)
```

---

## 2 `contains()` Function in XPath
```xpath
XPath = //tagname[contains(@Attribute, 'Value')]
Example: //input[contains(@placeholder, 'your username')]
```

Example HTML:
```html
<input type="text" id="username" name="username" placeholder="Enter your username..">
```

Usage:
```xpath
Input Text: xpath://input[contains(@placeholder, 'your username')] (On Your Left)
```

---

## 3 `text()` Function in XPath
```xpath
XPath = //tagname[text()='ActualText']
Example: //label[text()='Profile Picture:']
```

Example HTML:
```html
<input type="text" id="username" name="username" placeholder="Enter your username..">
```

Usage:
```xpath
Wait Until Element Is Visible: xpath://label[text()='Profile Picture:']
```

---

## 4 AND & OR in XPath
1. **AND**
   ```xpath
   XPath = //tagname[contains(@Attribute, 'Value') and @Attribute='value']
   Example: //input[contains(@placeholder, 'your username') and @id='username']
   ```

   Example HTML:
   ```html
   <input type="text" id="username" name="username" placeholder="Enter your username..">
   ```

   Usage:
   ```xpath
   Input Text: xpath://input[contains(@placeholder, 'your username') and @id='username'] (Tom and Jerry)
   ```

2. **OR**
   ```xpath
   XPath = //tagname[contains(@Attribute, 'Value') or @Attribute='value']
   Example: //input[contains(@placeholder, 'your username') or @id='username1']
   ```

   Example HTML:
   ```html
   <input type="text" id="username" name="username" placeholder="Enter your username..">
   ```

   Usage:
   ```xpath
   Input Text  xpath://input[contains(@placeholder, 'your username') or @id='username1' ]  Tom and Jerry
   ```
---

## 5 XPath Axes Methods: `parent`, `child`, and `self`
- Used to locate nodes relative to a specified context node

1. **parent**
   - Selects the parent of the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//parent::tagname
   Example: //select[@id='preferences']//parent::div[contains(@id, 'parent_of_select')]
   ```

   Usage:
   ```xpath
     Wait Until Element Is Visible  xpath://select[@id='preferences']//parent::div[contains(@id, 'parent_of_select')]
   ```

2. **child**
   - Selects all children of the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//child::tagname
   Example: //div[@id='parent_of_select']//child::select[@id='preferences']
   ```
   
   Usage:
   ```xpath
       Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//child::select[@id='preferences']
   ```

3. **self**
   - Selects the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//self::tagname
   Example: //div[@id='parent_of_select']//self::div[@class='Parent of select']
   ```

   Usage:
   ```xpath
      Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//self::div[@class='Parent of select']
   ```
   
Example HTML:
```html
<div class="Parent of select" id="parent_of_select">
   Parent of select
   <br>
   <label for="preferences">Choose your preferences:</label>
   <select id="preferences" name="preferences" multiple>
         <option value="technology">Technology</option>
         <option value="science">Science</option>
   </select>
</div>
```

---

## 7 XPath Axes Methods: `descendant`, `descendant-or-self`
     
1. **descendant**
   - It selects all descendants (children, grandchildren, etc.) of the context (current) node.
   ```xpath
   XPath = //tagname[@Attribute='Value']//descendant::tagname
   ```

2. **descendant-or-self**
   - It selects context(Current) node and all of its descendants like (children, grandchildren etc) if tagname for descendants and self are same
   ```xpath
   XPath = //tagname[@Attribute='Value']//descendant-or-self::tagname
   ```

Example Usage:
```xpath
  # Use descendant to locate all option tags within select#preferences
  Wait Until Element Is Visible  xpath://select[@id='preferences']//descendant::option
    
  # Use descendant-or-self to locate 'parent_of_select' div and all descendants
  Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//descendant-or-self::*
  Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//descendant-or-self::option | //div[@id='parent_of_select']//descendant-or-self::label 
  Wait Until Element Is Visible  xpath://div[@id='parent_of_select']//descendant-or-self::select[@id='preferences']
```

Example HTML:
```html
<div class="Parent of select" id="parent_of_select">
   Parent of select
   <br>
   <label for="preferences">Choose your preferences (hold down the Ctrl or Command key to select multiple options):</label>
   <select id="preferences" name="preferences" multiple>
         <option value="technology">Technology</option>
         <option value="science">Science</option>
         <option value="finance">Finance</option>
         <option value="health">Health & Wellness</option>
         <option value="art">Art & Design</option>
         <option value="environment">Environment</option>
   </select>
</div>
```

---

## 8 XPath Axes Methods: `ancestor`, `ancestor-or-self`
1. **ancestor**
   - It selects all of the ancestors (parent, grandparent etc) of context (Current) node
   ```xpath
   XPath = //tagname[@Attribute='Value']//ancestor::tagname
   ```

2. **ancestor-or-self**
   - It selects context(Current) node and all of its ancestors like (parent, grandparent etc) if tagname for ancestors and self are same
   ```xpath
   XPath = //tagname[@Attribute='Value']//ancestor-or-self::tagname
   ```

Example Usage:
```xpath
  Wait Until Element Is Visible  xpath://label[@for='preferences']//ancestor::div
  Wait Until Element Is Visible  xpath://select[@id='preferences']//ancestor-or-self::*
  Wait Until Element Is Visible  xpath://select[@id='preferences']//ancestor-or-self::div[@id='parent_of_select']
```

Example HTML:
```html
<div class="Parent of select" id="parent_of_select">
   Parent of select
   <br>
   <label for="preferences">Choose your preferences (hold down the Ctrl or Command key to select multiple options):</label>
   <select id="preferences" name="preferences" multiple>
         <option value="technology">Technology</option>
         <option value="science">Science</option>
         <option value="finance">Finance</option>
         <option value="health">Health & Wellness</option>
         <option value="art">Art & Design</option>
         <option value="environment">Environment</option>
   </select>
</div>
```

---

## 9 XPath Axes Methods: `following`, `following-sibling`
1. **following**
   - It selects all the nodes that appear after the context (Current) node
   ```xpath
   XPath = //tagname[@Attribute='Value']//following::tagname
   ```

2. **following-sibling**
   - It selects all of the nodes that have the same parent as the context (Current) node and appear after the context (Current) node 
   ```xpath
   XPath = //tagname[@Attribute='Value']//following-sibling::tagname
   ```

Example Usage:
```xpath
   Wait Until Element Is Visible  xpath://div[@id='first_child_of_country_select']//following::label
   Wait Until Element Is Visible  xpath://div[@id='first_child_of_country_select']//following::html  #Error
   Wait Until Element Is Not Visible  xpath://div[@id='first_child_of_country_select']//following::html


   Wait Until Element Is Visible  xpath://div[@id='second_child_of_country_select']//following-sibling::select[@id='country']
   Wait Until Element Is Not Visible  xpath://div[@id='second_child_of_country_select']//following-sibling::select[@id='preferences']
   Wait Until Element Is Not Visible  xpath://div[@id='second_child_of_country_select']//following-sibling::div[@id='first_child_of_country_select']
   Wait Until Element Is Visible  xpath://div[@id='second_child_of_country_select']//following-sibling::div[@id='first_child_of_country_select']  #Error
```

Example HTML:
```html
<div class="parent of country select" id="parent_of_country_select">
   <div id="first_child_of_country_select"></div>
   <div id="second_child_of_country_select">
         <label for="country" id="country_label">Country:</label>
         <select id="country" name="country">
            <option value="usa">USA</option>
            <option value="canada">Canada</option>
            <option value="uk">UK</option>
         </select>
   </div>
</div>
<br><br>

<div class="Parent of select" id="parent_of_select">
   Parent of select
   <br>
   <label for="preferences">Choose your preferences (hold down the Ctrl or Command key to select multiple options):</label>
   <select id="preferences" name="preferences" multiple>
         <option value="technology">Technology</option>
         <option value="science">Science</option>
         <option value="finance">Finance</option>
         <option value="health">Health & Wellness</option>
         <option value="art">Art & Design</option>
         <option value="environment">Environment</option>
   </select>
</div>
```
---

## 10 XPath Axes Methods: `preceding`, `preceding-sibling`
1. **preceding**
   - It selects all the nodes that appear before the context (Current) node
   ```xpath
   XPath = //tagname[@Attribute='Value']//preceding::tagname
   ```

2. **preceding-sibling**
   - It selects all of the nodes that have the same parent as the context (Current) node and appear before the context (Current) node 
   ```xpath
   XPath = //tagname[@Attribute='Value']//preceding-sibling::tagname
   ```
```

Example Usage:
```xpath
  Wait Until Element Is Visible  xpath://div[@id='second_child_of_country_select']//preceding::select[@id="country"]
  Wait Until Element Is Not Visible  xpath://div[@id='second_child_of_country_select']//preceding::div[@id="first_child_of_country_select"]
  Wait Until Element Is Not Visible  xpath://div[@id='first_child_of_country_select']//preceding::select[@id="preferences"]
  Wait Until Element Is Visible  xpath://select[@id='country']//preceding-sibling::div[@id='second_child_of_country_select']  #Error
  Wait Until Element Is Visible  xpath://select[@id='country']//preceding-sibling::label[@id='country_label']
```

Example HTML:
```html
<div class="parent of country select" id="parent_of_country_select">
    <div id="first_child_of_country_select"></div>
    <div id="second_child_of_country_select">
        <label for="country" id="country_label">Country:</label>
        <select id="country" name="country">
            <option value="usa">USA</option>
            <option value="canada">Canada</option>
            <option value="uk">UK</option>
        </select>
    </div>
</div>
<br><br>

<div class="Parent of select" id="parent_of_select">
    Parent of select
    <br>
    <label for="preferences">Choose your preferences (hold down the Ctrl or Command key to select multiple options):</label>
    <select id="preferences" name="preferences" multiple>
        <option value="technology">Technology</option>
        <option value="science">Science</option>
        <option value="finance">Finance</option>
        <option value="health">Health & Wellness</option>
        <option value="art">Art & Design</option>
        <option value="environment">Environment</option>
    </select>
</div>
<br><br>

```
