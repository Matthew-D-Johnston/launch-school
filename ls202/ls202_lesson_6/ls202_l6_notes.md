##### LS202 HTML and CSS > Lesson 6: Advanced Layout

---

## 1. Introduction

#### What to Focus On

In this lesson, we'll take a whirlwind tour of some layout-related features of CSS: floats, positioning, flex, grid, CSS frameworks, and responsive design. None of these topics are easy; in fact, unlike most of our material here at Launch School, **we don't expect you to master them in this lesson**. Instead, familiarize yourself with the concepts and what you can do with them, then use Google and MDN when you need to use them. Master the material we discussed in the previous lessons, but leave advanced layout until you're ready to use it. Don't struggle. When you've had more experience, you will get a better handle on the subject.  

For now, you should know how to use the following in simple projects and problem sets:  

* floated elements, including how to clear floats
* positioning with `position: absolute`
* basic media queries
* liquid and fluid layouts

---

## 2. Floats

## 3. Containing Floats

## 4. Practice Problems: Floats (1)

For these problems, you'll work with two columns of different sizes. You can grab some content for both over at [lipsum.com](http://www.lipsum.com/); generate several paragraphs of copy for both columns. For the best results, the two columns should have differing amounts of text.  

After most problem descriptions, you'll see a screenshot of how your page should look. The background colors help show where each element begins and ends; choose any colors you want.

