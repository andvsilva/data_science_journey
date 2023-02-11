## dictionary

#d = {'A': 1, 'B': 2, 'C': 3, 'D': 4, 'E': 5, 'F': 6}

#for key in d:
#    print(key, d[key], sep=", ")
    
#for key, value in d.items():
#    print(key, value, sep=", ")
    

#available_parts = {"1": "computer",
#                   "2": "monitor",
#                   "3": "keyboard",
#                   "4": "mouse",
#                   "5": "hdmi cable",
#                   "6": "dvd drive",
#                   }
# 
#current_choice = None
#computer_parts = []  # create an empty list
# 
#while current_choice != "0":
#    if current_choice in available_parts:
#        chosen_part = available_parts[current_choice]
#        if chosen_part in computer_parts:
#            # it's already in, so remove it
#            print(f"Removing {chosen_part}")
#            computer_parts.remove(chosen_part)
#        else:
#            print(f"Adding {chosen_part}")
#            computer_parts.append(chosen_part)
#        print(f"Your list now contains: {computer_parts}")
#    else:
#        print("Please add options from the list:")
#        for key, value in available_parts.items():
#            print(f"{key}: {value}")
#        print("0: to finish")
# 
#    current_choice = input("> ")
#
#
## We need an empty dictionary, to store and display the letter frequencies.
#word_count = {}
# 
## Text string
#text = "Later in the course, you'll see how to use the collections Counter class."
# 
## Iterate over every character in the string.
#for char in text.casefold():
#    # We're only counting letters and digits (no punctuation).
#    if char.isalnum():
#        word_count[char] = word_count.setdefault(char, 0) + 1
# 
## Printing the dictionary
#for letter, count in sorted(word_count.items()):
#    print(letter, count)
from icecream import ic

#d = {1: 'A', 2: 'B', 3: 'C', 4: 'D', 5: 'E', 6: 'F'}
#
#for key, value in d.items():
#    ic(key, value)
#    
#d1 = {7: 'G', 8: 'H', 9: 'I', 10: 'J'}
#
#d.update(d1)
#
#for key, value in d.items():
#    ic(key, value)

data = [
    ("orange", "a sweet, orange, citrus fruit"),
    ("apple", "good for making cider"),
    ("lemon", "a sour, yellow citrus fruit"),
    ("grape", "a small, sweet fruit growing in bunches"),
    ("melon", "sweet and juicy"),
]

# print(ord("a"))
# print(ord("b"))
# print(ord("z"))


#def simple_hash(s: str) -> int:
#    """A ridiculously simple hashing function"""
#    basic_hash = ord(s[0])
#    return basic_hash % 10
#
#
#for key, value in data:
#    # h = simple_hash(key)
#    h = hash(key)
#    print(key, h)


#import hashlib

#print(sorted(hashlib.algorithms_guaranteed))
#print(sorted(hashlib.algorithms_available))
#
#pw = "andrevieiradasilva"
#print(pw)
#
#original_hash = hashlib.sha256(pw.encode("utf-8"))
#
#print(f"SHA256: {original_hash.hexdigest()}")

#set_ = sorted(list(set("123456789")))

#print(set_)

#numbers = set()

#from icecream import ic

#ic(numbers, type(numbers))

#numbers.add(1)
#ic(numbers)

#add_numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]


#for add_number in add_numbers:
#    numbers.add(add_number)
    

#ic(numbers)

#file = open('data.txt', 'r')
#
#for line in file:
#    #print(len(line))
#    #print(line.split())
#    print(line.strip())

#file.close()
with open('data.txt', 'r') as file:
    #for line in file:
    #    print(line.rstrip())
    lines = file.readlines()


print(lines)
print(lines[-1:])