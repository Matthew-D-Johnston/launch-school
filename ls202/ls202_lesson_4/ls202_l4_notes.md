##### LS202 HTML and CSS > Lesson 4: Lists and Tables

---

## 1. Introduction

## 2. Lists Overview

Three list types:

* unordered
* ordered 
* description

### Unordered Lists

Unordered lists contain a series of unordered items. By unordered, we mean that there is no visual numbering or naming system for the items in the list. The content itself may have an implicit ordering, perhaps alphabetical, but the browser displays a **bullet** -- a glyph that looks like a small dot, disc, circle, or square -- instead of a number or letter before each item. By default, browsers render unordered lists vertically, each proceeded by a bullet. However, you can choose a horizontal display and hide the bullets. You can even use custom bullets.

### Ordered Lists

Ordered lists have ordered content; that is, they have a sequence that is a visual component of the list. By default, most browsers render a vertical list of numbered items, but you can change this to roman numbers as well as alphabetic letters, including foreign alphabets. Examples of ordered lists include a numbered list of the top 10 programming languages or a numbered list of the steps required to make a pot of coffee.

### Description Lists

Description lists (called definition lists before HTML5) contain a list of terms and definitions. Each item in the list includes one or more terms and one or more definitions. Examples of description lists include dictionaries, bibliographies, and, that relic of the past, the phone book.  

HTML uses the `<dl>`, `<dt>` and `<dd>` tags to construct description lists. Here's a simple example:

```html
<dl>
  <dt>Unordered</dt>
  <dd>A simple list with bullets.</dd>
  <dd>A plain list with no bullets or sequence numbers.</dd>

  <dt>Ordered</dt>
  <dd>A simple list with sequence numbers or letters.</dd>

  <dt>Description</dt>
  <dt>Definition</dt>
  <dd>A list with terms and definitions.</dd>
</dl>
```

### Navigation Menus

For a horizontal list:

* Set the width of the menu (`ul`).
* Set the font for the list (`ul`) to 0, then restore it for the list items (`li`).
* Set the list items to `inline-block`.
* Set the width of the list items to a value that will distribute the values the way you want them distributed (typically, you want a percentage width).
* Center the list items horizontally.

```html
<nav>
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">Projects</a></li>
    <li><a href="#">Team</a></li>
    <li><a href="#">Help</a></li>
  </ul>
</nav>
```

```css
nav ul {
  font-size: 0;
  width: 100%;
}

nav li {
  display: inline-block;
  font-size: 1.25rem;
  text-align: center;
  width: 25%;
}
```

---

## 3. Practice Problems: Lists

