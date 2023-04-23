##### LS202 HTML and CSS > Lesson 5: Forms

---

## 1. Introduction

### What to Focus On

* Use the `form` tag.
* Know the differences between checkboxes, radio buttons, and selection lists.
* Use `input` and `textarea` text tags.
* Understand the `type` attribute on `input` tags:
  - `checkbox`, `radio`
  - `text`, `email`, `tel`, `password`
  - `submit`, `reset`
  - `hidden`
* Construct `select` lists
* Use labels in a form with both container and `for` formats.
* Use description lists to help format forms.

---

## 2. Forms Overview

### The `form` Tag

* The `form` tag is the parent for all form-related tags. It tells the browser where and how to send the data. The most important attributes are `action` and `method`.
* A form should contain at least one `input`, `textarea`, or `select` tag; without one, the form is useless. We use the terms **control**, **widget**, and **input** informally to refer to any of these elements as a group. If we need to be more specific, we'll talk about an input tag or input element or use `input` with inline-code styling. In the real world, there is no single term like **control** or **input** that has the same connotation -- **widget** probably comes closest.

###### The `method` Attribute

* The `method` attribute tells the browser whether it should use the HTTP GET or HTTP POST method when sending the data to the server. You should use `method="get"` when requesting information from the server, and use `method="post"` when updating data on the server.
* HTTP supports several other methods, but HTML limits you to `GET` and `POST`. You must use JavaScript or a backend application to use the other methods.

###### The `action` and `formaction` Attributes

* `action` provides the URL to which the browser sends requests. Individual action items (`button` and `input type="submit"` elements) in a form can override the form's `action` value by using the `formaction` attribute.

### The `fieldset` Tag

* `fieldset` is an optional tag that groups together form content as a set of related data; most browsers draw a border around the content. While it's common to remove that border with CSS, `fieldset` still provides useful semantic data to the browser, and developers can reference it in their CSS for layout and styling purposes.

* Forms can have multiple `fieldset` tags.

  ```html
  <form action="/login" method="post">
    <fieldset>
      <input type="text" name="username" />
      <input type="password" name="password" />
    </fieldset>
    <fieldset>
      <input type="submit" value="Save" />
      <input type="submit" value="Forgot Password" formaction="/forgot" />
    </fieldset>
  </form>
  ```

### The `label` Tag

* The `label` tag provides a way to associate some identifying text with an input field. Here we associate the label `Phone` with the field named `phone_number`:

  ```html
  <label for="phone">Phone</label>
  <input type="text" id="phone" name="phone_number" />
  ```

* The browser uses the `for` attribute in the `label` tag and the `id` attribute in the `input` tag to associate the two items. One advantage of this association is that the user can click on the label to make the cursor jump to the desired field.

* You can also use `label` tags as containers:

  ```html
  <label>
    Phone
    <input type="text" name="phone" />
  </label>
  ```

* The "container" syntax eliminates the need for the `for` and `id` attributes, so it's easier to use. However, styling can be more difficult with the container syntax, and there are times when you must use a `for` attribute, so learn both variants.

----

## 3. Input Types

### Type

The most common input types are as follows:

###### Type `text`

* The `text` type creates a simple text entry field. The user can enter any text desired in this control, though the developer should almost always validate the data. Use the `maxlength` attribute to specify the input's maximum length.

  ```html
  <form action="#" method="post">
    <fieldset>
      <label>
      	First Name
        <input type="text" name="first_name" value="Tom" />
      </label>
    </fieldset>
  </form>
  ```

###### Type `password`

* The `password` type creates a single-line text field with an obscured value, often used for passwords and other sensitive information. Use the `maxlength` attribute to specify the input's maximum length.

  ```html
  <form action="#" method="post">
    <fieldset>
      <label for="password">Password</label>
      <input type="password" name="password" id="password"
             value="Not-good-password" size="35" />
    </fieldset>
  </form>
  ```

###### Type `email`

* The `email` type allows entry of an email address in the form `username@domain`. Browsers that implement this type try to prevent incorrectly formatted email addresses. However, the developer should almost always validate the data too.

  ```html
  <form action="#" method="post">
    <fieldset>
      <label>
        Email
        <input type="email" name="email" placeholder="username@domain" />
      </label>
    </fieldset>
  </form>
  ```

###### Type `tel`

* The `tel` type allows entry of a telephone number. Browsers that implement this type don't validate the input since phone numbers vary so much worldwide.

  ```html
  <form action="#" method="post">
    <fieldset>
      <label>
        Phone
        <input type="tel" name="phone" placeholder="(###) ###-####" />
      </label>
    </fieldset>
  </form>
  ```

###### Type `checkbox`

* The `checkbox` type lets the user choose one or more items from a series of yes/no-type options. Use the `value` attribute to give the value the form sends to the server when the user selects that checkbox. Use the `checked` attribute to pre-select checkboxes. Use the `name` attribute to name a set of related checkboxes. The user can select zero or more items in each set of checkboxes.

  ```html
  <form action="#" method="post">
    <fieldset>
      <label>
        <input type="checkbox" name="choice" value="search" />
        Sort search results
      </label>
      
      <label>
        <input type="checkbox" name="choice" value="google" checked />
        Search on Google
      </label>
      
      <label>
        <input type="checkbox" name="choice" value="recent" checked />
        Recent results (within last year)
      </label>
    </fieldset>
  </form>
  ```

###### Type `radio`

