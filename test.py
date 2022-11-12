#assign values to variables
age = 20
first_name = "Vincent"
patient = False
a = [1, 2, 3, 4]
b = a.copy                      #assigns the values in a to b but doesn't reflect any update/change made in a to b

#working with list and list comprehensions (can be used to generate lists. can be used with filters, functions and can be nested together with other lists too ) 

string = 'I am a very  big guy'         #this is a variable not ist
jest = [1, 2, 3, 4, 5]
fork = ['I am a very kind man but I do not try hard to prove it to anybody']
print(fork[:19])                #prints the first 19 characters from the fork variable
print(fork[27:])                #prints the last characters from index 27 in the fork variable
print(fork[0:8:2])              #prints from the first character to the 7 character with a jump or step of 2(that is skipping one character next after each character selection)
print(fork[::2])                #prints from begining till the end in ascending order, with a jump of two
print(fork[::-2])               #prints from begining till the end in descending order, with a jump of two
[2*var for var in jest]
print(filtered = [var for var in jest if var % 2 == 0])       #using it together with FOR bracket
string.split()                  #splits the string at every character occurrence with comma
string.split('.')                 #splits the string whereever there is a fullstop with comma

#working with dictionary and dictionary comprehensions (can be used to generate dictionaries)

mydict = [('a', 'aardvark'), ('b', 'bear'), ('c', 'cat'), ('d', 'dog')]
mydict = {var[0] : var[1] for var in mydict}            #gets the different element in mydict as there are no conditions
print(mydict)
mydict.items()
list(mydict.items())
[{'letter' : key, 'name' : value} for key, value in mydict.items()]   #assigns the keys and values in the dictionary to the 'letter' and , metric 'name' string and make each value to be in different format


#working with sets; uses {}, order of sequence doesn't matter, doesn't allow index search(subscriptable) and only contains unique values

fork = set((1, 2, 3, 3, 2, 1, 4))     #use the set function to change a list to a set
fork = list(set[1, 2, 3, 4, 4, 2])    #this de-duplicates a list and converts it back to a list
myset = {2, 3, 4, 5}
myset.discard(2)                      #this takes away a specific element from the set variable

#working with tuples; either uses () or not, has order of sequence, is immutable and allows index search(subscriptable)

mytuple = (1, 2, 3, 4, 5)

#working with dictionaries; uses {}, is immutable

animals = {'a' : 'vincent',         #the left side of the colon are the dictionary keys which are iterable, immutable and can be converted to a list
            'b' : 'paul',           #the right side of the colon are the dictionary values which are subscriptable by the keys and can be in a list form
            'c' : 'zobby',          #you can find items or add items using dictionary keys
            }
animals.keys                        #to get the list of all dictionary keys
animals.values                      #to get the list of all the dictionary values
animals['d'] = 'BigMan'             #this creates a new key/value to the dictionary
print(animals.get['f'])               #to find the value associated with the assigned key or return NONE if null


print(f'My number is: {5} and twice that is: {2*5}')        #using formatting f in strings
print(''' In life, my greatest desire is to make Heaven at last
    but before then, I would want to make much money and give my family a soft landing through life situations
        and largely help as many are going through my current situation of hopefulness''')
#use input_fx to call out an operation
name = input('What is your name?')
print("Hello" + name)

#use define to roll an operation
def multiply(var1, var2):
    return var1 * var2
print(multiply(2, 3))

#to convert from one data type to another
int()
str()
bool()
float()

type('type in anything')      #this shows the data type of the input

#to convert a value from a base number to base 10

int('value', "the value's base number")



birth_year = input("When were you born? ")
age = 2022 - int(birth_year)
print(age)

First = input("first_number: ")
Second = input("second_number: ")
Sum = float(First) + int(Second)
print("Sum:" + str(Sum))

# working with strings, methods

course = 'My name is Uzochukwu Onwuegbu Vincent'
print(course)
print(course.find('n'))
print(course.capitalize())
print(course.replace('name','full_name'))
print('name' in course)

# working with arithmetic operators, augmented operator, arithmetor precedence

x = 10
x = x + 3
x += 3
v = (10 - 3) * 2

