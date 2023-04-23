## CAP Theorem

#### What is it and why do we need it?

CAP stands for:

* Consistency: every read receives the most recent write or an error.
* Availability: every request receives a (non-error) response, without the guarantee that it contains the most recent write.
* Partition Tolerance: the system continues to operate despite an arbitrary number of messages being dropped (or delayed) by the network between nodes.

The preferred formulation of CAP today is: if there is no network partition, a system can be both consistent and available; when a network partition occurs, a system must choose between either consistency (CP) or availability (AP).

##### Explanation:

No distributed system is safe from network failures, thus network partitioning generally has to be tolerated. In the presence of a partition, one is then left with two options: consistency or [availability](https://en.wikipedia.org/wiki/Availability). When choosing consistency over availability, the system will return an error or a time out if particular information cannot be guaranteed to be up to date due to network partitioning. When choosing availability over consistency, the system will always process the query and try to return the most recent available version of the information, even if it cannot guarantee it is up to date due to network partitioning.

#### Some people criticize CAP theorem; why?

* The terms, *consistency, availability,* and *partition tolerance* have a wide range of ambiguous and mutually incompatible interpretations, which have led to widespread confusion.
* All of the misunderstandings and ambiguity have led some to assert that CAP is no longer an appropriate tool for reasoning about systems and that a better framework is required.