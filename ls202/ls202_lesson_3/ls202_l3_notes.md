##### LS202 HTML and CSS > Lesson 3: Images

---

## 1. Introduction

## 2. Image Types

* JPG
* PNG
* GIF

---

## 3. Adding Images to Web Pages

`<img>` is a self-closing tag that tells the browser to load and display a foreground image from a separate resource. It has four attributes of particular interest:

* The `src` attribute is required. It tells the browser where to find the image. It uses the same URL format as links in the `<a>` tag and can be relative, root-relative, or absolute.

* The `alt` attribute is optional, but one should almost always use it. It describes the content of the image as an aid for users who cannot see it or that have images disabled. If you have a picture of Da Vinci's smarter sister, Lucrezia, you should say so in the `alt` attribute value. Most browsers display the `alt` text when an image is unavailable or when images have been disabled.

  Screen readers, specialized browsers that read web pages aloud for people with vision problems, use the `alt` attribute to tell the user about image content. Without `alt`, the user has no idea what the image shows. They may not even know it is present: some reader software treats images with no `alt` text as non-essential, so they skip over them while reading the screen.  

  Search engines use `alt` to index images, which makes it relevant for search engine optimization (SEO).  

  If you omit the `alt` attribute, your browser can still render the image. Existing standards require the `alt` attribute *in most cases* to provide text that the browser can display when the image is unavailable. Your HTML won't validate on the W3C validator unless you use the `alt` attribute. If your image isn't significant enough to require an `alt` attribute, you can specify an empty value with `alt=""`. (There are some specific exceptions to this rule, but you should ignore them for this course.)  

* The `width` and `height` attributes are also optional. They provide the width and height of the image in pixels. The CSS `width` and `height` properties override the HTML attributes in the rendered version of the page.

  If you plan to almost always display images with a specific width and height, then you should use the attributes to specify those values. That lets your browser optimize the rendering speed by allocating room for your image before it finishes downloading.  

  In many cases, however, you won't know the specific width and height in advance, especially if the image's size is dependent on the output device. For instance, mobile devices often render images at a smaller size than in a desktop browser. In such cases, providing the `height` and `width` attributes may lead to worse overall performance. Instead, use the `height` and `width` CSS properties exclusively.   

---

## 4. Practice Problems: Images and Figures

These practice problems use [this image](https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/cats.jpg) which you can download to your system or use directly from its current location, `https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/cats.jpg`.

1. Write HTML to display the image. Don't use a `<figure>` or `<figcaption>` right now.

   ###### My Solution

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>Image Practice</title>
       <meta charset="utf-8" />
     </head>
     <body>
       <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/cats.jpg" alt="A couple of cats" />
     </body>
   </html>
   ```

2. Use CSS to set the width of the image to 250 pixels.

   ```css
   img {
     width: 250px;
   }
   ```

3. Update the CSS width from the previous problem with a height of 350 pixels.

   ```css
   img {
     height: 350px;
   }
   ```

4. Set the width of the image to 400 pixels, but keep the height at 350px.

   ```css
   img {
     height: 350px;
     width: 400px;
   }
   ```

5. Remove the CSS for the `img` element, and wrap the `<img>` in a `<figure>` tag with a yellow background.

   ```html
   <!DOCTYPE html>
   <html lang="en">
     <head>
       <title>Image Practice</title>
       <meta charset="utf-8" />
       <style>
         figure {
           background-color: yellow;
         }
       </style>
     </head>
     <body>
       <figure>
         <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/cats.jpg"
              alt="A couple of cats" />
       </figure>
     </body>
   </html>
   ```

6. Add a caption below the image.

   ```html
   <figure>
     <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/cats.jpg"
          alt="A couple of cats" />
   	<figcaption>A couple of cats being a couple of cats.</figcaption>
   </figure>
   ```

7. Move the caption above the image.

   ```html
   <figure>
     <figcaption>A couple of cats being a couple of cats.</figcaption>
     <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/cats.jpg"
          alt="A couple of cats" />
   </figure>
   ```

---

## 5. Guided Project: A Simple Photo Gallery

Here's the body of our HTML:

```html
<main>
  <figure>
    <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/1.jpg"
         alt="Transit Shadows" />
    <figcaption>Transit Shadows</figcaption>
  </figure>

  <figure>
    <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/2.jpg"
         alt="Missy Chaplin" />
    <figcaption>Missy Chaplin</figcaption>
  </figure>

  <figure>
    <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/3.jpg"
         alt="Thunderbirds in Formation" />
    <figcaption>Thunderbirds in Formation</figcaption>
  </figure>

  <figure>
    <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/4.jpg"
         alt="Orange Rose" />
    <figcaption>Orange Rose</figcaption>
  </figure>

  <figure>
    <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/5.jpg"
         alt="Kentucky Darleks" />
    <figcaption>Kentucky Darleks</figcaption>
  </figure>
