##### Capstone > Week 3 > Day 1

---

## Homework

#### Write up a one page summary on indexes

* What are they?
* Why are they useful?
* What are their advantages and disadvantages?

#### Indexes:

* An index is a copy of selected columns of data from a table that can be searched quickly and efficiently.
* Index is sorted
* Has as many rows as the table (1 row in the index for 1 row in the table itself)
* Indexes and tables are really the same thing—but you can get to the data you need in an index faster and then lookup whatever else you need in the main table knowing exactly where to look.
* Indexes are used to:
  * filter data
  * Sort data
  * Retrieve records
* They help us get to the smallest amount of data the soonest
* Disadvantages:
  * Indexes take up space
  * Adding an index slows down UPDATEs, INSERTs, and DELETEs, because those operations need to be performed on the table and the index.
* Rules:
  1. Any columns involved in queries should be covered by an index (caveat: somteimes it's better to use an index prefix)
  2. Use an OR to return records satisfying one or more of several conditions.
  3. If there's an index over all the fields in your query, you're all set
  4. Avoid redundant data across tables

---

/*

# Questions to Answer about Normalization
1. What is it?
2. What is over-normalization?
3. Pros/cons

--

https://www.bmc.com/blogs/data-normalization/

# What is normalization?

Data normalization is generally considered to be the development of clean data.

Diving deeper, the meaning is twofold:
1. DN... is the organization of data to appear similar across all records and fields.

DN... eliminates unstructured data and redundancy in order to ensure logical data storage.

--

1. Data normalization is the organization of data to appear similar across all records and fields.
  - the structure of the data should be the same for all entries

2. It increases the cohesion of entry types leading to cleansing, lead generation, segmentation, and higher quality data.

The process of splitting up data in this way to remove duplication and improve data integrity is known as *normalization*.

Normalization divides the larger tables into smaller tables and links them using relationships.

Normal forms are used to reduce redundancy:

https://www.freecodecamp.org/news/database-normalization-1nf-2nf-3nf-table-examples/

First normal form:
- no repeating entries in a group
- There must be a primary key (it seems that composite primary key is allowed)

Second normal form:
- only one primary key
- has no partial dependency. The other non primary key column are depndent on the primary key column but can also depend on other non primary key columns (this dependency between the non primary key columns is called transitive dependency)

That is, all non-key attributes are fully dependent on a primary key 

Third normal form:
- data in a table must only be dependent on the primary key.
- no transitive dependency
  - the non primary key values are fully dependent on the primary key column


Over-normalization
- The database is split into too many number of tables which complicates the relationships and the joins required to retrieve data.


# Pros/cons

there are two important things to remember:

- The main advantage for normalization is reduced data redundancy and improved data integrity

- The *mechanism* for carrying out normalization is arranging data in multiple tables and defining relationships between them

- Updates run quickly due to no data being duplicated in multiple locations.
- Inserts run quickly since there is only a single insertion point for a piece of data and no duplication is required.
- frees up storage space by removing duplicates


Cons
- Joining data back together can be complicated and lead to poor performance


https://www.lifewire.com/transitive-dependency-1019760
https://www.guru99.com/database-normalization.html
https://en.wikipedia.org/wiki/Transitive_dependency

Transitive dependency occurred because a non-key attribute (Author) was determining another non-key attribute (Author nationality).
*/

/*

https://launchschool.com/lessons/e752508c/assignments/17c58bc3

Write up a one page summary on indexes
- What are they?
- Why are they useful?
- What are their advantages and disadvantages?

# What are indexes?
- An index is a copy of selected columns of data from a table that can be searched quickly and efficiently.
- index is sorted
- has as many rows as the table
- basically the same as a table, except lookup in an index is faster


# Why are indexes useful?
  - can be used to filter data
     Indexing improves filtering performance because indexing reduces the number of rows that we need to filter
  - can be used to sort data
  - can be used to retrieve data faster(sometimes the index contains all the information you need without having to reference the main table)
  - gives us a way to get to the smallest piece of information the soonest
  - Indexes are best used in cases where sequential reading is inadequate. For example: columns that aid in mapping relationships (such as Foreign Key columns), or columns that are frequently used as part of an ORDER BY clause, are good candidates for indexing.


Disadvantages
- Indexes take up space
- Adding an index slows down UPDATEs, INSERTs, and DELETEs, because those operations need to be performed on the table and the index. i.e., performance cost

*/