* The `radio` type lets the user choose zero or one item from a list of options. Use the `value` attribute to define the value submitted by this item. Use the `checked` attribute to mark the default radio button. If there is no default button, use the `required` attribute on all of the buttons in a group to enforce selecting a button. Use the `name` attribute to name a set of related radio buttons. The user can select precisely one radio button from each group.

  ```html
  <form action="#" method="post">
    <fieldset>
      <label>
        <input type="radio" name="color" value="red" />
        Red
      </label>
      
      <label>
        <input type="radio" name="color" value="green" checked />
        Green
      </label>
      
      <label>
        <input type="radio" name="color" value="blue" />
        Blue
      </label>
    </fieldset>
  </form>
  ```

###### Type `submit`

* The `submit` type creates a button that the user can click to submit the contents of a form to the server. The `action` attribute on the `form` tag typically provides the URL of the server, but you can override that by using the `formaction` attribute with this tag.

  ```html
  <form action="#" method="post">
    <fieldset>
      <input type="submit" value="Save" />
    </fieldset>
  </form>
  ```

###### Type `reset`

* The `reset` type creates a button that the user can click to reset the contents of a form to its default values. Clicking a `reset` button does not send a request to the server.

  ```html
  <form action="#" method="post">
    <fieldset>
      <input type="reset" value="Clear Form" />
    </fieldset>
  </form>
  ```

---

## 4. Input Attributes

The `input` tag supports a variety of attributes -- some work with most input types, and some with just one. We describe the features worth memorizing in this assignment.

###### The `value` Attribute

Most input controls can use the `value` attribute, but the meaning varies with the `type`.

* For text-based types such as `text`, `email`, and `number`, the `value` assigns a default value for the control. If you don't supply a default value, the browser uses an empty string.

  ```html
  <form action="#" method="post">
    <fieldset>
      <label>
        Phone
        <input type="tel" name="phone" value="503-555-1212" />
      </label>
    </fieldset>
  </form>
  ```

  You should use `value` when you already have a value, either loaded from a database or provided by the user during the session.

* `checkbox` and `radio` types use the `value` attribute to set the value that the form submits for the indicated checkbox or radio group element.

  ```html
  <form action="#" method="post">
    <fieldset>
      <label>
        <input type="radio" name="color" value="red" />
        Red
      </label>
      <br />
  
      <label>
        <input type="radio" name="color" value="blue" checked />
        Blue
      </label>
      <br />
  
      <label>
        <input type="radio" name="color" value="green" />
        Green
      </label>
    </fieldset>
  </form>
  ```

  Technically, `radio` input types don't require the `value` attribute, but that can lead to undesirable behavior; we recommend always using a `name` value and using the same `name` on all radio buttons that belong together.  

  Note that we added a `checked` attribute to the blue button to make that button the initial selection. If we want to leave all of the radio buttons unselected, but still require a selection, we can add a `required` attribute to each button.  

* Button types, such as `submit`, `reset`, and the `button` type use the `value` attribute for the label that appears on the button:

  ```html
  <form action="#" method="post">
    <fieldset>
      <input type="submit" value="Save" />
    </fieldset>
  </form>
  ```

###### The `size` and `maxlength` Attributes

These attributes apply to most text-based input types.  

The `size` attribute lets you control the size of an `input` element in characters. You can also specify the width with the CSS `width` property, but it does not support character measurements. `maxlength` is similar, but it limits the maximum length of input values; this value can be more or less than the `size` value.

```html
<form action="#" method="post">
  <fieldset>
    <label>
      Phone
      <input type="tel" name="phone" size="10" maxlength="16" />
    </label>
    <br />
    <label>
      Cell Phone
      <input type="tel" name="cell-phone" size="20" maxlength="40" />
    </label>
  </fieldset>
</form>
```

###### The `placeholder` Attribute

The `placeholder` attribute lets you display some text when a field is empty to help describe the expected input; it applies to most of the text-based `input` types. Most browsers display `placeholder` text using a grayed-out format, and they erase the placeholder text as soon as you start typing:  

```html
<form action="#" method="post">
  <fieldset>
    <label>
      Phone
      <input type="tel" name="phone" placeholder="###-###-####" />
    </label>
  </fieldset>
</form>
```

###### The `disabled` Attribute

The `disabled` attribute lets you disable `input` elements; the browser renders disabled elements but won't let the user interact with them. The rendering looks different from enabled attributes, often by using a gray or lighter color. `disabled` also turns on the `:disabled` CSS pseudo-class. (Non-disabled elements set the `:enabled` pseudo-class.)  

Most web applications handle the `disabled` attribute programmatically, either at the time the application generates the HTML or dynamically with JavaScript. You still need to know that `disabled` exists, though; you may have to write some HTML for a program that expects disabled inputs on the original form.

```html
<form action="#" method="post">
  <fieldset>
    <label>
      Email
      <input type="email" name="email" value="xyz@example.com" disabled />
    </label>
    <br />
    <input type="submit" value="Save" disabled />
  </fieldset>
</form>
```

###### The `required` Attribute

The `required` attribute marks an `input` as required; the browser won't let you submit the form until the user completes all required fields. `required` also turns on the `:required` CSS pseudo-class.

```html
<form action="#" method="post">
  <fieldset>
    <label>
      Home Phone
      <input type="text" name="home_phone" required />
    </label>
    <br />
    <label>
      Business Phone
      <input type="text" name="business_phone" />
    </label>
    <br />
    <input type="submit" value="Save" />
  </fieldset>
</form>
```

###### The `autocomplete` Attribute

You can use `autocomplete` on most `input` text-box elements. This attribute prevents the browser from storing data for later reuse by the browser's `autocomplete` features. Autocomplete is common on smartphones and tablets but can be a nuisance. You can use the values `on` and `off` to explicitly turn `autocomplete` on or off on any given field.