1. Using the "Raw Text" shown below, create a Web page that looks like the image pictured below it.

   **Raw Text**

   ```plaintext
   The Next Reckoning: Capitalism and Climate Change
   By NATHANIEL RICH
   The world’s most difficult problem has a solution so simple that it can be
   expressed in four words: Stop burning greenhouse gases. How exactly to pull
   this off is somewhat more complicated — just not as complicated as most
   Americans have been led to believe.
   
   Related articles
   What Survival Looks Like After the Oceans Rise
   How Big Business is Hedging Against the Apocalypse
   Climate Chaos is Coming–and the Pinkertons Are Ready
   ```

   **How it should look in your browser:**

   ![Climate Change Article](https://d3jtzah944tvom.cloudfront.net/202/images/lesson_4/climatechange.png)

   ###### My Solution

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>List Practice</title>
       <meta charset="utf-8" />
       <style>
         body {
           width: 46%;
           font-size: 16px;
         }
   
         h1 {
           font-size: 2rem;
         }
       </style>
     </head>
     <body>
       <article>
         <h1>The Next Reckoning: Capitalism and Climate Change</h1>
         <p>By NATHANIEL RICH</p>
         <p>
           The world’s most difficult problem has a solution so simple that it can be
           expressed in four words: Stop burning greenhouse gases. How exactly to pull
           this off is somewhat more complicated — just not as complicated as most
           Americans have been led to believe.
         </p>
         <h2>Related article</h2>
         <ul>
           <li>What Survival Looks Like After the Oceans Rise</li>
           <li>How Big Business is Hedging Against the Apocalypse</li>
           <li>Climate Chaos is Coming–and the Pinkertons Are Ready</li>
         </ul>
       </article>
     </body>
   </html>
   ```

   ###### LS Solution

   ```html
   <header>
     <h1>The Next Reckoning: Capitalism and Climate Change</h1>
     <p>By NATHANIEL RICH</p>
   </header>
   
   <p>
     The world’s most difficult problem has a solution so simple that it can be
     expressed in four words: Stop burning greenhouse gases. How exactly to
     pull this off is somewhat more complicated — just not as complicated as
     most Americans have been led to believe.
   </p>
   
   <h2>Related articles</h2>
   <ul>
     <li>What Survival Looks Like After the Oceans Rise</li>
     <li>How Big Business is Hedging Against the Apocalypse</li>
     <li>Climate Chaos is Coming–and the Pinkertons Are Ready</li>
   </ul>
   ```

   The `header` provides [semantic meaning](https://developer.mozilla.org/en-US/docs/Glossary/Semantics) to the elements that it contains. Here, it shows that the `h1` and `p` tags are part of the page header. You should use `header` consistently with any part of your page that you think of either a page header or a section header.

2. Add CSS to your solution for the previous problem to remove the bullet character before each list item.

   ###### My Solution

   ```css
   ul {
     list-style: none;
   }
   ```

   ###### LS Solution

   ```css
   ul {
     list-style-type: none;
   }
   ```

3. Using the "Raw Text" shown below, create a Web page that looks like the image pictured below it.

   ###### My Solution

   ```html
   <header>
     <h1>5 Reasons to Use jQuery</h1>
   </header>
   <ol>
     <li>Open Source</li>
     <li>Endless Tutorials</li>
     <li>Huge Library</li>
     <li>Cross-browser Compatibility</li>
     <li>Large Variety of Plugins</li>
   </ol>
   ```

   ###### LS Solution

   ```html
   <h1>5 Reasons to Use jQuery</h1>
   <ol>
     <li>Open Source</li>
     <li>Endless Tutorials</li>
     <li>Huge Library</li>
     <li>Cross-browser Compatibility</li>
     <li>Large Variety of Plugins</li>
   </ol>
   ```

4. Add CSS to your solution for the previous problem to change the numbers from decimal to uppercase Roman digits (I, II, III, IV, V).

   ###### My Solution

   ```css
   ol {
     list-style-type: upper-roman;
   }
   ```

   ###### LS Solution

   ```css
   <style>
     ol {
       list-style-type: upper-roman;
     }
   </style>
   ```

5. Update your solution from the previous problem to number the items in descending order (V, IV, III, II, I).

   ###### My Solution

   ```html
   <ol reversed>
     <li>Open Source</li>
     <li>Endless Tutorials</li>
     <li>Huge Library</li>
     <li>Cross-browser Compatibility</li>
     <li>Large Variety of Plugins</li>
   </ol>
   ```

   ###### LS Solution

   ```html
   <h2>5 Reasons to Use jQuery</h2>
   <ol reversed>
     <li>Open Source</li>
     <li>Endless Tutorials</li>
     <li>Huge Library</li>
     <li>Cross-browser Compatibility</li>
     <li>Large Variety of Plugins</li>
   </ol>
   ```

6. Using the "Raw Text" shown below, create a Web page that looks like the image pictured below it.

   **Raw Text**

   ```plaintext
   HTML
   Hypertext Markup Language, a standardized system for tagging text files to
   achieve font, color, graphic, and hyperlink effects on World Wide Web pages.
   
   Semantic
   Relating to meaning in language or logic.
   
   CSS
   A style sheet language used for describing the presentation of a document
   written in a markup language.
   ```

   **How it should look in your browser:**

   ![Definitions](https://d3jtzah944tvom.cloudfront.net/lesson_2/exercises_basic_html/b3.jpg)

   ###### My Solution

   ```html
   <dl>
     <dt>HTML</dt>
       <dd>
         Hypertext Markup Language, a standardized system for tagging text files to
         achieve font, color, graphic, and hyperlink effects on World Wide Web pages.
       </dd>
     <dt>Semantic</dt>
       <dd>
         Relating to meaning in language or logic.
       </dd>
     <dt>CSS</dt>
       <dd>
         A style sheet language used for describing the presentation of a document
         written in a markup language.
       </dd>
   </dl>
   ```

   ###### LS Solution

   ```html
   <dl>
     <dt>HTML</dt>
     <dd>
       Hypertext Markup Language, a standardized system for tagging text files
       to achieve font, color, graphic, and hyperlink effects on World Wide Web
       pages.
     </dd>
     <dt>Semantic</dt>
     <dd>
       Relating to meaning in language or logic.
     </dd>
     <dt>CSS</dt>
     <dd>
       A style sheet language used for describing the presentation of a
       document written in a markup language.
     </dd>
   </dl>
   ```

7. The following code is an attempt to create a vertical navigation list on a web page:

   ```html
   <nav>
     <ul>
       <li>Home</li>
       <li>Projects</li>
       <li>Team</li>
       <li>Help</li>
     </ul>
   </nav>
   ```

   ```css
   html {
     font-size: 20px;
   }
   
   nav ul {
     background-color: yellow;
     width: 200px;
   }
   
   nav li {
     color: blue;
   }
   
   nav a {
     box-sizing: border-box;
     line-height: 2.5;
     padding: 0 10px;
     text-decoration: none;
     width: 100%;
   }
   ```

   Modify the code to remove the bullets. Each item should be 10px from the left edge of the yellow box. When you point to any line in the menu, the browser should highlight the entire line inside the yellow box. The final result should look like this:

   ![Vertical navbar](https://d3jtzah944tvom.cloudfront.net/202/images/lesson_4/vertical-nav.png)

   ###### My Solution

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>List Practice</title>
       <meta charset="utf-8" />
       <style>
         html {
           font-size: 20px;
         }
   
         nav ul {
           background-color: yellow;
           width: 200px;
           padding-left: 0;
         }
   
         nav li {
           color: blue;
           list-style-type: none;
         }
   
         nav a {
           box-sizing: border-box;
           display: block;
           line-height: 2.5;
           padding: 0 10px;
           text-decoration: none;
           width: 100%;
           color: blue;
         }
   
         nav a:hover {
           background-color: green;
           color: yellow;
         }
       </style>
     </head>
     <body>
       <nav>
         <ul>
           <li><a href="#">Home</a></li>
           <li><a href="#">Projects</a></li>
           <li><a href="#">Team</a></li>
           <li><a href="#">Help</a></li>
         </ul>
       </nav>
     </body>
   </html>
   ```

   ###### LS Solution

   ```html
   <nav>
     <ul>
       <li><a href="#">Home</a></li>
       <li><a href="#">Projects</a></li>
       <li><a href="#">Team</a></li>
       <li><a href="#">Help</a></li>
     </ul>
   </nav>
   ```

   ```css
   
   html {
     font-size: 20px;
   }
   
   nav ul {
     background-color: yellow;
     list-style-type: none;
     padding-left: 0;
     width: 200px;
   }
   
   nav li {
     color: blue;
   }
   
   nav a {
     box-sizing: border-box;
     display: inline-block;
     line-height: 2.5;
     padding: 0 10px;
     text-decoration: none;
     width: 100%;
   }
   
   nav a:hover,
   nav a:focus {
     background-color: green;
     color: yellow;
   }
   ```

8. Convert the solution from the last problem to a horizontal navigation bar that takes up the full width of the page. Again, try not to peek at the previous assignment. The final result should look like this:

   ![Horizontal navbar](https://d3jtzah944tvom.cloudfront.net/202/images/lesson_4/horizontal-nav.png)

   ###### My Solution

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>List Practice</title>
       <meta charset="utf-8" />
       <style>
         html {
           font-size: 20px;
         }
   
         nav ul {
           box-sizing: border-box;
           background-color: yellow;
           list-style-type: none;
           padding-left: 0;
           width: 500px;
         }
   
         nav li {
           display: inline-block;
           background-color: yellow;
           padding: 0;
           text-align: center;
           color: blue;
           width: 25%;
         }
   
         nav a {
           box-sizing: border-box;
           display: inline-block;
           line-height: 2.5;
           padding: 0;
           text-decoration: none;
           width: 100%;
         }
   
         nav a:hover,
         nav a:focus {
           background-color: green;
           color: yellow;
         }
       </style>
     </head>
     <body>
       <nav>
         <ul>
           <li><a href="#">Home</a></li><!-- 
            --><li><a href="#">Projects</a></li><!-- 
            --><li><a href="#">Team</a></li><!-- 
            --><li><a href="#">Help</a></li>
         </ul>
       </nav>
     </body>
   </html>
   ```

   ###### LS Solution

   ```css
   nav ul {
     font-size: 0;
     width: 100%;
   }
   
   nav li {
     display: inline-block;
     font-size: 1rem;
     text-align: center;
     width: 25%;
   }
   ```

---

## 4. Tables Overview

## 5. Practice Problems: Tables

1. Create a table with column headings for "Product," "Quantity," and "Price." Fill the table with this data:

   ```plaintext
   Apple, 34, $3.99/lb
   Banana, 116, $1.69/lb
   Carrot, 42, $2.49/lb
   Kiwi, 18, $0.69 ea.
   ```

   **How it should look in the browser:**

   ![Produce prices](https://d3jtzah944tvom.cloudfront.net/lesson_2/exercises_basic_html/t1.jpg)

   ###### My Solution

   ```html
   <table>
     <tr>
       <th>Product</th>
       <th>Quantity</th>
       <th>Price</th>
     </tr>
   
     <tr>
       <td>Apple</td>
       <td>34</td>
       <td>$3.99/lb</td>
     </tr>
   
     <tr>
       <td>Banana</td>
       <td>116</td>
       <td>$1.69/lb</td>
     </tr>
   
     <tr>
       <td>Carrot</td>
       <td>42</td>
       <td>$2.49/lb</td>
     </tr>
   
     <tr>
       <td>Kiwi</td>
       <td>18</td>
       <td>$0.69 ea.</td>
     </tr>
   </table>
   ```

   ###### LS Solution

   ```html
   <table>
     <thead>
       <tr>
         <th>Product</th>
         <th>Quantity</th>
         <th>Price</th>
       </tr>
     </thead>
     <tbody>
       <tr>
         <td>Apple</td>
         <td>34</td>
         <td>$3.99/lb</td>
       </tr>
       <tr>
         <td>Banana</td>
         <td>116</td>
         <td>$1.69/lb</td>
       </tr>
       <tr>
         <td>Carrot</td>
         <td>42</td>
         <td>$2.49/lb</td>
       </tr>
       <tr>
         <td>Kiwi</td>
         <td>18</td>
         <td>$0.69 ea.</td>
       </tr>
     </tbody>
   </table>
   ```

2. Update your solution to the previous problem to make the background color of the entire table cyan.

   ###### My Solution

   ```css
   <style>
     table {
   		background-color: cyan;
     }
   </style>
   ```

   

3. Update your solution to the previous problem to make the background color of the individual data cells orange.

   ###### My Solution

   ```css
   td {
     background-color: orange;
   }
   ```

4. The background color of the table in the previous problem bleeds through as a border around the data cells. Update your solution to remove that border.

   ###### My Solution

   ```css
   table {
     border-collapse: collapse;
   }
   ```

5. Update your solution to the previous problem to change the background color for the Banana and Kiwi rows to yellow.

   ###### My Solution

   Technique 1:

   ```html
   <table>
    ...
     
      <tr class="banana">
        <td>Banana</td>
        <td>116</td>
        <td>$1.69/lb</td>
      </tr>
    ...
     
      <tr class="kiwi">
        <td>Kiwi</td>
        <td>18</td>
        <td>$0.69 ea.</td>
      </tr>
   </table>
   ```

   ```css
   .banana td,
   .kiwi td {
     background-color: yellow;
   }
   ```

   Technique 2:

   ```css
   tr:nth-child(2) td,
   tr:nth-child(4) td {
     background-color: yellow;
   }
   ```

   ###### LS Solution

   Technique 1:

   ```html
   <tr class="odd-row">
     <td>Apple</td>
     <td>34</td>
     <td>$3.99/lb</td>
   </tr>
   <tr class="even-row">
     <td>Banana</td>
     <td>116</td>
     <td>$1.69/lb</td>
   </tr>
   <tr class="odd-row">
     <td>Carrot</td>
     <td>42</td>
     <td>$2.49/lb</td>
   </tr>
   <tr class="even-row">
     <td>Kiwi</td>
     <td>18</td>
     <td>$0.69 ea.</td>
   </tr>
   ```

   ```css
   /* delete this rule
   td {
     background-color: orange;
   }
   */
   
   .odd-row {
     background-color: orange;
   }
   
   .even-row {
     background-color: yellow;
   }
   ```

   Technique 2:  

   Our solution relies on giving each row a class name that varies depending on the color we want to assign to the row. A more reliable solution that doesn't need classes uses the `:nth-child()` pseudo-class that we introduced in the previous assignment:

   ```css
   tbody tr:nth-child(2n+1) {
     background-color: orange;
   }
   
   tbody tr:nth-child(2n+2) {
     background-color: yellow;
   }
   ```

   This variation of `:nth-child()` uses the `2n+` part of the parameter to select every other row.

6. Create a table with both column and row headings. Use "Name," "Major," and "GPA" for the columns, and student names for the rows. Be sure to tell the browser which headings are for columns and which are for rows.

   ```plaintext
   Chris Lee, Supply Chain Management, 3.7
   Shane Riley, Photojournalism, 3.8
   Kevin Wang, Computer Science, 4.0
   ```

   **How it should look in the browser:**

   ![College records](https://d3jtzah944tvom.cloudfront.net/lesson_2/exercises_basic_html/t2.jpg)

   ###### My Solution

   ```html
   <table>
     <thead>
       <tr>
         <th>Name</th>
         <th>Major</th>
         <th>GPA</th>
       </tr>
     </thead>
     <tbody>
       <tr>
         <th>Chris Lee</th>
         <td>Supply Chain Management</td>
         <td>3.7</td>
       </tr>
       <tr>
         <th>Shane Riley</th>
         <td>Photojournalism</td>
         <td>3.8</td>
       </tr>
       <tr>
         <th>Kevin Wang</th>
         <td>Computer Science</td>
         <td>4.0</td>
       </tr>
     </tbody>
   </table>
   ```

   ###### LS Solution

   ```html
   <table>
     <thead>
       <tr>
         <th scope="col">Name</th>
         <th scope="col">Major</th>
         <th scope="col">GPA</th>
       </tr>
     </thead>
     <tbody>
       <tr>
         <th scope="row">Chris Lee</th>
         <td>Supply Chain Management</td>
         <td>3.7</td>
       </tr>
       <tr>
         <th scope="row">Shane Riley</th>
         <td>Photojournalism</td>
         <td>3.8</td>
       </tr>
       <tr>
         <th scope="row">Kevin Wang</th>
         <td>Computer Science</td>
         <td>4.0</td>
       </tr>
     </tbody>
   </table>
   ```

   Don't forget to provide the `scope` attributes!

7. Without adding anything to the HTML, update the solution to the previous problem to set the column headings to green, and the row headings to blue.

   ###### My Solution

   ```css
   [scope="col"] {
     color: green;
   }
   
   [scope="row"] {
     color: blue;
   }
   ```

   ###### LS Solution

   Same.

8. For this table, our data has categories to create subsets of data within the same table. We need "Type," "Name," and "Price" column headings. Each row represents one of three different wine types. All rows that share a wine type should use the same row heading. Your result should look like the image below.

   ```plaintext
   Red    Meiomi Pinot Noir             $17.99
          Radius Cabernet               $9.99
          Apothic Red                   $7.97
   White  Cloud Break Chardonnay        $8.99
          Kendall Jackson Chardonnay    $9.97
          Kim Crawford Sauvignon Blanc  $9.97
   Sake   Gekkeikan Sake                $9.99
          Mura Mura Mountain Sake       $15.99
          TY KU Sake Junmai Ginjo Black $21.99
   ```

   **How it should look in the browser:**

   ###### ![Wine prices](https://d3jtzah944tvom.cloudfront.net/lesson_2/exercises_basic_html/t3.jpg)

   ###### My Solution

   ```html
   <table>
     <thead>
       <tr>
         <th scope="col">Type</th>
         <th scope="col">Name</th>
         <th scope="col">Price</th>
       </tr>
     </thead>
     <body>
       <tr>
         <th scope ="row" rowspan="3">Red</th>
         <td>Meiomi Pinot Noir</td>
         <td>$17.99</td>
       </tr>
       <tr>
         <td>Radius Cabernet</td>
         <td>$9.99</td>
       </tr>
       <tr>
         <td>Apothic Red</td>
         <td>$7.97</td>
       </tr>
   
       <tr>
         <th scope="row" rowspan="3">White</th>
         <td>Cloud Break Chardonnay</td>
         <td>$8.99</td>
       </tr>
       <tr>
         <td>Kendall Jackson Chardonnay</td>
         <td>$9.97</td>
       </tr>
       <tr>
         <td>Kim Crawford Sauvignon Blanc</td>
         <td>$9.97</td>
       </tr>
   
       <tr>
         <th scope="row" rowspan="3">Sake</th>
         <td>Gekkeikan Sake</td>
         <td>$9.99</td>
       </tr>
       <tr>
         <td>Mura Mura Mountain Sake</td>
         <td>$15.99</td>
       </tr>
       <tr>
         <td>TY KU Sake Junmai Ginjo Black</td>
         <td>$21.99</td>
       </tr>
     </body>
   </table>
   ```

   ###### LS Solution

   Basically the same.

9. It's difficult to tell which wines apply to each type in the output of the previous problem. Update your solution to display a 1-pixel wide gray border around all the table's cells and headings.

###### My Solution

```css
table {
  border-collapse: collapse;
}

th, td {
  border: 1px solid gray;
}
```

###### LS Solution

Basically the same.

---

## 6. On Your Own: Nutrition Facts Label

