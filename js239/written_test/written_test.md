###### JS239 Assessment: DOM and Asynchronous Programming with JavaScript > Start Assessment JS239

---

## Study Guide: Written Test

The JS239 written test will test your knowledge of the DOM, the event model, Asynchronous Programming and using the XHR object.

Important topics you need to study:

- Using Web APIs to work with the DOM
- Understanding event-driven programming for front-end development
- Communicating with the server through XHR and rendering the response to the page
- jQuery (minimal coverage relative to above 3 bullets)

The test will contain a mix of theory and practical questions.  

---

### Using WEB APIs to work with the DOM

#### The Document Object Model (DOM)

- The DOM is an in-memory object representation of an HTML document; it provides a way to interact with a web page using JS, which provides the functionality required to build modern interactive user experiences; it is composed of a hierarchy of nodes, each of which can contain any number of child nodes.
- DOM nodes have different types, two of which are:
  * Elements represent HTML tags
  * Text nodes represent text that appears in the document
- There are some other types that we can ignore for now.
- We can make a distinction between two different types of text nodes: 1) text nodes that contain text; and 2) text nodes that contain nothing but whitespace (this latter group of text nodes is often referred to as empty nodes).
- Empty nodes are not reflected visually in the browser.

#### Node Properties

All DOM Nodes have certain properties in common. Some useful ones include:

* `nodeName`: this property contains a String representation that represents the node type.

  ```javascript
  > p.nodeName
  = "P"
  ```

* `nodeType`: this property determines a node's type: it returns a number that matches a node type constant.

  ```javascript
  > p.nodeType
  = 1
  ```

  We can see the most common types below. A complete list is available at [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Node/nodeType).  

  | Constant             | Value | Description                         |
  | :------------------- | :---- | :---------------------------------- |
  | `Node.ELEMENT_NODE`  | 1     | An Element representing an HTML tag |
  | `Node.TEXT_NODE`     | 3     | A Text node                         |
  | `Node.COMMENT_NODE`  | 8     | A Comment node                      |
  | `Node.DOCUMENT_NODE` | 9     | A Document node                     |

  Use the constant names instead of the numeric values to write clear code that checks the node type:  

  ```javascript
  > p.nodeType === Node.ELEMENT_NODE
  = true
  > document.nodeType === Node.DOCUMENT_NODE
  = true
  ```

* `nodeValue`: this property references the value of a node. Element nodes don't have values:

  ```javascript
  > p.nodeValue
  = null
  ```

  Text nodes do, though. For a text node, the `nodeValue` is the textual content of the node. Let's look at our paragraph. To start, first extract the first text node from the DOM:

  ```javascript
  > let t = p.childNodes[0];
  ```

  The local variable, `t`, now references the first child within the paragraph. By checking `nodeName` and the return value of `toString`, we learn that `t` is a text node, that its `nodeName` is `"#text"`, and that its type is `Text`.  

  ```javascript
  > t.nodeName;
  = "#text"
  > t.toString();
  = "[object Text]"
  ```

  Since the `p` node represents the `<p>` tag, its child nodes represent its contents; here, we have some text and a link. The first child node of `p` (`t`) has a `nodeValue` property that contains the first sentence of text from the paragraph:

  ```javascript
  > t.nodeValue
  = "To receive our weekly emails, enter your email address below. "
  ```

  `nodeValue` happened to return a complete sentence above, but it does not recognize sentences. It merely grabs text up to the next opening or closing tag.

* `textContent`: 

  We've seen that `nodeValue` references the textual content of the Node, but Elements don't have any textual content, so the `nodeValue` for Elements is `null`. We can use a different property when we need the text within an Element: `textContent`.  

  `textContent` represents the textual content of all the nodes inside the Element. You can think of it as the `nodeValue` for all the Element's child nodes concatenated into a single String. For example, if we access the paragraph's `textContent` property, it contains the content of the Text nodes directly inside the tag as well as the text within the `a` Node that the `p` Node contains.

  ```javascript
  > document.querySelector("p").textContent
  = "
        To receive our weekly emails, enter your email address below.
        Get more info.
      "
  ```

  Notice all the whitespace in the String. `textContent` joins the `nodeValue`s of all child Text Nodes together, including the empty Nodes, which leads to excess whitespace. You can deal with the excess whitespace using the usual String and RegExp methods.

#### Determining the Type of a Node

##### Nodes and Elements

DOM objects come in different types: Nodes, Elements, Text, and more. The Element type is further broken down into dozens of subtypes. Trying to determine the _exact_ object type can be confusing. Here's what you need to know:

* **All** DOM objects are Nodes.
* **All** DOM objects have a type that inherits from Node, which means they all have properties and methods that inherit from Node.
* The most common DOM object types you will use are **Element** and **Text**.

The following diagram shows the relationship between these different types:

![Node type diagram](https://d3905n0khyu9wc.cloudfront.net/images/node_venn.png)



Keep in mind that *Elements* include more specific, specialized Element types. For example, the DOM node that represents a `<p>` HTML tag has type `HTMLParagraphElement`, while the Element that represents a `<div>` tag is `HTMLDivElement`.  

##### Inheritance in the DOM

How do all these different types relate? You can think of them as a hierarchy where types on the right inherit properties and methods from types on the left. Here is a partial list of some common node types:

- EventTarget
  - Node
  - Text
  - Comment
  - Document
    - HTMLDocument
  - Element
    - HTMLElement
    - HTMLAnchorElement
    - HTMLBodyElement
    - HTMLButtonElement
    - HTMLCanvasElement
    - HTMLDivElement
    - HTMLFormElement
    - HTMLHeadingElement
    - HTMLHtmlElement
    - HTMLImageElement
    - HTMLInputElement
    - HTMLLIElement
    - HTMLLabelElement
    - etc, etc.
    - SVGElement
    - SVGColorElement
    - SVGRectElement
    - etc, etc.

Almost every HTML tag has its own Element subtype, though not all. Most browsers, for instance, don't support the `HTMLTableDataCellElement` and `HTMLTableHeaderCellElement` types that correspond to the `<td>` and `<th>` tags. They both map to a shared and more general `HTMLTableCellElement` type. (The MDN documentation, at the time of writing, incorrectly states that both `HTMLTableDataCellElement` and `HTMLTableHeaderCellElement` exist in all browsers, but, in truth, they're unique to Microsoft browsers.). 

Here is what you need to remember about the different types:

- `EventTarget` provides the event-handling behavior that supports interactive web applications. We'll study this in detail in an upcoming lesson.
- `Node` provides common behavior to *all* nodes.
- `Text` and `Element` are the chief subtypes of `Node`.
  - `Text` nodes hold text.
  - `Element` nodes represent HTML tags.
- Most HTML tags map to specific element subtypes that inherit from `HTMLElement`.
- Other element types exist, such as `SVGElement` and its subtypes.

##### Determining the Node Type

JavaScript provides two useful ways to determine a node type: one works best in interactive console sessions using the browser's developer tools, while the other works best from a program.  

The technique most useful on the console uses the `toString` method or the `String` constructor on the node; you can read the name from the display:

```javascript
> p.toString();
= "[object HTMLParagraphElement]"
```

For most nodes, the return value of `toString` and `String` is the node type's name, but not all node types behave so well. `HTMLAnchorElement` (an `<a>` tag), for instance, is different:  

```javascript
> let a = document.querySelector('a');
> a
= <a href="http://domain.com/page">Page</a>
> a.toString();
= "http://domain.com/page"
```

`HTMLAnchorElement` implements `toString` in a way that causes it to return the URL from the link. Customized `toString` methods like this exist for some other Elements as well.  

This inconsistency is bothersome, of course. As a workaround, you can call the node's `constructor` property; it references a function that creates Objects of the appropriate Element type. The value is browser-dependent, though, which adds some clumsiness when using it.

```javascript
> document.querySelector('a').constructor;
= function HTMLAnchorElement() { [native code] }
```

```javascript
> document.querySelector('a').constructor;
= function()
> document.querySelector('a').constructor.name; /* Note use of .name property! */
= "HTMLAnchorElement"
```

###### From Code

If you're writing a program, you should probably use the `instanceof` operator or `tagName` property.  

With element nodes, `tagName` returns the same value as `nodeName`.  

`instanceof` checks whether an object has a type that matches or inherits from a named type.  

```javascript
> let p = document.querySelector('p');
> p instanceof HTMLParagraphElement;
= true
> p instanceof HTMLAnchorElement;
= false
> p instanceof Element;
= true
```

The downside here is that you have to test against a particular Element type. If all you need to know, though, is whether a node is an Element, you can test it with `instanceof Element`:

```javascript
> p instanceof HTMLElement;
= true
> p instanceof Element;
= true
> p instanceof Node;
= true
> p instanceof SVGElement;
= false
```

Checking an Element's type in this way is common in code that must process two or more different Element types with different actions based on the Element type.  

If you don't need to know the type name, you can use the `tagName` property to check its HTML tag name instead. (Remember that this property has an uppercase value.)

```javascript
> p.tagName;
= "P"
```

#### Traversing Nodes

DOM nodes connect with other DOM nodes via a set of properties that point from one node to another with defined relationships. For example, the `childNodes` property returns a collection of the nodes directly beneath a given node. Each element in the returned collection has a `parentNode` property that points back to the original node.  

You should know these properties of parent nodes:

| Parent Node Properties | Value                                         |
| :--------------------- | :-------------------------------------------- |
| `firstChild`           | `childNodes[0]` or `null`                     |
| `lastChild`            | `childNodes[childNodes.length - 1]` or `null` |
| `childNodes`           | *Live collection* of all child nodes          |

You should also know these properties of child nodes:   

| Child Node Properties | Value                                    |
| :-------------------- | :--------------------------------------- |
| `nextSibling`         | `parentNode.childNodes[n + 1]` or `null` |
| `previousSibling`     | `parentNode.childNodes[n - 1]` or `null` |
| `parentNode`          | Immediate parent of this node            |

You may assume that the node in question is at index `n` of its parent's `childNodes` collection.  

All DOM nodes that represent elements have *both* parent and child nodes. Thus, they have both sets of the above properties. Whether a node has a non-null *value* for a given property, though, depends on the DOM that contains the node. For example, the last child of a node has a `null` value for `nextSibling`; all other child nodes have non-null values for `nextSibling`.  