```html
<input type="tel" value="123-456-7890" name="phone" autocomplete="off" />
```

The `autocomplete` option does not affect the `password` input type.

###### The `autocapitalize` Attribute

Some browsers recognize an `autocapitalize` attribute to turn autocapitalization on and off for the first letter of words or sentences. Browsers that recognize this tag default to `sentences`. Use `autocapitalize="none"` when expecting input that you don't want to capitalize. You can also specify `autocapitalize="words"` or `autocapitalize="characters"`.

```html
<input type="text" name="full-name" autocapitalize="words" />
```

`autocapitalize` is not part of the HTML standard, but an attribute provided by some *mobile* browsers, such as iOS Safari and Google Chrome. It does not affect desktop and laptop systems. The W3C HTML validator presently complains about `autocapitalize` since it is non-standard. If you want to use this attribute, you'll have to suffer that complaint.

###### The `autocorrect` Attribute

Some browsers support an `autocorrect` attribute that turns automatic spelling correction on and off. You can disable this feature with `autocorrect="off"`; you should usually disable it with names, addresses, and other information where autocorrection would be a bother.

```html
<input type="text" name="full-name" autocorrect="off" />
```

`autocorrect` is non-standard HTML, but an attribute presently provided by iOS Mobile Safari. Since it is non-standard, the W3C HTML validator will complain about the `autocorrect` attribute. If you want to use this attribute, you'll need to get used to this complaint.

---

## 5. Select and Textarea

### The `textarea` Element

`textarea` lets the user input multiple lines of text. Unlike `text`-type inputs, which ignore carriage returns, newlines, and other whitespace characters, `textarea` elements retain them and use them to format the text into lines and paragraphs. Unlike other controls, though, the value of the `textarea` doesn't use the `value` attribute to provide a value for the element. Instead, you need to contain the text between the opening and closing tags.

```html
<form action="#" method="post">
  <fieldset>
    <label>
      Comment
      <textarea name="tweet">I got 20% off my first purchase at joesburgers.com! You can too!</textarea>
    </label>
  </fieldset>
</form>
```

###### Rows and Cols

`textarea` uses the `rows` and `cols` attributes to control the height and width of the text box; `rows` is the height in lines, while `cols` is the width in characters. As with the `size` attribute on some `input` tags, neither measurement is precise - the browser may choose to display more or fewer lines or columns than requested. The CSS `height` and `width` properties will also override these attributes. Furthermore, the `rows` value is not a maximum for the number of lines of input allowed; instead, it's the number of visible lines. The text box enables vertical scrolling when the content exceeds the `rows` count.  

Most browsers today let the user resize the `textarea` box by dragging and dropping a small triangle that appears in the lower-right corner of the text box.

```html
<form action="#" method="post">
  <fieldset>
    <lable>
      Comment
      <textarea name="tweet" rows="5" cols="40">I got 20% off my first purchase at joesburgers.com! You can too!</textarea>
    </lable>
  </fieldset>
</form>
```

### The `select` Element

