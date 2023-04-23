

What is it? 

Allows you to expose your local app to the internet using a secure tunnel. The end result is that you get a temporary public URL which others can use to access your app without deploying it.

You can then use the temporary URL to test webhooks. 



Benefit over PostMan
- multiple users can send request to it instead of just the person with access to local host

- You can test webhooks with the public URL. 




What specific problem does it solve?  Has anyone on your team used it before, and if so, what was your experience? 
Why is it useful when we're integrating with webhooks?



primary domain: launchschool.com
request bin domain: launchschool.com/rb

web server:
  nginx:
    - when the path is `/rb`:
      - reverse proxy to app location: port 4567
      // https://pipedream.net/rb/eopqsvicrktgs0z -- npm uuidv4
      app server:
  - receives HTTP request
  - verify that endpoint exists
  - creates a DB record for the incoming request
  - returns response with HTTP headers and body

https://requestbin.com/r/en4koze2ne9ld/2KdlOiqJzNsDWsDmnTkwr78mUix



Step 1: request is made at yourwebsite/rb/$endpoint

Step 2: gets handled web server (nginx)

Step 3: nginx forward the request to your express app which has a route for handling the specific request

For example: this route handles that request
router.get("/:uid")
  - do your normal activity for this route (example: post a payment)
  - create a db record of the request
  - display request headers and body to user