1. Create a `section` element with a fixed width of 750px, and horizontally center it on the page using CSS margins. Create two columns inside it, a 500px-wide `article` and a 250px-wide `aside`, positioned side-by-side with CSS floats. The left column should contain the `article`. Each column should have `1rem` of whitespace between the text and edges of the container. Add some background colors to the `body`, `section`, `article`, and `aside` `body` so you can see the boundaries of each element.

   ![Fixed width floated columns](https://d3jtzah944tvom.cloudfront.net/202/images/lesson_6/f1.png)

   ###### My Solution

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>Practice Problems: Floats(1)</title>
       <meta charset="utf-8" />
       <style>
         section {
           background-color: #D8DDE6;
           width: 750px;
           margin: auto;
           padding: 0 1.5rem 1.5rem 1.5rem;
           overflow: hidden;
         }
   
         article, aside {
           display: inline-block;
           box-sizing: border-box;
           padding: 1rem;
         }
   
         article {
           background-color: #FCFBC0;
           width: 500px;
           float: left;
         }
   
         aside {
           background-color: #C1FDBE;
           width: 250px;
           float: right;
         }
       </style>
     </head>
     <body>
       <section>
         <article>
           Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
         </article>
         <aside>
           The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
         </aside>
       </section>
     </body>
   </html>
   ```

   ###### LS Solution

   ```html
   <section>
     <article>
       <p><!-- lipsum content #1 --></p>
       <p><!-- lipsum content #2 --></p>
         <!-- more content -->
     </article>
     <aside>
       <p><!-- lipsum content #3 --></p>
       <p><!-- lipsum content #4 --></p>
         <!-- more content -->
     </aside>
   </section>
   ```

   ```css
   body, section, article, aside {
     margin: 0;
     padding: 0;
   }
   
   body {
     background-color: #ccc;
   }
   
   section {
     background-color: white;
     margin: 0 auto;
     width: 750px;
   }
   
   article, aside {
     box-sizing: border-box;
     float: left;
     padding: 1rem;
   }
   
   article {
     background-color: #ffc;
     width: 500px;
   }
   
   aside {
     background-color: #cfc;
     width: 250px;
   }
   ```

   You can also float the `aside` to the `right` since the total of the column widths matches that of the container.  

   Note that we need padding to provide the whitespace between the text and the edges of the container. Since we're mixing `padding` with `width`, we should also use `border-box` box-sizing to simplify our calculations.

2. If necessary, add some more text to the `article` to ensure it is noticeably taller than the `aside`. Can you see the background color you set on the section element? Why not? What can you add to your CSS to fix it?

   ###### My Solution

   ```css
   section {
     background-color: white;
     margin: 0 auto;
     width: 750px;
     overflow: hidden;
   }
   ```

   ###### LS Solution

   Since the browser removes floats from the normal flow, the parent element doesn't contain them properly. Thus, the background color doesn't paint to the bottom of the taller column. You need to tell the container (the `section`) to expand itself enough to cover the area used by the taller column. Use `overflow` or a clearfix as desired.

   ```css
   /* Using overflow */
   section {
     overflow: hidden;  /* beware of clipping */
   }
   ```

   ```css
   /* Using clearfix */
   section::after {
     clear: both;
     content: "";
     display: block;
   }
   ```

3. Remove the fixed width of 750px from the `section` and set a maximum width of 1000px instead. Modify the right column to take up the remainder of the space without floating the column or giving it a specific width.

   ###### My Solution

   ```css
   This one had me puzzled
   ```

   ###### LS Solution

   Adding `overflow: hidden` to the last floated element in a row and removing the `float` and `width` properties cause it to take up the remaining space within the row. This technique is useful when your last element should take up the leftover space in a variable width layout.

   ```css
   section {
     max-width: 1000px;
     /* width: 750px; */
   }
   
   aside {
     float: none;
     overflow: hidden;
     /* width: 250px; DELETE */
   }
   ```

   Modify the CSS as shown and watch what happens as you adjust your browser's width. Be sure to narrow your browser down to the point where there is no more room for the `aside` and observe the behavior as you go past that point.  

4. Change the left column from a fixed width to a variable width of 70% of the parent's width.

   ###### My Solution

   ```css
   article {
     background-color: #FCFBC0;
     /*width: 500px;*/
     width: 70%;
   }
   ```

   ###### LS Solution

   If you haven't already done so, use the `box-sizing` property to ensure that your `article` takes up precisely 70% of the row width, rather than 70% plus the padding.

   ```css
   article {
     box-sizing: border-box;
     width: 70%;
   }
   ```

5. Add a `footer` below the two columns.

   ![Clearing columns](https://d3jtzah944tvom.cloudfront.net/202/images/lesson_6/f3.png)

   ###### My Solution

   ```html
   <body>
     <section>
       <article>
         <p>
           Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
         </p>
         <p>
           It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
         </p>
       </article>
       <aside>
         <p>
           The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
         </p>
       </aside>
     </section>
     <footer>
       <p>
         Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
       </p>
     </footer>
   </body>
   ```

   ```css
   body, section, article, aside, footer {
     margin: 0;
     padding: 0;
   }
   
   body {
     background-color: #ccc;
   }
   
   section, footer {
     background-color: white;
     margin: 0 auto;
     /*width: 750px;*/
     max-width: 1000px;
     overflow: hidden;
   }
   
   ...
   
   footer {
     box-sizing: border-box;
     background-color: #D5E6F5;
     padding: 1rem;
   }
   ```

   ###### LS Solution

   If you used a clearfix in problem 2, you can remove it and clear the floats with the `footer` element and `clear: both`.

   ```html
   <section>
     <article>
       content
     </article>
     <aside>
       content
     </aside>
     <footer>
       <p><!-- lipsum content #7 --></p>
     </footer>
   </section>
   ```

   ```css
   section {
     /* overflow: hidden; */
   }
   
   /*
   section::after {
     clear: both;
     content: "";
     display: block;
   }
   */
   
   footer {
     background-color: #ebecff;
     clear: both;
     padding: 1rem;
   }
   ```

---

## 5. Practice Problems: Floats (2)

For this problem set, use the Inspector to add CSS properties to the working page and see immediate results. If you need a review of the Inspector, see [the documentation](https://developers.google.com/web/tools/chrome-devtools/inspect-styles/). You must know how to inspect and edit pages and styles for this assignment; you don't need any other developer tools.

1. [Open this page](https://d3jtzah944tvom.cloudfront.net/lesson_4/exercises_floating_positioning/float1.html) then open the Inspector and find the div with the "floated" ID. Select it, then make the `div` float left by updating the styles tab.

   Solution

   The page should now look something like this.

   

   ![Floating a short column](https://d3jtzah944tvom.cloudfront.net/lesson_4/exercises_floating_positioning/float1.jpg)

   

2. Can you determine why the blue paragraph hangs out beneath the right edge of the orange `div`? Add a CSS property to force the blue box beneath the orange; don't worry about the widths - the blue box will be wider than the orange.

   Solution

   ```css
   /* A selector of `#floated + p` will also work */
   main > p {
     clear: both;
   }
   ```

3. Why is the orange container now narrower than the blue? How can you keep the orange box floated but take on the same width as the blue?

   Solution

   When you float an element, it uses as much space as it needs to display its content, which is less than that required by the `main` element. To use all available width, add `width: 100%`.

   ```css
   #floated {
     width: 100%;
   }
   ```

4. Change the floated element's width to 20%, then remove the `clear` from the `p` below it. Try setting a left margin on the blue paragraph equal to the width of the floated element.

   Solution

   This code works to produce a two-column layout here.

   ```css
   #floated {
     width: 20%;
   }
   
   main > p {
     /* clear: both; */
     margin-left: 20%;
   }
   ```

   This code works, but it isn't robust. For instance, if you add a fixed height to the blue paragraph that isn't enough to fully contain the text, the text will overflow. If you add `overflow: hidden` to the blue box, the overflowing text will get clipped. If you add `overflow: auto` instead, you will be able to scroll the blue box.

   Can you find other ways to demonstrate the lack of robustness?

5. Remove the left margin on the blue paragraph, and have it float right instead. What do you think will happen? Will the orange and blue elements sit side-by-side?

   Solution

   The blue element ends up too large to fit within the remaining space. Remember that floated elements take up as much space as they need for the content, within the bounds of any space constraints.

6. Ideally, you want both boxes side-by-side. In an attempt to do that, you add a width of 80% to the blue paragraph. What happens? How can you fix this problem without changing the width setting?

   Solution

   Since the paragraph has 1em of padding on all sides, we need to account for that when we set the width. In fact, as is, the blue box is 80% of the container width plus an additional 2rem. To fix this issue, set the box-sizing mode to `border-box`.

---

## 6. Positioning

## 7. Practice Problems: Positioning

For these problems, create a simple HTML page with a few paragraphs of text. You should have enough content that you must scroll the browser window to read the bottommost content; you can also shorten the window height if you prefer. If you add any elements to the page, add them after the paragraph elements.

1. Starting with a new document, create an element and position it at the top right of the page. It should scroll with the rest of the window when you scroll.

   ###### My Solution

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>your page title goes here</title>
       <meta charset="utf-8" />
       <style>
         .positioned {
           background-color: lightyellow;
           width: 200px;
           height: 100px;
           margin: 0;
           position: fixed;
           right: 0;
           top: 0;
           text-align: center;
           line-height: 100px;
         }
       </style>
     </head>
     <body>
       <p class="positioned">I'm positioned!</p>
       <p>
         The economic impact of COVID-19 has raised the stakes for policy makers everywhere, and central bankers are all in. But perhaps none more so than Jerome Powell, Chairman of the U.S. Federal Reserve. From rate cuts to liquidity support and from swap lines to asset purchase schemes, the Fed has opened up the floodgates. It’s still not clear when they’ll be closed again. But with all this new money gushing into the economy, shouldn’t Chairman Powell, the rest of the FOMC, and everyone else be worried about inflation?
       </p>
       
       ...
       
     </body>
   </html>
   ```

   ###### LS Solution

   ```html
   <section>
     <!-- text paragraphs go here -->
   </section>
   
   <div id="positioned">I'm positioned!</div>
   ```

   ```css
   #positioned {
     background-color: #ffc;
     padding: 30px 15px;
     position: absolute;
     right: 0;
     top: 0;
   }
   ```

   

