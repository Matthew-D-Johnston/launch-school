## Progressive Web Applications (PWAs)

#### What are PWAs?

PWAs are web-based applications that use modern web technologies to provide a native app-like experience in a browser. You can think of them as websites built using web technologies but which act and feel like native apps. PWAs can work across desktop and mobile browsers. They are designed to work offline, be fast, and provide an immersive user experience. 

#### Historical Context

At the iPhone's launch in 2007, Steve Jobs announced that web apps (developed in HTML5 using AJAX architecture) would be the standard format for iPhone apps. He indicated that no software development kit (SDK) would be required, and that apps would be fully integrated into the device through the Safari browser engine. However, Apple eventually abandoned this model in favour of the App Store, partly due to developer push back. Developers wanted the ability to develop apps that had capabilities, which browsers did not support at the time.  

Starting in the early 2010s, responsive web design—an approach to web design that aims to make web pages render well on a variety of devices and window or screen sizes—made PWA development more accessible. Continued enhancements to HTML, CSS, and JavaScript allowed web applications to incorporate greater levels of interactivity, making native-like experiences possible on a website.

The term "progressive web app" was first coined in 2015 by designer Frances Berriman and Google Chrome engineer Alex Russell. At that time, the functionality of native applications was far superior to that of mobile browser functionality. Native applications were, in a sense, holding back the web. 

The PWA term was used to describe apps that leveraged the new features supported by modern browsers, including *service workers* and *web app manifests*. The idea behind PWAs was to leverage those modern web technologies in order to provide a better web experience for users, especially in areas with unreliable or slow internet connectivity.

##### What is a Service Worker?

A service worker is a script executed from an HTML page that runs in the background of a web application. It runs independently of other scripts that may also have been executed from the same HTML page. Service workers allow for the caching of website assets and make them available when a user's device is offline. They also enable background processing and push notifications.

##### What is a Web App Manifest?

A web application manifest provides information about a web application in a JSON text file that is necessary for the web app to be downloaded and be presented to the user similarly to a native app (e.g. be installed on the home screen of a device, providing users with quicker access and a richer experience). PWA manifests include the web app's name, author, icon(s), version, description, and list of all the necessary resources.

#### But why PWAs and not just Native Apps?

There are several reasons why PWAs might be useful and may be preferred over a native app. However, they are not necessarily preferred in every scenario.

One of those reasons is rapid deployment. Native apps must abide by the rules of the app store and be approved before they can be deployed. And it's not just when first deployed that these apps need to be approved, but on every subsequent update. Waiting for approval takes time, sometimes days or weeks. By contrast, a web app can be deployed and updated at any time and does not need to wait for approval.  

Another reason is privacy. Native apps must be uploaded to a public app store. But some apps are meant for just a specific group of users and not for wide-scale public use. Being forced to deploy through a public app store may infringe on a group's privacy.  

Going with a PWA can reduce the amount of additional learning and development time compared to a native app. This is because PWAs allow web developers to use tools they are already familiar with, such as HTML, CSS and JS. In the case of building a native app, web developers may need to learn platform specific / cross platform libraries. If the goal is to add a new feature, a lot of time can be saved by updating an existing web app with native capabilities rather than developing a completely new native app from scratch.

#### PWAs and Offline-First Functionality

One of the major problems that PWAs are trying to solve is the ability to provide a functional app experience even when connectivity is lost. This means thinking about app development with an offline-first mentality. It means assuming that connectivity cannot always be guaranteed, but aiming to ensure that things still work. You have to assume that lack of connectivity isn't an error condition, which takes a significant mindset shift.

PWAs prioritize the ability to function offline and one of the most challenging aspects of providing that functionality is offline-first data management. How do you manage and serve offline users their data? The assumption of offline-first app development is that data is held and processed on the mobile or remote device, as opposed to the cloud or back at a data center.

Given that assumption, one option might be to simply cache data on the device to keep apps running during internet disruptions and then syncing it when connectivity is restored. But this option could run into data storage limits depending on how long the device is offline. Data loss could occur if you run into caching limits. Further, if the cache is being held in memory, then data loss would also occur if the device's battery dies.

An alternative would be to embed a full database on the device itself, allowing information to be queried and stored without any need for connectivity. This could be done with SQLite, for example. But most applications are being used by multiple people, all of which are affecting the data stored by the app. At some point, the data needs to be shared across an ecosystem with other users. That means developers need a way to sync the data back to the cloud as well as other devices running the app.

#### Solutions

* Couchbase
* Hoodie
* Realm Mobile Platform

 