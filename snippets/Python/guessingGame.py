##############################################################################################
#
# Author: David Kirwan
# Website: https://about.me
#
# Simple Guessing Game coded in Python
#
##############################################################################################
# Imports

from random import randint

print('Guessing Game v0.0.1' + '\nYou have 3 guesses')
found = False
theNum = randint(0,9)
guessCount = 3


def guessingGame(myGuess):
    diff = theDiff(theNum, myGuess)
    
    if myGuess == theNum:
        print('yes!')
        global found
        found = True
    elif myGuess < 0:
        print('The number you entered was negative!')
    elif diff <= 2:
        global guessCount
        guessCount -= 1
        print('Close!')
    else:
        global guessCount
        guessCount -= 1
        print('not even close!')

def theDiff(n, guess):
    return abs(n - guess)


while found is False and guessCount > 0:

    print('Enter a guess between 0 and 9')
    n = int(raw_input())
    guessingGame(n)
        
print('\n\nSorry you failed rather miserably!')        