2. Change the element to remain in the top right of the viewport when the window scrolls.

   ###### My Solution

   ```css
   #positioned {
     position: fixed;
   }
   ```

   

3. Set the element's width to 400px and center it horizontally. Centering positioned elements is tricky, so feel free to check the hints and use Google.

   ###### My Solution

   ```css
   #positioned {
     width: 400px;
     right: 50%;
     margin-right: -200px;
   }
   ```

   ###### LS Solution

   To horizontally center a positioned element with fixed width, you can move it to the center of the container with a `left` offset of 50%, and a negative left margin that is half the width of the element. In our example, we're moving the element from the left edge to the center of the container, then reversing direction by using a negative margin.

   ```css
   #positioned {
     box-sizing: border-box;
     left: 50%;
     margin-left: -200px;
     /* right: 0; */
     width: 400px;
   }
   ```

4. Place a new element between the page contents and the yellow item; by between, we mean in a 3D sense. Consider the page content to be at the bottom of a stack and the yellow at the top; place the new element between the two.

   The new element should take up the full width and height of the page. Use the CSS below to get started; note that it sets the background to a translucent color. The new element should fill the browser's entire window, and it should appear in front of the paragraphs but behind the yellow box.

   ```css
   background-color: rgba(0, 0, 0, .6);
   ```

   ###### My Solution

   ```html
   ...
   
   			<p>
           Companies saying they are finding it hard to find qualified labor is just another way of saying they don’t want to pay to train people, they want the government to do it. If the labor market was tight and the economy was booming, firms would be throwing out all kinds of incentives to attract anybody with two feet and heart beat. Firms would not only train workers, they’d actually offer paid training. Imagine that was the way the world worked. Alas, we’re still waiting.
         </p>
       </section>
       <div id="positioned">I'm positioned!</div>
       <div id="middle"></div>
     </body>
   </html>
   ```

   ```css
   #positioned {
     background-color: #ffc;
     padding: 30px 15px;
     position: fixed;
     box-sizing: border-box;
     right: 50%;
     margin-right: -200px;
     top: 0;
     width: 400px;
     z-index: 1;
   }
   
   #middle {
     background-color: rgba(0, 0, 0, .6);
     height: 100%;
     width: 100%;
     position: fixed;
     z-index: auto;
     top: 0;
   }
   ```

   ###### LS Solution

   To take up the entirety of the window, we can use a width and height of `100%`. We can use z-index values for both elements to position one on top of the other.

   ```html
   <div id="fixed"></div>
   ```

   ```css
   #positioned {
     /* z-index must be greater than that of the elements you want overlay */
     z-index: 2; /* 2 must be > 1 */
   }
   
   #fixed {
     background-color: rgba(0, 0, 0, .6);
     height: 100%;
     left: 0;
     position: fixed;
     top: 0;
     width: 100%;
     z-index: 1; /* 1 must be < 2 */
   }
   ```

