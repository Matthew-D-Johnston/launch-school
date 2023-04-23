## Capstone Day 1 Homework Questions

#### What are the defining characteristics of an Array?

An array ...

* is a list of data elements (pg. 3 of DS&A)
* has a definite _size_ indicating the number of elements it contains (pg. 3 of DS&A)
* uses an _index_ to identify where a specific piece of data is located in the array (pg. 3 of DS&A)

#### What are four operations we typically study for a Data Structure?

1. **Read**: looking something up at a particular spot within the data structure (e.g. look up what value is contained at a particular index inside an array) (pgs. 4 and 5 of DS&A).
2. **Search:** looking for a particular value within a data structure (e.g. looking to see if a particular value exists within an array, and if so, at what index) (pg. 4 of DS&A).
3. **Insert:** adding a new value to our data structure (e.g. adding a new value to an additional slot within an array) (pg. 4 of DS&A).
4. **Delete:** removing a value from our data structure (e.g. removing a value from an array) (pg. 4 of DS&A).

#### What does Big(O) notation measure? What does the "N" represent in the Big(O) notation?

Big(O) notation is used in computer science to measure either the time complexity or space complexity of an algorithm. In terms of time complexity, Big(O) notation measures the number of steps an algorithm takes given a certain number of data elements (pgs. 36-37 of DS&A).  

The number of data elements is represented by "N". Big (O) notation answers the following key question: if there are N data elements, how many steps will the algorithm take? (pgs. 36-37 of DS&A). For space complexity, Big(O) notation provides an answer to the following key question: if there are N data elements, how many units of memory will the algorithm consume? (pg. 387 of DS&A).

But Big(O) notation is about more than just the number of steps an algorithm takes. It is ultimately about how the number of steps increases as the data changes (pg. 38 of DS&A).

#### Does O(1) mean the algorithm completes in one step?

No. O(1) means that the number of steps the algorithm takes is not impacted by N. It means that the algorithm will take a constant number of steps no matter the number of data elements. That means it could take just 1 step or it could take 3 steps. The key, however, is that those number of steps don't change even as the number of data elements changes (pg. 38 of DS&A).

#### What's the English explanation of O(Log N) and O(N Log(N))?

O(Log N) describes an algorithm that takes log N steps given N data elements. The number of steps will be equal to the number of times we must keep dividing N by before we arrive at 1. In other words, "O(log N) means the algorithm takes as many steps as it takes to keep halving the data elements until we remain with 1." (pg. 43 of DS&A).  For O(log n), if the input size (i.e. number of data elements) doubles, the runtime increases by 1 (https://stackoverflow.com/questions/487258/what-is-a-plain-english-explanation-of-big-o-notation).

O(N Log(N)) says that for each of our N data elements we must perform log(N) steps (pgs. 214-216 of DS&A).  

