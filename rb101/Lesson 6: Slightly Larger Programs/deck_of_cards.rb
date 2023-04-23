# deck_of_cards.rb
# Different Data Structure Experiments for the Deck of Cards for the Twenty-One
# Game:

cards_deck = { hearts: [ { '2' => [2] }, { '3' => [3] }, { '4' => [4] },
                         { '5' => [5] }, { '6' => [6] }, { '7' => [7] }, 
                         { '8' => [8] }, { '9' => [9] }, { '10' => [10] },
                         { 'jack' => [10] }, { 'queen' => [10] },
                         { 'king' => [10] }, { 'ace' => [1, 11] }
                        ], 
               diamonds: [ { '2' => [2] }, { '3' => [3] }, { '4' => [4] },
                         { '5' => [5] }, { '6' => [6] }, { '7' => [7] }, 
                         { '8' => [8] }, { '9' => [9] }, { '10' => [10] },
                         { 'jack' => [10] }, { 'queen' => [10] },
                         { 'king' => [10] }, { 'ace' => [1, 11] }
                        ],
               clubs: [ { '2' => [2] }, { '3' => [3] }, { '4' => [4] },
                         { '5' => [5] }, { '6' => [6] }, { '7' => [7] }, 
                         { '8' => [8] }, { '9' => [9] }, { '10' => [10] },
                         { 'jack' => [10] }, { 'queen' => [10] },
                         { 'king' => [10] }, { 'ace' => [1, 11] }
                        ], 
               spades: [ { '2' => [2] }, { '3' => [3] }, { '4' => [4] },
                         { '5' => [5] }, { '6' => [6] }, { '7' => [7] }, 
                         { '8' => [8] }, { '9' => [9] }, { '10' => [10] },
                         { 'jack' => [10] }, { 'queen' => [10] },
                         { 'king' => [10] }, { 'ace' => [1, 11] }
                        ]
              }

card_deck = { '2' => [2, 2, 2, 2], '3' => [3, 3, 3, 3],
         '4' => [4, 4, 4, 4], '5' => [5, 5, 5, 5],
         '6' => [6, 6, 6, 6], '7' => [7, 7, 7, 7],
         '8' => [8, 8, 8, 8], '9' => [9, 9, 9, 9],
         '10' => [10, 10, 10, 10], 'jack' => [10, 10, 10, 10],
         'queen' => [10, 10, 10, 10], 'king' => [10, 10, 10, 10],
         'ace' => [[1, 11], [1, 11], [1, 11], [1, 11]] }

deck = { 2 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         3 => ["3 of Hearts", "3 of Diamonds", "3 of Clubs", "3 of Spades"],
         4 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         5 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         6 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         7 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         8 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         9 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         10 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
          => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         2 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         2 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
         2 => ["2 of Hearts", "2 of Diamonds", "2 of Clubs", "2 of Spades"],
}

card_deck = { '2 of Hearts' => [2, 2, 2, 2], '3 of Hearts' => [3, 3, 3, 3],
         '4 of Hearts' => [4, 4, 4, 4], '5 of Hearts' => [5, 5, 5, 5],
         '6 of Hearts' => [6, 6, 6, 6], '7' => [7, 7, 7, 7],
         '8' => [8, 8, 8, 8], '9' => [9, 9, 9, 9],
         '10' => [10, 10, 10, 10], 'jack' => [10, 10, 10, 10],
         'queen' => [10, 10, 10, 10], 'king' => [10, 10, 10, 10],
         'ace' => [[1, 11], [1, 11], [1, 11], [1, 11]] }