5. Create a new element inside the `#positioned` container. Starting with the CSS below, move the new item partially outside the parent's boundaries by 10px to the left and top. To ensure you can see everything, move the parent element down from the top of the page.

   ```css
   ... {
     /* code omitted */
     background-color: pink;
     height: 20px;
     width: 20px;
   }
   ```

   ###### My Solution

   ```html
   <div id="positioned">
     <div id="inside"></div>
     I'm positioned!
   </div>
   ```

   ```css
   #positioned {
     background-color: #ffc;
     padding: 30px 15px;
     position: fixed;
     box-sizing: border-box;
     right: 50%;
     margin-right: -200px;
     top: 20px;
     width: 400px;
     z-index: 2;
     display: inline-block;
   }
   
   #inside {
     background-color: pink;
     height: 20px;
     width: 20px;
     position: relative;
     top: -40px;
     left: -25px;
     display: inline-block;
     box-sizing: border-box;
   }
   ```

   ###### LS Solution

   ```html
   <div id="positioned">
     <span></span>
     I'm positioned!
   </div>
   ```

   ```css
   #positioned {
     top: 20px;
   }
   
   #positioned span {
     background-color: pink;
     height: 20px;
     left: -10px;
     position: absolute;
     top: -10px;
     width: 20px;
   }
   ```

---

## 8. On Your Own: Floats and Positioning

## 9. Flex and Grid

## 10. Guided Project: Flex

1. Load the completed project and your in-progress project from the downloaded file in your browser. Study the differences, and try to decide what general actions you must take to convert your project to one that matches the completed project. Think about the tasks you need to accomplish, not the CSS you need to code.

   ###### My Initial Notes

   Steps that will need to be taken:

   1. The blue background for the `<header>` will need to span the entire width of the screen and expand to reach the top of the screen.
   2. The `<nav>` bar will need to be rearranged horizontally and also span the width of the screen. 
   3. Both of the `<aside>` elements and the `<main>` element will need to be arranged so they flow horizontally.
   4. The `<footer>` also needs to be rearranged horizontally, and the orange bit needs to be removed.

   ###### LS Initial Notes

   1. Zero out margins and padding
   2. Set primary font and color info.
   3. Expand header
   4. Convert navigation menu to horizontal
   5. Create 3 column format for main content areas
   6. Create a 2 column footer.
   7. Shrink image and move it to the left side.
   8. Center copyright notice vertically and right justify it.

2. Start by providing any global settings you think you will need. You can update this later.

   ###### My Solution

   1. I commented out the current margins and padding that existed in the CSS file.
   2. Created a `main` selector and added a `display` property of `flex`; also, added the `display` property of `flex` to the `footer` selector.

   ###### LS Solution

   ```css
   * {
     margin: 0;
     padding: 0;
   }
   
   html {
     background-color: white;
     color: black;
     font: normal 24px Helvetica, Arial, sans-serif;
   }
   ```

   It's a good idea to start out by getting rid of all margins and padding at the global level to decrease the cross-browser differences. We can use the `*` selector in this project; you would typically use a CSS reset (discussed later) for this.

   From step 1, we can observe that most of our text should be black and that white is a good starting choice for the background color; we apply both of those via the `html` selector.

3. Give the header a blue background; the `h1` heading has a blue background, but not the `header`.

   ###### My Solution

   ```css
   header {
     background-color: blue;
     padding: 1rem;
     text-align: center;
   }
   ```

   ###### LS Solution

   ```css
   header, h1 {
     background-color: blue;
     color: white;
   }
   ```

   You could also put the `background-color` for `header` in the other `header` selector. The advantage of adding a `header` selector to the `h1` selector is that it emphasizes the relationship between the `header` and `h1` elements.

4. Convert the navigation links into a horizontal navigation bar:

   ###### My Solution

   ```css
   ul {
     display: flex;
     list-style_type: none;
   }
   ```

   ###### LS Solution

   ```css
   ul {
     display: flex;
     justify-content: space-around;
     list-style-type: none;
   }
   ```

   Without Flex, you would have to convert the `li` elements to `inline-block` then deal with the spaces between the `inline-block` elements. Flex takes care of both those needs.  

