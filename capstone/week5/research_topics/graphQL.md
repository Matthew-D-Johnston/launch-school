## GraphQL

#### What is GraphQL?

* GraphQL is a query language and server-side runtime for [application programming interfaces (APIs)](https://www.redhat.com/en/topics/api/what-are-application-programming-interfaces) that prioritizes giving clients exactly the data they request and no more (https://www.redhat.com/en/topics/api/what-is-graphql).
* GraphQL is designed to make APIs fast, flexible, and developer-friendly (https://www.redhat.com/en/topics/api/what-is-graphql).
* As an alternative to [REST](https://www.redhat.com/en/topics/integration/whats-the-difference-between-soap-rest), GraphQL lets developers construct requests that pull data from multiple data sources in a single API call (https://www.redhat.com/en/topics/api/what-is-graphql).
* GraphQL is a query language to build APIs (https://dev.to/juliansci/graphql-what-is-it-and-what-does-it-solve-15p1).



#### GraphQL: Historical Context

* GraphQL was invented in 2012.
* Before 2012, there was a broad shift towards mobile apps. Facebook felt that it wasn't keeping up with this shift (https://www.youtube.com/watch?v=783ccP__No8).
* Facebook came to the decision that it needed to rebuild its iOS app from scratch. But they immediately began to find issues with the API (https://www.youtube.com/watch?v=783ccP__No8).
* Facebook wanted their APIs to support News Feed. But the APIs at the time were not designed to allow you to expose a full, rich news-feed-like experience: they didn't have a hierarchical nature, they didn't have the ability to easily select what you needed, and they didn't have the ability to display a list of heterogenous feed stories (https://www.youtube.com/watch?v=783ccP__No8).
* At the beginning of 2012, Facebook realized that it was probably going to need a new news feed API in order to deliver the mobile app it wanted to its users (https://www.youtube.com/watch?v=783ccP__No8).
* GraphQL was created by Facebook. It was motivated by a desire to fix some of the problems associated with REST APIs (https://dev.to/juliansci/graphql-what-is-it-and-what-does-it-solve-15p1).
* The Mobile Facebook team was having problems with REST that were affecting app performance. Multiple requests were required for a simple app page. Overfetching of data was also an issue. Both these issues were affecting the app's performance (https://dev.to/juliansci/graphql-what-is-it-and-what-does-it-solve-15p1).
* Facebook began creating a new query language that allowed a client to specify exactly what data it needed and then receive the data in a single request (https://dev.to/juliansci/graphql-what-is-it-and-what-does-it-solve-15p1).
* GraphQL was used internally by Facebook for their mobile applications to reduce network usage by means of its specific data-fetching capabilities (https://www.altexsoft.com/blog/engineering/graphql-core-features-architecture-pros-and-cons/).



#### Problems GraphQL Solves

* GraphQL solves the problem of over- or under-fetching of data in REST APIs by allowing clients to specify exactly the data they need, thus avoiding round trips and reducing network usage.
* GraphQL can lead to better performance, as it reduces the number of round trips and bandwidth usage compared to REST.
* One of the most common problems with REST is that of over- and under-fetching. These problems occur because the only way for a client to download data is by hitting endpoints that return fixed data structures (https://www.howtographql.com/basics/1-graphql-is-the-better-rest/).
* Overfetching: a client downloads more information than is actually required in the app. Imagine for example a screen that needs to display a list of users only with their names. In a REST API, this app would usually hit the `/users` endpoint and receive a JSON array with user data. This response however might contain more info about the users that are returned, e.g. their birthdays or addresses - information that is useless for the client because it only needs to display the users’ names (https://www.howtographql.com/basics/1-graphql-is-the-better-rest/).
* Underfetching: Another issue is *underfetching* and the *n+1*-requests problem. Underfetching generally means that a specific endpoint doesn’t provide enough of the required information. The client will have to make additional requests to fetch everything it needs. This can escalate to a situation where a client needs to first download a list of elements, but then needs to make one additional request per element to fetch the required data. As an example, consider the same app would also need to display the last three followers per user. The API provides the additional endpoint `/users/<user-id>/followers`. In order to be able to display the required information, the app will have to make one request to the `/users` endpoint and then hit the `/users/<user-id>/followers` endpoint for *each* user.



#### REST API vs. GraphQL

* With a REST API, you would typically gather the data by accessing multiple endpoints. By contrast, in GraphQL you'd simply send a single query to the GraphQL server that includes the concrete data requirements (https://www.howtographql.com/basics/1-graphql-is-the-better-rest/). REST APIs have multiple endpoints, whereas GraphQL APIs have just a single endpoint (https://www.youtube.com/watch?v=PeAOEAmR0D0).
* JSON data is typically exchanged in both APIs (https://www.youtube.com/watch?v=PeAOEAmR0D0).
* For both, any server-side language can be used and any frontend framework can be used (https://www.youtube.com/watch?v=PeAOEAmR0D0).
* Both are stateless (https://www.youtube.com/watch?v=PeAOEAmR0D0).
* GraphQL emples a client-driven architecture as opposed to a server-driven architecture for REST (https://www.altexsoft.com/blog/engineering/graphql-core-features-architecture-pros-and-cons/).
* GraphQL is organized in terms of a schema and type system; REST is organized in terms of endpoints (https://www.altexsoft.com/blog/engineering/graphql-core-features-architecture-pros-and-cons/).
* GraphQL's operations include Query, Mutation, and Subscription; REST's operations include Create, Read, Update, and Delete (https://www.altexsoft.com/blog/engineering/graphql-core-features-architecture-pros-and-cons/).
* GraphQL fetches data with a single API call; REST fetches fixed data with multiple API calls (https://www.altexsoft.com/blog/engineering/graphql-core-features-architecture-pros-and-cons/).
* GraphQL is fast while the multiple network calls of REST consumes more time (https://www.altexsoft.com/blog/engineering/graphql-core-features-architecture-pros-and-cons/).
* The learning curve is more difficult for GraphQL (https://www.altexsoft.com/blog/engineering/graphql-core-features-architecture-pros-and-cons/).
* GraphQL uses automatic validation and type checking, but REST may be a better choice for complex queries (https://www.altexsoft.com/blog/engineering/graphql-core-features-architecture-pros-and-cons/).