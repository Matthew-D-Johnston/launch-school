Mortgage / Car Loan Calculator
==============================

## Problem
Create a mortgage / car loan calculator in ruby.
Calculate monthly loan payments based on the following inputs:
1. The total loan amount ($XXX.XX);
2. The Annual Percentage Rate (APR; XX.XX%);
3. The loan duration (years).
Thus, the created method will need to contain three parameters: 
`loan_calculator(loan, apr, duration)`

As intermediate steps, use this information to calculate the following:
1. A monthly interest rate (APR/12);
2. Loan duration in months(years * 12).

Formula to be used to calculate monthly payments:
m = p * (j / (1 - (1 + j)**(-n)))
* m = monthly payment
* p = loan amount
* j = monthly interest rate
* n = loan duration in months

## Examples / Test Cases
Inputs:
* Total loan amount = $200,000
* APR = 4.55%
* Loan duration = 20 years

Intermediate Calcluations:
* monthly interest rate = (4.55%)/12 = 0.379167% = 0.00379167
* Loan duration in months = 20 * 12 = 240

Final Calculation and Output:
* Monthly payment: m = p * (j / (1 - (1 + j)**(-n))) = $1,270.70

## Data Structure
Inputs:
1. Total loan amount (p):
* will be a dollar amount; in general will be working to two decimal places.
* originally, input as string; will need to convert to integer or float.
* edge cases: 0, negatives, non-numeric inputs.
2. APR:
* input will be a percentage value, so will need to divide by 100.
* string input will need to be converted to float.
* edge cases: 0, negatives, non-numeric inputs.
3. Loan duration:
* input in years.
* string input will need to be converted to integer.
* edge cases: 0, negatives, non-numeric inputs, decimal values.

Intermediate Outputs:
1. Monthly interest rate (j):
* will already be a float and will have already been in non-percentage terms.
* rounding???
* edge cases: ???
2. Loan duration in months (n):
* will be an integer value.
* edge cases: ???

Final Output:
1. Monthly payment (m):
* float number in dollars, rounded to two decimal places.
* edge cases: ???

## Algorithm
Pseudo-code:
1. Welcome Message:
* print some sort of welcome message to the screen.
* Example: "Welcome to the Mortgage/Car Loan Calculator!"
* perhaps, create a `prompt` method that standardizes how messages are presented to the user (e.g. with '=> Message...').
2. Prompt User for Inputs:
* print message asking for 'total loan amount'.
* print message asking for 'annual percentage rate (APR)'.
* print message asking for 'loan amount in years'. 
3. Get, Convert and Set inputs:
* create loops for each prompt in the case of invalid inputs.
* convert string inputs to integers or floats, depending on specific case. For APR, will need to divide value by 100 for non-percentage value.
* assign inputs to variables: `loan`, `apr`, `duration_y`.
4. Perform Intermediate Calculations:
* calc' monthly interest rate: `mpr` = `apr`/12 .
* calc' monthly duration: `duration_m` = `duration_y` * 12 . 
5. Perform Final Calculation:
* `m` = p * (j / (1 - (1 + j) ** (-n))) 
    = `loan` * (`mpr` / (1 - (1 + `mpr`) ** (-`duration_m`))) .
* make sure it is rounded to two decimal places.
6. Print Result:
* print "Your monthly loan payment is $#{`m`}."
7. Final Message:
* ask user if they would like to do another calculation; if so, loop back to the beginning, demanding for user to re-input the three needed values.
* If user does not want to do another calculation, print some goodbye message.

## Code
Formal Pseudo-code:
1. Define Methods:
* START by defining a `prompt(message)` method for prefacing each method with '=>' .
* SET a `valid_number?` method that checks to make sure the inputs can be propertly converted to meaningful integer or float values.
2. Welcome:
* PRINT open welcome message: "Welcome to the Mortgage / Car Loan Calculator." Use the `prompt` method.
3. Main Loop:
* LOOP: start the main loop.
4. Sub-Loop 1:
* SET `loan` = ''
* LOOP: start first sub-loop.
* PRINT message with `prompt`: "Please enter the loan amount:"
* GET input with `gets()`
* IF `valid_number?`: convert and round (if needed) to nearest integer value; SET as `loan` variable; then `break`. 
* ELSE: `prompt`('Invalid Input: make sure to enter a positive number.').
5. Sub-Loop 2:
* SET `apr` = ''
* LOOP: start first sub-loop.
* PRINT message with `prompt`: "Please enter the annual percentage interest rate (APR):"
* GET input with `gets()`
* IF `valid_number?`: convert and round (2 decimal places) to nearest float value; SET as `apr` variable; then `break`. 
* ELSE: `prompt`('Invalid Input: make sure to enter a positive number.').
6. Sub-Loop 3:
* SET `duration_y` = ''
* LOOP: start first sub-loop.
* PRINT message with `prompt`: "Please enter the loan duration in number of years (fractions of a year will be rounded to nearest full year):"
* GET input with `gets()`
* IF `valid_number?`: convert and round to nearest integer value; SET as `duration_y` variable; then `break`. 
* ELSE: `prompt`('Invalid Input: make sure to enter a positive number.').
7. Intermediate Calculations:
* SET `mpr` = (`apr`/100)/12
* SET `duration_m` = `duration_y` * 12
8. Final Calculations:
* SET `m` = `loan` * (`mpr` / (1 - (1 + `mpr`) ** (-`duration_m`)))
9. Print Result:
PRINT: `prompt`('Your monthly loan payment is #{`m`.round}.')
10. Final Message:
* PRINT: `prompt`('Would you like do another loan calculation? (Y or N)')
* GETS input with `gets()`
* IF 'Y': go back to the start of the main loop and repeat the steps.
* ELSE: `break` and...
* PRINT: prompt('Thank you for using the Mortgage / Car Loan Calculator. Good bye!')
* END