5. Create three columns of text - an `article` and two `aside`s - as the main body of the page. The `article` should consume half the page width, while the `aside`s should each consume one-quarter (that is, the `article` is twice the width of each `aside`). Each column should be the same height, no matter how much text it contains.

   ###### My Solution

   ```css
   main {
     display: flex;
   }
   ```

   ###### LS Solution

   ```css
   main {
     display: flex;
   }
   
   article {
     flex: 2;
   }
   
   aside {
     flex: 1;
   }
   ```

   You can do the same thing with floats and positioning, but it isn't easy.

6. Create a two-column `footer` with the copyright notice on the left, and the 200px high image on the right.

   ###### My Solution

   ```css
   footer {
     background-color: yellow;
     display: flex;
     justify-content: flex-end;
     height: 200px;
   }
   
   img {
     height: 200px;
   }
   ```

   ###### LS Solution

   ```css
   footer {
     background-color: yellow;
     display: flex;
     justify-content: space-between;
   }
   
   img {
     display: block;
     height: 200px;
   }
   ```

   

7. Swap the positions of the copyright notice and image to place the image on the left and the copyright notice on the right.

   ###### My Solution

   ```css
   footer {
     background-color: yellow;
     display: flex;
     justify-content: flex-start;
   }
   
   #copyright {
     margin: 0 1rem;
     order: 2;
   }
   
   #logo {
     background-color: orange;
     order: 1;
   }
   ```

   ###### LS Solution

   ```css
   footer {
     background-color: yellow;
     display: flex;
     flex-flow: row-reverse;
     justify-content: space-between;
   }
   ```

8. Center the copyright notice vertically.

   ###### My Solution

   ```css
   footer {
     background-color: yellow;
     display: flex;
     flex-flow: row-reverse;
     justify-content: space-between;
     align-items: center;
   }
   ```

   ###### LS Solution

   ```css
   footer {
     align-items: center;
     background-color: yellow;
     display: flex;
     flex-flow: row-reverse;
     justify-content: space-between;
   }
   ```

   We use `align-items` or `align-content` when working with Flex, not `vertical-align`. `vertical-align` works with `inline` elements, not `flex`.

---

## 11. Guided Project: Grid

1. Load the completed project and your in-progress project from the downloaded file in your browser. Study the differences, and try to decide what general actions you must take to convert your project to one that matches the completed project. Think about the tasks you need to accomplish, not the CSS you need to code.

   ###### My Initial Notes

   1. Reset the margins and padding to zero.
   2. Make sure there is no white space between header, body, and footer.
   3. Make the navigation menu horizontal rather than vertical.
   4. Make it so that the first article is sandwiched horizontally between the two asides with green backgrounds.
   5. The article with the blue background and the aside with the pink background should appear below the other article and aside elements, with the aside on the left and the article on the right.
   6. Adjust the footer: compress the size of the image; make sure the image is on the left side of the page and the copyright message with the yellow background on the right.

   ###### LS Initial Notes

   1. Zero out margins and padding
   2. Set primary font and color info.
   3. Convert navigation menu to horizontal
   4. Create a 5-line, 3-column grid format for the page
   5. Position elements in the grid
   6. Create a 1-line, 2-column grid in the footer.
   7. Move the image and copyright to the footer grid.
   8. Shrink image.
   9. Center copyright notice vertically and right justify it.

2. Start by providing any global settings you think you will need. You can update this later.

   ###### My Solution

   ```css
   * {
     margin: 0;
     padding: 0;
   }
   ```

   ###### LS Solution

   ```css
   html {
     background-color: white;
   	color: black;
     font: normal 24px Helvetica, Arial, sans-serif;
   }
   ```

   It's a good idea to start out by getting rid of all margins and padding at the global level to decrease the cross-browser differences. We can use the `*` selector in this project; you would typically use a CSS reset (discussed later) for this.  

   From step 1, we can observe that most of our text should be black and that white is a good starting choice for the background color; we apply both of those via the `html` selector.

3. Convert the navigation links into a horizontal navigation bar:

   ###### My Solution

   ```css
   ul {
     display: grid;
     grid-template-columns: repeat(5, 1fr);
     list_style-type: none;
   }
   ```

   ###### LS Solution

   ```css
   ul {
     display: grid;
     grid-template-columns: repeat(5, 1fr);
     list-style-type: none;
   }
   ```

   This code converts the list of navigation links to a single line grid in which each item is part of a `1fr`-width cell. Assigning each cell the same `1fr` width divides the cells up evenly, with each cell taking up 1/5th of the page width.  

   Without Grid, you would have to convert the `li` elements to `inline-block` then deal with the spaces between the `inline-block` elements. Grid takes care of both those needs.

