##### LS202 HTML and CSS > Lesson 7: Design Files

---

## 1. Introduction

## 2. CSS Resets

A reset is a bit of CSS that "resets" your CSS to a known state in a variety of different browsers. Thus, your favorite browser renders your web page in the same way that other browsers do. Resets do this by removing or overriding most browser styling defaults; for instance, they set a default font, zero out margins and padding, and eliminate browser-specific styling on input controls. These actions give you a fresh start from which to work and leave you free to add the styles you need without worrying about unexpected results in other browsers.

While there are plenty of resets available, most developers choose one of these popular files:

- [Eric Meyer's reset](http://meyerweb.com/eric/tools/css/reset/)
- [Normalize.css](http://necolas.github.io/normalize.css/)
- [Tantek Celik's whitespace reset](http://cssreset.com/scripts/undohtml-css-tantek-celik/).

The resets vary in aggressiveness, and it's probable that you'll end up with a reset that you like, except for one or two problems. People often customize the reset they use, as we do at Launch School: we use a custom version of Tantek Celik's reset. It's a simple one:

```css
/*
----------------------------------------
Tantek Celik's Whitespace Reset
     Author:    Tantek Celik, Shane Riley
    Version:    (CC) 2010 Some Rights Reserved - http://creativecommons.org/licenses/by/2.0
Description:  Resets default styling of browsers to a common base
----------------------------------------
*/

ul, ol { list-style: none; }
h1, h2, h3, h4, h5, h6, pre, code { font-size: 1em; }
ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, body, html, p, blockquote,
fieldset, input, dl, dt, dd, figure, figcaption {
  margin: 0;
  padding: 0;
}
a img, :link img, :visited img, fieldset { border: none; }
address { font-style: normal; }
header, section, article, nav, footer, hgroup, details, summary, figure, main {
  display: block;
}
mark {
  color: inherit;
  background-color: transparent;
}
abbr { border: none; }
summary::-webkit-details-marker { display: none; }
```

As you can see, there's not much to it. This reset:

- removes the bullets on ordered and unordered lists.
- sets all headings and a few other items to use the same font size.
- sets the padding and margins on most `block` elements to 0.
- removes the border that surrounds images inside links on older browsers.
- removes the border on `fieldset`.
- converts `address` elements to look like regular text.
- sets newer HTML elements to `display: block`, in case the user has an old browser that defaults to `inline`.
- removes garish colors from the `mark` element.
- removes the bottom border from `abbr` elements.
- removes the toggle marker from the `summary` element.

---

## 3. Working With Design Files

### Photoshop and Design Files

When you first start writing HTML and CSS for a real-world project, a designer will probably give you a **design file** (it's possible that you may be the designer): a mockup of the finished project pages. The design file is almost always a Photoshop document, a PSD file, which is a multi-layered image that contains layers for each part of the design: images, shapes, text, etc. You're expected to use the design file to create your image and background assets as well as obtain information regarding padding, margins, font-size, and color. Knowing your way around Photoshop well enough to extract this information will help you get work as a front-end developer.  

There are alternatives to Photoshop that can read and process PSD files, but we haven't yet determined whether any of these programs do everything needed to examine design files usefully. Most are not free. Some programs provide the ability to read layered PSD files, but they may lack the functionality you need to extract information from those layers.  

Here are a few alternatives that may do the job.

- [Photopea](https://www.photopea.com/) is a free online alternative to Photoshop that some of our students recommend. The support for Launch School project files appears to be excellent; we've had no reports of problems working on the projects in this course.
- [Affinity Photo](https://affinity.serif.com/en-us/photo/) Serif claims that Affinity can access PSD file layers, but with some limitations. The chief lack appears to be support for "smart objects," which you may need with some design files. A 10 day trial period may be available.
- [Photoshop Elements](https://www.adobe.com/) Adobe claims that Photoshop Elements can access PSD files, but with some limitations. It doesn't go into detail, though. A 30 trial period may be available.
- [GIMP](https://www.gimp.org/) As with Affinity Photo, GIMP can read PSD files with some limits, but it is also free. Note that we know that GIMP doesn't work with the Company Site project later in this lesson, but it seems to work well with the other projects provided that you use "Open as Layers" to open the files.
- [Adobe Creative Assets](https://assets.adobe.com/) This free online tool supplied by Adobe lets you look at PSD file layers, measure distances and colors, and extract resources such as images. It works somewhat differently from Photoshop and other tools, but it can be a useful alternative to purchasing Photoshop or using one of the above tools.

If you find one of these programs or another application useful, or find that one doesn't work, let us know!

### PNG Design Files

In the absence of Photoshop, we will provide you with a design file that we've collapsed down to a PNG format. PNG files aren't the best tool for the job, but they work well enough for your Launch School projects.  

There are several problems with using PNG files for design:

- There is no way to examine and measure fonts.
- It is hard to measure colors when the color patch is less than 5-10 pixels thick, such as line drawings and text.
- Extracting images is tedious. If it has curved, jagged, or fuzzy edges, obtaining a clean result may be almost impossible. We'll avoid this by providing you with the images that you need.

To use PNG design files, you'll need tools that:

- open and view PNG files at the intended screen size
- measure sizes, padding, and margins
- measure colors

The macOS program, Preview, displays PNG files. Use View, Actual Size to view the image at its actual size. Drag out rectangular marquees to measure a component. However, there is no way to measure colors.  

On a Mac, Digital Color Meter (found under Applications, Utilities) can help measure colors. Select View, Display Values, as Hexadecimal to display color values in hex, and use Display in sRGB on the drop-down list. You can use Shift-Cmd-C to copy the color under the cursor to the cut-and-paste buffer as a hex value suitable for use in your CSS.  

---

## 4. Walkthrough: Using A Photoshop Design File

##### HTML

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shutter Bug</title>
    <meta charset="utf-8" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <header>
      <h1>Shutter Bug</h1>
      <nav>
        <ul>
          <li><a class="active" href="#">Home</a></li>
          <li><a href="#">Gallery</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </nav>
    </header>

    <main>
      <img class="masthead" src="img_masthead.jpg" />
      <h2>Welcome to Shutter Bug</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet nisl vel eros semper maximus at in quam. Suspendisse ac lectus ac eros pulvinar finibus luctus sed magna. Duis eleifend placerat metus, sed malesuada ipsum rhoncus viverra. Donec vel ullamcorper lorem. Integer accumsan mauris vel ex porttitor, et pharetra nisi finibus. Vestibulum vitae sagittis risus. Fusce ornare tempor purus eget blandit. Quisque eu erat non odio lobortis sollicitudin ultrices nec arcu. Pellentesque eget iaculis purus. Morbi ac libero egestas, maximus ex id, mattis arcu. Praesent tincidunt justo non luctus dapibus.</p>

      <figure>
        <img src="img_article.jpg" />
      </figure>

      <p>Pellentesque vel congue dolor. Aenean varius lectus massa, ac pharetra sapien egestas sit amet. Maecenas non ipsum convallis, vestibulum augue eget, molestie urna. Donec a mauris pretium, eleifend felis eu, dapibus mi. Nunc vel imperdiet arcu. Morbi hendrerit rhoncus eleifend. Nullam sodales tincidunt consequat. Maecenas ut laoreet dui, et hendrerit nisi.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet nisl vel eros semper maximus at in quam. Suspendisse ac lectus ac eros pulvinar finibus luctus sed magna. Duis eleifend placerat metus, sed malesuada ipsum rhoncus viverra. Donec vel ullamcorper lorem. Integer accumsan mauris vel ex porttitor, et pharetra nisi finibus. Vestibulum vitae sagittis risus. Fusce ornare tempor purus eget blandit. Quisque eu erat non odio lobortis sollicitudin ultrices nec arcu. Pellentesque eget iaculis purus. Morbi ac libero egestas, maximus ex id, mattis arcu. Praesent tincidunt justo non luctus dapibus.</p>
    </main>
    <footer>
      <p>&copy; 2015 Shutter Bug</p>
    </footer>
  </body>
</html>
```

##### CSS

```css
@import url("whitespace-reset.css");

body {
  font: normal 18px "Roboto Condensed", sans-serif;
  color: #3e606f;
  background-image: linear-gradient(to bottom, #d1dbbd, #fcfff5);
  background-repeat: no-repeat;
}

header {
  width: 920px;
  padding: 20px 20px 0 20px;
  margin: 0 auto;
}

h1 {
  float: left;
  padding: 45px 0 15px 115px;
  font-size: 36px;
  font-weight: normal;
  color: #193441;
  background: transparent url("logo.png") 0 0 no-repeat;
}

nav {
  float: right;
  padding: 75px 0 0 0;
}

nav li {
  display: inline-block;
}

nav a {
  display: block;
  padding: 10px 40px 14px 40px;
  text-decoration: none;
  color: #91aa9d;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  background-color: #fcfff5;
}

nav a.active {
  color: #fcfff5;
  background-color: #91aa9d;
}

main {
  clear: both;
  overflow: hidden;
  width: 960px;
  padding: 30px;
  margin: 0 auto;
  background: #ffffff;
  box-sizing: border-box;
  box-shadow: 0 5px 5px #b5b5b5;
}

img.masthead {
  margin: 0 0 40px 0;
}

h2 {
  padding: 0 0 25px 0;
  font-size: 32px;
  font-weight: normal;
}

p {
  padding: 0 0 20px 0;
}

figure {
  float: right;
  padding: 0 0 0 30px;
}

footer {
  width: 960px;
  padding: 15px 0;
  margin: 0 auto;
  font-size: 14px;
}
```

---

## 5. On Your Own: Using a PNG Design File

##### HTML

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shutter Bug</title>
    <meta charset="utf-8" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="png_style.css"  />
  </head>
  <body>
    <header>
      <h1>Shutter Bug</h1>
      <nav>
        <ul>
          <li><a class="active" href="#">Home</a></li>
          <li><a href="#">Gallery</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </nav>
    </header>
    <main>
      <figure>
        <img class="main-image" src="img-masthead.jpg" alt="Landscape main image" />
      </figure>
      <h2>Welcome to Shutter Bug</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet nisl vel eros semper maximus at in quam. Suspendisse ac lectus ac eros pulvinar finibus luctus sed magna. Duis eleifend placerat metus, sed malesuada ipsum rhoncus viverra. Donec vel ullamcorper lorem. Integer accumsan mauris vel ex porttitor, et pharetra nisi finibus. Vestibulum vitae sagittis risus. Fusce ornare tempor purus eget blandit. Quisque eu erat non odio lobortis sollicitudin ultrices nec arcu. Pellentesque eget iaculis purus. Morbi ac libero egestas, maximus ex id, mattis arcu. Praesent tincidunt justo non luctus dapibus.</p>

      <figure class="article-image">
        <img src="img-article.jpg" alt="desolate tree" />
      </figure>

      <p>Pellentesque vel congue dolor. Aenean varius lectus massa, ac pharetra sapien egestas sit amet. Maecenas non ipsum convallis, vestibulum augue eget, molestie urna. Donec a mauris pretium, eleifend felis eu, dapibus mi. Nunc vel imperdiet arcu. Morbi hendrerit rhoncus eleifend. Nullam sodales tincidunt consequat. Maecenas ut laoreet dui, et hendrerit nisi.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet nisl vel eros semper maximus at in quam. Suspendisse ac lectus ac eros pulvinar finibus luctus sed magna. Duis eleifend placerat metus, sed malesuada ipsum rhoncus viverra. Donec vel ullamcorper lorem. Integer accumsan mauris vel ex porttitor, et pharetra nisi finibus. Vestibulum vitae sagittis risus. Fusce ornare tempor purus eget blandit. Quisque eu erat non odio lobortis sollicitudin ultrices nec arcu. Pellentesque eget iaculis purus. Morbi ac libero egestas, maximus ex id, mattis arcu. Praesent tincidunt justo non luctus dapibus.</p>
    </main>
    <footer>
      <p>&copy; 2015 Shutter Bug</p>
    </footer>
  </body>
</html>
```

##### CSS

```css
@import url("whitespace-reset.css");

body {
  font: normal 18px "Roboto Condensed", sans-serif;
  background-image: linear-gradient(to bottom, #D1DBBD, #F1F2EA);
  background-repeat: no-repeat;
}

header {
  width: 960px;
  margin: 0 auto;
  box-sizing: border-box;
  padding: 20px 20px 0 20px;
  overflow: hidden;
}

h1 {
  padding: 50px 0 15px 115px;
  font-size: 36px;
  font-weight: normal;
  color: #193441;
  background: transparent url("logo.png") 0 0 no-repeat;
  float: left;
}

nav {
  float: right;
  padding: 85px 0 0 0;
}

nav li {
  display: inline-block;
}

nav a {
  display: block;
  text-decoration: none;
  color: #91AA9D;
  background-color: #FCFEF5;
  width: 130px;
  text-align: center;
  padding: 15px 0;
  border-radius: 10px 10px 0 0;
}

nav a.active {
  color: #FCFEF5;
  background-color: #91AA9D;
}

main {
  width: 960px;
  margin: 0 auto;
  background-color: #FFFFFF;
  box-sizing: border-box;
  padding: 0 30px 50px 30px;
  overflow: hidden;
  box-shadow: 0 5px 5px #B5B5B5;
}

img.main-image {
  padding: 30px 0 40px 0;
}

h2 {
  color: #3E606F;
  font-size: 32px;
  font-weight: normal;
  padding-bottom: 30px;
}

p {
  color: #3E606F;
  padding-bottom: 20px;
}

figure.article-image {
  float: right;
  padding-left: 35px;
}

footer {
  width: 960px;
  margin: 0 auto;
  padding: 10px 0;
}

footer p {
  font-size: 14px;
  font-weight: normal;
}
```

---

## 6. On Your Own: A Company Splash Page

##### My HTML

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>SpaceDesign</title>
    <link rel="stylesheet" href="styles.css" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&display=swap" rel="stylesheet">
    <meta charset="utf-8" />
  </head>
  <body>
    <header>
      <img src="logo.png" alt="Space Design logo" />
    </header>
    <main>
      <section class="about">
        <h2><span>&bull;</span>About Us<span>&bull;</span></h2>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in.
        </p>
      </section>
      <section class="founder">
        <h2><span>&bull;</span>Our Founder<span>&bull;</span></h2>
        <h3>Admiral Kerning</h3>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint.
        </p>
      </section>
    </main>
    <footer>
      <nav>
        <ul>
          <li><a href="#"><img src="icon_twitter.png" alt="Twitter Icon" /></a></li>
          <li><a href="#"><img src="icon_facebook.png" alt="Facebook Icon" /></a></li>
          <li><a href="#"><img src="icon_email.png" alt="Email Icon" /></a></li>
        </ul>
      </nav>
    </footer>
  </body>
</html>
```

##### My CSS

```css
@import url("whitespace-reset.css");

body {
  background-image: url("bg_body.gif");
  padding-bottom: 145px;
}

main {
  width: 1000px;
  margin: 0 auto;
  background-color: #fff;

}

header {
  text-align: center;
  margin: 160px 0 95px;
}

h2 {
  font: normal 36px "Nunito Sans", Helvetica, sans-serif;
  color: #45494d;
  text-align: center;
  padding: 110px 0 40px;
}

h2 span {
  color: #2f2840;
  padding: 0 28px;
}

section.founder {
  margin-top: 40px;
  padding-bottom: 70px;
}

h3 {
  font: normal 24px "Nunito Sans", Helvetica, sans-serif;
  color: #3e98b2;
  text-align: center;
  padding-bottom: 35px;
}

p {
  font: normal 20px "Nunito Sans", Helvetica, sans-serif;
  color: #45494d;
  text-align: center;
  padding: 0 95px;
}

footer {
  width: 1000px;
  margin: 0 auto;
  background-color: #e7e7e7;
}

nav {
  text-align: center;
}

li {
  display: inline-block;
  padding: 32px 60px;
}

a {
  display: block;
}
```

### Challenge

If you want an additional challenge, try changing the page layout to a variable width by using a combination of min-width and max-width CSS properties. As you resize the browser window, the content should adjust in width to match the minimum and maximum widths.

###### My CSS Additions

```css
body {
  max-width: 1400px;
  min-width: 800px;
}

main {
  width: 71.4%;
}

footer {
  width: 71.4%;
}
```

---

## 7. Improving Your HTML and CSS

## 8. On Your Own: Company Site

## 9. On Your Own: Web Store Catalog