# working with comparison operators

x = 3==2
v = 3 > 2
k = 3 < 2
l = 3 >= 2
y = 3 != 2

# working with logical operators; and, or, not

ashawo = ['party', 'money', 'sex']
'Christ' not in ashawo                      #this will return true because there is no Christ in ashawo
price = 20
print(price > 20 and price < 10)
print(price > 20 or price < 10)
print(not price > 20)

# working with IF, ELSEIF(ELIF) statements

temp = 30
if temp < 35:
    print("temperature is hot")
    print("please drink enough water")
elif temp > 20:
    print("temperature is too cold")
    print("please wear cardigan")
else:
    print("it's a moderate day")

for n in range(1, 100):
    if n % 15 == 0:
        print('Fizz')
    elif n % 5 == 0:
        print('Buzz')
    elif n % 3 == 0:
        print('Fizz')

# EXERCISE

weight = int(input("what is your weight? "))
unit = input("(K)g or (L)bs: ")
if unit == "K":
    converted = weight / 0.45
    print('my weight is ' + str(converted) + 'bs')
else:
    converted = weight * 0.45
    print('my weight is ' + str(converted) + 'g')

# working with lists and lists methods

names = ["James", "Peter", "John"]
print(names)
names[0] = "Sam"      #to replace an element in the list
print(names[0:3])     #to show the first three elements in the lists
numbers = [1, 2, 3, 4, 5]
numbers.append(6)            #to add the number 6 to the list
print(numbers.insert(0, "bn"))          #to add the string (bn) to a specific (first) position in the list using the index number
numbers.remove(3)                 #to remove the number 3 from the list of numbers
numbers.clear()                   #to clear all the numbers in the list
print(10 in numbers)              #to see if the number 10 is present in the list

# working with WHILE Loop for iteration or repeating code blocks or process multiple times till a condition is met

variable = 0
while variable < 50:            #print a variable for each row iteration, incrementally by 5 from 0 till less than 50
    print(variable)
    variable = variable + 5

from datetime import datetime
wait_until = datetime.now().second + 2      

while datetime.now().second != wait_until:      #WHILE loop with pass statement to skip a step
    pass

print(f'we are at {wait_until} seconds')

while True:
    if datetime.now().second == wait_until:
        print(f'we are at {wait_until} seconds')
        break                                       #breaks out only the first WHILE loop and executes the loop

while True:
    while datetime.now().second == wait_until:
            print(f'we are at {wait_until} seconds')
            break 

while True:                                         #continue is used in an if statement, prevent the code from executing if a statement condition is met
    if datetime.now().second < wait_until:
        continue
    break

print(f'we are at {wait_until} seconds') 
 
# working with FOR Loops for iteration or access each element in a list individually

numbers = [1, 2, 3, 4, 5]
for variable in numbers:
    print(variable)

animallookup = {
    'a' : ['aardvark', 'antelope'],
    'b' : ['bear'],
    'c' : ['cat'],
    'd' : ['dog']
}

for letter, animals in animallookup.items():
    pass                                                #skip a for loop 

for letter, animals in animallookup.items():            #skips rest of iteration
    if len(animals) > 1:
        continue
    print(f'Only one animal: {animals[0]}')

for letter, animals in animallookup.items():            #stops iteration when the condition is met
    if len(animals) > 1:
        print(f'Found {len(animals)}: {animals}')
        break

# working with a range

for variable in range(30, 100, 10):
    print(variable)                      #iterate a sequence of numbers from 30 with numbers increasing by 10 but excluding the last number 100

# working with tuples (an immutable or unchangeable list), sets, or dictionaries.

numbers = (1, 2, 3, 4, 5)    #this is a tuple

my_set = {9, 2, 3, 8, 4, 9}
print(my_set)
my_dictionary = {'Uzochukwu':'my Igbo name',
                'Vincent':'my English name which means Conqueror',
                'Onwuegbu':'my surname'}
print(my_dictionary['Vincent'])

#Working with Class



#Opening, reading and writing files

file = open('file path', 'r')
f = open ('10_01_2021', 'w')
file.close

import csv 