4. Organize the entire page as a grid of three columns and five lines, with named grid areas. The first and last column should each take up 1/4 of the page width, while the central column should take up 1/2 the page width. Use fractions, not percentages, to designate these measurements. The `header` should be on the top line, followed by the navigation bar. The content area consists of two lines. The first has two `aside` elements and an `article`, with the `article` in the larger center column. The next line consists of an `article` and an `aside`. Lastly, the `footer` should appear at the bottom of the grid.

   ###### My Solution

   ```css
   body {
     display: grid;
     grid-template-columns: 25% 50% 25%; /* couldn't get fractions to work */
   }
   
   header {
     padding: 1rem;
     text-align: center;
     grid-row: 1;
     grid-column: 1 / span 3;
   }
   
   nav {
     background-color: cyan;
     grid-row: 2;
     grid-column: 1 / span 3;
   }
   
   #article-1,
   #aside-1,
   #aside-2 {
     grid-row: 3;
   }
   
   #aside-1 {
     grid-column: 1;
   }
   
   #article-2 {
     grid-column: 2;
   }
   
   #aside-2 {
     grid-column: 3;
   }
   
   #article-2,
   #aside-3 {
     grid-row: 4;
   }
   
   #aside-3 {
     grid-column: 1;
   }
   
   #article-2 {
     grid-column: 2 / span 2;
   }
   
   footer {
     background-color: yellow;
     grid-row: 5;
   }
   ```

   ###### LS Solution

   ```css
   body {
     display: grid;
     grid-auto-rows: min-content;
     grid-template-areas:
       "header   header    header"
       "nav      nav       nav"
       "sidebar1 article1  sidebar2"
       "sidebar3 article2  article2"
       "footer   footer    footer";
     grid-template-columns: 1fr 2fr 1fr;
   }
   
   header {
     grid-area: header;
     padding: 1rem;
     text-align: center;
   }
   
   nav {
     background-color: cyan;
     grid-area: nav;
   }
   
   #article-1 {
     grid-area: article1;
   }
   
   #article-2 {
     background-color: skyblue;
     grid-area: article2;
   }
   
   #aside-1 {
     grid-area: sidebar1;
   }
   
   #aside-2 {
     grid-area: sidebar2;
   }
   
   #aside-3 {
     background-color: pink;
     grid-area: sidebar3;
   }
   
   footer {
     background-color: yellow;
     grid-area: footer;
   }
   ```

   The most striking part of this code is the `grid-template-areas` property on the `body` and the associated `grid-area` properties that give names to each grid item. The `grid-template-areas` property shows the positioning and size for each `grid-area`:

   - The first row contains the `header` grid area, spread out over the entire row.
   - The second row contains the `nav` grid area, spread out over the entire row.
   - The third row contains the `sidebar1` and `sidebar2` grid areas as well as the `article1` grid area, with the `article1` area in the middle.
   - The fourth row contains the `sidebar3` and `article2` grid areas, with the `article2` area spanning two columns.
   - The fifth row contains the `footer` grid area, spread out over the entire row.

   This solution is more complicated than a Flex solution. The most straightforward approach often requires Flex and Grid together.  

   Our layout is independent of the order in which we define the elements in the HTML.  

   Lastly, the photo in the footer is too big for the intended cell, so the browser stretches the cell to allow the image to fit. This layout looks odd, so we'll fix that in the next question.  

5. Divide the footer area into a sub-grid that will show the logo on the left and the copyright notice on the right.

   ###### LS Solution

   ```css
   footer {
     background-color: yellow;
     display: grid;
     grid-area: footer;
     grid-template-areas: "logo copyright";
   }
   
   #copyright {
     grid-area: copyright;
     margin: 0 1rem;
   }
   
   #logo {
     background-color: orange;
     grid-area: logo;
   }
   ```

   This solution is similar to that used in the previous step: we define a grid template area, then assign the grid-area names to the appropriate selectors.  

   If you make the window narrow enough, the space allocated for the image may begin to shrink due to the space required for the copyright message.

6. Reduce the size of the image to the same size as the first column of the content area.

   ###### LS Solution

   ```css
   footer {
     background-color: yellow;
     display: grid;
     grid-area: footer;
     grid-template-areas: "logo copyright";
     grid-template-columns: 1fr 3fr;
   }
   
   img {
     display: block;
     object-fit: cover;
     width: 100%;
   }
   ```

   This solution is similar to that used in the Flex project: we set the display type to `block` and set the width, though this time we want the width to be 100% of the cell width. We also need to supply `object-fit` to control the technique used to resize the image.  

   If you make the window narrow enough, the space allocated for the image may begin to shrink due to the space required for the copyright message.

7. Right-align and vertically center the copyright message in the yellow box.

   ```css
   #copyright {
     align-self: center;
     grid-area: copyright;
     margin: 0 1rem;
     justify-self: end;
   }
   ```

   You can think of `justify-self` as a [more Grid-like way to align content](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Box_Alignment_in_CSS_Grid_Layout). If you're using an older browser, you can replace `justify-self: end` with `text-align: right`. The result is identical, but the `justify-self` approach is more Grid-like.

