#a = 15
#b = 3

#print(a + b) # 15
#print(a % b)
#print(a // b)

#print(a + b / 3 - 4 * 12)

#parrot = "Blue"
#
#print(parrot * 3)

#days = "Mon, Tue, Wed, Thu, Fri, Sat, Sun"
#print(days[::5])
#print(days[1:5])
#print(days[0:-1:5])
#print(days[:-1:5])

#for i in range(0,12):
#	print("# {} -> square -> {}".format(i, i ** 2))
#	print("*" * 80)

#x = 7
#y = 7
#
#if x > y:
#    print("x is greater than y")
#elif x < y:
#    print("x is smaller than y")
#else:
#    print("x equals y")

#age = int(input("How old are you? "))
#
#if age >= 16 and age <= 65:
#	print("Have a good day at work!")


#parrot = "Norwegian Blue"

#letter = input("Enter a character: ")
#
#if letter in parrot:
#	print("{} is in {}".format(letter, parrot))
#else:
#	print("I don't need that letter")

#parrot ="andvsilva"
#
#i = 1
#for character in parrot:
#	print(f" " * i + character)
#	i = i + 1

#quote = """
#Alright, but apart from the Sanitation, the Medicine, Education, Wine,
#Public Order, Irrigation, Roads, the Fresh-Water System,
#and Public Health, what have the Romans ever done for us?
#"""
# 
#for letter in quote:
#    if letter.isupper():
#        print(letter)


#for i in range(1, 20):
#	print("i is now {}".format(i))

#for number in range(0,101):
#	if((number % 7) == 0):
#		print(f"number: {number} is divisible by 7")

#i = 0
#
#while i < 10:
#	print("i is now {}".format(i))
#	i += 1

#for i in range(0, 100, 7):
#    print(i)
#    if( (i % 11) == 0 and i != 0 ):
#        break

#for number in range(0, 21):
#    if(number % 3 != 0 and number % 5 != 0):
#        print(f"{number} is not divisible by 3 or 5.")

# using continue
#for x in range(21):
#    if x % 3 == 0 or x % 5 == 0:
#        continue
#    print(x)

#import random

#highest = 10
#answer = random.randint(1, highest)
#print(answer)   # TODO: Remove after testing

#guess = None

#while guess != answer:
#	pass
#	print("Please guess number between 1 and {}: ".format(highest))
#	guess = int(input())
#
#	if guess == answer:
#	    print("You got it first time")
#	else:
#	    if guess < answer:
#	        print("Please guess higher")
#	    else:   # guess must be greater than answer
#	        print("Please guess lower")
#	    guess = int(input())
#	    if guess == answer:
#	        print("Well done, you guessed it")
#	    else:
#	        print("Sorry, you have not guessed correctly")


#low = 1
#high = 1000

#print("Please think of a number between {} and {}".format(low, high))
#input("Press ENTER to start")
#
#guesses = 1
#while True:
#    print("\tGuessing in the range of {} to {}".format(low, high))
#    guess = low + (high - low) // 2
#    high_low = input("My guess is {}. Should I guess higher or lower? "
#                     "Enter h or l, or c if my guess was correct "
#                     .format(guess)).casefold()
#
#    if high_low == "h":
#        # Guess higher. The low end of the range becomes 1 greater than the guess.
#        low = guess + 1
#    elif high_low == "l":
#        # Guess lower. The high end of the range becomes one less than the guess.
#        high = guess - 1
#    elif high_low == "c":
#        print("I got it in {} guesses!".format(guesses))
#        break
#    else:
#        print("Please enter h, l or c")
#
#    guesses = guesses + 1


#number = 5
#multiplier = 8
#answer = 0
# 
# add your loop after this comment
#for i in range(multiplier):
#    answer += number
#
#print(answer)

#######

#print("Please choose your option from the list below:")
#print("1:\tLearn Python")
#print("2:\tLearn Java")
#print("3:\tGo swimming")
#print("4:\tHave dinner")
#print("5:\tGo to bed")
#print("0:\tExit")

#while True:
#    choice = input()
#
#    if choice == "0":
#        break
#    elif choice in "12345":
#        print("You chose {}".format(choice))


#########
#value = 8
#answer = 0
# 
#for x in range(1, 13):
#    answer = value * x
#
#    print("{0} times {1} is {2}".format(x, value, answer))

#asteroids = [9617, 9618, 9619, 9620, 9621, 9622, 13681]
#
#for asteroid in asteroids:
#    if asteroid == 9617:
#        print("Grahamchapman")
#    elif asteroid == 9618:
#        print("Johncleese")
#    elif asteroid == 9619:
#        print("Terrygilliam")
#        break
#    elif asteroid == 9620:
#        print("Ericidle")
#    elif asteroid == 9621:
#        print("Michaelpalin")
#    else:
#        print("Terryjones")
#else:
#    print("MontyPython")

#choice = None
# 
#while choice != '0':
#    choice = input("Please enter your choice.  Press enter to quit")
#    if choice == '':
#        break
# 
#    print("You have selected {}".format(choice))
#else:
#    print("Thank you for playing, please call back soon.")

#computer_parts = ["computer",
#                  "monitor",
#                  "keyboard",
#                  "mouse",
#                  "mouse mat"
#                  ]
#
#for part in computer_parts:
#    print(part)
#
#print()
#print(computer_parts[2])
#
#print(computer_parts[0:3])
#print(computer_parts[-1])

#print("ahha".count("h"))

# list of books to read 
#books = ['A',
#         'B',
#         'C',
#        'D']

# loop and enumerate books
#for number, book in enumerate(books):
#    print(f'#{number} book: {book}')

#valid_choices = [str(i) for i in range(0, len(books))]
#print(valid_choices)

#import snoop
#
#data = [
#    "Andromeda - Shrub",
#    "Bellflower - Flower",
#    "China Pink - Flower",
#    "Daffodil - Flower",
#    "Evening Primrose - Flower",
#    "French Marigold - Flower",
#    "Hydrangea - Shrub",
#    "Iris - Flower",
#    "Japanese Camellia - Shrub",
#    "Lavender - Shrub",
#    "Lilac - Shrub",
#    "Magnolia - Shrub",
#    "Peony - Shrub",
#    "Queen Anne's Lace - Flower",
#    "Red Hot Poker - Flower",
#    "Snapdragon - Flower",
#    "Sunflower - Flower",
#    "Tiger Lily - Flower",
#    "Witch Hazel - Shrub",
#]
#
#flowers = []
#shrubs = []
#
#@snoop
#def main():
#    for item in data:
#        if "Flower" in item:
#            flowers.append(item)
#        else:
#            shrubs.append(item)
#
#    for flower in flowers:
#        print(f'{flower},')
#
#    print('***********************')
#
#    for shrub in shrubs:
#        print(f'{shrub},')
#
#
#if __name__ == '__main__':
#    main()

empty_list = []

even = [2, 4, 6, 8]
odd = [1, 3, 5, 7, 9]

numbers = [even, odd]

for number in numbers:
    for item in number:
        print(item)