`select` creates a drop-down list of options from which the user can select zero or more options. It has two possible child elements, the `option` and `optgroup` elements (we won't discuss `optgroup` in this course). `select` uses the `name` attribute like other form elements, but it uses the `option` elements within it to describe the values shown to the user and sent to the server (which may be different).  

###### The `option` Element

An `option` defines one of the choices a user can make in a `select` tag. A `select` element is useless without its `option` elements. Each `option` represents a possible value for the select, and they use the `value` attribute as the value sent as the value of the `select` element's name. If an `option` does not have a `value` attribute, the browser uses the text contained by the `option` element instead.  

`select` elements often have a placeholder `option` that says something like `Choose one` and has a `value` of an empty string, as well as a `disabled` and `selected` attribute. This option works something like the placeholder attribute on text boxes: the user can see some helpful text, but she cannot select that text.

```html
<form action ="#" method="post">
  <fieldset>
    <label>
      Colors
      <select name="color">
        <option value="" disabled selected>Choose one</option>
        <option value="#f00">Red</option>
        <option value="#0f0">Green</option>
        <option value="#00f">Blue</option>
      </select>
    </label>
  </fieldset>
</form>
```

By default, `select` lets the user choose precisely one option or leave the option unselected if it contains a `disabled selected` option as shown above. If you add the `multiple` attribute, the user can select more than one option. On most browsers, a `select` with `multiple` appears as a (possibly scrolling) rectangle that displays several options. The user then Ctrl-clicks (Windows) or Cmd-clicks (Mac) to select the options she wants. If you use `multiple`, you can also supply the `size` attribute to control the height of the selection box.

```html
<form action="#" method="post">
  <fieldset>
    <label>
      Choose Your Favorite Movies
      <select name="favorites" multiple size="4">
        <option value="" disabled selected>Select One or More</option>
        <option>2001: A Space Odyssey</option>
        <option>Arrival</option>
        <option>Close Encounters of the Third Kind</option>
        <option>District 9</option>
        <option>Guardians of the Galaxy</option>
        <option>Interstellar</option>
        <option>Serenity</option>
        <option>Silent Running</option>
      </select>
    </label>
  </fieldset>
</form>
```

---

## 6. Form Layouts

## 7. Practice Problems: Forms

1. Create a contact form that collects the user's first name, last name, email address, and phone number. Be sure to require all inputs and to use appropriate input types and labels. Prevent Chrome and iOS Safari from doing any auto-actions (e.g., autocomplete and autocorrect) on the email input.  

   For this problem, don't use a definition list to organize your form. We'll do that in the next question.

   ###### My Solution

   ```html
   <form action="#" method="post" autocomplete="off">
     <fieldset>
       <label for="first_name">First Name</label>
       <input type="text" name="first_name" id="first_name" required="required" />
   
       <label for="last_name">Last Name</label>
       <input type="text" name="last_name" id="last_name" required="required" />
   
       <label for="email">Email Address</label>
       <input type="text" name="email" id="email" required="required" />
   
       <label for="phone">Phone Number</label>
       <input type="text" name="phone" id="phone" required="required" />
     </fieldset>
   </form>
   ```

   ###### LS Solution

   ```html
   <form action="#" method="post">
     <fieldset>
       <label for="first_name">First Name</label>
       <input type="text" name="first_name" id="first_name" required />
   
       <label for="last_name">Last Name</label>
       <input type="text" name="last_name" id="last_name" required />
   
       <label for="email">Email Address</label>
       <input type="email" name="email" id="email"
              autocomplete="off" autocorrect="off"
              autocapitalize="none" required />
   
       <label for="phone">Phone Number</label>
       <input type="tel" name="phone" id="phone" required />
   
       <input type="submit" value="Send" />
     </fieldset>
   </form>
   ```

2. Convert the HTML from the previous problem to use a single description list to pair each label and input control.

   ###### My Solution

   ##### HTML

   ```html
   <form action="#" method="post" autocomplete="off">
     <fieldset>
       <dl>
         <dt><label for="first_name">First Name</label></dt>
         <dd><input type="text" name="first_name" id="first_name" required /></dd>
   
         <dt><label for="last_name">Last Name</label></dt>
         <dd><input type="text" name="last_name" id="last_name" required /></dd>
   
         <dt><label for="email">Email Address</label></dt>
         <dd>
           <input type="email" name="email" id="email"
                autocomplete="off" autocorrect="off"
                autocapitalize="none" required />
         </dd>
   
         <dt><label for="phone">Phone Number</label></dt>
         <dd><input type="tel" name="phone" id="phone" required /></dd>
       </dl>
   
       <input type="submit" value="Send" />
     </fieldset>
   </form>
   ```

   ##### CSS

   ```css
   fieldset {
     width: 25%;
   }
   dt {
     display: inline-block;
     box-sizing: border-box;
     width: 28%;
     margin: 10px 0;
   }
   
   dd {
     display: inline-block;
     box-sizing: border-box;
   }
   ```

   ###### LS Solution

   ```html
   <form action="#" method="post">
     <fieldset>
       <dl>
         <dt><label for="first_name">First Name</label></dt>
         <dd>
           <input type="text" name="first_name" id="first_name" required />
         </dd>
   
         <dt><label for="last_name">Last Name</label></dt>
         <dd><input type="text" name="last_name" id="last_name" required /></dd>
   
         <dt><label for="email">Email Address</label></dt>
         <dd>
           <input type="email" name="email" id="email" required
                  autocomplete="off" autocorrect="off" autocapitalize="none" />
         </dd>
   
         <dt><label for="phone">Phone Number</label></dt>
         <dd><input type="tel" name="phone" id="phone" required /></dd>
       </dl>
   
       <input type="submit" value="Send" />
     </fieldset>
   </form>
   ```

3. Add a `select` box to your solution from the previous problem that lets the user select a phone type given the options "home," "business," and "mobile." Make sure you pre-select the "home" option.

   ###### My Solution

   ```html
   <dl>
     ...
   
     <dt><label for="phone">Phone Number</label></dt>
     <dd><input type="tel" name="phone" id="phone" required /></dd>
     <dd>
       <select name="phone_type" id="phone_type">
         <option value="home" selected>home</option>
         <option value="business">business</option>
         <option value="mobile">mobile</option>
       </select>
     </dd>
   </dl>
   ```

   ###### LS Solution

   ```html
   <dt><label for="phone_type">Phone Type</label></dt>
   <dd>
     <select name="phone_type" id="phone_type">
       <option value="home" selected>Home</option>
       <option value="business">Business</option>
       <option value="mobile">Mobile</option>
     </select>
   </dd>
   ```

4. Add a message box to your solution from the previous problem that lets the user enter an optional multi-line message. The message box should allow around six lines of text of up to about 80-characters each.

   ###### My Solution

   ```html
   <dt><label for="message">Optional Message</label></dt>
   <dd>
     <textarea name="message" id="message" rows="6" cols="80"></textarea>
   </dd>
   ```

   ###### LS Solution

   ```html
   <dt><label for="message">Message</label></dt>
   <dd><textarea id="message" name="message" rows="6" cols="80"></textarea></dd>
   ```

5. Add some placeholder text to the phone number input that shows the format you expect to see. (For instance, `###-###-####`.)

   ###### My Solution

   ```html
   <dd><input type="tel" name="phone" id="phone" required placeholder="###-###-####" /></dd>
   ```

   ###### LS Solution

   ```html
   <dt><label for="phone">Phone Number</label></dt>
   <dd>
     <input type="tel" name="phone" id="phone" placeholder="###-###-####"
            required />
   </dd>
   ```

6. Add some placeholder text to the message box, e.g., `Type your message here.`.

   ###### My Solution

   ```html
   <dt><label for="message">Message</label></dt>
   <dd>
     <textarea id="message" name="message" rows="6" cols="80"
               placeholder="Type your message here."></textarea>
   </dd>
   ```

   ###### LS Solution

   ```html
   <dt><label for="message">Message</label></dt>
   <dd>
     <textarea id="message" name="message" rows="6" cols="80"
               placeholder="Type your message here."></textarea>
   </dd>
   ```

7. Create a search form with three items:

   - a field for the search term,
   - a group of three controls to select precisely one from the list "TV," "Movies," and "Music,"
   - a Search button (use the `button` tag, not the obsolete `<input type="button" />` tag).

   The form doesn't have to do anything when submitted. Don't use a description list for this problem.

   ![Search form](https://d3jtzah944tvom.cloudfront.net/202/images/lesson_5/f2.jpg)

   ###### My Solution

   ```html
   <form action="#" method="post">
     <fieldset>
       <label for="search">Search for</label>
       <input type="text" name="search" id="search" />
   
       <input type="radio" id="tv" name="media" value="tv" />
       <label for="tv">TV</label>
   
       <input type="radio" id="movies" name="media" value="movies" />
       <label for="movies">Movies</label>
   
       <input type="radio" id="music" name="media" value="music" />
       <label for="music">Music</label>
   
       <button type="submit">Search</button>
     </fieldset>
   </form>
   ```

   ###### LS Solution

   ```html
   <form action="#" method="get">
     <fieldset>
       <label>
         Search for
         <input type="search" name="query" id="query" />
       </label>
   
       <label>
         <input type="radio" name="filter" value="tv" required />
         TV
       </label>
   
       <label>
         <input type="radio" name="filter" value="movies" required />
         Movies
       </label>
   
       <label>
         <input type="radio" name="filter" value="music" required />
         Music
       </label>
   
       <button name="search">Search</button>
     </fieldset>
   </form>
   ```

   Be sure your form uses a `get` method; since searches customarily don't update the server, a GET request is more appropriate than a POST request.  

   Note that we use a `required` attribute on each `radio` button to ensure that the user must select one of the buttons. Alternatively, we could place the `checked` attribute on one of the buttons to make a default selection.

8. Create a review form with a single control that lets the user select from the movies "Looper," "Frozen," and "Tommy Boy," then add a numeric rating field that the user can set to any integer from 1-5. Next, add a toggle control to add the movie to your favorites list. Enable the toggle control by default. Lastly, add a submit button.

   ![Movie review form](https://d3jtzah944tvom.cloudfront.net/202/images/lesson_5/form-range-01.png)

   ###### My Solution

   ##### HTML

   ```html
   <form>
     <fieldset>
       <dl>
         <dt><label for="movie">Movie</label></dt>
         <dd>
           <select name="movie" id="movie">
             <option value="looper">Looper</option>
             <option value="frozen">Frozen</option>
             <option value="tommy_boy">Tommy Boy</option>
           </select>
         </dd>
   
         <dt><label for="rating">Rating</label></dt>
         <dd>
           <select name="rating" id="rating">
             <option value="1">1</option>
             <option value="2">2</option>
             <option value="3">3</option>
             <option value="4">4</option>
             <option value="5">5</option>
           </select>
         </dd>
   
       </dl>
   
       <label>
         <input type="checkbox" name="favorites" value="add" checked>
         Add to my favorites
       </label>
   
       <button type="submit">Rate movie</button>
     </fieldset>
   </form>
   ```

   ##### CSS

   ```css
   button {
     display: block;
   }
   ```

   ###### LS Solution

   ```html
   <form action="#" method="post">
     <fieldset>
       <dl>
         <dt><label for="title">Movie</label></dt>
         <dd>
           <select name="title" id="title">
             <option value="Looper">Looper</option>
             <option value="Frozen">Frozen</option>
             <option value="Tommy Boy">Tommy Boy</option>
           </select>
         </dd>
         <dt><label for="rating">Rating</label></dt>
         <dd>
           <input type="number" name="rating" id="rating" min="1" max="5" />
         </dd>
       </dl>
       <div>
         <label>
           <input type="checkbox" name="favorite" checked />
           Add to my favorites
         </label>
       </div>
       <input type="submit" value="Rate movie" />
     </fieldset>
   </form>
   ```

9. Add the movie "Alien" to the end of the drop-down list and make it the initial selection when displaying the form.

   ###### My Solution

   ```html
   <select name="title" id="title">
     <option value="Looper">Looper</option>
     <option value="Frozen">Frozen</option>
     <option value="Tommy Boy">Tommy Boy</option>
     <option value="Alien" selected>Alien</option>
   </select>
   ```

   ###### LS Solution

   ```html
   <select name="title" id="title">
     <option value="Looper">Looper</option>
     <option value="Frozen">Frozen</option>
     <option value="Tommy Boy">Tommy Boy</option>
     <option value="Alien" selected>Alien</option>
   </select>
   ```

10. Update your solution to show all four possible choices at once.

    ###### My Solution

    ```html
    <select name="title" id="title" size="4">
    ```

    ###### LS Solution

    ```html
    <select name="title" id="title" size="4">
      <option value="Looper">Looper</option>
      <option value="Frozen">Frozen</option>
      <option value="Tommy Boy">Tommy Boy</option>
      <option value="Alien" selected>Alien</option>
    </select>
    ```

11. Create a form that filters news articles by a single category and any number of selected tag words. Use radio buttons for the news category and checkboxes for the tags. Make sure you use the `get` method to allow the user to save and share the filtered URL.

    - **Categories**: Core, Plugins and Libraries, Conventions, Reviews, Opinion, People
    - **Tags**: HTML, CSS, Javascript, Ruby, Rails, Python, Django

    For this problem, use the container-style `label` tag (without the `for` attribute). Use an unordered list instead of a description list for both the categories and tags.

    ###### My Solution

    ##### HTML

    ```html
    <form action="#" method="get">
      <fieldset>
        <label>
          <legend>Categories</legend>
          <ul>
            <li>
              <label>
                <input type="radio" name="category" value="core" />
                Core
              </label>
            </li>
            <li>
              <label>
                <input type="radio" name="category" value="plugins and libraries" />
                Plugins and Libraries
              </label>
            </li>
            <li>
              <label>
                <input type="radio" name="category" value="conventions" />
                Conventions
              </label>
            </li>
            <li>
              <label>
                <input type="radio" name="category" value="reviews" />
                Reviews
              </label>
            </li>
            <li>
              <label>
                <input type="radio" name="category" value="opinion" />
                Opinion
              </label>
            </li>
            <li>
              <label>
                <input type="radio" name="category" value="people" />
                People
              </label>
            </li>
          </ul>
          <legend>Tags</legend>
          <ul>
            <li>
              <label>
                <input type="checkbox" name="tag" value="html" />
                HTML
              </label>
            </li>
            <li>
              <label>
                <input type="checkbox" name="tag" value="css" />
                CSS
              </label>
            </li>
            <li>
              <label>
                <input type="checkbox" name="tag" value="javascript" />
                Javascript
              </label>
            </li>
            <li>
              <label>
                <input type="checkbox" name="tag" value="ruby" />
                Ruby
              </label>
            </li>
            <li>
              <label>
                <input type="checkbox" name="tag" value="rails" />
                Rails
              </label>
            </li>
            <li>
              <label>
                <input type="checkbox" name="tag" value="python" />
                Python
              </label>
            </li>
            <li>
              <label>
                <input type="checkbox" name="tag" value="django" />
                Django
              </label>
            </li>
          </ul>
      </fieldset>
    </form>
    ```

    ##### CSS

    ```css
    ul {
      list-style: none;
    }
    ```

    ###### LS Solution

    ```html
    <form action="#" method="get">
      <fieldset>
        <h1>Category</h1>
        <ul>
          <li>
            <label>
              <input type="radio" name="category" value="core" required />
              Core
            </label>
          </li>
          <li>
            <label>
              <input type="radio" name="category" value="plugins" required />
              Plugins and Libraries
            </label>
          </li>
          <li>
            <label>
              <input type="radio" name="category" value="conventions" required />
              Conventions
            </label>
          </li>
          <li>
            <label>
              <input type="radio" name="category" value="reviews" required />
              Reviews
            </label>
          </li>
          <li>
            <label>
              <input type="radio" name="category" value="opinion" required />
              Opinion
            </label>
          </li>
          <li>
            <label>
              <input type="radio" name="category" value="people" required />
              People
            </label>
          </li>
        </ul>
    
        <h1>Tags</h1>
        <ul>
          <li>
            <label>
              <input type="checkbox" name="html" />
              HTML
            </label>
          </li>
          <li>
            <label>
              <input type="checkbox" name="css" />
              CSS
            </label>
          </li>
          <li>
            <label>
              <input type="checkbox" name="javascript" />
              Javascript
            </label>
          </li>
          <li>
            <label>
              <input type="checkbox" name="ruby" />
              Ruby
            </label>
          </li>
          <li>
            <label>
              <input type="checkbox" name="rails" />
              Rails
            </label>
          </li>
          <li>
            <label>
              <input type="checkbox" name="python" />
              Python
            </label>
          </li>
          <li>
            <label>
              <input type="checkbox" name="django" />
              Django
            </label>
          </li>
        </ul>
    
        <input type="submit" value="Filter" />
      </fieldset>
    </form>
    ```

12. Convert the radios and checkboxes in the filter form to `select` lists. Let the user select any number of tags, and ensure the selection box is large enough that she can see several choices at once. Use description lists to organize the form elements.

    ###### My Solution

    ```html
    <form action="#" method="get">
      <fieldset>
        <label>
          <dl>
            <dt><label for="category">Category</label></dt>
            <dd>
              <select name="category" id="category" size="3">
                <option value="core">Core</option>
                <option value="plugins">Plugins and Libraries</option>
                <option value="conventions">Conventions</option>
                <option value="reviews">Reviews</option>
                <option value="opinion">Opinion</option>
                <option value="people">People</option>
              </select>
            </dd>
    
            <dt><label for="tags">Tags</label></dt>
            <dd>
              <select name="tags" id="tags" size="3" multiple >
                <option value="html">HTML</option>
                <option value="css">CSS</option>
                <option value="javascript">Javascript</option>
                <option value="ruby">Ruby</option>
                <option value="rails">Rails</option>
                <option value="python">Python</option>
                <option value="django">Django</option>
              </select>
            </dd>
          </dl>
    
          <input type="submit" value="Filter" />
      </fieldset>
    </form>
    ```

13. Provide the user with a way to reset the filter form.

    ###### My Solution

    ```html
    <input type="reset" value="Reset the form" />
    ```

    ###### LS Solution

    ```html
    <form action="#" method="get">
      <fieldset>
        <dl>
          <dt><label for="category">Category</label></dt>
          <dd>
            <select name="category" size="5" id="category">
              <option value="core">Core</option>
              <option value="plugins">Plugins and Libraries</option>
              <option value="conventions">Conventions</option>
              <option value="reviews">Reviews</option>
              <option value="opinion">Opinion</option>
              <option value="people">People</option>
            </select>
          </dd>
    
          <dt><label for="tags">Tags</label></dt>
          <dd>
            <select name="tags" id="tags" size="5" multiple>
              <option value="html">HTML</option>
              <option value="css">CSS</option>
              <option value="javascript">Javascript</option>
              <option value="ruby">Ruby</option>
              <option value="rails">Rails</option>
              <option value="python">Python</option>
              <option value="django">Django</option>
            </select>
          </dd>
        </dl>
    
        <input type="submit" value="Filter" />
        <input type="reset" />
      </fieldset>
    </form>
    ```

---

## 8. Walkthrough Project: Contact Form

In this project, you'll create a contact form with a variety of controls. Our intent here is for you to follow along with the accompanying videos, but after you've tried to complete as much as you can using the steps outlined below. Whether you do the project entirely on your own or need lots of help doesn't matter; what matters is that you try. If you do manage to finish on your own, watch the videos anyway, and compare your solution with ours.

1. Create a web page that contains a contact form. Using your newly acquired knowledge, create the label and input fields for a first name, last name, email address, city, state, and zip code. Each input field can appear on a separate line.
2. Assume that users are from the United States. The `state` select element should contain each state's two-letter abbreviation as `option` options. You don't need to add `value` attributes to the `option` elements; the `form` can submit the two-letter abbreviations to the server. You saved a copy of the list of states earlier, right?
3. Use the most appropriate input type for the email and zip code inputs, along with a `placeholder` attribute that shows an example of a properly formatted email address and Zip Code. (There is no "zipcode" input type; use another input type.) Since Zip Codes always have five digits (we'll ignore Zip+4), you should also set a maximum length for this input. See if you can figure out how to require exactly 5 digits.
4. Add some inputs that will help you get to know your users better. Begin with a question that asks "Which of these colors do you like best?" and add a list of inputs to represent colors. Make sure you use an input type that allows for precisely one color choice. Ensure that the browser pre-selects the first color in the list when the page loads.
5. Add another question that asks "Which web technologies do you want to learn?" and add a list of inputs that allow the user to pick any number of answers. Add some technologies (HTML, CSS, Javascript, Ruby, Rails, etc.) to the list.
6. Add the most important part of a contact form: a comment box that lets the user enter several lines or paragraphs of text. Be sure the comment box displays up to around 6 rows and 80 columns of text but also scrolls as needed if the user enters more than that.
7. When the user clicks the submit button, the browser should send a timestamp to the server along with the other form data. Since we don't have a way to determine the date with HTML and CSS alone, you can use a constant value like today's date, e.g., `2018-02-17` (year-month-day). The form should have an `input` tag for the timestamp, but the browser should not display it to the user; you can use `type="hidden"` for this control.
8. Add a `submit` input to create a button with the name `Send`. You should also include a `reset` button so the user can clear the form and start over.
9. Since we don't have an actual server that we can use, you can use the action URL `#` in your form.

#### My Solution:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Contact Form</title>
    <meta charset="utf-8" />
    <style>
      body {
        font-family: Helvetica, Arial, sans-serif;
        margin-left: 30%;
      }

      fieldset {
        border: none;
      }
      dt, dd {
        display: inline-block;
        box-sizing: border-box;
        margin: 5px 0;
      }

      dt {
        width: 15%;
      }

      dd {
        width: 92%;
      }

      ul {
        list-style: none;
        padding-left: 0;
      }

      input[type="text"], [type="email"] {
        width: 500px;
      }

    </style>
  </head>
  <body>
    <form action="#" method="post">
      <fieldset>
        <dl>
          <dt><label for="first_name">First Name</label></dt><!-- 
           --><dd><input type="text" name="first_name" id="first_name" /></dd>

          <dt><label for="last_name">Last Name</label></dt><!-- 
           --><dd><input type="text" name="last_name" id="last_name" /></dd>

          <dt><label for="email">Email Address</label></dt><!-- 
           --><dd><input type="email" name="email" id="email" placeholder="email@example.com" /></dd>

          <dt><label for="city">City</label></dt><!-- 
           --><dd><input type="text" name="city" id="city" /></dd>

          <dt><label for="state">State</label></dt><!-- 
           --><dd>
                <select name="state" id="state">
                  <option>AK</option>
                  <option>AL</option>
                  <option>AR</option>
                  <option>AZ</option>
                  <option>CA</option>
                  <option>CO</option>
                  <option>CT</option>
                  <option>DC</option>
                  <option>DE</option>
                  <option>FL</option>
                  <option>GA</option>
                  <option>HI</option>
                  <option>IA</option>
                  <option>ID</option>
                  <option>IL</option>
                  <option>IN</option>
                  <option>KS</option>
                  <option>KY</option>
                  <option>LA</option>
                  <option>MA</option>
                  <option>MD</option>
                  <option>ME</option>
                  <option>MI</option>
                  <option>MN</option>
                  <option>MO</option>
                  <option>MS</option>
                  <option>MT</option>
                  <option>NC</option>
                  <option>ND</option>
                  <option>NE</option>
                  <option>NH</option>
                  <option>NJ</option>
                  <option>NM</option>
                  <option>NV</option>
                  <option>NY</option>
                  <option>OH</option>
                  <option>OK</option>
                  <option>OR</option>
                  <option>PA</option>
                  <option>RI</option>
                  <option>SC</option>
                  <option>SD</option>
                  <option>TN</option>
                  <option>TX</option>
                  <option>UT</option>
                  <option>VA</option>
                  <option>VT</option>
                  <option>WA</option>
                  <option>WI</option>
                  <option>WV</option>
                  <option>WY</option>
                </select>
              </dd>

          <dt><label for="zip">Zip Code</label></dt><!-- 
           --><dd><input type="text" name="zip" id="zip" pattern="[0-9]{5}" placeholder="e.g. 02309" /></dd>
        </dl>

        <p>Which of these colors do you like best?</p>
        <ul>
          <li>
            <label>
              <input type="radio" name="color" value="red" checked />
              Red
            </label>
          </li>

          <li>
            <label>
              <input type="radio" name="color" value="blue" />
              Blue
            </label>
          </li>

          <li>
            <label>
              <input type="radio" name="color" value="yellow" />
              Yellow
            </label>
          </li>

          <li>
            <label>
              <input type="radio" name="color" value="green" />
              Green
            </label>
          </li>

          <li>
            <label>
              <input type="radio" name="color" value="orange" />
              Orange
            </label>
          </li>

          <li>
            <label>
              <input type="radio" name="color" value="purple" />
              Purple
            </label>
          </li>
        </ul>

        <p>Which web technologies do you want to learn?</p>
        <ul>
          <li>
            <label>
              <input type="checkbox" name="html" value="HTML" />
              HTML
            </label>
          </li>

          <li>
            <label>
              <input type="checkbox" name="css" value="CSS" />
              CSS
            </label>
          </li>

          <li>
            <label>
              <input type="checkbox" name="javascript" value="JavaScript" />
              JavaScript
            </label>
          </li>

          <li>
            <label>
              <input type="checkbox" name="ruby" value="Ruby" />
              Ruby
            </label>
          </li>

          <li>
            <label>
              <input type="checkbox" name="rails" value="Rails" />
              Rails
            </label>
          </li>

          <li>
            <label>
              <input type="checkbox" name="python" value="Python" />
              Python
            </label>
          </li>
        </ul>

        <dl>
          <dt><label for="comments">Comments</label></dt>
          <dd>
            <textarea name="comments" id="comments" rows="6" cols="80" 
                      placeholder="Tell us what you think"></textarea>
          </dd>
        </dl>


        <input type="hidden" name="timestamp" value="2020-09-14" />
        <input type="submit" value="Send" />
        <input type="reset" />
      </fieldset>
    </form>
  </body>
</html>
```

#### LS Solution:

```html

<!DOCTYPE html>
<html lang="en-US">
  <head>
    <title>Contact Form</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <form action="#" method="post">
      <fieldset>
        <dl>
          <dt>
            <label for="first_name">First Name</label>
          </dt>
          <dd>
            <input type="text" name="first_name" id="first_name" />
          </dd>
          <dt>
            <label for="last_name">Last Name</label>
          </dt>
          <dd>
            <input type="text" name="last_name" id="last_name" />
          </dd>
          <dt>
            <label for="email">Email Address</label>
          </dt>
          <dd>
            <input type="email" name="email" id="email" />
          </dd>
          <dt>
            <label for="city">City</label>
          </dt>
          <dd>
            <input type="text" name="city" id="city" />
          </dd>
          <dt>
            <label for="state">State</label>
          </dt>
          <dd>
            <select name="state" id="state">
              <option>AK</option>
              <option>AL</option>
              <option>AR</option>
              <option>AZ</option>
              <option>CA</option>
              <option>CO</option>
              <option>CT</option>
              <option>DC</option>
              <option>DE</option>
              <option>FL</option>
              <option>GA</option>
              <option>HI</option>
              <option>IA</option>
              <option>ID</option>
              <option>IL</option>
              <option>IN</option>
              <option>KS</option>
              <option>KY</option>
              <option>LA</option>
              <option>MA</option>
              <option>MD</option>
              <option>ME</option>
              <option>MI</option>
              <option>MN</option>
              <option>MO</option>
              <option>MS</option>
              <option>MT</option>
              <option>NC</option>
              <option>ND</option>
              <option>NE</option>
              <option>NH</option>
              <option>NJ</option>
              <option>NM</option>
              <option>NV</option>
              <option>NY</option>
              <option>OH</option>
              <option>OK</option>
              <option>OR</option>
              <option>PA</option>
              <option>RI</option>
              <option>SC</option>
              <option>SD</option>
              <option>TN</option>
              <option>TX</option>
              <option>UT</option>
              <option>VA</option>
              <option>VT</option>
              <option>WA</option>
              <option>WI</option>
              <option>WV</option>
              <option>WY</option>
            </select>
          </dd>
          <dt>
            <label for="zip">Zip</label>
          </dt>
          <dd>
            <input type="number" name="zip" id="zip" min="0" max="99999" />
          </dd>
        </dl>
        <p>Which of these colors do you like best?</p>
        <ul>
          <li>
            <label><input type="radio" value="red" name="color" checked/>Red</label>
          </li>
          <li>
            <label><input type="radio" value="orange" name="color" />Orange</label>
          </li>
          <li>
            <label><input type="radio" value="yellow" name="color" />Yellow</label>
          </li>
          <li>
            <label><input type="radio" value="green" name="color" />Green</label>
          </li>
          <li>
            <label><input type="radio" value="blue" name="color" />Blue</label>
          </li>
          <li>
            <label><input type="radio" value="indigo" name="color" />Indigo</label>
          </li>
          <li>
            <label><input type="radio" value="violet" name="color" />Violet</label>
          </li>
        </ul>
        <p>Which web technologies do you want to learn?</p>
        <ul>
          <li>
            <label><input type="checkbox" value="HTML" name="html" />HTML</label>
          </li>
          <li>
            <label><input type="checkbox" value="CSS" name="css" />CSS</label>
          </li>
          <li>
            <label><input type="checkbox" value="JavaScript" name="javascript" />JavaScript</label>
          </li>
          <li>
            <label><input type="checkbox" value="Ruby" name="ruby" />Ruby</label>
          </li>
          <li>
            <label><input type="checkbox" value="Rails" name="rails" />Rails</label>
          </li>
        </ul>
        <label for="comments">Comments</label>
        <textarea rows="6" cols="80" name="comments" id="comments"></textarea>
        <input type="hidden" value="2015-01-01" name="timestamp" />
        <input type="submit" value="Send" />
        <input type="reset" />
      </fieldset>
    </form>
  </body>
</html>
```

## 9. Guided Project: Tweaking the Contact Form