---

## 12. CSS Frameworks

## 13. Responsive Design

Most websites must look good and provide identical functionality regardless of whether the user is using a smartphone or a desktop with a massive display, or anything in between. However, what looks great on a desktop, for example, is sometimes a poor user experience on a smartphone. The same holds in the other direction: a site that looks great on your cell phone will look sparse and empty on your 34-inch display.

Dealing with these differences is not hard, but it requires the ability to write CSS that changes with different output devices. That's the role of **CSS media queries**.

### Media Queries

Media queries typically define styles that change based on the current size of the browser window, which lets us customize the look for phones, tablets, small laptops, and large desktop displays. Here's a simple media query that changes the link color on small devices (cell phones frequently have screens less than 480px wide):

```css
a {
  color: #f00;
}

@media (max-width: 480px) {
  a {
    color: #06c;
  }
}
```

Any styles you put inside the media query block will apply when the screen width is 480px or less, as specified by the `(max-width: 480px)` query.  

You can also use the words `not` and `and` in media queries, and choose different media types such as `screen`, `print`, or `speech`. Most common is a combination of `screen` media type and a `min-width` or `max-width`, like this:

```css
@media screen and (max-width: 1600px) {
  /* CSS for 1600px (or smaller) screens (no printers!) */
}
```

---

## 14. On Your Own: Fluid Photo Gallery

###### My Solution

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Fluid Photo Gallery</title>
    <meta charset="utf-8" />
    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      html {
        background-color: black;
        font-family: Helvetica, Arial, sans-serif;
      }

      figure {
        margin: 0;
        padding: 0 0 30px;
      }

      figcaption {
        color: white;
        margin-top: 15px;
      }

      body {
        box-sizing: border-box;
        display: grid;
        grid-template-columns: 15% 70% 15%;
      }

      main {
        background-color: #3D3D3D;
        box-sizing: border-box;
        padding: 50px 20px;
        min-width: 500px;
        max-width: 1000px;
        grid-column-start: 2;
        display: grid;
        grid-template-areas: 
          "header"
          "main_photo"
          "sub_photos"
      }

      img {
        box-sizing: border-box;
        display: block;
        width: 100%;
      }

      .main-photo img {
        border: 1rem solid white;
      }

      ul {
        list-style: none;
        display: flex;
        justify-content: space-between;
      }

      li {
        border: 3px solid white;
        flex-basis: 22%;
      }


      h1 {
        color: white;
        margin-bottom: 25px;
        text-align: center;
        grid-area: header;
      }

      .main-photo {
        grid-area: main_photo;
      }

      .sub-photos {
        grid-area: sub_photos;
      }
    </style>
  </head>
  <body>
    <main>
      <h1>My Photo Gallery</h1>
      <figure class="main-photo">
        <img src="http://placehold.it/1200x900" alt="Placeholder image" class="main-photo" />
        <figcaption>Example photo</figcaption>
      </figure>
      <ul class="sub-photos">
        <li><img src="http://placehold.it/1200x900" alt="Placeholder image" /></li>
        <li><img src="http://placehold.it/1200x900" alt="Placeholder image" /></li>
        <li><img src="http://placehold.it/1200x900" alt="Placeholder image" /></li>
        <li><img src="http://placehold.it/1200x900" alt="Placeholder image" /></li>
      </ul>
    </main>
  </body>
</html>
```

###### LS Solution

##### HTML

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Fluid Photo Gallery</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="gallery.css" />
  </head>
  <body>
    <main>
      <h1>My Photo Gallery</h1>
      <figure>
        <img src="http://placehold.it/1200x900" alt="Example photo" />
        <figcaption>Example photo</figcaption>
      </figure>
      <ul>
        <li><img src="http://placehold.it/1200x900" alt="" title="Photo 1" /></li>
        <li><img src="http://placehold.it/1200x900" alt="" title="Photo 2" /></li>
        <li><img src="http://placehold.it/1200x900" alt="" title="Photo 3" /></li>
        <li><img src="http://placehold.it/1200x900" alt="" title="Photo 4" /></li>
      </ul>
    </main>
  </body>
</html>
```

##### CSS

```css
body {
  margin: 0;
  font: normal 16px Helvetica, Arial, sans-serif;
  color: #f0f0f0;
  background: #141414;
}

main {
  min-width: 600px;
  max-width: 1000px;
  padding: 20px;
  margin: 0 auto;
  background: #333333;
}

h1 { text-align: center; }

img {
  display: block;
  width: 100%;
}

figure {
  padding: 0 0 30px 0;
  margin: 0;
}

figure img {
  border: 15px solid #ffffff;
  box-sizing: border-box;
}

figcaption {
  padding: 10px 0 0 0;
}

ul {
  padding: 0;
  margin: 0 -15px;
  font-size: 0;
}

li {
  display: inline-block;
  width: 25%;
  padding: 0 15px;
  box-sizing: border-box;
}

li img {
  border: 3px solid #ffffff;
}
```