![Connections between nodes in the DOM](https://d3905n0khyu9wc.cloudfront.net/images/node_hierarchy.png)

##### Walking the DOM

```javascript
// walk() calls the function "callback" once for each node
function walk(node, callback) {
  callback(node);																									 // do something with node
  for (let index = 0; index < node.childNodes.length; index += 1) { //for each child node
    walk(node.childNodes[index], callback); 											// recursively call walk()
  }
}

walk(document.body, node => {
  console.log(node.nodeName);
});
```

#### Element Attributes

##### Getting and Setting Attributes

Let's look again at a simple paragraph element:  

```javascript
> let p = document.querySelector('p');
> p;
= <p class="intro" id="simple">...</p>
```

We can access the attributes of an Element using these methods:

| Method                         | Description                                 | Returns                      |
| :----------------------------- | :------------------------------------------ | :--------------------------- |
| `getAttribute(name)`           | Retrieve value of attribute `name`          | Value of attribute as string |
| `setAttribute(name, newValue)` | Set value of attribute `name` to `newValue` | `undefined`                  |
| `hasAttribute(name)`           | Check whether element has attribute `name`  | `true` or `false`            |

```javascript
> p.hasAttribute('class');
= true
> p.getAttribute('class');
= "intro"
> p.getAttribute('id');
= "simple"
> p.setAttribute('id', 'complex');
> p
= <p class="intro" id="complex">...</p>
```

When using `setAttribute` please take note of this [warning from MDN](https://developer.mozilla.org/en-US/docs/Web/API/Element/setAttribute#Notes)

> Using `setAttribute` to modify certain attributes, most notably `value` in XUL, works inconsistently, as the attribute specifies the default value. To access or modify the current values, you should use the properties. For example, use `Element.value` instead of `Element.setAttribute`.

##### Attribute Properties

`getAttribute` and `setAttribute` work for *all* attributes, but you can access some attributes another way. The DOM exposes these special attributes as properties of the Element: `id`, `name`, `title`, and `value`. You can fetch the value for one of these properties or set it to a new value using standard property access and assignment operations:  

```javascript
> p;
= <p class="intro" id="simple">...</p>
> p.id
= "simple"
> p.id = 'complex'
> p;
= <p class="intro" id="complex">...</p>
```

Not every Element type has these properties: the `name` and `value` attributes, in particular, are invalid on most elements.  

The `class` attribute is similar, but uses the `className` property since `class` is a JavaScript reserved word:  

```javascript
> p.className;
= "intro"
> p.className = 'outro';
```

##### classList

Working with the `class` attribute via `className` is inconvenient when elements have more than one class. *This is common* in some applications. Consider the following HTML:  

```javascript
<button class="btn btn-lg btn-primary">Proceed</button>
```

If we have a reference to the DOM node for this `button`, we can get the list of classes for the `button`:

```javascript
> button.className;
= "btn btn-lg btn-primary"
```

Since the value is a space-delimited set of names, interacting with `className` can be clumsy. Let's say we need to replace `btn-primary` with `btn-disabled`. To do this, we must get the string from `className`, use `replace` to change it, and then use the result to set a new value for `button.className`:  

```javascript
> let newClass = button.className.replace('btn-primary', 'btn-disabled');
> button.className = newClass;
= "btn btn-lg btn-disabled"
> button;
= <button class="btn btn-lg btn-disabled">...</button>
```

As another example, consider how we determine whether the `button` belongs to the `btn` class? Keep in mind that `class` may contain class names in any order. To make this determination, you must split `className`'s value using spaces as a delimiter, then search the array to see whether it contains the string `btn`. You can do this, but it's tedious for something you will need to do fairly often.  

Modern browsers provide a better way with the `classList` property. `classList` references a special array-like `DOMTokenList` object that has these properties and methods:  

| Name             | Description                                                  |
| :--------------- | :----------------------------------------------------------- |
| `add(name)`      | Add class `name` to element                                  |
| `remove(name)`   | Remove class `name` from element                             |
| `toggle(name)`   | Add class `name` to element if it doesn't exist, remove if it does exist |
| `contains(name)` | Return `true` or `false` depending on whether element has class `name` |
| `length`         | The number of classes to which element belongs               |

##### style

Element nodes also have a `style` attribute that has some special behavior. The `style` attribute on an Element references a `CSSStyleDeclaration` Object:  

```javascript
> let h1 = document.querySelector('h1');
> h1.style;
= CSSStyleDeclaration {alignContent: "", alignItems: "", alignSelf: "", alignmentBaseline: "", all: "", ...}
```

You can use the `style` attribute to alter any CSS property. For example, you can change the color of a heading to `red`:  

```javascript
> h1.style.color = 'red';
```

To remove a CSS property, set the property to `null` with the `style` property:  

```javascript
> h1.style.color = null;
```

When a CSS property's name contains dashes, you must use a camelCased version of the name to access that property. For example, to set a value for the `line-height` attribute, you assign a value to the `lineHeight` property:  

```javascript
> h1.style.lineHeight = '3em';
```

Most applications don't use the `style` property often; it's easier and more manageable to use classes in your stylesheet to alter the characteristics of your elements. You can add or remove CSS class names to or from any DOM Element.

#### Finding DOM Nodes

##### Finding an Element by Id

In HTML/JavaScript applications, we often need to find an element based on its `id` attribute. The built-in method `getElementById` on `document` provides this behavior.  

| Method                        | Returns                 |
| :---------------------------- | :---------------------- |
| `document.getElementById(id)` | element with given `id` |

This technique works well when we want to find a single element with its `id`, more often though, we want a list of elements that match some criteria, such as a list of all `p` elements or all elements that belong to the `find-me` HTML class. In fact, it's often easier to maintain your application if you structure the code to find all matching elements instead of just one.  

##### Finding More Than One Element

**Built-in Functions**

`getElementsByTagName` is so useful that the DOM provides a similar method for all elements, and another method that does the same thing for class names:

| Method                                       | Returns                                             |
| :------------------------------------------- | :-------------------------------------------------- |
| `document.getElementsByTagName(tagName)`     | `HTMLCollection` or `NodeList` of matching elements |
| `document.getElementsByClassName(className)` | `HTMLCollection` or `NodeList` of matching elements |

One key way in which these methods differ from the one we wrote above is that they return array-like objects, not actual arrays.

**What is a `HTMLCollection` or `NodeList`?**  

Both types are array-like objects, which means they are containers for other objects indexed by non-negative integers.  

Since these are not JavaScript arrays, they do not support `forEach` or other array methods. (`NodeList` on some browsers do support `forEach`, but not on all browsers; `HTMLCollection` provides no support for `forEach`.) To loop through the elements returned by these methods, use a `for` loop or convert the object into an array and then use the higher-order array functions.  

```javascript
let paragraphs = document.getElementsByTagName("p");

paragraphs.length; // returns a Number
paragraphs[0]; // returns first element in collection

// The following will fail with "forEach" not available in some browsers
paragraphs.forEach((paragraph) => console.log(paragraph.textContent));

// Possible fix
let paragraphsArray = Array.prototype.slice.call(paragraphs);
paragraphsArray.forEach((paragraph) => console.log(paragraph.textContent));

// Alternative fix
for (let index = 0; index < paragraphs.length; index += 1) {
  let paragraph = paragraphs[index];
  console.log(paragraph.textContent);
}
```

`HTMLCollection` and `NodeList` have differences, but they aren't important right now. All you must know is that `document.getElementsByTagName` returns one in some browsers and the other in other browsers.  

###### Live Collection

Some DOM-querying methods return collections that are called **live collections**. Live collections have a special behavior in that they automatically update to reflect changes in the DOM, hence the term "live". Methods like `document.getElementsByClassName` and `document.getElementsByTagName`, when they return an `HTMLCollection`, return it in the form of a live collection. It is important to take note of this because it can lead to unexpected behavior, especially when you iterate over it or use the return value.  

Here's code demonstrating a live collection:

```javascript
<ul id="list">
  <li class="list-item">Item 1</li>
  <li class="list-item">Item 2</li>
  <li class="list-item">Item 3</li>
</ul>
```

Using the above markup, we're now going to add a new element with the class of "list-item." Observe what happens when we log the `.length` property of the value assigned to `listItems`:

```javascript
let list = document.querySelector("#list");
let listItems = document.getElementsByClassName("list-item");
console.log(listItems.length); // logs 3

// We'll cover creating elements in a later assignment
let newItem = document.createElement("li"); // Creates a new element
newItem.className = "list-item"; // adds a class to the element
list.appendChild(newItem); // appends to "list" element

console.log(listItems.length); // logs 4
```

Notice how the `listItems`' length increases even though we didn't explicitly add any elements to it.

##### Using CSS Selectors

The proliferation of JavaScript libraries and frameworks have popularized an alternate way to find elements. Instead of searching for a tag name, class name, or relationship, these tools use CSS selectors to find elements with minimal effort. Selector searches have become so common that web browsers now provide built-in support for selector searches with these two methods:

| Method                                 | Returns                          |
| :------------------------------------- | :------------------------------- |
| `document.querySelector(selectors)`    | First matching element or `null` |
| `document.querySelectorAll(selectors)` | `NodeList` of matching elements  |

As with `getElementsByClassName` and `getElementsByTagName`, `querySelectorAll` returns array-like objects, so you'll need to keep that in mind. You can use things like `forEach`, array destructuring, and `Array.from` on these objects, but be aware of which browser versions you are targeting. Older browsers may not support these features.

#### Traversing Elements

Earlier, we looked at some properties that you can use to traverse DOM nodes:  

![Connections between DOM Nodes](https://d3905n0khyu9wc.cloudfront.net/images/node_hierarchy2.png)

These properties often don't give you what you want, though; you probably want a list of element nodes without the `Text` and other nodes mixed in. You can simplify your code if you can start with a list of element nodes alone, and don't have to ignore everything else. Another set of DOM properties provides the functionality you need; you can find them in the element nodes:

![Connections between DOM Elements](https://d3905n0khyu9wc.cloudfront.net/images/node_hierarchy3.png)

| Parent Element Properties | Value                                     |
| :------------------------ | :---------------------------------------- |
| `children`                | *Live collection* of all child elements   |
| `firstElementChild`       | `children[0]` or `null`                   |
| `lastElementChild`        | `children[children.length - 1]` or `null` |
| `childElementCount`       | `children.length`                         |

| Child Element Properties | Value                                  |
| :----------------------- | :------------------------------------- |
| `nextElementSibling`     | `parentNode.children[n + 1]` or `null` |
| `previousElementSibling` | `parentNode.children[n - 1]` or `null` |

Most browsers include these properties in `document`, which has type `Document`. Internet Explorer does not, though; it provides them in `document.body` instead. You can use `document.body` with them all and get the expected results.

##### textContent

You might wonder how you can access the `Text` nodes when using the above DOM properties since they don't include non-element nodes. The `textContent` property provides access to the text. For example, consider the following HTML:  

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>Go Back or Continue</title>
  </head>

  <body>
    <p>
      You can <a href="?page=2">go back</a> or <a href="/page/3">continue</a>.
    </p>
  </body>
</html>
```

You can access the text in the first link like this:  

```javascript
> document.querySelector('a').textContent;
= "go back"
```

To change the value of that text content, use:

```javascript
> document.querySelector('a').textContent = 'step backward';
= "step backward"
```

This replaces the text content of the first link with the specified text:  

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>Go Back or Continue</title>
  </head>
  <body>
    <p>
      You can <a href="?page=2">step backward</a> or <a href="/page/3">continue</a>.
    </p>
  </body>
</html>
```

Be careful when setting `textContent`; doing so removes all child nodes from the element and replaces them with a text node that contains the value:  

```javascript
> document.querySelector('p').textContent = "You can't go anywhere.";
= "You can't go anywhere."
```

The resulting page looks like this:  

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>Go Back or Continue</title>
  </head>
  <body>
    <p>You can't go anywhere.</p>
  </body>
</html>
```

The best strategy for updating text with JavaScript is to place the text you need to update within an element; the element type doesn't matter -- even a bare `span` or `div` element will suffice. This approach makes using `textContent` simpler and safer to use.  

Consider how you would update the time on this page:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>My Site</title>
  </head>
  <body>
    <div>
      Welcome to the site!<br>
      The time is 9:15 am.<br>
      You are logged in as <a href="/account">Kabu</a>.
    </div>
  </body>
</html>
```

Finding the text node you must update would be tricky; replacing the time would probably require a regular expression:  

```javascript
var div = document.querySelector('div');
var node;
var newText;

for (let index = 0; index < div.childNodes.length; index += 1) {
  node = div.childNodes[index];
  if (node instanceof Text && node.nodeValue.indexOf('The time is') !== -1) {
    newText = node.nodeValue.replace(/\d{1,2}:\d{2} [ap]m/, '9:16 am');
    node.nodeValue = newText;
  }
}
```

Compare that with this simpler example that uses a `<span>` tag:  

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>My Site</title>
  </head>
  <body>
    <div>
      Welcome to the site!<br>
      The time is <span class="time">9:15 am</span>.<br>
      You are logged in as <a href="/account">Kabu</a>.
    </div>
  </body>
</html>
```

All you need here is:

```javascript
document.querySelector('.time').textContent = '9:16 am';
```

#### Creating and Moving DOM Nodes

Thus far, we've modified existing nodes in the DOM. It's time to learn how to create, add, and remove nodes. We'll use the following HTML:  

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>Empty Page</title>
  </head>
  <body>
  </body>
</html>
```

We can add a paragraph to this document with `createElement` and `appendChild`:  

```javascript
let paragraph = document.createElement('p');
paragraph.textContent = 'This is a test.';
document.body.appendChild(paragraph);
```

You can also create a text node and append it to the paragraph element:  

```javascript
let text = document.createTextNode('This is a test.');
let paragraph = document.createElement('p');
paragraph.appendChild(text);
document.body.appendChild(paragraph);
```

Try using one of these snippets in the Web Developer console; they both add a new paragraph to the page:  

##### Creating New Nodes

You can create nodes in two ways: you can create new empty nodes with the `document.create*` methods, or you can clone an existing node hierarchy:  

| Node Creation Method              | Returns                  |
| :-------------------------------- | :----------------------- |
| `document.createElement(tagName)` | A new Element node       |
| `document.createTextNode(text)`   | A new Text node          |
| `node.cloneNode(deepClone)`       | Returns a copy of `node` |

If `deepClone` is `true`, `cloneNode` makes copies of `node` and *all its children*; otherwise, `cloneNode` merely copies `node`. Don't rely on a specific default value for `deepClone`; it has changed over time, so always specify `true` or `false` to get what you want. In most cases, you'll use `true` to get a copy of the node and its children.  

Continuing with the above HTML, let's add a copy of the paragraph to the document:

```javascript
> paragraph;
= <p>This is a test.</p>
> let paragraph2 = paragraph.cloneNode(true);
> document.body.appendChild(paragraph2);
```

The page now has two copies of the paragraph. The DOM objects that represent them are independent of each other — changing one does not change the other.  

##### Adding Nodes to the DOM

You can append, insert, and replace nodes with methods on the node's parent:  

| Parent Node Method                      | Description                                                  |
| :-------------------------------------- | :----------------------------------------------------------- |
| `parent.appendChild(node)`              | Append `node` to the end of `parent.childNodes`              |
| `parent.insertBefore(node, targetNode)` | Insert `node` into `parent.childNodes` before `targetNode`   |
| `parent.replaceChild(node, targetNode)` | Remove `targetNode` from `parent.childNodes` and insert `node` in its place |

`document.appendChild` causes an error. Use `document.body.appendChild` instead.  

**No Node may appear twice in the DOM.** If you try to add a node that is already in the DOM, it gets removed from the original location. Thus, you can move an existing node by inserting it where you want it.  

These methods insert node before, after, or within an Element:

| Element Insertion Method                              | Description                                                  |
| :---------------------------------------------------- | :----------------------------------------------------------- |
| `element.insertAdjacentElement(position, newElement)` | Inserts `newElement` at `position` relative to `element`     |
| `element.insertAdjacentText(position, text)`          | Inserts Text node that contains `text` at `position` relative to `element` |

`position` must be one of the following String values:  

| Position        | Description                           |
| :-------------- | :------------------------------------ |
| `"beforebegin"` | Before the element                    |
| `"afterbegin"`  | Before the first child of the element |
| `"beforeend"`   | After the last child of the element   |
| `"afterend"`    | After the element                     |

##### Removing Nodes

When you remove a node from the DOM, it becomes eligible for garbage collection unless you keep a reference to the node in a variable. You cannot access an object that is eligible for garbage collection, so it's no longer available to your program.  

| Element Method             | Description                            |
| :------------------------- | :------------------------------------- |
| `node.remove()`            | Remove `node` from the DOM             |
| `parent.removeChild(node)` | Remove `node` from `parent.childNodes` |

We can remove the paragraphs we created like this:  

```javascript
> paragraph.remove();
> paragraph2.remove();
```

#### Summary

* The **Document Object Model**, or **DOM**, is an in-memory object representation of an HTML document. It provides a way to interact with a web page using JavaScript, which provides the functionality required to build modern interactive user experiences.
* The DOM is a hierarchy of **nodes**. Each node can contain any number of child nodes.
* There are different types of nodes. The types you should be familliar with are **elements** and **text nodes**.
* The whitespace in an HTML document may result in empty text nodes in the DOM.
* Useful properties of nodes include `nodeName`, `nodeType`, `nodeValue`, and `textContent`.
* Nodes have properties that traverse the DOM tree: `firstChild`, `lastChild`, `childNodes`, `nextSibling`, `previousSibling`, and `parentNode`.
* Element nodes have `getAttribute`, `setAttribute`, and `hasAttribute` methods to manipulate HTML attributes.
* Elements have properties that let you read and alter the `id`, `name`, `title`, and `value`.
* Elements let you read and change CSS classes and style properties via the `classList` and `style` properties.
* `document.getElementById(id)` finds a single Element with the specified `id`.
* `document.getElementsByTagName(name)` and `document.getElementsByClassName(name)` find any Elements with the specified `tagName` or `class`.
* `document.querySelector(selector)` returns the first Element that matches a CSS selector. `document.querySelectorAll(selector)` is similar but returns all matching elements.
* Elements have properties to traverse the DOM tree: `firstElementChild`, `lastElementChild`, `children`, `nextElementSibling`, and `previousElementSibling`.
* You can create new DOM nodes with `document.createElement(tagName)` or `document.createTextNode(text)`.
* You can create a copy of a node with `node.cloneNode(deepClone)`.
* `parent.appendChild(node)`, `parent.insertBefore(node, targetNode)`, `parent.replaceChild(node, targetNode)`, `element.insertAdjacentElement(position, newElement)`, and `element.insertAdjacentText(position, text)` add nodes to the DOM.
* `node.remove()` and `parent.removeChild(node)` remove nodes from the DOM.

---

### Understanding event-driven programming for front-end development

#### Asynchronous Execution with setTimeout

Much of the code you've seen and written so far runs sequentially within the JavaScript runtime. For instance, consider this simple program and how your browser evaluates it:  

```javascript
let a = 38;            // set a to 38
a += 4;                // set a to 42
console.log(a);        // log 42 to the console
```

The browser evaluates each line in this program, one at a time. For each line of code, the next line of code must wait until the current line completes. We call this **sequential code** since each line runs in sequence.  

It's possible to write code that runs partly now, then pauses and continues to run later after a delay of milliseconds, minutes, hours, or even days. We call such code **asynchronous code**; it doesn't run continuously or even when the runtime encounters it. To illustrate how asynchronous code works, we need a way to make our code wait and run later.  

#### User Interfaces and Events

Running code after a timed delay is useful, but most user interfaces must respond to something other than the passage of time. For instance, the UI may need to take action when a button click occurs.  

An **event** is an object that represents some occurrence; it contains information about what happened and where it happened. The browser can trigger events as the page loads, when the user interacts with the page, and when the browser performs some action required by the program.  

User interfaces are inherently event-driven. An interface draws itself on the screen, and then it does nothing until a user interacts with it. That interaction could be a button-click, a finger-swipe, or even a shake of a motion-sensitive device. Such interfaces require the program to register some behavior that the event will trigger when it occurs.  

Since a lot of web applications consist mainly of a user interface, the code within them has two main tasks:

1. Set up the user interface and display it.
2. Handle events resulting from user or browser actions.

Since we're working in the browser, we typically achieve #1 with HTML, which lets us focus on #2, handling events.

In the following diagram, lines that begin with *when* describe actions the program takes in response to the appropriate event. The code that the browser runs in response to the event is an **event listener**.  

#### Page Lifecycle Events

In the previous assignment, we learned how to use an event listener to run JavaScript code when the `DOMContentLoaded` event on `document` fires:  

```java
document.addEventListener('DOMContentLoaded', event => {
  // Do something with the DOM
});
```

Unless you understand how a web browser renders a page, the purpose of this code is unclear. Identifying when the page finishes loading isn't easy; web pages are intricate, and the precise moment that a page load completes depends on how you define "complete" and "page."  

Consider, for instance, a web page made with HTML alone (no CSS, no JavaScript, no images, etc.). With this simple situation, you can say that the page has loaded when the browser displays it to the user. In other words, the process of displaying a web page works like this:  

![Simplified page loading](https://d3905n0khyu9wc.cloudfront.net/images/simplified_page_loading.png)

In reality, there's more to it. Your browser needs to download and display more than the HTML; it must also work with images, stylesheets, JavaScript, video, and more. When we consider these objects as part of the page load, the steps a browser goes through to display a web page look more like this:  

![Semicomplete page loading](https://d3905n0khyu9wc.cloudfront.net/images/semicomplete_page_loading.png)

This revised set of steps is still a simplification, but it's accurate enough to use as a mental model. It shows why the JavaScript code shown above uses an event handler for the `DOMContentLoaded` event: the JavaScript code on the page runs before the browser processes the HTML and creates the DOM. Any JavaScript that needs to use the DOM must wait until it becomes available.  

It's common to call the moment when the DOM is ready for interaction the **DOM Ready Event**. This term is imprecise; it isn't clear what it refers to beyond the concept that the DOM is ready for use. The name became commonplace when jQuery introduced the `$.ready` method; it provides a `DOMContentLoaded` event-like functionality in older browsers that don't support that event natively or reliably.  

Let's add some more steps to our list to account for other events related to the page-loading process:  

![Complete page loading](https://d3905n0khyu9wc.cloudfront.net/images/complete_page_loading.png)

We typically use the `DOMContentLoaded` event when we have JavaScript code that must access the DOM. The `load` event fires much later, after everything on the page loads, including images, videos, etc. This `load` event is not useful in most cases because it may not occur for a long time after the page first appears.    

#### User Events

Building an interactive web application means responding to user actions. Depending on the input device, the application, and the user, your application may need to detect and react to more than a dozen different user-initiated events:  

| Event Type | Example Events                                              |
| :--------- | :---------------------------------------------------------- |
| Keyboard   | `keydown`, `keyup`, `keypress`                              |
| Mouse      | `mouseenter`, `mouseleave`, `mousedown`, `mouseup`, `click` |
| Touch      | `touchdown`, `touchup`, `touchmove`                         |
| Window     | `scroll`, `resize`                                          |
| Form       | `submit`                                                    |

In the rest of this lesson, we'll look at the different event types. Keep in mind that an event's type determines the kind of code it makes sense to run within an event handler, but registering and triggering events is the same for all.  

#### Adding Event Listeners

**Event listeners**, also known as **event handlers**, are functions that the JavaScript runtime calls when a particular event occurs. There are four steps needed to setup an event handler:  

1. **Identify the event you need to handle.** User actions, the page lifecycle, and more can fire events.
2. **Identify the element that will receive the event.** Depending on the event, the object could be a button, an input field, or any other element on the page.
3. **Define a function to call when this event occurs.** The function is passed a single argument, an Event object. For now, we won't be using this argument. We'll learn more about Events later.
4. **Register the function as an event listener.** This step brings the first three together into a working system.

Let's look at an example. Assume you have the following HTML in a web page:  

```javascript
<html>
  <head>
    <title>Test Page</title>
  </head>
  <body>
    <textarea id="message"></textarea>
    <button id="alert">Alert</button>
  </body>
</html>
```

1. *Identify the event you need to handle.* We want something to happen when the user clicks on the "Alert" button, so we need to handle the `click` event.
2. *Identify the element that will receive the event.* In this example, we'll use the button since that's where the interaction will occur.
3. *Define a function to call when this event occurs.* This function displays an alert using the contents of the `textarea`:

```javascript
function displayAlert(event) {
  let message = document.getElementById("message").value;
  alert(message);
}
```

4. *Register the function as an event listener.* We can call `addEventListener` on a reference to the button:

   ```javascript
   document.addEventListener("DOMContentLoaded", () => {
     let button = document.getElementById("alert");
     button.addEventListener("click", displayAlert);
   });
   ```

Alternatively, we can also combine step 3 with step 4:

```javascript
document.addEventListener("DOMContentLoaded", () => {
  let button = document.getElementById("alert");
  button.addEventListener("click", (event) => {
    let message = document.getElementById("message").value;
    alert(message);
  });
});
```

Notice that we register `displayAlert` as the `click` listener *within* the `DOMContentLoaded` event handler. As we saw in the [A Simple Example](https://launchschool.com/lessons/519eda67/assignments/463aa0eb) assignment and as explained in the [Page Lifecycle Events](https://launchschool.com/lessons/519eda67/assignments/6ce4b02c) assignment, we can't access the `button` element until *after* the DOM is ready, so we must postpone this step until then.  

The [GlobalEventHandlers mixin](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers) provides an alternative way to register a function as an event listener for an element. Rather than adding a `click` handler with `button.addEventListener`, we assign the listener to the `onclick` property of the `button` element:  

```javascript
document.addEventListener("DOMContentLoaded", () => {
  let button = document.getElementById("alert");
  button.onclick = displayAlert;
});
```

Feel free to explore other `GlobalEventHandlers` like `onsubmit` and `onclick`.  

#### The Event Object

In the previous assignment, we learned how to create event handlers that execute when a particular event occurs. For instance, we can define a handler for `click` events like this:  

```javascript
document.addEventListener('click', event => {
  // respond to the click
});
```

If all we need to know is that a click occurred, then it's easy to add some code to the handler to do what we need to do. What if we need more information about the event, though? The argument passed to the event handler provides this extra information; it's an `Event` object that provides contextual information about the event.  

Some useful properties that appear in Event objects include:  

| Property        | Description                                                  |
| :-------------- | :----------------------------------------------------------- |
| `type`          | The name of the event (e.g., 'click')                        |
| `currentTarget` | The current object that the event object is on. It always refers to the element that has the event listener attached to it |
| `target`        | The initial object to receive notification of the event, e.g., the element clicked by the user |

##### Mouse Events

Most events have properties specific to their type. For example, here are some of the properties available for mouse events:  

| Property  | Description                                                  |
| :-------- | :----------------------------------------------------------- |
| `button`  | This is a read-only property that indicates which button was pressed |
| `clientX` | The horizontal position of the mouse when the event occurred |
| `clientY` | The vertical position of the mouse when the event occurred   |

Both `clientX` and `clientY` return values **relative to the visible area of the page**: the number of pixels from the upper-left corner of the browser's viewport.

##### Keyboard Events

Keyboard-related events also have special properties:  

| Property   | Description                                                  |
| :--------- | :----------------------------------------------------------- |
| `key`      | The string value of the pressed key. **Older browsers do not support this property** |
| `shiftKey` | Boolean value that indicates whether the user pressed the shift key |
| `altKey`   | Boolean value that indicates whether the user pressed the alt (or option) |
| `ctrlKey`  | Boolean value that indicates whether the user pressed the control key |
| `metaKey`  | Boolean value that indicates whether the user pressed the meta (or command) key |

#### Capturing and Bubbling (1)

Thus far, we've been working with events by adding handlers to elements that may be the source of events. For example, we would add an event listener to a button element. This approach results in event listeners attached to each element of interest on the page. It works fine in small applications, but there are downsides:  

- You can't add an event listener to an element until the DOM is ready, which means that you must wait until the `DOMContentLoaded` event fires.
- You must add event handlers manually when you add new elements to the page after `DOMContentLoaded` fires.
- Adding handlers to many elements can be slow, and can lead to complicated, difficult to maintain code. Imagine a page with a large spreadsheet-like grid with hundreds or thousands of cells; you must provide listeners for both keyboard and mouse events in every cell.

A technique called **event delegation** provides a solution for these problems, but before we can learn how to use it, we first need to talk about **capturing** and **bubbling**. We'll discuss event delegation later in this lesson.  

**Capturing** and **bubbling** are phases that an event goes through after it initially fires. The event first gets dispatched to the global `window` object, then to the `document` object, all the way down to the target element, which is the element on which the event was originally fired. At this point, this dispatch process reverses and from the `target` element the event works its way through containing elements until it reaches the `window` object. Using the HTML from our scenario of *"Adding the Event Listener to the Innermost and Outermost Element"*, this process looks like this:

![Event capturing and bubbling](https://d3905n0khyu9wc.cloudfront.net/images/event_phases_v4.png)

**Note1:** The diagram may suggest that there are many click events happening, but actually, there's just **one** `click` event. This one `click` event object moves through the capturing and bubbling phases and checks if there are any listeners for it on the DOM objects that it passes.  

**Note2:** The event gets dispatched to each element twice, once during the capturing phase and once during the bubbling phase. The actual event listener, though, gets called/fired in only one phase. By default the listener is set to fire during the "bubbling" phase. To set it to listen on the "capturing phase" you can use the third optional, argument, for the `addEventListener` method, `useCapture`, and set it to `true`.  

```javascript
elem1.addEventListener('click', callbackFunction, true);
// Notice the third argument. It's set to `true`. When it's set to true, the event listener will listen during the capturing phase. If not specified, `useCapture` defaults to `false` and the event listener listens during the bubbling phase.
```

**Note3:** When event listeners fire on the target element it is also described as firing on the "**target phase**."    

What the capturing and bubbling mechanism implies is that events do not start and end on the target element or the element that an event was triggered on.  

#### Preventing Propagation and Default Behaviors

In this assignment, we will take a look at a couple of methods on the `event` object that can affect its behavior as it moves through the capturing and bubbling phases — `event.stopPropagation` and `event.preventDefault`.  

##### Stopping Propagation

`event.stopPropagation` stops the `event` object from continuing its path along the capturing and bubbling phases.

```javascript
event.stopPropagation(); // Tells the browser to stop bubbling the event up to parents
```

##### Preventing Default Behaviors

Another useful method on Event objects is `preventDefault`. This method tells the browser that it shouldn't perform any actions that it might otherwise perform in response to a user's action. For instance, clicking a link typically loads a new page in the browser. `preventDefault` tells the browser not to do that.  

It's good practice to call `preventDefault` or `stopPropagation` as soon as possible in an event handler. Doing so emphasizes the presence of those methods to people reading the code. It also ensures that these methods run before any errors occur; not running these methods before an error occurs can lead to unexpected behavior that is hard to debug.  

#### Event Delegation

Problems associated with adding an event listener to individual elements that must wait for the DOM to fully load:

- We must wait for the DOM to finish loading before adding event handlers. It isn't hard to do this, but it might introduce timing problems if we have other code that also must wait before it runs.
- Modern web pages often add new elements after the page finishes loading. Here, we're binding the event listeners to elements that already exist when the page finishes loading. Any elements added later, though, won't have those event handlers. Instead, the developer must explicitly add listeners to new Elements as the application adds them.
- Attaching many listeners to a document has a cost in performance and memory. For our eight buttons, this overhead is negligible, but imagine a spreadsheet application with thousands of cells, each of which needs several event handlers. We now have to register thousands of listeners, which can cause the page to "freeze" while JavaScript creates them.

**Event delegation** takes advantage of event propagation to address these problems. Instead of adding listeners to every element you're watching, you can add a single handler to any common ancestor (a parent, grandparent, or something further up the DOM tree) of the elements you want to watch. The listener, in turn, performs the required actions for each element.  

Our simple example lets us attach the single event handler directly to `document`, which means we don't have to wait until the DOM is ready. Within the handler, we can determine which DOM element triggered the event using `event.target`.  

The trade-off of delegation is that the listener may become complicated if it must handle multiple situations. Consider the following variation of the button clicker example that uses both buttons and links. We must treat them differently, depending on which was clicked.  

Even with merely two cases, our code is noticeably more complex, yet we only have to check the tag name and perform a simple action. In a large document, there may be many different situations; imagine the complexity that may result from even a dozen cases.  

##### When to use Event Delegation

The best approach is to start by binding event handlers directly to elements when a project is new and small. As the code grows in size and complexity, delegation may make sense to reduce the number of event handlers required.  

Keep in mind that you don't need to use `document` as the delegator: you can delegate events to any common ancestor element of the elements you want to monitor. You can even have more than one element handling delegated events if it makes sense.  

jQuery, which we'll look at in an upcoming lesson, includes functionality that makes delegation comparatively easy while avoiding the complexity drawback.

#### What is the Event Loop?

The job of the **event loop** is to look into the call stack and determine if the call stack is empty or not. If the call stack is empty, it looks into the message queue to see if there's any pending callback waiting to be executed.  

![img](https://miro.medium.com/max/1400/1*O_H6XRaDX9FaC4Q9viiRAA.png)

The event loop will prioritize the tasks in the micro-task queue over the tasks in the message queue/task queue. While the event loop is executing the tasks in the micro-task queue and in that time if another promise is resolved, it will be added to the end of the same micro-task queue, and it will be executed before the callbacks inside the message queue no matter for how much time the callback is waiting to be executed.

#### Promises and Async/Await

##### Promise

The `Promise` object represents the eventual completion (or failure) of an asynchronous operation and its resulting value.  

A `Promise` is a proxy for a value not necessarily known when the promise is created. It allows you to associate handlers with an asynchronous action's eventual success value or failure reason. This lets asynchronous methods return values like synchronous methods: instead of immediately returning the final value, the asynchronous method returns a _promise_ to supply the value at some point in the future.  

A `Promise` is in one of these states:

* _pending_: initial state, neither fulfilled or rejected.
* _fulfilled_: meaning that the operation was completed successfully.
* _rejected_: meaning that the operation failed.

A pending promise can either be _fulfilled_ with a value or _rejected_ with a reason (error). When either of these options happens, the associated handlers queued up by a promise's `then` method are called. If the promise has already been fulfilled or rejected when a corresponding handler is attached, the handler will be called, so there is no race condition between an asynchronous operation completing and its handlers being attached.  

As the `Promise.prototype.then()` and `Promise.prototype.catch()` methods return promises, they can be chained.  

![img](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/promises.png)

**Note:** A promise is said to be *settled* if it is either fulfilled or rejected, but not pending. You will also hear the term *resolved* used with promises — this means that the promise is settled or “locked-in” to match the state of another promise.  

##### Chained Promises

The methods `promise.then()`, `promise.catch()`, and `promise.finally()` are used to associate further action with a promise that becomes settled.  

The `.then()` method takes up to two arguments; the first argument is a callback function for the resolved case of the promise, and the second argument is a callback function for the rejected case. Each `.then()` returns a newly generated promise object, which can optionally be used for chaining; for example:

```javascript
const myPromise = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve('foo');
  }, 300);
});

myPromise
  .then(handleResolvedA, handleRejectedA)
  .then(handleResolvedB, handleRejectedB)
  .then(handleResolvedC, handleRejectedC);
```

Processing continues to the next link of the chain even when a `.then()` lacks a callback function that returns a Promise object. Therefore, a chain can safely omit every *rejection* callback function until the final `.catch()`.  

Handling a rejected promise in each `.then()` has consequences further down the promise chain. Sometimes there is no choice, because an error must be handled immediately. In such cases we must throw an error of some type to maintain error state down the chain. On the other hand, in the absence of an immediate need, it is simpler to leave out error handling until a final `.catch()` statement. A `.catch()` is really just a `.then()` without a slot for a callback function for the case when the promise is resolved.  

```javascript
myPromise
.then(handleResolvedA)
.then(handleResolvedB)
.then(handleResolvedC)
.catch(handleRejectedAny);
```

#### Summary

1. `setTimeout(callback, delay)` invokes a function after the specified number of milliseconds.
2. `setInterval(callback, delay)` invokes a function repeatedly in intervals of some specified number of milliseconds. `clearInterval` clears the interval and prevents future invocations of the Function.
3. An **event** is an object that represents some occurrence and contains a variety of information about what happened and where it happened. The browser triggers some events as it loads a page and when it accomplishes some actions directed by an application. The user also triggers events when he interacts with the page.
4. Code that must access the DOM should be invoked after the `DOMContentLoaded` event fires on document.
5. User events drive most user interfaces and can result from a user interacting with the keyboard, mouse, touchscreen, window or other devices. Examples of these user events are `click`, `mouseover`, `keydown`, and `scroll`. 
6. **Event listeners** are callbacks that the browser will invoke when a matching event occurs.
7. `element.addEventListener` registers an event listener. You can also use specific `GlobalEventHandlers` like `element.onclick`, to register an event handler.  
8. The Event object provides the useful properties `type`, `target`, and `currentTarget`.
9. Keyboard events have properties like `key` (and others) describes the keys the user pressed. Mouse events similarly provide `button`, `clientX`, and `clientY`. 
10. Events propagate in three phases: capturing, target, and bubbling.
11. `event.preventDefault` prevents default browser behavior in response to an event. `event.stopPropagation` stops the current capturing or bubbling phase, which prevents the event from firing on containing or contained elements.
12. **Event delegation** is a technique used to handle events triggered by multiple elements using a single event handler.

---

### Communicating with the server through XHR and rendering the response to the page

#### HTTP Review

##### A Typical Interaction with the Internet

Your typical interaction with the Internet starts with a web browser when you:

1. Enter a URL like [http://www.google.com](http://www.google.com/) into your web browser's address bar.
2. The browser creates an HTTP request, which is packaged up and sent to your device's network interface.
3. If your device already has a record of the IP address for the domain name in its DNS cache, it will use this cached address. If the IP address isn't cached, a DNS request will be made to the Domain Name System to obtain the IP address for the domain.
4. The packaged-up HTTP request then goes over the Internet where it is directed to the server with the matching IP address.
5. The remote server accepts the request and sends a response over the Internet back to your network interface which hands it to your browser.
6. Finally, the browser displays the response in the form of a web page.

The above set of steps is a simplification of what happens at a technical level. The main thing to understand though is that when your browser issues a request, it's simply sending some text to an **IP address**. Because the client (web browser) and the server (recipient of the request) have an agreement, or protocol, in the form of HTTP, the server can take apart the request, understand its components and send a response back to the web browser. The web browser will then process the response strings into content that you can understand.  

![Internet](https://d186loudes4jlv.cloudfront.net/http/images/internet.png)

#### URLs

##### URL Components

When you see a URL, such as "http://www.example.com:88/home?item=book", it is comprised of several components. We can break this URL into 5 parts:  

- `http`: The **scheme**. It always comes before the colon and two forward slashes and tells the web client how to access the resource. In this case it tells the web client to use the Hypertext Transfer Protocol or HTTP to make a request. Other popular URL schemes are `ftp`, `mailto` or `git`. You may sometimes see this part of the URL referred to as the *protocol*, and there is a connection between the two things in that the scheme can indicate which protocol (or system of rules) should be used to access the resource; in the context of a URL however, the correct term for this component is the *scheme*.
- `www.example.com`: The **host**. It tells the client where the resource is hosted or located.
- `:88` : The **port** or port number. It is only required if you want to use a port other than the default.
- `/home/`: The **path**. It shows what local resource is being requested. This part of the URL is optional.
- `?item=book` : The **query string**, which is made up of **query parameters**. It is used to send data to the server. This part of the URL is also optional.

![URL Components](https://d186loudes4jlv.cloudfront.net/http/images/url_components.png)

#### Request Methods

You can think of the **HTTP Request Method** as the verb that tells the server what action to perform on a resource. The two most common HTTP request methods you'll see are `GET` and `POST`. When you think about retrieving information, think `GET`, which is the most used HTTP request method. In the above diagram, you'll notice almost all of the requests use `GET` to retrieve the resources needed to display the web page.  

##### GET Requests

`GET` requests are initiated by clicking a link or via the address bar of a browser. When you type an address like `https://www.reddit.com` into the address bar of your browser, you're making a `GET` request. You're asking the web browser to go retrieve the resource at that address, which means we've been making `GET` requests throughout this book. The same goes for interacting with links on web applications. The default behavior of a link is to issue a `GET` request to a URL.  

The primary concepts associated with sending GET requests are:

- GET requests are used to retrieve a resource, and most links are GETs.
- The response from a GET request can be anything, but if it's HTML and that HTML references other resources, your browser will automatically request those referenced resources. A pure HTTP tool will not.

##### POST Requests

We've seen how to retrieve or ask for information from a server with `GET`, but what if you need to send or submit data to the server? That's where another essential HTTP request method comes in: `POST`. `POST` is used when you want to initiate some action on the server, or send data to a server.  

Typically from within a browser, you use `POST` when submitting a form. `POST` requests allow us to send much larger and sensitive data to the server, such as images or videos. For example, say we need to send our username and password to the server for authentication. We could use a `GET` request and send it through query strings. The flaw with this approach is obvious: our credentials become exposed instantly in the URL; that isn't what we want. Using a `POST` request in a form fixes this problem. `POST` requests also help sidestep the query string size limitation that you have with `GET` requests. With `POST` requests, we can send significantly larger forms of information to the server.  

#### HTTP Headers

HTTP headers allow the client and the server to send additional information during the request/response HTTP cycle. Headers are colon-separated name-value pairs that are sent in plain text. By using the **Inspector,** we can see these Headers.  

#### Status Code. 

The `status code` is a three-digit number that the server sends back after receiving a request signifying the status of the request. The `status text` displayed next to `status code` provides the description of the code. It is listed under the **Status** column of the Inspector.  

The most common response status code you'll encounter is **200** which means the request was handled successfully. Other useful status codes are:  

| Status Code | Status Text           | Meaning                                                      |
| :---------- | :-------------------- | :----------------------------------------------------------- |
| 200         | OK                    | The request was handled successfully.                        |
| 302         | Found                 | The requested resource has changed temporarily. Usually results in a redirect to another URL. |
| 404         | Not Found             | The requested resource cannot be found.                      |
| 500         | Internal Server Error | The server has encountered a generic error.                  |

#### HTTP Response

The most important parts of an HTTP response are:

- status code
- headers
- message body, which contains the raw response data. 

#### AJAX

AJAX is short for Asynchronous JavaScript and XML. Its main feature is that it allows browsers to issue requests and process responses *without a full page refresh*. For example, if you're logged into Facebook, the server has to generate the initial page you see, and the response is a pretty complex and expensive HTML page that your browser displays. The Facebook server has to add up all the likes and comments for every photo and status, and present it in a timeline for you. As we described earlier, it's a very expensive page to re-generate for every request (remember, every action you take -- clicking a link, submitting a form -- issues a new request).  

When AJAX is used, all requests sent from the client are performed *asynchronously*, which just means that the page doesn't refresh. The main thing to remember is that AJAX requests are just like normal requests: they are sent to the server with all the normal components of an HTTP request, and the server handles them like any other request. The only difference is that instead of the browser refreshing and processing the response, the response is processed by a callback function, which is usually some client-side JavaScript code.

#### Security

##### Same-origin policy

The same-origin policy is an important concept that permits unrestricted interaction between resources originating from the same origin, but restricts certain interactions between resources originating from different origins. What we mean by *origin* here is the combination of a url's scheme, hostname, and port. So `http://mysite.com/doc1` would be considered to have the same origin as `http://mysite.com/doc2`, but a different origin to `https://mysite.com/doc2` (different scheme), `http://mysite.com:4000/doc2` (different port), and `http://anothersite.com/doc2` (different host).  

Same-origin policy doesn't restrict *all* cross-origin requests. Requests such as linking, redirects, or form submissions to different origins are typically allowed. Also typically allowed is the embedding of resources from other origins, such as scripts, css stylesheets, images and other media, fonts, and iframes. What *is* typically restricted are cross-origin requests where resources are being accessed programmatically using APIs such as `XMLHttpRequest` or `fetch` (the details of which are beyond the scope of this book).  

While secure, same-origin policy is an issue for web developers who have a legitimate need for making these restricted kinds of cross-origin requests. Cross-origin resource sharing or **CORS** was developed to deal with this issue. CORS is a mechanism that allows interactions that would normally be restricted cross-origin to take place. It works by adding new HTTP headers, which allow servers to serve resources cross-origin to certain specified origins.  

The same-origin policy is an important guard against session hijacking (see next section) attacks and serves as a cornerstone of web application security. Let's look at some HTTP security threats and their counter-measures.  

#### Defining API

##### What is an API?

An **API**, or **Application Programming Interface**, provides a way for computer systems to interact with each other. There are many types of APIs. Every programming language has a built-in API that is used to write programs. Mobile devices provide APIs to provide access to location or other sensor data, such as the device's GPS location or the orientation of the device. Operating systems themselves have APIs used by programs to open files, access memory, and draw text on the screen. While the types of uses for APIs are vast, the one thing all APIs have in common is **providing functionality for use by another program**.  

##### Web APIs

This book is going to focus on APIs that are built with web technologies and that work in a similar way to the web. These are often called **web APIs** or **HTTP APIs** because, like the web, they operate over HTTP. We'll use the term *web APIs* most often as it is shorter and potentially more common in discussion. There will be more detail about how APIs relate to HTTP as we work through the rest of this book as we delve into *how* web APIs work.  

##### Summary

- *Web APIs* allow one system to interact with another over HTTP (just like the web).
- The system offering the API for use by others is the *provider*.
- The system interacting with the API to accomplish a goal is the *consumer*.
- It is best to prefer the terms *provider* and *consumer* over *client* and *server*.

#### What APIs Can Do

##### Sharing Data

Perhaps the most common use case for web APIs is simply sharing data between systems. Consider a web application for creating birthday cards. Instead of requiring a user to enter the names and birthdays for each of their friends, the application could use an API provided by Facebook to fetch data about a user's friends automatically.  

At a certain level, all APIs are used to transfer data between systems. This basic capability offers many benefits to application developers and users alike. An extremely common case would be providing data to a mobile application that needs to access data from a web-based service. The Netflix mobile application (and actually all of the various Netflix apps that run on different devices) need to be able to access your same Netflix account. Since this data is kept on a central server, it can be exposed to the mobile and other apps using an API.  

##### APIs can also...

* enable automation
* leverage existing services

**APIs enable application developers to build their applications on top of a variety of other specialized systems, allowing them to focus on their actual objectives and not worry about all the complexities of every part of the system.** In a way, it's like hiring a team of specialists for a construction project. While it would be possible to do everything, it makes a lot more sense to delegate certain responsibilities to a specialist. A project will have better results if it is built by a plumber, an electrician, and a carpenter than if it was all done by a single person. Plus, the team effort will likely result in a higher quality product in less time.  

##### Summary

- APIs break down the walls between systems, allowing them to share data.
- APIs provide an "escape hatch" enabling service users to customize the software's behavior or integrate it into other systems if required.
- Many modern web applications provide an API that allows developers to integrate their own code with these applications, taking advantage of the services' functionality in their own apps.

#### A Review of HTTP

- Web APIs are built on top of HTTP, the technology that makes the web work.
- HTTP Responses have 3 main parts: status code, headers, and body.
- The *Content-Type* header describes the format of the response body.

#### A Review of URLs

- Working with web APIs involves working with *URLs*.
- URLs represent *where* a resource is and *how* it can be accessed.
- URLs typically contain a *scheme*, *hostname*, *path*, and sometimes a *query string*.
- Paths (and URLs) can include *placeholders* when they are written generically.

#### Media Types

##### What is a Media Type?

In the same way that humans have developed shared languages to facilitate communication, the internet has given rise to a set of shared markup languages and data formats for transferring information between computers. One example of this is **HTML**, the markup language used to create all web pages, including this one. Because nearly all computers (and now most phones, tablets, and even televisions) can understand HTML and display it, the web is extremely accessible for people using a wide range of devices.  

HTML is one of many different **media types** (also called **content types** or sometimes **MIME types**) supported by modern web browsers. It is represented in an HTTP response as the `Content-Type` header as `text/html`:  

```javascript
Content-Type: text/html
```

This tells the browser to interpret the content as HTML and render it graphically on the screen.  

Most web servers also include a `charset` for certain text media types, so a real world response header would look more like this:  

```javascript
Content-Type: text/html; charset=UTF-8
```

The `charset` (or character set) tells the browser which set of characters the response is using. The charset for most requests will be `UTF-8` or `ISO-8859-1`. For the purposes of this book, and for the work we'll be doing with APIs, we don't need to get into the difference between these or other character sets. If at some point you are seeing strange characters when working with an API, you should check the response charset to make sure it is something compatible with the tools you are using.  

Other media types include `text/plain` for plain text responses, `text/css` for CSS stylesheets, `application/javascript` for JavaScript files, and many, many more. There are media types for PDF documents, sound files, videos, ZIP archives, and [many, many, more](https://en.wikipedia.org/wiki/Internet_media_type#List_of_common_media_types).  

It is possible to use HTTPie to look at the content type of a variety of URLs and see some of the different media types. Using the `--headers` switch tells `httpie` to only print out the response's headers (in the following listings, some headers have been omitted for brevity):  

```javascript
$ http --headers www.google.com
HTTP/1.1 200 OK
Alternate-Protocol: 80:quic,p=0.002
Cache-Control: private, max-age=0
Content-Type: text/html; charset=ISO-8859-1
Date: Fri, 19 Sep 2014 18:36:13 GMT
Expires: -1
Server: gws
Transfer-Encoding: chunked
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
```

The Google homepage has a media type of `text/html`, which makes sense: it is a basic web page.  

Many other parts of the web are built with text as well, such as the CSS used to tell a browser how to display HTML. Google Fonts provides CSS files that enable browsers to display text in specific fonts using the media type `text/css`:  

```javascript
$ http --headers http://fonts.googleapis.com/css\?family=Open+Sans
HTTP/1.1 200 OK
Alternate-Protocol: 80:quic,p=0.002
Cache-Control: private, max-age=86400
Content-Length: 244
Content-Type: text/css
Date: Fri, 19 Sep 2014 18:47:16 GMT
Expires: Fri, 19 Sep 2014 18:47:16 GMT
Server: GSE
Timing-Allow-Origin: *
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
```

The media type returned by loading a photo URL from Flickr is `image/jpeg`, which tells the browser to display the request's body as an image.  

```javascript
$ http --headers https://c2.staticflickr.com/4/3913/15095210318_930069f3d6_c.jpg
HTTP/1.1 200 OK
Accept-Ranges: bytes
Age: 72701
Cache-Control: max-age=315360000,public
Connection: keep-alive
Content-Length: 311944
Content-Type: image/jpeg
Date: Fri, 19 Sep 2014 02:26:32 GMT
Expires: Wed, 18 Sep 2024 10:35:21 UTC
Last-Modified: Thu, 18 Sep 2014 21:22:48 GMT
Server: ATS
X-Cache: HIT from photocache429.flickr.gq1.yahoo.com
X-Cache-Lookup: HIT from photocache429.flickr.gq1.yahoo.com:81
```

##### Data Serialization

APIs are generally used to allow systems to communicate by passing structured data back and forth. The content of most requests will use a format and media type that works well for representing hierarchical data. These formats are known as data serialization formats.  

A **data serialization format** describes a way for programs to convert data into a form which is more easily or efficiently stored or transferred. The stored or transferred data can then be converted back into the original data at any time by the original program or any other program that can understand its format.  

##### XML

**XML** (or **extensible markup language**) shares common heritage with HTML: they are both based on an earlier and similar type of markup, SGML. XML is generally stricter than HTML and doesn't handle missing tags or improper nesting. It was fairly common to see XML used with APIs in the past, and while some services continue to support XML, JSON has become much more common.  

Here is one way to represent an address in XML:  

```javascript
<address>
    <street>1600 Pennsylvania Ave NW</street>
    <city>Washington</city>
    <state>DC</state>
    <zipcode>20500</zipcode>
    <country>Unites States</country>
</address>
```

##### JSON

**JSON** (or **JavaScript Object Notation**) is perhaps the most popular data serialization format used by web APIs today. The syntax JSON uses is based on the way object literals are written in JavaScript, the ubiquitous scripting language of the web. While JSON's popularity is partially due to being based on existing web technologies, a distinction it shares with XML, it is also the result of JSON being a simpler and less ambiguous format. 

A simple JSON document is used to represent key and value pairs. Here is one way to represent a US address as JSON:  

```javascript
{
  "street": "1600 Pennsylvania Ave NW",
  "city": "Washington",
  "state": "DC",
  "zipcode": "20500",
  "country": "United States"
}
```

JSON can represent objects, arrays, strings, and numbers:

```javascript
{
  "object": {
  	"city": "Boston"
  },
  "array": [1, 1, 2, 3, 5],
  "string": "Hello, World!",
  "number": 8675.309
}
```

##### Summary

- *Media types* describe the format of a response's body.
- Media types are represented in an HTTP response's `Content-Type` header, and as a result, are sometimes referred to as *content types*.
- *Data serialization* provides a common way for systems to pass data to each other, with a guarantee that each system will be able to understand the data.
- JSON is the most popular media type for web APIs and the one this book will focus on.

#### REST and CRUD

- *REST* is a set of conventions about how to build APIs.
- RESTful APIs consist of CRUD actions on a resource.
- By limiting actions to CRUD, REST requires thinking in a *resource-oriented way*.
- It is worth being as RESTful as possible, but there are times when it is not the best solution.

#### Fetching Resources

##### Fetching a Resource

Given a working example API server, basic interactions can be performed with a simple command in a terminal– just like they were against the weather API:  

```javascript
$ http GET http://book-example.herokuapp.com/v1/products/1
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 53
Content-Type: application/json
Date: Mon, 22 Sep 2014 19:55:17 GMT
Server: Cowboy
Status: 200 OK
Via: 1.1 vegur

{
    "id": 1,
    "name": "Red Pen",
    "price": 100,
    "sku": "redp100"
}
```

The response should look fairly familiar, but let's go over a few important details:

- The *media type* is *application/json*.
- The *status* is *200 OK*.
- The *body* is in *JSON* format.

The JSON body of the response is a representation of a single **resource** on the server, which represents a single product. When deserialized into a programming environment, the response body will be a single object. This representation includes *id*, *name*, *price*, and *sku* properties. The properties *id* and *price* are numbers, and *name* and *sku* are strings.  

##### What is a Resource?

A **resource** is the representation of some grouping of data. A resource can be anything an API user needs to interact with. Blog software might expose posts, sections, tags, and comments as resources in its API, and it might allow users to create or edit any of those resources. A bank's API might provide access to accounts and transactions but only allow viewing transactions.  

Every resource in a web API must have a unique URL that can be used to identify and access it. In this case, the URL was `http://book-example.herokuapp.com/v1/products/1`, and this URL was for a single resource on the server.  

The *hostname* for this URL is `book-example.herokuapp.com`. Everything after the hostname is considered to be the **path**, which for this resource is `/v1/products/1`. The first segment of the path, `/v1/`, indicates we will be accessing *version 1* of this API. APIs can have multiple versions, just like any other software.  

While this path identifies a single resource, some identify multiple resources as a group. Let's look at an example.  

##### Fetching a Collection

The web store server comes with a few preloaded products: a variety of pens, each with unique ink color. To see all of these products, perform a GET request using the collection's path:  

```javascript
$ http GET http://book-example.herokuapp.com/v1/products
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 166
Content-Type: application/json
Date: Tue, 23 Sep 2014 01:30:07 GMT
Server: Cowboy
Status: 200 OK
Via: 1.1 vegur

[
    {
        "id": 1,
        "name": "Red Pen",
        "price": 100,
        "sku": "redp100"
    },
    {
        "id": 2,
        "name": "Blue Pen",
        "price": 100,
        "sku": "blup100"
    },
    {
        "id": 3,
        "name": "Black Pen",
        "price": 100,
        "sku": "blap100"
    }
]
```

This response is very similar to the previous one for a single resource:

- The *media type* is *application/json*.
- The *status* is *200 OK*.
- The *body* is in *JSON* format.

A closer look at the content of the response, however, shows that data for three products has been returned. The JSON body of this response is a representation of a **collection** resource. When deserialized in a programming environment, the body of the response will be an array containing 3 objects.  

##### Elements and Collections

There are two types of resources involved in the use of RESTful APIs: elements and collections.  

**Elements** are the representation of a single resource, such as the first request above. Operations that involve a single resource are done in the context of that resource, and will use that resource's path.  

**Collections** represent a grouping of elements of the same type. It is common for collection and element resources to have a parent-child relationship, where the collection is the "parent" and an element is a "child", although this is not always the case. Here is what could be the path to a collection of blog posts:  

```
/api/blog/posts
```

This path represents the collection of all blog posts. Compare to it the path to an individual post:  

```
/api/blog/posts/1
```

Since a single blog post is one of the elements in the collection of all blog posts, the path to the post is the path to the collection *plus* an extra value to identify the specific element of the collection. In this case, that value is `1`.  

###### How to know if a URL is for a collection or a resource?

There are a few ways to know what kind of resource a URL represents by looking closely at its path. Keep in mind that when in doubt, **it is best to reference the API's official documentation**. Sometimes there won't be documentation, though, and there are a few clues that can be a sign of what kind of resource a URL is for.  

Signs a URL is for a collection:

1. The path ends in a plural word, such as *example.com/products*
2. The response body contains multiple elements

Signs a URL is for a single element:

1. The path ends in a plural word, a slash, and then what could be an identifier (which could be numeric or alphabetic)
2. The response body contains a single element

##### Summary

- APIs provide access to single resources (**elements**) or groups of resources (**collections**).
- The path for an element is usually the path for its collection, plus an identifier for that resource.

#### Requests in Depth

##### GET and POST

All requests made to web servers start with an **HTTP method** (sometimes called a **verb**), which tells the server what operation to perform.  

While the HTTP spec defined a larger set of allowed methods, the only methods used for a long time were GET and POST. This is because web browsers only supported these methods for a long time as they provide enough functionality for the HTML-based web to operate.  

You have already performed many GET and POST requests! This page was loaded with a GET request. When you logged in to Launch School, your web browser performed a POST request when it sent your username and password to the server.  

GET and POST are still the most common request methods on the web today, although APIs often take advantage of some of the additional methods.  

##### Parts of a Request

This book has spent a good amount of time looking at HTTP responses, but it hasn't yet spent much time looking at requests. We can use HTTPie to take a closer look at the requests themselves and see exactly how they are constructed. This is accomplished by running HTTPie with slightly different flags (we will include the HTTP method for clarity, even though *GET* is the default and can be omitted): 

```javascript
$ http --print H GET http://book-example.herokuapp.com/v1/products/1
GET /v1/products/1 HTTP/1.1
Accept: */*
Accept-Encoding: gzip, deflate
Host: book-example.herokuapp.com
User-Agent: HTTPie/0.8.0
```

With the use of `--print H`, the program prints out the text that is being sent to the remote server (in this case, a server at *book-example.herokuapp.com*.) Note the first line of the output:

```javascript
GET /v1/products/1 HTTP/1.1
```

- *GET* is the HTTP method for the request. The client wants the server to return a representation of the resource.
- */v1/products/1* is the path to a specific resource.
- *HTTP/1.1* is the protocol version being used. Nearly all modern servers and clients support at least this version of HTTP.

POST and PUT requests can also include a body, which is similar to the body of a response in that it follows any headers. Since this was a GET request, there wasn't a body.  

Another part of the request that is very important is one of the headers:  

```javascript
Accept: */*
```

The **Accept Header** specifies what media types the client will accept in response to this request. **/** means that the client will accept any media type in a request. The web store server returns JSON by default, so requests like the previous one would probably be OK to use. However, it is better to be in the habit of crafting more explicit requests.  

What we want to do is tell the server to return JSON to us. We can do that by specifying a media type in the request's accept header. We want to get a response in JSON format, and recall that the media type for JSON is *application/json*:  

```javascript
http --print=H GET http://book-example.herokuapp.com/v1/products/1 Accept:application/json
GET /v1/products/1 HTTP/1.1
Accept: application/json
Accept-Encoding: gzip, deflate
Host: book-example.herokuapp.com
User-Agent: HTTPie/0.8.0
```

The Accept Header for this last request was correctly set to *application/json*.

##### Summary

- HTTP requests include a path, method, headers, and body.
- The **Accept** header tells the provider what media types can be used to respond to the request.

#### Creating Resources

- Resources can be created with POST requests.
- Requests should include all required parameters and use the proper media type.
- Responses to failed requests will often contain information about the cause of the failure.

#### More HTTP Methods

- Use HTTP method **PUT** to update resources.
- Use HTTP method **DELETE** to delete resources.

#### Network Programming in JavaScript

The request-response cycle provided by HTTP is the underlying foundation of web applications. This cycle means that when a user requests a new page, the browser must retrieve all the HTML code at once from the server. The process looks like this:  

![User clicking a link](https://d3905n0khyu9wc.cloudfront.net/images/link_loading.png)

There are two things worth noting about this interaction:

- When the user clicks a link, the web browser automatically requests the page.
- When the browser receives a response, it renders it in the viewport.

As web applications become more interactive and their interfaces more complex, the need to reload an entire HTML page becomes a limiting factor. Developers need different methods to work around it; they need a way to replace only part of the page. That new technique is **AJAX**: **A**synchronous **J**avaScript **A**nd **X**ML. AJAX gained popularity for its ability to fetch data, typically HTML or XML, and update parts of a page. When you hear someone mention "an AJAX request" or "via AJAX," they refer to an HTTP request from a web browser that *does not perform a full page load.*

There are two things worth noting about how this interaction that differs from the page-navigation example shown above:

- The web browser doesn't make an automatic HTTP request; instead, JavaScript code initiates it, typically from an event listener.
- When the browser receives a response, JavaScript code *optionally* takes the response's body and updates the page as needed. Note that the JavaScript code is free to ignore the response.

**To summarize: when requesting a resource using JavaScript, the developer must write code that initiates the request and then optionally handles the response.**  

One popular use case for AJAX is to display some pertinent information in a popup when the user hovers the mouse pointer over certain words:

![AJAX Flow (using hover popup)](https://d3905n0khyu9wc.cloudfront.net/images/xhr_loading.png)

Another use case arises when a large page contains a form. When a user submits such a form with validation errors, rather than reloading the entire page and losing the user's scroll position, we can send the form request asynchronously with AJAX, and update only the form to show relevant error messages. The technique provides a better user experience.  

##### Single Page Applications

As client-side software development has become more involved, it has become increasingly common to make HTTP requests outside the main HTML page load. Some modern applications fetch data in a serialized format and create the DOM entirely from JavaScript running in a client's browser. We call these applications *single page applications* since they often run entirely within a single HTML page. Instead of fetching bits of HTML generated by a server, this model does all interactions by passing data to and from the server, often encoded as JSON.

#### Making a Request with XMLHttpRequest

Use the `XMLHttpRequest` object to send a HTTP request with JavaScript. This object is part of the browser API, not the JavaScript language. The name comes from its original use, which was to fetch XML documents over HTTP. Today, we use this object to load any data (typically HTML or JSON) and can use other protocols (including `file://`) as well.  

To send a request, we must provide the same parameters we would use when sending an HTTP request from any other language or tool: a *method*, a *host*, and a *path*.  

```javascript
let request = new XMLHttpRequest(); // Instantiate new XMLHttpRequest object
request.open('GET', '/path');       // Set HTTP method and URL on request
request.send();                     // Send request
```

The above code sends a `GET` request for `/path` from the local host (the host that runs the above code). The request object has some interesting properties. Before the request completes, though, those properties contain empty string or `0`:  

```javascript
let request = new XMLHttpRequest();
request.open('GET', '/path');
request.send();

request.responseText;                       // => ""
request.status;                             // => 0
request.statusText;                         // => ""
```

Once the request completes, these properties have values that describe the results:  

```javascript
request.responseText;                       // body of response
request.status;                             // status code of response
request.statusText;                         // status text from response

request.getResponseHeader('Content-Type');  // response header
```

Note that `request.send` is asynchronous, meaning that code execution continues without waiting for it to complete. The `XMLHttpRequest` object uses event listeners to send notifications when the request completes and provides access to the response returned by the remote system. Here, we'll wait for the response to load by listening for the `load` event:  

```javascript
request.addEventListener('load', event => {
  var request = event.target;                 // the XMLHttpRequest object

  request.responseText;                       // body of response
  request.status;                             // status code
  request.statusText;                         // status text from response

  request.getResponseHeader('Content-Type');  // response header
});
```

You may sometimes see code where `request.open` receives a third argument, either `true` or `false`. This argument specifies whether the method should make a synchronous or asynchronous request. Since you should never make synchronous requests from JavaScript, most contemporary browsers deprecate them, which suggests that you should always use `true` as the third argument. Since the argument defaults to `true`, you can omit it from most code.  

```javascript
var request = new XMLHttpRequest();

request.open('GET', '/path', false);  // Don't make synchronous requests!

request.open('GET', '/path', true);   // OK but redundant.

request.open('GET', '/path');         // Best.
```

#### An Overview of XMLHttpRequest Methods

You should become familiar with how to use the following `XMLHttpRequest` methods:  

| Method                            | Description                                        |
| :-------------------------------- | :------------------------------------------------- |
| `open(method, url)`               | Open a connection to `url` using `method`.         |
| `send(data)`                      | Send the request, optionally sending along `data`. |
| `setRequestHeader(header, value)` | Set HTTP `header` to `value`.                      |
| `abort()`                         | Cancel an active request.                          |
| `getResponseHeader(header)`       | Return the response's value for `header`.          |

You should also become familiar with the following `XMLHttpRequest` properties:  

| Property       | Writable | Default Value | Description                                                  |
| :------------- | :------- | :------------ | :----------------------------------------------------------- |
| `timeout`      | Yes      | `0`           | Maximum time a request can take to complete (in milliseconds) |
| `readyState`   | No       |               | What state the request is in (see below)                     |
| `responseText` | No       | `null`        | Raw text of the response's body.                             |
| `response`     | No       | `null`        | Parsed content of response, *not meaningful in all situations* |

#### XMLHttpRequest Events

In the last assignment, we looked at how to make a simple HTTP request from JavaScript using `XMLHttpRequest`. We learned how to use the `load` event to access an HTTP response and its values. In this assignment, we'll take a look at all the events that you can use in the lifecycle of an `XMLHttpRequest`.  

To run some code when an event occurs on an `XMLHttpRequest` object, we can use the same `addEventListener` method that we used for handling user or page events:  

```javascript
let request = new XMLHttpRequest();

request.addEventListener('load', event => {
  let xhr = event.target;   // the request is available as event.target
                            // if you can't access it from an outer scope.
});
```

Two main events fire during an `XMLHttpRequest` cycle: one when it sends the request, and one when response loading ends.  

| Event       | Fires When...                                                |
| :---------- | :----------------------------------------------------------- |
| `loadstart` | Request sent to server                                       |
| `loadend`   | Response loading done and all other events have fired. Last event to fire. |

Before `loadend` triggers, another event will fire based on whether the request succeeded:  

| Events    | Fires when...                                              |
| :-------- | :--------------------------------------------------------- |
| `load`    | A complete response loaded                                 |
| `abort`   | The request was interrupted before it could complete       |
| `error`   | An error occurred                                          |
| `timeout` | A response wasn't received before the timeout period ended |

![XMLHttpRequest lifecycle events](https://d3905n0khyu9wc.cloudfront.net/images/220_xhr_main_events.png)

Keep in mind that the browser considers any request that receives a complete response as successful, even if the response has a non-200 status code or represents an application error. **Whether `load` or another event fires is determined by whether the HTTP request-response cycle loads a complete response. It does not consider the response's semantic meaning to the application.**  

It is the responsibility of the application code to determine whether a `request` was successful from its perspective by inspecting the response within a `load` event handler.  

#### Data Serialization

##### Request Serialization Formats

JavaScript applications that run in a web browser must *serialize* data when communicating with remote systems. Serialization lets both the client and server transfer data in a format that preserves information without interfering with the communication protocol. Applications can use any *data serialization format* that both the client and server know how to read and write.  

Let's examine some of these formats. We'll use the following data to illustrate the differences:  

```javascript
{
  "title": "Do Androids Dream of Electric Sheep?",
  "year": 1968
}
```

###### Query String / URL Encoding

Many web applications use a serialization format that you've already seen and used: URL encoding for query strings. A query string consists of one or more `name=value` pairs separated by the `&` character. This format is easy to use and understand, though the presence of non-alphanumeric characters in the names or values can complicate matters. You must encode those characters. For example, you can encode spaces in a query string as either `%20` or `+`.  

JavaScript provides a built-in function, `encodeURIComponent`, that lets you encode a name or value using this format. You can then combine the name-value pairs with `=`, and combine the resulting strings with `&`. Name-value pairs can be used both as part of a URL and in the body of a POST request.  

```
# without encodeURIComponent
title=Do Androids Dream of Electric Sheep?&year=1968

# with encodeURIComponent
title=Do%20Androids%20Dream%20of%20Electric%20Sheep%3F&year=1968
```

Once you have a properly encoded query string, you can append it to a GET request's path:  

```
GET /path?title=Do%20Androids%20Dream%20of%20Electric%20Sheep%3F&year=1968 HTTP/1.1
Host: example.test
Accept: */*
```

URL encoding also works with POST requests, but you must include a `Content-Type` header with a value of `application/x-www-form-urlencoded` in that case. Place the encoded name-value string in the request body.  

```
POST /path HTTP/1.1
Host: example.test
Content-Length: 54
Content-Type: application/x-www-form-urlencoded; charset=utf-8
Accept: */*

title=Do%20Androids%20Dream%20of%20Electric%20Sheep%3F&year=1968
```

##### Multipart Forms

POST requests use multipart form formats for forms that include file uploads or that use `FormData` objects to collect data. This format isn't strictly an encoding format since we don't encode anything. Instead, we place each name-value pair in a separate section of the request body. A **boundary delimiter** defined by the `Content-Type` request header separates each part:  

```
Content-Type: multipart/form-data; boundary=----WebKitFormBoundarywDbHM6i57QWyAWro
```

Below is an entire POST request that uses multipart form data. Notice how each parameter is in a separate part of the request body, with the boundary delimiter before each section, and after the last section. The `Content-Type` header also sets `multipart/form-data` and specifies the boundary delimiter:  

```
POST /path HTTP/1.1
Host: example.test
Content-Length: 267
Content-Type: multipart/form-data; boundary=----WebKitFormBoundarywDbHM6i57QWyAWro
Accept: */*

------WebKitFormBoundarywDbHM6i57QWyAWro
Content-Disposition: form-data; name="title"

Do Androids Dream of Electric Sheep?
------WebKitFormBoundarywDbHM6i57QWyAWro
Content-Disposition: form-data; name="year"

1968
------WebKitFormBoundarywDbHM6i57QWyAWro--
```

Note that the final boundary delimiter has an extra `--` at the end; these characters mark the end of the multipart content.  

##### JSON Serialization

JSON (JavaScript Object Notation) is a popular data serialization format used by APIs. It's used by programs written in different languages to exchange arrays, objects, strings, numbers, and boolean values over the network.  

JSON does not provide native support for complex data types like dates and times. Instead, you must represent such values in a format that both the client and server understand; strings, numbers, and objects work well for this in most cases.  

A `GET` request can return JSON, you may then use `POST` to send JSON data to the server. Here we make our request using JSON format:  

```javascript
POST /path HTTP/1.1
Host: example.test
Content-Length: 62
Content-Type: application/json; charset=utf-8
Accept: */*

{"title":"Do Androids Dream of Electric Sheep?","year":"1968"}
```

Note that the `Content-Type` header has a value of `application/json; charset=utf-8`. This is required if you want to use JSON as the request serialization format. The server may not parse the request correctly if this header has the wrong value.  

**Content-Type and charset.**  

The `charset` is optional, but it's best practice to include it except when using multipart form format. Providing the `charset` ensures that the server interprets the data with the correct encoding. You can use `charset=utf-8` in most cases, meaning that the data uses the UTF-8 character encoding.

#### Example: Loading HTML via XHR

In this assignment, we'll use the `XMLHttpRequest` object to embed a web store in an existing web page. The existing page looks like this:

```html
<h1>Existing Page</h1>

<div id="store"></div>
```

We'll use the JavaScript below to fetch the list of products from a web store and insert it in the `div` with an `id` of `store`:

```javascript
document.addEventListener('DOMContentLoaded', () => {
  let request = new XMLHttpRequest();
  request.open('GET', 'https://ls-230-web-store-demo.herokuapp.com/products');

  request.addEventListener('load', event => {
    let store = document.getElementById('store');
    store.innerHTML = request.response;
  });

  request.send();
});
```

When the DOM loads, JavaScript will run the `DOMContentLoaded` handler which makes a request to the URL `https://ls-230-web-store-demo.herokuapp.com/products`. When that request finishes loading, the `load` handler stores the response body inside the `<div id="store">` tag.

#### Example: Submitting a Form via XHR

There are three steps to submitting a form using JavaScript:

1. Serialize the form data.
2. Send the request using `XMLHttpRequest`.
3. Handle the response.

Steps 2 and 3 will be similar to what we've done so far for `GET` requests. Here's the JavaScript code used to make a `POST` request to a book-catalog demo application:

```javascript
let request = new XMLHttpRequest();
request.open('POST', 'https://example.test/path');

let data = 'this is a test';

request.send(data);

// Or if there was no data to send
// request.send();
```

This code results in the following HTTP request:

```
POST /path HTTP/1.1
Host: example.text
Content-Length: 14
Content-Type: text/plain;charset=UTF-8
Accept: */*

this is a test
```

The `Accept` header gets set to `*/*` if it isn't set via `setRequestHeader`.  

Other than changing the first argument to `XMLHttpRequest.open` to `POST`, we now include some data in the request body by passing it to `send`. These changes bring us back to Step 1 in the list above: serialize the form data. There are several ways to do this. In the rest of this assignment, we'll look at each approach.  

##### URL-encoding POST Parameters

URL encoding also works with `POST` requests, but you must include a `Content-Type` header with a value of `application/x-www-form-urlencoded` when you do. Place the encoded name-value string in the request body. Here we post a new book to a book-catalog demo application.  

```javascript
let request = new XMLHttpRequest();
request.open('POST', 'https://ls-230-book-catalog.herokuapp.com/books');

request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

let data = 'title=Effective%20JavaScript&author=David%20Herman';

request.addEventListener('load', () => {
  if (request.status === 201) {
    console.log(`This book was added to the catalog: ${request.responseText}`);
  }
});

request.send(data);
```

A 201 status means the resource was added successfully on the server, although our book-catalog application doesn't actually store the data. This code produces the following HTTP request:  

```
POST /books HTTP/1.1
Host: ls-230-book-catalog.herokuapp.com
Content-Length: 50
Content-type: application/x-www-form-urlencoded
Accept: */*

title=Effective%20JavaScript&author=David%20Herman
```

The server parses the data in the HTTP request's body and makes it available in the following data structure.  

```javascript
{
  title: 'Effective JavaScript',
  author: 'David Herman'
}
```

The specifics vary with languages, but the basic structure and values will be the same. Note that all parameter values are strings.  

The example data structure assumes that the data is already in a valid URL-safe format. Most of the time, though, you need to construct this data on the fly based on the state of the program or, more often, the values entered by a user in an HTML form. We'll learn how to handle that situation next.  

##### Submitting a Form

Let's assume we are working with a web page that contains the following form:  

```html
<form id="form">
  <p><label>Title: <input type="text" name="title"></label></p>
  <p><label>Author: <input type="text" name="author"></label></p>
  <p><button type="submit">Submit</button></p>
</form>
```

To access the values from this form, we can use the `HTMLFormElement.elements` property within an event listener that receives control when the user submits the form:  

```javascript
let form = document.getElementById('form');

// Bind to the form's submit event to handle the submit button
// being clicked, enter being pressed within an input, etc.
form.addEventListener('submit', event => {
  // prevent the browser from submitting the form
  event.preventDefault();
  
  // access the inputs using form.elements and serialize into a string
  let keysAndValues = [];
  
  for (let index = 0; index < form.elements.length; index += 1) {
    let element = form.elements[index];
    let key;
    let value;
    
    if (element.type !== 'submit') {
      key = encodeURIComponent(element.name);
      value = encodeURIComponent(element.value);
      keysAndValues.push(`${key}=${value}`);
    }
  }
  
  let data = keysAndValues.join('&');
  
  // submit the data
  let request = new XMLHttpRequest();
  request.open('POST', 'https://ls-230-book-catalog.herokuapp.com/books');
  request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  
  request.addEventListener('load', () => {
    if (request.status === 201) {
      console.log(`This book was added to the catalog: ${request.responseText}`);
    }
  });
  
  request.send(data);
});
```

When this code runs, it sends a request that is identical to the one we sent in the previous example:  

```
POST /books HTTP/1.1
Host: ls-230-book-catalog.herokuapp.com
Content-Length: 50
Content-type: application/x-www-form-urlencoded
Accept: */*

title=Effective%20JavaScript&author=David%20Herman
```

This result means that the data the remote system receives will be the same. The difference between the two examples lies purely in how we obtain the data.  

##### Submitting a Form with FormData

URL-encoding the names and values of each `input` element as we did above is a manual and error-prone process. Modern browsers provide a built-in API to assist in this process, [FormData](https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects#Retrieving_a_FormData_object_from_an_HTML_form). Here's how to use it:  

Please take note that `FormData` only uses input fields that have a `name` attribute.  

```javascript
let form = document.getElementById('form');

form.addEventListener('submit', event => {
  // prevent the browser from submitting the form
  event.preventDefault();
  
  let data = new FormData(form);
  
  let request = new XMLHttpRequest();
  request.open('POST', 'https://ls-230-book-catalog.herokuapp.com/books');
  
  request.addEventListener('load', () => {
    if (request.status === 201) {
      console.log(`This book was added to the catalog: ${request.responseText}`);
    }
  });
  
  request.send(data);
})
```

As you can see, using `FormData` makes it easy to serialize the form's data!  

One thing to note is that `FormData` uses a different serialization format called *multipart*. Forms that include file inputs use this same serialization. Since `FormData` can upload files, it makes sense for it to default to this multipart format.  

The HTTP request sent by the above code looks like this:  

```
POST /books HTTP/1.1
Host: ls-230-book-catalog.herokuapp.com
Content-Length: 234
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryf0PCniJK0bw0lb4e
Accept: */*

------WebKitFormBoundaryf0PCniJK0bw0lb4e
Content-Disposition: form-data; name="title"

Effective JavaScript
------WebKitFormBoundaryf0PCniJK0bw0lb4e
Content-Disposition: form-data; name="author"

David Herman
------WebKitFormBoundaryf0PCniJK0bw0lb4e--
```

The body of requests sent using multipart form serialization contains a series of parts. Each section is prefixed by a string (in this case, `------WebKitFormBoundaryf0PCniJK0bw0lb4e`), and includes an HTTP header called `Content-Disposition` that provides the name of a parameter and its value. Here's one part of the above request for illustration:  

```
------WebKitFormBoundaryf0PCniJK0bw0lb4e
Content-Disposition: form-data; name="author"

David Herman
```

The body of the request terminates with the same boundary string followed by two dashes (in this case, `------WebKitFormBoundaryf0PCniJK0bw0lb4e--`).  

```javascript
{
  title: 'Effective JavaScript',
  author: 'David Herman'
}
```

#### Example: Loading JSON via XHR

Thus far, we've learned how to retrieve HTML fragments (parts of whole pages) from a server and insert them into a page. This approach works well for applications that primarily use server-side rendering to generate the user interface.  

Sometimes, though, it makes more sense to load data in a primitive data structure and render it with the client-side code. This situation often occurs when the user interface has widgets that the server doesn't render.  

In a previous assignment, we used the following code to load some JSON data from GitHub:  

```javascript
let request = new XMLHttpRequest();
request.open('GET', 'https://api.github.com/repos/rails/rails');

request.addEventListener('load', event => {
  let data = JSON.parse(request.response);
  
  // do something with data
});

request.send();
```

Modern browsers make this process a bit easier by providing native support for fetching JSON data. To do this, we can take advantage of the `responseType` property to tell the browser how to handle the data it receives.    

The valid values for `responseType` are: `text`, `json`, `arraybuffer`, `blob`, and `document`.  

In the example above, we would set `responseType` to `json`, which would let us simplify our code to the following:  

```javascript
let request = new XMLHttpRequest();
request.open('GET', 'https://api.github.com/repos/rails/rails');
request.responseType = 'json';

request.addEventListener('load', event => {
  // request.response will be the result of parsing the JSON response body
  // or null if the body couldn't be parsed or another error
  // occurred.
	
  let data = request.response;
});

request.send();
```

Setting `responseType` lets us avoid extra error-handling code that we may need in the `JSON.parse` example. For instance, we might need to use a try/catch block to handle invalid JSON data returned by the server:  

```javascript
let request = new XMLHttpRequest();
request.open('GET', 'http://ls-230-book-catalog.herokuapp.com/invalid_book');

request.addEventListener('load', event => {
	try {
    let data = JSON.parse(request.response);
    // do something with the data
  } catch(e) {
    console.log('Cannot parse the recieved response as JSON.');
  }
});

request.send();
```

We can avoid this boilerplate by setting `responseType` to `json`. `request.response` either contains a value, or it doesn't, and our code can check that condition.  

#### Example: Sending JSON via XHR

Sending JSON data to the server is similar to submitting a form. You use the same three steps, with a couple of adjustments:  

1. Serialize the data **into valid JSON**.
2. Send the request using `XMLHttpRequest` **with a `Content-Type: application/json; charset=utf-8` header**.
3. Handle the response.

We'll go through these differences one at a time.  

###### Serializing Data to JSON

Let's review how to send a basic POST request from JavaScript:

```javascript
let request = new XMLHttpRequest();
request.open('POST', 'https://ls-230-book-catalog.herokuapp.com/books');

let data = 'title=Eloquent%20JavaScript&author=Marijn%20Haverbeke';

request.send(data);
```

To send data in JSON format, we must update the code to create a valid JSON string.  

```javascript
let request = new XMLHttpRequest();
request.open('POST', 'https://ls-230-book-catalog.herokuapp.com/books');

let data = { title: 'Eloquent JavaScript', author: 'Marijn Haverbeke' };
let json = JSON.stringify(data);

request.send(json);
```

The serialized JSON data looks like this:  

```javascript
{"title": "Eloquent JavaScript", "author": "Marijn Haverbeke"}
```

###### Setting the Content-Type Header

The second step is to set the `Content-Type` request header to `application/json; charset=utf-8`, which tells the server to expect JSON data. It's up to the server to do the right thing here, and not all will change their behavior based on the value of this header, but many APIs require that you set this value accurately; it's a good habit.  

```javascript
let request = new XMLHttpRequest();
request.open('POST', 'https://ls-230-book-catalog.herokuapp.com/books');

request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');

let data = { title: 'Eloquent JavaScript', author: 'Marijn Haverbeke' };
let json = JSON.stringify(data);

request.send(json);
```

#### Cross-Domain XMLHttpRequests with CORS

##### Cross-Origin Requests

The scheme, hostname, and port of a web page's URL define its origin. A cross-origin request occurs when the page tries to access a resource from a different origin.  

Let's consider the URL `http://mysite.com/doc1`. If the web page from this URL requests a resource from any of the following URLs, it will be considered a cross-origin request.  

- https://mysite.com/doc1 (different scheme/protocol)
- http://mysite.com:4000/doc1 (different port)
- http://anothersite.com/doc1 (different host)

A cross-origin request could be a request for an image, a JavaScript file, an XHR, or any other resource. The most important kind of cross-origin request for our purposes is a cross-domain request: a request from one domain (hostname) to another domain.  

Cross-domain requests in web browsers have security vulnerabilities that hackers can exploit to launch attacks. These attacks often lure a user into clicking a carefully crafted link that sends a request to an application with the user's login credentials. These security issues are beyond the scope of our discussion here. Search *XSS* and *CSRF* if you're interested in finding out more about these attacks.  

##### Cross-Origin requests with XHR

By default, an `XHR` object can't send **cross-origin** requests because of the aforementioned security problems. All browsers implement a security feature called the same-origin policy. It prevents `XMLHttpRequest` from making cross-domain requests. The application can request resources from the origin domain, but a request from any other domain causes an error.  

You might ask how you can use all the APIs available for public consumption on web applications if cross-origin requests from XHR objects aren't allowed? Indeed, many applications do use APIs for weather information, stocks, sports scores, maps and all kinds of other services hosted at different domains. The answer is that they use the Cross-Origin Resource Sharing (CORS) mechanism to allow cross-origin access to resources.  

##### CORS

Cross-Origin Resource Sharing is a W3C specification that defines how the browser and server must communicate when accessing resources across origins. The idea behind CORS is to let the two systems know enough about each other to determine whether the response should succeed or fail. Applications use custom HTTP request and response headers to implement this mechanism.  

According to the specification, every `XMLHttpRequest` sent by the browser must have an `Origin` header that contains the origin of the requesting page. The server uses this header to determine whether it should send a corresponding header in the response.  

The browser automatically adds the `Origin` header as part of an XHR. For example, if we send an XHR from a page hosted at `http://localhost:8080`, the browser adds the following request header:  

```
Origin: http://localhost:8080
```

When the server receives this request, it checks the `Origin` header and determines whether the request came from an origin that is allowed to see the response. If it is, it sends the response back with an `Access-Control-Allow-Origin` header that contains the same origin. In our example, the response header will be:  

```
Access-Control-Allow-Origin: http://localhost:8080
```

If the server wants to make a resource available to everyone, it can send the same header, but with a value of `*`:  

```
Access-Control-Allow-Origin: *
```

When the browser sees the `Access-Control-Allow-Origin` header, it checks whether the value contains the correct origin or `*`. If it does, the browser makes the response available to the application. Otherwise, it raises an error.  

It's important to note that even if the server sends the correct response, but without the `Access-Control-Allow-Origin` header with the appropriate value, the browser will raise an error and not let the script access the response.

#### Summary

* AJAX is a technique used to exchange data between a browser and a server without causing a page reload.
* Modern browsers provide an API called the `XMLHttpRequest` to send AJAX requests.
* Some modern applications rely exclusively on JavaScript and `XMLHttpRequest` to communicate with the server and build up the DOM. Such applications are called _single page applications_.
* Sending requests through `XMLHttpRequest` mainly involves the following steps:
  * Create a new `XMLHttpRequest` object.
  * Use the `open` method on the XHR object to specify the method and URL for the request.
  * Use the `setRequestHeader` method on the XHR object to set headers you'd like to send with the request. Most of the headers will be added by the browser automatically.
  * Use the `send` method on the XHR object to trigger the whole action and on POST request we can also pass serialized data as an argument.
  * Attach an event handler for the `load` event to the XHR object to handle the response.
  * Attach an event handler for the `error` event to the XHR object to handle any connection errors. This is not required but it's a good practice.
* XHR objects send asynchronous requests by default, meaning that the rest of the code continues to execute without waiting for the request to complete.
* Important properties on an XHR object are: `responseText`, `response`, `status`, and `statusText`
* The data sent along with requests, if any, must be serialized into a widely supported format.
* The three request serialization formats in widespread use are: 1) _query string/url encoding_, 2) _multi-part form data_, 3) and _JSON_.
* It's a good practice to send a `Content-Type` header with XHR. This helps the server parse the request data.
* Three popular response formats are: 1) HTML, 2) JSON, 3) XML.
* The single most popular serialization format currently in use is JSON.
* To submit a form via XHR, an instance of `FormData` can be used to conveniently serialize the form into multi-part data format.
* One useful property on an XHR object is `responseType`. It's particularly useful when the response is expected to be JSON. When its value is set to `"json"`, the XHR object's response property gives us parsed JSON.
* One major constraint on XHR is the browsers' same-origin policy that limits communication to the same domain, the same port, and the same protocol. Any attempt to communicate outside these limits result in a security error.
* The standard solution for cross-origin restrictions is a W3C specification called Cross-Origin Resource sharing (CORS). CORS recommends using an `Origin` header on the request and an `Access-Control-Allow-Origin` header on the response for cross-origin communications.



---

### jQuery (minimal coverage relative to above 3 bullets)

* jQuery is a JavaScript library that provides a convenient API to perform functions like manipulating DOM elements, handle events, and Make AJAX requests.

* jQuery is _not a separate language_ from JavaScript, but a library of functions and methods that abstract away JavaScript functionality. At its core, jQuery is still JavaScript. 

* At its core, jQuery is a **function** that wraps a _collection of DOM elements_ and some _convenience methods_ into an _object_. You can call the function to select the elements you need to process, and manipulate the object or its elements with methods built into the object. 

* What is the jQuery function? Internally, it is a function that works with an argument that you pass to it.

  * If the argument is a string or a DOM element, it wraps a collection of jQuery objects and returns them.
  * If the argument is a function, jQuery uses that function as a callback when the *document is ready*.

* While you can use the name `jQuery` when calling jQuery, it's common practice to use the alias `$` instead. Either way, we pass the function a string that resembles a CSS selector. For example, if we have a `div` with an `id` of `content`, we can pass jQuery the string `"#content"`:

  ```javascript
  var $content = jQuery('#content');
  var $sameContent = $('#content');
  ```

* Both forms of the function return an object that represents a collection of elements. For `"#id"` selectors, the returned object represents no more than one element (since ids should be unique on the page). For other selectors, the returned object may reference many elements.  

* In our examples, we use the Airbnb-recommended style of prefixing names that reference jQuery objects with a `$` so we can instantly distinguish them from other (non-jQuery) objects.  

#### The DOM Ready Callback

* Since most of jQuery acts on DOM elements, we must wait for the page to load before we execute our code. jQuery has that covered as well. Meet the **DOM ready callback**:

  ```javascript
  $(document).ready(function() {
    // DOM loaded and ready, referenced image on img tags are not ready
  });
  ```

* The callback function we pass to `ready` executes after the document, and its dependencies, finish loading. Note, though, that `ready` doesn't wait for the browser to load images included via `<img>` tags. In some cases, you must delay execution until the window finishes loading:

  ```javascript
  $(window).load(function() {
    // DOM loaded and ready, referenced image on img tags loaded and ready
  });
  ```

* Typically, you can wait for the DOM ready event before running your code. If it uses the natural image dimensions, though, you must wait for the window `load` event instead.

* There's an even shorter way to write a DOM ready callback. You can skip traversing the document and binding to its `ready` event by passing a callback function directly to the jQuery function, `$()`:

  ```javascript
  $(function() {
    // DOM is now loaded
  });
  ```

#### jQuery Object Methods

* Once you obtain an object from jQuery, you can perform a variety of tasks with it. You can, for example, change the `font-size` for all of the elements represented by the object with the `css` method:

  ```javascript
  $content.css('font-size', '18px ');
  ```

* Note that you must pass a string value for the second argument of `css` and that you must include the measurement units when appropriate.

###### Getters and Setters

* We often use the term **setter method** to refer to methods that set properties for an object. We also use the term **getter method** to refer to methods that retrieve the current values for a property. Some jQuery methods, including `css`, have both setter and getter forms: if you omit the last argument, the method acts as a getter; otherwise, it acts as a setter.

  ```javascript
  console.log($content.css('font-size'));    // getter
  $content.css('font-size', '18px');         // setter
  ```

* Likewise, the `width` and `height` methods act as both getters and setters. To check the `$content` object's width, call `width`. To set it to half that width, we use the same method with the new width.

  ```javascript
  var width = $content.width();  // 800 (getter)
  $content.width(width / 2);     // Sets to 400
  console.log($content.width()); // now 400 (getter)
  ```

* Note that `width` and `height` return and use numeric values.

##### Object Argument

* As with most jQuery methods, there are multiple ways to call `css`. One intriguing alternative uses an Object with key/value pairs that match up with the CSS property/value pairs you want to give the element, which lets you set any number of CSS property/value pairs at once. Thus, we can rewrite our code like this:

  ```javascript
  $content.css({
    'font-size': '18px',
    color: '#b00b00'
  });
  ```

##### Property Name Syntax

* Note that we quoted the `font-size` property name here, but didn't do that for `color`. Since `font-size` contains a hyphen that JavaScript tries to interpret as subtraction, we can't write `font-size` without quotes; the quotes prevent JavaScript from trying to process `-` as the subtraction operator.

* If this syntax annoys you, jQuery also accepts camel case property names instead. Whenever you have a CSS property that includes one or more hyphens, you can omit the hyphens and capitalize the next letter instead. For `font-size`, for example, you can use `fontSize` instead:

  ```javascript
  $content.css({
    fontSize: '18px',
    color: '#b00b00'
  });
  ```

* Likewise, you can use `backgroundColor` instead of `"background-color"`, and `borderWidth` instead of `"border-width"`.

* You can use most CSS selectors as-is to access elements with jQuery, though you may need to "escape" some special characters. JQuery also provides a bunch of selectors that are unique to jQuery. You can view all available selectors [here](http://api.jquery.com/category/selectors/).

#### Convenience Methods

* jQuery also provides a variety of convenience methods directly attached to the jQuery object. If you need to check what type a variable is, you can use methods like `$.isArray` and `$.isFunction`. You can concatenate two arrays using `$.merge`, or make a new array with `$.map`. The most important method of the jQuery object is the `$.ajax` method, which lets you make AJAX requests in a much easier fashion than if you had to support multiple versions of Internet Explorer on your own. We'll get to AJAX a bit later.





