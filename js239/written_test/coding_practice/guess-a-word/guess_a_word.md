###### JS230 DOM and Asynchronous Programming with JavaScript > Putting it All Together

---

## Project: Guess a Word, Part 1: Core Functions

### Problem

In this project, we're going to make a web-based version of guess a word. Guess a word is a game where you are presented with a series of blank spaces to represent the letters to the word that you need to complete. You guess a letter, and if you guessed a letter that appears in the word, the instances of that letter are revealed. If the guess does not appear in the word, an apple falls from the tree. If you guess incorrectly enough times, there are no more apples left on the tree and the game is over.  

You can [play a game of it here](https://d3905n0khyu9wc.cloudfront.net/guess_a_word/index.html).  

To start with, you will need the HTML and CSS to display the apples, the word, and the guesses already given. Here's [the archive](https://d3905n0khyu9wc.cloudfront.net/guess_a_word/guess-a-word.zip) containing both. Alternatively, if you want to get some practice with writing HTML and CSS, you can create it from scratch following the description in [this gist](https://launchschool.com/gists/fa3cf899). The gist also includes a walkthrough video that you can reference. Take note that the succeeding walkthrough videos in the project uses the completed HTML and CSS that we provide.  

When you have the HTML and CSS, start creating the game functionality. In this part, we'll focus on two pieces of core functionality of the game:

- A function that picks a random word from an array of words. The function has to pick a different word every time it runs, and when it's out of words, it returns `undefined`.
- How to start a new game. We'll need a Game constructor that can be used to create game objects.







---

### Examples / Test Cases

#### The randomWord() Function

We'll need a function `randomWord` that can pick one word out at a time randomly. A picked word can't be picked again, and when all words are taken, return `undefined`. For example:

```javascript
// the words are: 'apple', 'banana', 'orange' and 'pear'

randomWord();     // banana
randomWord();     // pear
randomWord();     // apple
randomWord();     // orange
randomWord();     // undefined
```

Our function has to have access to the words array defined outside of it. With each call of the function, it mutates the array to remove the element it used.  

#### Start a New Game

We need a `Game` constructor that we can use to create a new game object. When we plan out the constructor, we need to examine all the states that a game needs to track.

- The word chosen for the current game.
- Number of incorrect guesses: this controls the number of apples we show.
- All the letters guessed: the letters will show for "Guesses"
- Total allowed wrong guesses: this should be 6, since we only have 6 apples!

A game object, after it's constructed, should be able to do the following:

- It needs to choose a word from the words array as the word of the game. If all words are chosen, show the "Sorry, I've run out of words!" message.
- Number of incorrect guesses should be initialized to 0.
- The letters guessed should be initialized as an empty array.
- Set total allowed wrong guesses to 6.
- Create blanks in the "Word:" container. The number of blanks should be the same as the length of the chosen word.







---

### Data Structure

#### The randomWord() Function

##### Inputs:

* No explicit input.
* But the function depends on the existence of an array of words represented as strings.

##### Outputs:

* a randomly-selected word from the array.
* The output word is represented as a string.

#### Start a New Game

##### Inputs:

* There will be no input to the `Game` constructor function.

##### Outputs:

* The `Game` constructor function will create a new `Game` object.
* The `Game` object will have the following properties:
  * `word`: this will be the chosen word for the current game, selected from an array of words outside of the `Game` object. It will be a `string` and `undefined` if there are no more words in the word list.
  * `incorrectGuesses`: the number of incorrect guesses; should be initialized to `0`. This will be a `number`.
  * `lettersGuessed`: an `array` of all the letters that have been guessed; each letter is a `string`.
  * `totalAllowedGuesses`: this will be the `number` `6`, since there are only six apples.
* The `Game` object should have the following methods:
  * `displayWordBlanks`: given the chosen `word`, this method should display on the page the number of blank spaces that correspond to the number of letters in the word.
  * `letterKeyPressed`: this method will be invoked when the user presses a letter key on the keyboard. It should validate that a letter key was pressed; if it was a letter that has not been selected already, then it should determine if the letter was in the word; if in the word it should display the letter above one of the blanks in the "Word"; if it is not, then it should be added to the "Guesses" along with a blank that it sits above; if the guess was the last availale then, a message should indicate that the player has lost and a "Play another" link should be displayed; if the guess resulted in the last corret letter being selected then a message that indicates that the player has won should be displayed and the "Play another" link should be displayed (this method can be decomposed into some smaller methods).
  * `playAnother`: this method should be the event handler for the `click` event on the "Play another" link. It should reset everything by creating a new `Game`. This means 
* 



---

### Algorithms

#### The randomWord() Function

* We should begin by defining the `words` array that will be oustide of our `randomWord()` function and which will contain all the words for the game.
* Then define the `randomWord()` function:
  * select a random word from the `words` array:
    * Use the following: `Math.floor(Math.random() * words.length)`
  * 
* 





---

### Code

#### The randomWord() Function

```javascript
let words = ['abacus', 'stipend', 'octothorpe', 'proselytize', 'quotient']

function randomWord() {
  let randomIndex = Math.floor(Math.random() * words.length);
  return words.splice(randomIndex, 1).pop();
}
```

#### Start a New Game

```javascript
let Game = function() {
  this.word = randomWord();
  this.incorrectGuesses = 0;
  this.lettersGuessed = [];
  this.totalAllowedGuesses = 6;
}

Game.prototype.displayWordBlanks = function() {
  let spacesDiv = document.getElementById('spaces');

  for (let index = 1; index <= this.word.length; index += 1) {
    let span = document.createElement('span');
    spacesDiv.appendChild(span);
  }
}
```



### New Code Based on LS Recommendations

#### The randomWord() Function

```javascript
let randomWord = (function() {
  let words = ['abacus', 'stipend', 'octothorpe', 'proselytize', 'quotient'];

  return function() {
    let word = words[Math.floor(Math.random() * words.length)];
    words.splice(words.indexOf(word), 1);
    return word;
  }
})();
```

#### Start a New Game

```javascript
```

