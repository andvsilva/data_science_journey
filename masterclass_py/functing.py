import numbers
import snoop

#@snoop
#def multiply(a, b, c ):
#    a1 = a*2
#    a2 = b*3
#    a3 = round(c*5.2, 4)
#    return 2*a1 + 5*a2 - a3
#
#
#result = multiply(a=3, b=6, c=3)
#print(result)

@snoop
def multiply(x: float, y: float):
    """_summary_
    This function does the multiplication
    of two numbers, x and y. 

    Args:
        x (int or float): number
        y (int or float): number

    Returns:
        _type_: number
    """
    result = x * y
    return result


#@snoop
def is_palindrome(string: str) -> bool:
    """
    Check if a string is a palindrome.
    
    A palindrome is a string that reads the same forwards as backwards.
    
    :param string: The string to check.
    :return True if `string` is a palindrome, False otherwise.
    """
    # backwards = string[::-1]
    # return backwards == string
    return string[::-1].casefold() == string.casefold()


#@snoop
#def palindrome_sentence(sentence):
#    string = ""
#    for char in sentence:
#        if char.isalnum():
#            string += char
#    print(string)
#    return string[::-1].casefold() == string.casefold()
#
#
#word = input("Please enter a word to check: ")
#if palindrome_sentence(word):
#    print("'{}' is a palindrome".format(word))
#else:
#    print("'{}' is not a palindrome".format(word))
#    
#    
#    

#res = multiply(2.5,2.9777)
#
#print("*" * 60)
#print(multiply.__doc__)
#print("*" * 60)

#def finabonacci(n: int ) -> int:
#    """Return the `n`th Fibonacci number, for positive `n`."""
#    if 0 <= n <=1:
#        return n
#    
#    n_minus1, n_minus2 = 1, 0
#    
#    result = None
#    for f in range(n - 1):
#        result = n_minus2 + n_minus1
#        n_minus2 = n_minus1
#        n_minus1 = result
#    
#    return result
#
#
#for i in range(36):
#    print(i, finabonacci(i))
#
#p = is_palindrome()


#def greeting(name: str) -> str:
#    return 'Hello ' + name
#
#
#print(greeting("andvsilva"))
#
#
#def banner_text(text: str = " ", screen_width: int = 80) -> None:
#    """ Print a string centred, with ** either side.
#  
#    :param text: The string to print.
#        An asterisk (*) will result in a row of asterisks.
#        The default will print a blank line, with a ** border at
#        the left and right edges.
#    :param screen_width: The overall width to print within
#        (including the 4 spaces for the ** either side).
#    :raises ValueError: if the supplied string is too long to fit.
#    """
#    if len(text) > screen_width - 4:
#        raise ValueError("String '{0}' is larger than specified width {1}"
#                         .format(text, screen_width))
# 
#    if text == "*":
#        print("*" * screen_width)
#    else:
#        centred_text = text.center(screen_width - 4)
#        output_string = "**{0}**".format(centred_text)
#        print(output_string)
#
#banner_text("*")
#banner_text("Hi, I will start my carreer as Data Scientist today")
#banner_text(" and I am willing to work hard to reach my goals!")
#banner_text("*")


## Some ANSI escape sequences for colours and effects
#BLACK = '\u001b[30m'
#RED = '\u001b[31m'
#GREEN = '\u001b[32m'
#YELLOW = '\u001b[33m'
#BLUE = '\u001b[34m'
#MAGENTA = '\u001b[35m'
#CYAN = '\u001b[36m'
#WHITE = '\u001b[37m'
#RESET = '\u001b[0m'
#
#BOLD = '\u001b[1m'
#UNDERLINE = '\u001b[4m'
#REVERSE = '\u001b[7m'
#
#
#def colour_print(text: str, effect: str) -> None:
#    """
#    Print `text` using the ANSI sequences to change colour, etc
#
#    :param text: The text to print.
#    :param effect: The effect we want.  One of the constants
#        defined at the start of this module.
#    """
#    output_string = "{0}{1}{2}".format(effect, text, RESET)
#    print(output_string)
#
#
#colour_print("Hello, Red", RED)
## test that the colour was reset
#print("This should be in the default terminal colour")
#colour_print("Hello, Blue", BLUE)
#colour_print("Hello, Yellow", YELLOW)
#colour_print("Hello, Bold", BOLD)
#colour_print("Hello, Underline", UNDERLINE)
#colour_print("Hello, Reverse", REVERSE)
#colour_print("Hello, Black", BLACK)


#import snoop
#
#@snoop
#def number_to_bits(number):
#    if number:
#        bits = []
#        while number:
#            number, remainder = divmod(number, 2)
#            bits.insert(0, remainder)
#        return bits
#    else:
#        return [0]

#number_to_bits(6)

#numbers = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
#print(*numbers)

def funcargs(*args):
    for arg in args:
        print(arg)
    
funcargs(1, 2, 3, 4, 5, 6, 7, 8, 9)
