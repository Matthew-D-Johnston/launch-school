### Unlucky Days

---

**Problem:**

Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

---

**Examples / Test Cases:**

```ruby
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
```

---

**Data Structure:**

**_Inputs_**

* an integer representation of a given year

**_Ouptus_**

* an integer representing the number of Friday the 13ths in the given year

**_Rules_**

* assume the year is greater than 1752

---

**Algorithm:**

* Initialize the method definition: `def friday_13th(year)`
* Use the `upto` method to cycle through the 12 months, checking for each month of the specified year what day of the week it is for the 13th day of the month. If the day is a friday, then add one to a `fridays` variable.

---

**Code:**

```ruby
def friday_13th(year)
  unlucky = 0
  1.upto(12) { |month| unlucky += 1 if Time.gm(year, month, 13).friday? }
  unlucky
end 
```

---

**Launch School's Solution:**

```ruby
require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end
```

---

**Further Exploration:**

An interesting variation on this problem is to count the number of months that have five Fridays. This one is harder than it sounds since you must account for leap years.

```ruby
def five_fridays(year)
  months_with_five = 0
  month_counter = 1
  1.upto(12) do |month|
    fridays = 0
    1.upto(31) do |day|
      time = Time.gm(year, month, day)
      fridays += 1 if time.month == month_counter && time.friday?
    end
    months_with_five += 1 if fridays == 5
    month_counter += 1
  end
  months_with_five
end  
```