---

## 15. Guided Project: Photo Gallery With Media Queries

In this project, you will add some media queries to the photo gallery project from the previous assignment to adjust the design for both smaller and larger screens. In the original project, we used a fluid layout with a minimum width of 500 pixels and a maximum width of 1000. In this project, we'll do away with the minimum width; instead, we'll reduce the number of thumbnails shown at the bottom as the screen width shrinks.  

The final project displays four thumbnails per line when the window is at least 900 pixels wide. It displays three per line when the window is between 600 and 899 pixels, and two per line when the window is narrower than 600 pixels. As a challenge, we'll add an extra layout that kicks in when the window width is 1280px or more.  

You can start this project with the [completed example from the previous project](https://d3jtzah944tvom.cloudfront.net/202/projects/lesson_6/photo_gallery_with_fluid_layout/example.html), or your own completed version.  

1. Add a meta tag that tells the browser that this page is a responsive design.

   ###### LS Solution

   ```html
   <head>
     <title>Example Liquid Photo Gallery</title>
     <meta charset="UTF-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <link rel="stylesheet" href="gallery.css" />
   </head>
   ```

2. Remove the minimum width from the project.

   ###### My Solution

   ```css
   main {
     /* min-width: 600px; */ /* delete this line */
     max-width: 1000px;
     padding: 20px;
     margin: 0 auto;
     background: #333333;
   }
   ```

   ###### LS Solution

   ```css
   main {
     /*min-width: 500px;*/
   }
   ```

3. Add several additional thumbnail images to the HTML to help make your changes stand out as the number of thumbnails per line shrinks. Add some margin between each row of thumbnails.

   ###### My Solution

   ##### HTML

   ```html
   <ul>
     <li><img src="http://placehold.it/1200x900" alt="" title="Photo 1" /></li>
     <li><img src="http://placehold.it/1200x900" alt="" title="Photo 2" /></li>
     <li><img src="http://placehold.it/1200x900" alt="" title="Photo 3" /></li>
     <li><img src="http://placehold.it/1200x900" alt="" title="Photo 4" /></li>
     <li><img src="http://placehold.it/1200x900" alt="" title="Photo 5" /></li>
     <li><img src="http://placehold.it/1200x900" alt="" title="Photo 6" /></li>
   </ul>
   ```

   ##### CSS

   ```css
   li {
     display: inline-block;
     width: 25%;
     padding: 0 15px;
     margin-bottom: 15px; /* new line of code */
     box-sizing: border-box;
   }
   ```

   ###### LS Solution

   ##### HTML

   ```html
   <li>
     <img src="http://placehold.it/1200x900" alt="Photo 5" />
   </li>
   
   <li>
     <img src="http://placehold.it/1200x900" alt="Photo 6" />
   </li>
   
   <li>
     <img src="http://placehold.it/1200x900" alt="Photo 7" />
   </li>
   ```

   ##### CSS

   ```css
   li {
     margin-bottom: 15px;
   }
   ```

4. Add a media query with the CSS you need to limit the number of thumbnails per line to three when the window width is less than 900px.

   ###### My Solution

   ```css
   @media (max-width: 900px) {
     li {
       width: 33.33%;
     }
   }
   ```

   ###### LS Solution

   ```css
   @media screen and (max-width: 899px) {
     li {
       width: 33.3333%;
     }
   }
   ```

5. Add a media query with the CSS you need to limit the number of thumbnails per line to two when the window width is less than 600px.

   ###### My Solution

   ```css
   @media screen and (max-width: 599px) {
     li {
       width: 50%;
     }
   }
   ```

   ###### LS Solution

   ```css
   @media screen and (max-width: 599px) {
     li {
       width: 50%;
     }
   }
   ```

6. **Challenge** Add a media query and the necessary CSS to move the thumbnails to the right side of the primary photo when the browser's width is 1280 pixels or more. Arrange the thumbnails as a single column. Allow the thumbnails to continue expanding as you increase the window width, but limit the central photo to 950px. If your display can't handle 1280 pixels, choose a smaller value, and make any necessary adjustments. See the [completed project](https://d3jtzah944tvom.cloudfront.net/202/projects/lesson_6/photo_gallery_with_fluid_layout/example2.html) for the expected appearance.

   ###### LS Solution

   ```css
   @media screen and (min-width: 1280px) {
     main {
       max-width: 100%;
     }
   
     figure {
       display: inline-block;
       float: left;
       margin-right: 50px;
       vertical-align: top;
       width: 950px;
     }
   
     ul {
       overflow: hidden;
     }
   
     li {
       width: 100%;
     }
   }
   ```

---

