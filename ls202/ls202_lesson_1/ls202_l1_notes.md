##### LS202 HTML and CSS > Lesson 1: Your First Web Pages

---

## 1. Welcome

### Where to Find More Information

* Google (or whatever search engine you prefer) is your leading resource when you have a problem or question. Often, all you have to do is ask a question, and one of the top results will provide an answer. For example, try "How do I create superscripts in HTML?" It's also helpful to provide `mdn` or `w3c` in your search to access two of the most useful resources:

  * The [Mozilla Developer Network](https://developer.mozilla.org/), or **MDN**, is perhaps the best resource for extensive and accessible information about the Web, specifically HTML, CSS, and JavaScript. In fact, it's so good that we suggest that you get in the habit of adding **mdn** to your searches. For instance, `mdn form tag` will find the MDN documentation on the `<form>` tag. If MDN fails to help, a more global search will often turn up a video, tutorial, or Stack Overflow question that provides all the information you need.

    MDN is free and continually updated. Mozilla, the makers of the Firefox Web browser, maintains the site. MDN isn't official, but it's up-to-date, generally accurate, and easier to use than the official specification documents at W3C.

  * The [W3C](http://www.w3.org/), the World Wide Web Consortium, is the standards body for Web technologies, so it serves as the official source of information for HTML and CSS. The content is often dry and academic, but it's an essential resource that you shouldn't ignore. You can add the word **w3c** to your searches to find W3C information about specific topics, e.g., `w3c textarea tag`.

  * In mid-2019, W3C announced that it would collaborate with the Web Hypertext Application Technology Working Group, [WHATWG](https://whatwg.org/), on future HTML and DOM standards, effectively giving up control over those standards. The effects of this collaboration are still unclear at this time. However, it may lead to more rapid development of HTML and DOM standards. The most recent standards documents for the HTML and browser DOM standards can be located at the WHATWG site:

    * [HTML Standard](https://html.spec.whatwg.org/multipage/)
    * [DOM Standard](https://dom.spec.whatwg.org/)

* If you omit "mdn" or "w3c" from the search query, the first result is often from a website called W3 Schools. Material from this site is frequently outdated and incorrect. We suggest that you steer clear of those results.

  Don't confuse W3 Schools with W3C; W3C has no affiliation with W3 Schools.

---

## 2. Introduction

### What to Focus On

#### Vocabulary

As with everything else in the developer's world, there's a wealth of specialized terminology you must learn to converse with other developers and designers. The vocabulary you need here, though, is small compared to most languages, and most terms are easy to learn. In particular, you should become comfortable with:

* element and tag
* self-closing tag
* document type definition (DOCTYPE, DTD)
* attribute
* selector
* property
* id, class, and name

#### The Difference Between HTML and CSS

These two technologies are so intertwined in contemporary Web pages that it seems like they do the same thing, and that they are dependent on each other. However, they are distinct and independent with different purposes. **HTML provides the structure and content of a web page; CSS describes the appearance, or presentation, of the page.** There is a bit of overlap that can lead to some confusion: CSS can dictate the apparent structure, while HTML can inform the browser of some presentation elements.

#### HTML and CSS Syntax

HTML and CSS both have simple syntax; you can learn nearly all you need for each language in a few minutes. Take the time you need to learn it well, and both HTML and CSS will become routine in no time.

For the most part, you shouldn't worry about the specific tags, attributes, selectors, and properties yet. Instead, focus on how to put these items together to create well-formed HTML and CSS. The rest will come with time and practice.

#### Structure of a Web Page

All web pages start with some routine code that defines the basic layout of the document. It includes a DOCTYPE (we'll explain this later), an `<html>`, `<head>`, and `<body>` element, and a few other tags in the `<head>` section. Learn what this boilerplate code does, and how to use it in your web pages.

#### Basic HTML Elements

The best way to learn HTML is to use it. The more you use it, the less often you'll need to refer to the documentation; however, you'll probably never learn it all, so don't try.

Start by learning to use the `<p>` (paragraph), `<a>` (anchor), and `<h1>`-`<h6>` elements. Paragraphs are the primary organizational construct for text on web pages, and anchors represent links to other pages, while headings occur on most pages. These elements are so common that you want to learn them as soon as possible, so go ahead and memorize them.

You should also become familiar with these elements:

- `<em>`, `<strong>`
- `<header>`, `<main>`
- `<article>`, `<section>`, `<aside>`
- `<div>` and `<span>`

You don't have to know them by heart; you will remember them through repeated use.

#### Using CSS With HTML

Become familiar with the three ways to use CSS in an HTML document: inline, internal, and external. For now, you should learn to use the `<style>` tag to provide internal CSS.

#### Basic CSS Selectors

CSS has three primary types of selectors (tag, id, and class) that select elements based on the tag name, `id` attribute, or `class` attribute. Learn the syntax for these three selectors, but don't get bogged down trying to memorize how you can combine them. For now, rely on the documentation.

#### CSS Properties

Stick to the documentation as you start out; don't try to memorize CSS properties until you've used them a few times and seen how they work and interact with your HTML. This way, you'll learn the features you need most often without spending a lot of time absorbing material that you may never use.

The most important properties introduced in this lesson are `color`, `background-color`, `font-family`, and `font-size`; we recommend memorizing these. The other properties you see in this lesson will become familiar with time and practice.

---

## 3. Install Software

## 4. Getting Started

### Read the Tutorial

#### 1. [Building Your First Web Page](https://learn.shayhowe.com/html-css/building-your-first-web-page/)

This tutorial introduces the vocabulary of HTML and CSS and demonstrates a few of the most common tags and rules.  

##### Understanding Common HTML Terms:

* While getting started with HTML, you will likely encounter new—and often strange—[terms](http://www.scriptingmaster.com/html/HTML-terms-glossary.asp). Over time you will become more and more familiar with all of them, but the three common HTML terms you should begin with are *elements*, *tags*, and *attributes*.
* **Elements:** Elements are designators that define the structure and content of objects within a page. Some of the more frequently used elements include multiple levels of headings (identified as `<h1>` through `<h6>` elements) and paragraphs (identified as the `<p>` element); the list goes on to include the `<a>`, `<div>`, `<span>`, `<strong>`, and `<em>` elements, and many more.
* **Tags:** The use of less-than and greater-than angle brackets surrounding an element creates what is known as a *tag*. Tags most commonly occur in pairs of opening and closing tags.
* **Attributes:** *Attributes* are properties used to provide additional information about an element. The most common attributes include the `id` attribute, which identifies an element; the `class` attribute, which classifies an element; the `src` attribute, which specifies a source for embeddable content; and the `href` attribute, which provides a hyperlink reference to a linked resource.

##### Setting Up the HTML Document Structure:

* All HTML documents have a required structure that includes the following declaration and elements: `<!DOCTYPE html>`, `<html>`, `<head>`, and `<body>`.

  ```html
  <!DOCTYPE html>
  <html>
    <head>
      
    </head>
    <body>
      
    </body>
  </html>
  ```

##### Understanding Common CSS Terms

* In addition to HTML terms, there are a few common [CSS terms](http://www.impressivewebs.com/css-terms-definitions/) you will want to familiarize yourself with. These terms include *selectors*, *properties*, and *values*. 

* **Selectors:** 

  * As elements are added to a web page, they may be styled using CSS. A *selector* designates exactly which element or elements within our HTML to target and apply styles (such as color, size, and position) to. Selectors may include a combination of different qualifiers to select unique elements, all depending on how specific we wish to be. For example, we may want to select every paragraph on a page, or we may want to select only one specific paragraph on a page.

  * Selectors generally target an attribute value, such as an `id` or `class` value, or target the type of element, such as `<h1>` or `<p>`.

  * Within CSS, selectors are followed with curly brackets, `{}`, which encompass the styles to be applied to the selected element. The selector here is targeting all `<p>` elements.

    ```css
    p { ... }
    ```

* **Properties:**

  * Once an element is selected, a property determines the styles that will be applied to that element. Property names fall after a selector, within the curly brackets, `{}`, and immediately preceding a colon, `:`. There are numerous properties we can use, such as `background`, `color`, `font-size`, `height`, and `width`, and new properties are often added. In the following code, we are defining the `color` and `font-size` properties to be applied to all `<p>` elements.

    ```css
    p {
      color: ...;
      font-size: ...;
    }
    ```

* **Values:**

  * So far we’ve selected an element with a selector and determined what style we’d like to apply with a property. Now we can determine the behavior of that property with a value. Values can be identified as the text between the colon, `:`, and semicolon, `;`. Here we are selecting all `<p>` elements and setting the value of the `color` property to be `orange` and the value of the `font-size` property to be `16` pixels.

    ```css
    p {
      color: orange;
      font-size: 16px;
    }
    ```

##### Working with Selectors:

* The most common types of selectors are: _type_, _class_, and _ID_ selectors.

* **Type Selectors:**

  * *Type* selectors target elements by their element type. For example, should we wish to target all division elements, `<div>`, we would use a type selector of `div`. The following code shows a type selector for division elements as well as the corresponding HTML it selects.

    ###### CSS

    ```css
    div { ... }
    ```

    ###### HTML

    ```html
    <div>...</div>
    <div>...</div>
    ```

* **Class Selectors:**

  * *Class* selectors allow us to select an element based on the element’s `class` attribute value. Class selectors are a little more specific than type selectors, as they select a particular group of elements rather than all elements of one type.

  * Class selectors allow us to apply the same styles to different elements at once by using the same `class` attribute value across multiple elements.

  * Within CSS, classes are denoted by a leading period, `.`, followed by the `class` attribute value. Here the class selector will select any element containing the `class` attribute value of `awesome`, including both division and paragraph elements.

    ###### CSS

    ```css
    .awesome { ... }
    ```

    ###### HTML

    ```html
    <div class="awesome">...</div>
    <p class="awesome">...</p>
    ```

* **ID Selectors:** 

  * *ID* selectors are even more precise than class selectors, as they target only one unique element at a time. Just as class selectors use an element’s `class` attribute value as the selector, ID selectors use an element’s `id` attribute value as a selector.

  * Regardless of which type of element they appear on, `id` attribute values can only be used once per page. If used they should be reserved for significant elements.

  * Within CSS, ID selectors are denoted by a leading hash sign, `#`, followed by the `id` attribute value. Here the ID selector will only select the element containing the `id` attribute value of `shayhowe`.

    ###### CSS

    ```css
    #shayhowe { ... }
    ```

    ###### HTML

    ```html
    <div id="shayhowe">...</div>
    ```

##### Referencing CSS:

* In order to get our CSS talking to our HTML, we need to reference our CSS file within our HTML. The best practice for referencing our CSS is to include all of our styles in a single external style sheet, which is referenced from within the `<head>` element of our HTML document. Using a single external style sheet allows us to use the same styles across an entire website and quickly make changes sitewide.

* To create our external CSS style sheet, we’ll want to use our text editor of choice again to create a new plain text file with a `.css` file extension. Our CSS file should be saved within the same folder, or a subfolder, where our HTML file is located.

* Within the `<head>` element of the HTML document, the `<link>` element is used to define the relationship between the HTML file and the CSS file. Because we are linking to CSS, we use the `rel` attribute with a value of `stylesheet` to specify their relationship. Furthermore, the `href` (or hyperlink reference) attribute is used to identify the location, or path, of the CSS file.

* Consider the following example of an HTML document `<head>` element that references a single external style sheet.

  ```html
  <head>
    <link rel="stylesheet" href="main.css">
  </head>
  ```

* In order for the CSS to render correctly, the path of the `href` attribute value must directly correlate to where our CSS file is saved. In the preceding example, the `main.css` file is stored within the same location as the HTML file, also known as the root directory.
* If our CSS file is within a subdirectory or subfolder, the `href` attribute value needs to correlate to this path accordingly. For example, if our `main.css` file were stored within a subdirectory named `stylesheets`, the `href` attribute value would be `stylesheets/main.css`, using a forward slash to indicate moving into a subdirectory.

#### 2. [Getting to Know HTML](https://learn.shayhowe.com/html-css/getting-to-know-html/)

This tutorial discusses some basic HTML concepts, notably semantics, headings, paragraphs, simple HTML-based styling, and the general structure of an HTML document. It also examines hyperlinks and URLs.  

In this lesson we covered the following:

* What semantics are and why they are important
* `<div>`s and `<span>`s, and the difference between block- and inline-level elements
* Which text-based elements best represent the content of a page
* The HTML5 structural elements and how to define the structure and organization of our content and page
* How to use hyperlinks to navigate between web pages or websites

#### 3. [Getting to Know CSS](https://learn.shayhowe.com/html-css/getting-to-know-css/)

This tutorial brings CSS into the mix, introducing the cascade, specificity, selectors, and an assortment of properties.  

Within this lesson we've discussed the following:

* How style sheets cascade from the top to the bottom of a file
* What specificity is and how we can calculate it
* How to combine selectors to target specific elements or groups of elements
* How to use multiple classes on a single element to layer on different styles for more modular code
* The different color values available to use within CSS, including keyword, hexadecimal, RGB, and HSL values
* The different length values available to use within CSS, including pixels, percentages, and em units

---

## 5. Creating an HTML Skeleton

Building a new web page often begins with creating an HTML file that contains some minimal HTML. Most developers like to create the skeleton of an HTML file and put it someplace where they can readily use it to create new HTML files without having to write a bunch of boilerplate. We'll call this file your **HTML skeleton** or the **HTML scaffold**.

### Creating the HTML Skeleton

Here's a typical HTML skeleton, based on the simple document you worked on in the Shay Howe tutorial.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>your page title goes here</title>
    <meta charset="utf-8" />
  </head>
  <body>
  </body>
</html>
```

---

## 6. Classes, IDs, and Names

HTML provides three ways to identify certain elements: classes, ids, and names. Any element can use a `class` or `id` attribute, and a variety of elements can use the `name` attribute.

### Classes

The `class` attribute identifies a set of page elements that you wish to style consistently. 

* Use the `class` attribute to assign a class or classes to an element.
* Any number of elements may belong to the same class.
* Any element can belong to one or more classes. List all the names separated by spaces in the `class` attribute, e.g., `class="executive management full-time"`.
* Prefer semantic class names; they should provide meaning. For instance, use `teaching-assistant` rather than `yellow-background`.
* Use CSS class selectors (`.classname`) to select elements by class, e.g., `.teaching-assistant`.
* Class selectors have lower CSS specificity than ID selectors (an ID selector overrides a class selector), but higher than tag name selectors (a class selector overrides a tag selector). Thus, the `.teaching-assistant` selector overrides the `tr` selector. See [Getting to Know CSS](https://learn.shayhowe.com/html-css/getting-to-know-css/#cascade).

### IDs

The `id` attribute applies a unique identification string to a single element, such as a headline; no other `id` attributes on the page should have the same ID.

* Use the `id` attribute to assign an ID to an element.
* Each ID on a page must be unique.
* Each element can have one ID or none.
* Use semantic ID names; they should provide meaning. For instance, use an ID name of `headline` rather than `big-font`.
* Use CSS ID selectors (`#idname`) to select elements by ID, e.g., `#headline`.
* ID selectors have higher CSS specificity than class selectors (an ID selector can override a class selector).

### Names

We won't use the `name` attribute until much later in this course. For now, all you must know about the `name` attribute is that it ties form elements to data on the server - it typically doesn't play a role in styling. You can use the `[name="field-name"]` selector to select elements by name, but you should use a class or ID selector instead. When you submit a form, the browser sends the form data to the server using name/value pairs in which each name comes from the associated `name` attribute. For instance:

```html
<form method="get" action="#">
  <label for="first-name-field">First name:</label>
  <input type="text" name="first-name" id="first-name-field" />

  <label for="last-name-field">Last name:</label>
  <input type="text" name="last-name" id="last-name-field" />

  <input type="submit" value="Search" />
</form>
```

When you submit this form, the browser constructs a query string that looks like this:

```plaintext
first-name=Joe&last-name=Jones
```

Note that the browser does not send the `id` attribute value to the server.  

Since the `for` attribute references an ID (as we'll see later), it's accepted practice to use both a `name` and an `id` on form elements and to use the same value for both:

```html
<form method="get" action="#">
  <label for="first-name">First name:</label>
  <input type="text" name="first-name" id="first-name" />

  <label for="last-name">Last name:</label>
  <input type="text" name="last-name" id="last-name" />

  <input type="submit" value="Search" />
</form>
```

* Use the `name` attribute to assign a name to a form data element that the server can use to obtain the value. 
* Not all tags accept the `name` attribute; it applies to input controls in forms. Some other elements have a `name` attribute, too, but with a different meaning.
* Always use a `name` attribute on form elements that accept it.
* Each name in a form should be unique to that form except for radio buttons and checkboxes that belong to a single group.
* Use descriptive `name` values, not semantic. For instance, use `name="last-name"` instead of `name="input-field"`.
* Avoid trying to select elements in CSS by using the `name` attribute.

---

## 7. Practice Problems: Semantics

1. Which of these tags are semantic, and which are not?

   |             |            |            |             |
   | :---------: | :--------: | :--------: | ----------- |
   |             |            |            |             |
   | `<article>` | `<aside>`  |   `<b>`    | `<div>`     |
   | `<footer>`  |   `<h3>`   | `<header>` | `<section>` |
   |  `<span>`   | `<strong>` |            |             |

   Semantic: `<article>`, `<aside>`, `<b>`, `<footer>`, `<h3>`, `<header>`, `<section>`, and `<strong>`

   Not Semantic: `<div>` and `<span>`

2. Given the following HTML, would `<section>`, `<aside>`, `<article>`, or `<div>` be the most appropriate element for the tag shown as `<sometag>`?

   ```html
   <sometag>
     <h1>Lincoln's Gettysburg Address</h1>
     <p>
       Four score and seven years ago our fathers brought forth on this
       continent, a new nation, conceived in Liberty, and dedicated to the
       proposition that all men are created equal.
     </p>
     <p>
       Now we are engaged in a great civil war, testing whether that nation,
       or any nation so conceived and so dedicated, can long endure. We are
       met on a great battle-field of that war. We have come to dedicate a
       portion of that field, as a final resting place for those who here gave
       their lives that that nation might live. It is altogether fitting and
       proper that we should do this.
     </p>
     <p>
       But, in a larger sense, we can not dedicate—we can not consecrate—we
       can not hallow—this ground. The brave men, living and dead, who
       struggled here, have consecrated it, far above our poor power to add or
       detract. The world will little note, nor long remember what we say
       here, but it can never forget what they did here. It is for us the
       living, rather, to be dedicated here to the unfinished work which they
       who fought here have thus far so nobly advanced. It is rather for us
       to be here dedicated to the great task remaining before us—that from
       these honored dead we take increased devotion to that cause for which
       they gave the last full measure of devotion—that we here highly
       resolve that these dead shall not have died in vain—that this nation,
       under God, shall have a new birth of freedom—and that government of
       the people, by the people, for the people, shall not perish from the
       earth.
     </p>
   </sometag>
   ```

   My response: `<section>` or `<article>`

3. Given the HTML from question 2, would it be appropriate to replace `<sometag>` with `<address>` or `<blockquote>`? If so, which one?

   A `<blockquote>` might make sense as this is quoted passage from some other source. But an `<address>` does not make sense here since it is used to identify contact information, not speeches.

4. Given the following HTML, would `<section>`, `<aside>`, `<article>`, or `<div>` be the most appropriate element for the tag shown as `<sometag>`?

   ```html
   <sometag>
     <h3>Text-align Property</h3>
     <p>
       Given the width of the paragraph, the heading looks odd hanging out on
       the left side of the screen. Let's center it instead; we'll do this
       with the text-align property:
     <p>
   
     <pre>
       <h1 style="color: orange; text-align: center;">Hello, Internet!</h1>
     </pre>
   </sometag>
   ```

   My response: Looks kind of like it could be a sidebar comment or glossary item, so maybe `<aside>`.  

   LS response: This time, a `<section>` tag may be the best choice. The text appears to be part of a larger body of work, but it isn't a standalone block like an `article`. It's also not an `aside` since it appears to be part of the main document flow.

5. Given the following HTML, would `<aside>`, `<section>`, `<blockquotes>`, or `<div>` be the most appropriate element for the tag shown as `<sometag>`?

   ```html
   <h3>Hex Colors</h3>
   
   <p>
     Most graphics and design applications like Photoshop and Pixelmator
     display colors in hexadecimal format, so it's easy to copy and paste
     color values you need from one program into your editor as a CSS
     property.
   </p>
   
   <sometag>
     <p>
       If you're unfamiliar with the hexadecimal numbering system, it uses 16
       different digits instead of the ten the decimal system uses. The hex
       digits are 0 through 9, as in the decimal system, but also include a
       through f (or A through F) as valid digits.
     </p>
   </sometag>
   ```

   That looks like an `<aside>`, and to a lesser extent, a `<section>`.

---

## 8. Walkthrough Project: A Simple Web Page

* **HTML character entities:** All entities follow the pattern of an ampersand (`&`) followed by one or more alphanumeric characters terminated by a semicolon (`;`). All have numeric versions, and most have alphanumeric names, e.g., `&#38;` also represents an ampersand (`&amp;`); you should use the alphanumeric name when you can, though.
* **HTML headings:** Don't use `h1`, `h2`, etc. solely because you want to change font sizes. The numbered heading elements have semantic meaning; using them for their font sizes makes it harder for search engines and assistive technologies to understand your code and present it in a useful format. Misusing HTML for its stylistic effects also makes it hard for other developers to understand your code.

---

## 9. Walkthrough Project: Adding Style to Your Web Page

## 10. Guided Project: A Personal Profile

## 11. Practice Problems: Text Formatting

These practice problems focus on HTML and CSS that deal with text, like the font family, style, color, and size.

1. Create an HTML page with a single paragraph of text. Write CSS to set the font size for most elements on the page to 20px (you may ignore headers, subscripts, and other items that often have a different size).

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>HTML & CSS Practice</title>
       <meta charset="utf-8" />
       <style>
         body {
           font-size: 20px;
         }
       </style>
     </head>
     <body>
       <p>
         Both behaviours and attributes are defined within a class, but before any object is created, or instantiated, the behaviours and attributes exist only in potentia; that is, they exist as formal essential possibilities rather than as substantive particular realities. And in this case, contra the existentialists, essence precedes existence.
       </p>
     </body>
   </html>
   ```

2. Change the font family for the page from the previous problem to a sans-serif font.

   ```css
   <style>
     body {
       font-size: 20px;
       font-family: Arial, Helvetica, sans-serif;
     }
   </style>
   ```

3. Change the CSS for the previous problem to give the browser a choice one of three fonts (Tahoma, Trebuchet MS, Verdana), depending on what is available, before it uses the default sans-serif font.

   ```html
   <style>
     body {
       font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
       font-size: 20px;
     }
   </style>
   ```

4. Change the text from the previous problem to italic.

   ```html
   <style>
     body {
       font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
       font-size: 20px;
       font-style: italic;
     }
   </style>
   ```

5. Change the CSS from the previous problem to boldface (keep the italics).

   ```html
   <style>
     body {
       font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
       font-size: 20px;
       font-style: italic;
       font-weight: bold;
     }
   </style>
   ```

6. Change the CSS from the previous problem to increase the line height to 2.5 times its default height.

   ```html
   <style>
     body {
       font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
       font-size: 20px;
       font-style: italic;
       font-weight: bold;
     }
   </style>
   ```

7. Change the CSS you wrote in questions 1-6 to a shorthand form that uses precisely one property. The output should not change.

   ```html
   <style>
     body {
       /*        font-size: 20px;
       font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
       font-style: italic;
       font-weight: bold;
       line-height: 2.5;*/
       font: italic bold 20px/2.5 Tahoma, "Trebuchet MS", Verdana, sans-serif;
     }
   </style>
   ```

8. Change the CSS from the previous problem to right-align the text within the paragraph:

   ```html
   <style>
     body {
       /*        font-size: 20px;
       font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
       font-style: italic;
       font-weight: bold;
       line-height: 2.5;*/
       font: italic bold 20px/2.5 Tahoma, "Trebuchet MS", Verdana, sans-serif;
       text-align: right;
     }
   </style>
   ```

9. Change the CSS from the previous problem to center-align the text within the paragraph:

   ```html
   <style>
     body {
       /*        font-size: 20px;
       font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
       font-style: italic;
       font-weight: bold;
       line-height: 2.5;*/
       font: italic bold 20px/2.5 Tahoma, "Trebuchet MS", Verdana, sans-serif;
       text-align: center;
     }
   </style>
   ```

10. Change the CSS from the previous problem to fully justify the text within the paragraph:

    ```html
    <style>
      body {
        /*        font-size: 20px;
        font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
        font-style: italic;
        font-weight: bold;
        line-height: 2.5;*/
        font: italic bold 20px/2.5 Tahoma, "Trebuchet MS", Verdana, sans-serif;
        text-align: justify;
      }
    </style>
    ```

11. Change the CSS from the previous problem to indent the start of the paragraph by 4em.

    ```html
    <style>
      body {
        /*        font-size: 20px;
        font-family: Tahoma, "Trebuchet MS", Verdana, sans-serif;
        font-style: italic;
        font-weight: bold;
        line-height: 2.5;*/
        font: italic bold 20px/2.5 Tahoma, "Trebuchet MS", Verdana, sans-serif;
        text-align: justify;
        text-indent: 4em;
      }
    </style>
    ```

12. Write the CSS needed to reproduce this screenshot:

    (screenshot not copied)

    ```html
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>HTML & CSS Practice</title>
        <meta charset="utf-8" />
        <style>
          body {
            font: normal 14px Helvetica, Arial, sans-serif;
          }
    
          h1 {
            font-family: Georgia, serif;
          }
    
          code {
            font-family: monospace;
            font-style: italic;
            text-decoration: underline;
          }
        </style>
      </head>
      <body>
        <article>
          <header>
            <h1>Finessing `feColorMatrix`</h1>
          </header>
          <p>
            Harness the power of <code>feColorMatrix</code> to create detailed
            filters, with Una Kravets as your guide.
          </p>
        </article>
      </body>
    </html>
    ```

13. Change the CSS from the previous problem to display the `h1` element text in blue, and the `code` text in green.

    ```html
    <style>
      body {
        font: normal 14px Helvetica, Arial, sans-serif;
      }
    
      h1 {
        font-family: Georgia, serif;
        color: blue;
      }
    
      code {
        font-family: monospace;
        font-style: italic;
        text-decoration: underline;
        color: green;
      }
    </style>
    ```

14. Write the CSS needed to reproduce this screenshot:

    (screenshot not copied)

    ```html
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>HTML & CSS Practice</title>
        <meta charset="utf-8" />
        <style>
          body {
            font-size: 18px;
          }
    
          mark {
            background-color: yellow;
            font-family: Courier, monospace;
            font-size: 12px;
          }
    
          strong {
            font-size: 15px;
          }
    
          em {
            font-size: 20px;
            text-transform: uppercase;
          }
        </style>
      </head>
      <body>
        <p>That episode was <mark>un<strong>be<em>lieve</em></strong>able</mark>!</p>
      </body>
    </html>
    ```

15. Create some HTML with this paragraph:

    ```html
    <p>
      The Creating Hyperlinks section of Getting to Know HTML discusses
      hyperlinks, or anchors. Be sure to work both "In Practice" sections; they
      pick up from where you left off in an earlier reading assignment.
    </p>
    ```

    Convert the text `Getting to know HTML` to a hypertext link to this URL:

    ```plaintext
    http://learn.shayhowe.com/html-css/getting-to-know-html/#creating-hyperlinks
    ```

    The link should open in a new browser tab or window. Add CSS to remove the underline and change the color to red.

    ```html
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>HTML & CSS Practice</title>
        <meta charset="utf-8" />
        <style>
          a {
            color: red;
            text-decoration: none;
          }
        </style>
      </head>
      <body>
        <p>
          The Creating Hyperlinks section of <a href="http://learn.shayhowe.com/html-css/getting-to-know-html/#creating-hyperlinks" target="_blank">Getting to Know HTML</a> discusses
          hyperlinks, or anchors. Be sure to work both "In Practice" sections; they
          pick up from where you left off in an earlier reading assignment.
        </p>
      </body>
    </html>
    ```

---

## 12. On Your Own: Creating a Simple Page

## 13. Practice Problems: CSS Selectors

1. Set the width of the page body to `600px`.

   ```css
   body {
   	width: 600px;
   }
   ```

2. Set the font size on all paragraphs to `18px`.

   ```css
   p {
     font-size: 18px;
   }
   ```

3. Change the font for all list items (the `li` tags) to a `monospace` font, and give them a color of `purple`.

   ```css
   li {
     font-family: monospace;
     color: purple;
   }
   ```

4. Remove the underlines from all links on the page.

   ```css
   a {
     text-decoration: none;
   }
   ```

5. Change the `li` selector from problem 3 so that it no longer styles the lists inside the `header` section. Don't add any new CSS, but you can modify the selector for an existing rule. Afterward, the list items in the header should be blue with a proportional (non-monospace) font, and the numbers should be black. All remaining list items should be purple and monospace.

   ```css
   main li {
     font-family: monospace;
     color: purple;
   }
   ```

6. Set the color on all paragraphs that are inside an `article` element to `brown`.

   ```css
   article p {
     color: brown;
   }
   ```

7. Add the background color `#e0e0e0` to the "First Article" heading.

   ```css
   .subheading {
     background-color: #e0e0e0;
   }
   ```

8. Set the font size for the element with ID `intro` to `24px`.

   ```css
   #intro {
     font-size: 24px;
   }
   ```

9. **Challenge:** Change the color for all list items directly within an unordered list in the `main` section to `green`. Be careful not to change any of the list items that don't belong to an unordered list, nor any of the list items in the `header` element.

   ```css
   main ul > li {
     color: green;
   }
   ```

---

## 14. CSS Diner

## 15. Using the Chrome Inspector

## 16. HTML and CSS Style Guide

## 17. Summary

### HTML

- HTML is an acronym for HyperText Markup Language.
- HTML uses markup to organize your content and give it semantic meaning.
- Elements are the basic building blocks of HTML.
- We use tags in HTML to represent elements.
- Tags may have attributes that add details to the element.
- The Document Type Definition (DTD or DOCTYPE) tells the browser what subset of HTML you intend to use.
- All documents require a DOCTYPE.
- All documents should have `html`, `head`, `title`, and `body` tags, and should also include a `meta` tag that defines the character set. The standard does not require these tags, but always using them will keep you out of trouble.
- HTML attributes `id`, `class`, and `name` assign different kinds of identification information to HTML elements.
- The `p`, `a`, `em`, `strong`, and `h1`..`h6` tags; you should memorize these. You should also be familiar with the `header`, `main`, `article`, `section`, `aside`, `div` and `span` tags, but you don't have to recognize them yet; you will through repeated use, though.
- HTML character entities, and how to use them in place of the literal `<`, `>`, and `&` characters.

### CSS

- CSS is an acronym for Cascading Style Sheets.
- CSS tells your browser how to present content with spacing, colors, sizing, font styles, background images, placement, and much more.
- CSS properties have a name and value.
- CSS rules have a selector that describes what elements to style and a list of zero or more properties that define how the browser should render them.
  - CSS tag selectors select HTML elements by element (tag) name, e.g., `h1`
  - CSS class selectors select HTML elements by class name. The selector consists of a `.` followed by the class name, e.g., `.highlight`.
  - CSS ID selectors select HTML elements by ID name. The selector consists of a `#` followed by the ID, e.g., `#intro`.
  - You can concatenate CSS selectors to make them more specific, e.g., `strong.highlight`.
- CSS has both specificity and inheritance rules that control the notion of the cascade; together, these rules define how CSS rules with different selectors interact.
- CSS font stacks tell the browser which font to use by providing a list of candidate fonts along with an optional "fallback" font family.
- The difference between serif and sans-serif fonts.
- The differences, benefits, and problems with inline, internal, and external CSS.
- How to set text and background colors, font families, and font sizes.

---



