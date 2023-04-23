## Consistent Hashing

**Q.** How does ”consistent hashing” (compared to, say, hash(key) % N) reduce the amount of data that needs to be moved when a node joins or leaves the cluster?

**A.** When using simple hasing (hash(key) % N) each key needs to be redistributed based on the change in N. This may lead to every key being redistributed to a completely new server. However, this is not the case with consistent hashing. In the case where a server is removed, only keys that were being stored on that server need to be redistributed. In the case where a server is added, only keys that are within its proximate domain will then be redistributed to it.



