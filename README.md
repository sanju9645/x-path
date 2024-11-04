# x-path
The only place where slashes mean something other than 'cut here'!

# XPath Tutorials

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

## `starts-with()` Function in XPath
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

## `contains()` Function in XPath
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

## `text()` Function in XPath
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

## AND & OR in XPath
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

---

## XPath Axes Methods: `parent`, `child`, and `self`
- Used to locate nodes relative to a specified context node

1. **parent**
   - Selects the parent of the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//parent::tagname
   Example: //select[@id='preferences']//parent::div[contains(@id, 'parent_of_select')]
   ```

2. **child**
   - Selects all children of the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//child::tagname
   Example: //div[@id='parent_of_select']//child::select[@id='preferences']
   ```

3. **self**
   - Selects the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//self::tagname
   Example: //div[@id='parent_of_select']//self::div[@class='Parent of select']
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

## XPath Axes Methods: `descendant`, `descendant-or-self`
1. **descendant**
   - Selects all descendants of the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//descendant::tagname
   ```

2. **descendant-or-self**
   - Selects the current node and all of its descendants
   ```xpath
   XPath = //tagname[@Attribute='Value']//descendant-or-self::tagname
   ```

Example Usage:
```xpath
Wait Until Element Is Visible: xpath://select[@id='preferences']//descendant::option
Wait Until Element Is Visible: xpath://div[@id='parent_of_select']//descendant-or-self::*
```

---

## XPath Axes Methods: `ancestor`, `ancestor-or-self`
1. **ancestor**
   - Selects all ancestors of the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//ancestor::tagname
   ```

2. **ancestor-or-self**
   - Selects the current node and all of its ancestors
   ```xpath
   XPath = //tagname[@Attribute='Value']//ancestor-or-self::tagname
   ```

Example Usage:
```xpath
Wait Until Element Is Visible: xpath://label[@for='preferences']//ancestor::div
```

---

## XPath Axes Methods: `following`, `following-sibling`
1. **following**
   - Selects all nodes after the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//following::tagname
   ```

2. **following-sibling**
   - Selects all nodes with the same parent after the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//following-sibling::tagname
   ```

---

## XPath Axes Methods: `preceding`, `preceding-sibling`
1. **preceding**
   - Selects all nodes before the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//preceding::tagname
   ```

2. **preceding-sibling**
   - Selects all nodes with the same parent before the current node
   ```xpath
   XPath = //tagname[@Attribute='Value']//preceding-sibling::tagname
   ```
```