</main>
```

We'll zero out the margins and padding for all these elements to ensure that the appearance remains similar in different browsers:

```css
body, main, figure, figcaption, img {
  margin: 0;
  padding: 0;
}
```

We call this type of margin/padding zeroing a reset.  

We're using the `main` element as a master "container" element for the entire photo gallery. It provides some semantic meaning for the document as it identifies the primary content area.  

1. After loading the page, you may notice that the images are vertically too near each other, and they're flush with the top and left edges of the window. Adjust the spacing between the `figure` elements and the distance between the left and right edges of the browser window to `50px` to give the images some breathing room.

   ###### My Solution

   ```css
   figure {
     margin: 50px;
   }
   ```

   ###### LS Solution

   ```css
   figure {
     margin: 50px;
     outline: 1px solid red;
   }
   ```

   In a previous lesson, we discussed the rule of thumb that one should use margins instead of padding to adjust the space between adjacent elements. Since we're dealing with spacing here, we elected to use margins. It's possible to use padding instead, as we'll see later, but we'll stick to the rule of thumb for now.

   _We used the `outline` property to temporarily draw rectangles around each figure to help you see how the elements line up. Outlines are like borders, but they lie outside them. More importantly, they don't interact with the box model, so they don't change the page layout. This feature makes them useful during development and debugging._

   Look at the outline around the figure that contains the widest image. Depending on your browser window's width, the image may extend beyond the right side of the outline. This odd effect occurs for two reasons:

   - The displayed width of an image that doesn't have the `width` property or the deprecated `width` attribute is the original width of the image. That can be wider than the container in which the image resides.
   - In this case, the container element is a `figure` element. The default width for `figure` is `100%`, which, in this case, represents 100% of the browser window (minus the margins). If the image width image exceeds the width of the `figure`, the image will extend beyond the right side of the outline.

2. Reduce your browser window's width, if necessary, until at least one image exceeds the window width. Next, adjust the CSS to make them all fit inside the window. Don't forget that there is a margin around each figure, which should be evident when you display the page.

   Once you're done, check what happens as you expand and shrink the browser window; no matter what adjustments you make, all images should fit in the window.

   ###### My Solution

   ```css
   img {
     width: 100%;
   }
   ```

   ###### LS Solution

   ```css
   max-width: 100%;
   ```

   By reducing the maximum size, all of the images now fit entirely inside their figure outlines.

3. Every image should use the entire width of the `figure` elements. Modify your CSS to implement this requirement.

   ###### My Solution

   ```css
   img {
     width: 100%
   }
   ```

4. Reduce the width of each `figure` to 1/2 the width of the browser window:

   ###### My Solution

   ```css
   figure {
     margin: 50px;
     outline: 1px solid red;
     width: 50%;
   }
   ```

   This is not technically 1/2 the width of the browser window due to the margins on either side of the figure elements. But here's what LS did:

   ###### LS Solution

   ```css
   figure {
     width: 50%
   }
   ```

5. At this point, the figures are narrow enough that we should be able to squeeze 2 of them in every row on the page. However, since `figure`'s are `block` elements, they always take up an entire row. Instead, you must convert the `figure` elements to `inline-block`. Please do so.

   ###### My Solution

   ```css
   figure {
     display: inline-block;
     margin: 50px;
     outline: 1px solid red;
     width: 50%;
   }
   ```

   ###### LS Solution

   ```css
   figure {
     display: inline-block;
   }
   ```

   Even though we converted the box model to `inline-block`, the images still don't fit side-by-side. There's a problem - actually, two problems. Can you see what's wrong? Try to determine what you need to do before continuing. We'll return to this issue after an unrelated question.

   ###### My Response:

   One problem is, as I mentioned above, that because of the margins on either side of the figure, the specification of 50% for the value of the `width` property is too high. But I'm not sure how best to go about calculating what it should be.  

   I'm not exactly sure what the second problem is.

6. There's a small cosmetic issue unrelated to squeezing two images per row. Let's center the captions beneath each image:

   ###### My Solution

   ```css
   figcaption {
     text-align: center;
   }
   ```

   ###### LS Solution

   Same.

7. Returning to the problem of squeezing two images per row, the main issue we have is that we have margins to the left and right of each `figure`. Recall that we used margins here to satisfy our rule of thumb about choosing margins or padding. However, those margins take up space in the browser window, so we can't squeeze two 50%-width elements side-by-side. Instead, we need to set the left and right margins on the `figure` elements to `0`, and redistribute that space in some other way. Give this a try now.

   ###### My Solution

   ```css
   figure {
     display: inline-block;
     margin: 50px 0;
     outline: 1px solid red;
     width: 50%;
   }
   ```

   ###### LS Solution

   ```css
   figure {
     box-sizing: border-box;
     margin: 50px 0;
     padding: 0 50px;
   }
   ```

   We need to set the top and bottom margins to 50px and set the left and right padding values to 50px as well. Lastly, we need to set the box-sizing model to `border-box` to ensure the width includes the padding.

8. The other part of the problem of squeezing two images per row is that there is a small amount of whitespace between every pair of `inline-block` elements. It's not much whitespace, but it's enough to prevent two 50% elements from fitting side-by-side. Go ahead and make the necessary adjustments to get rid of the whitespace.

   ###### My Solution

   ```html
   <main>
     <figure>
       <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/1.jpg"
            alt="Transit Shadows" />
       <figcaption>Transit Shadows</figcaption>
     </figure><!-- 
   
   --><figure>
       <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/2.jpg"
            alt="Missy Chaplin" />
       <figcaption>Missy Chaplin</figcaption>
     </figure><!-- 
   
   --><figure>
       <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/3.jpg"
            alt="Thunderbirds in Formation" />
       <figcaption>Thunderbirds in Formation</figcaption>
     </figure><!-- 
   
   --><figure>
       <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/4.jpg"
            alt="Orange Rose" />
       <figcaption>Orange Rose</figcaption>
     </figure><!-- 
   
   --><figure>
       <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/5.jpg"
            alt="Kentucky Darleks" />
       <figcaption>Kentucky Darleks</figcaption>
     </figure>
   </main>
   ```

   I inserted comments to eliminate the white space between the `<figure>` elements.

   ###### LS Solution 1

   ```html
   <figure>
     <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/1.jpg"
          alt="Transit Shadows" />
     <figcaption>Transit Shadows</figcaption>
   </figure><figure>
     <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/2.jpg"
          alt="Missy Chaplin" />
     <figcaption>Missy Chaplin</figcaption>
   </figure><figure>
     <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/3.jpg"
          alt="Thunderbirds in Formation" />
     <figcaption>Thunderbirds in Formation</figcaption>
   </figure><figure>
     <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/4.jpg"
          alt="Orange Rose" />
     <figcaption>Orange Rose</figcaption>
   </figure><figure>
     <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/5.jpg"
          alt="Kentucky Darleks" />
     <figcaption>Kentucky Darleks</figcaption>
   </figure>
   ```

   In one of our earlier encounters with this issue, we inserted comments between each of the elements. We use a slightly different technique here: we place the opening tag of each `figure` adjacent to the closing tag of the previous `figure`. It has the same effect.

   ###### LS Solution 2

   Another way to get rid of the space between `figure` elements is to reduce the font size of that space to 0.

   ```css
   main {
     font-size: 0;
   }
   
   figcaption {
     font-size: 1rem;
   }
   ```

   By reducing the font size for the `main` element to 0 (we don't have any other text in this element), the space character shrinks into nothingness. However, we must remember to restore the font before we display anything, such as the caption.

9. The images are a bit on the small side. Let's give the user the ability to see them full-sized by clicking on them. When clicked, the browser should load the image directly into a new tab or window. To accomplish this, convert your images into links.

   ###### My Solution

   ```html
   <main>
     <figure>
       <a href="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/1.jpg" target="_blank"><img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/1.jpg"
            alt="Transit Shadows" /></a>
       <figcaption>Transit Shadows</figcaption>
     </figure><!-- 
   
   --><figure>
       <a href="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/2.jpg" target="_blank"><img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/2.jpg"
            alt="Missy Chaplin" /></a>
       <figcaption>Missy Chaplin</figcaption>
     </figure><!-- 
   
   --><figure>
       <a href="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/3.jpg" target="_blank"><img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/3.jpg"
            alt="Thunderbirds in Formation" /></a>
       <figcaption>Thunderbirds in Formation</figcaption>
     </figure><!-- 
   
   --><figure>
       <a href="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/4.jpg" target="_blank"><img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/4.jpg"
            alt="Orange Rose" /></a>
       <figcaption>Orange Rose</figcaption>
     </figure><!-- 
   
   --><figure>
       <a href="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/5.jpg" target="_blank"><img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/photo-gallery/5.jpg"
            alt="Kentucky Darleks" /></a>
       <figcaption>Kentucky Darleks</figcaption>
     </figure>
   </main>
   ```

   ###### LS Solution

   Pretty much the same.

10. You can now get rid of the outline you attached to the `figure` elements, and assign a pleasant background to the gallery. You can use the background image we used earlier in this lesson (`https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/gradient-background.png`) or one of your own.

    ###### My Solution

    ```css
    main {
      background-image: url('https://d3jtzah944tvom.cloudfront.net/202/images/lesson_3/gradient-background.png');
      background-size: cover;
    }
    ```

    ###### LS Solution

    Basically the same.

---

## 6. Summary

