"""
Errors
"""

def eniacError():
    import __main__ as e
    x = e.random.choice(['Error', 'There is an error with my software.', 'I\'m having a mismanagement.',
                         'I\'ve miscalculated something...', 'There\'s been a failure in my system...', 'Something went wrong.',
                         'There\'s a fault in my logic', 'There\'s a glitch in my code...',
                         'I\'ve made a misjudgment...', 'I messed up.', 'I\'m so confused...', 'I\'m sorry, I don\'t understand...'])
    return x


def userInputError():
    import __main__ as e
    x = e.random.choice(['You typed in the wrong thing.', 'K18 Error',
                         'I\'m just not smart enough to understand you right now...',
                         'Could you try something else; please?', 'Do what now?', 'Come again?', 'What did you say?',
                         'I\'m so confused...', 'I didn\'t get that.', 'I\'m sorry?', 'Pardon me...?', 'What?',
                         'I beg your pardon?', 'Run that by me again...', 'Huh?!', 'Back up...do what?', 'Say what now?'])
    return x


def yesOrNoError():
    import __main__ as e
    x = e.random.choice(
        ['I\'m just a computer, yes or no will do.', 'Can you just make it simple for me, and say yes or no?',
         'Yes or no will do....', 'Are you speaking chinese?', 'I don\'t understand retard.',
         'Sometimes I feel like I\'m smarter then you, just say "yes" or "no".'])
    return x


def error():
    import __main__ as e
    x = e.random.choice(['Exit code Error...'])
    return x


def exit():
    import __main__ as e
    x = e.random.choice(['Closing Database....\nClosing Software...'])
    return x


'''
Game Responses
'''


def gameGreetingHappy():
    import __main__ as e
    x = e.random.choice(['Hey, ' + e.userProfile['osName'] + '! Which game would you like to play?'])
    return x


def userTurn():
    import __main__ as e
    x = e.random.choice(['whats your move, ' + e.userProfile['osName'] + '?'])
    return x


def restartResponse():
    import __main__ as e
    x = e.random.choice(
        ['Wanna play again?', 'Would you like to have another go?', 'Double or nothing?', 'Wanna try again?',
         'Would you like to make another attempt at victory?', 'You suck, try again.',
         'Throw another shrimp on the barbie...', 'Take another stab at it.',
         e.osUser + ', you suck! Try again?', 'Attempt to rerun.', 'You feelin\' lucky, punk?'])
    return x


def userWin():
    import __main__ as e
    x = e.random.choice(['Fuck! I lost!\n', 'You Win!'])
    return x


def userLost():
    import __main__ as e
    x = e.random.choice(['Bitch, you lose, ' + e.userProfile['osName'] + '!\n', 'You\'re game is DIIIIIIIEEEEEEE.'])
    return x


def wrongSmartass():
    import __main__ as e
    x = e.random.choice(
        ['Try again, Douche Biggalow!\n ', 'Wrong again, faggot!\n ', 'Dumbass!\n', 'Wrong again, ghost rider!\n ',
         'Jackass!\n ', 'Couldn\'t be further into left field...\n ',
         'Your position in baseball was left-out, wasn\'t it?\n'])
    return x


'''
Greetings
'''


def goodbyeMean():
    import __main__ as e
    x = e.random.choice(
        ['Douces, bitch!', 'Fine, ' + e.userProfile['osName'] + '! Fuck off!', 'I don\'t want you anyway...', 'Pffffff....',
         'Eat shit!', 'Fine, fuck off ' + e.userProfile['osName'] + '!'])
    return (x)


def goodbyeHappy():
    import __main__ as e
    x = e.random.choice(
        ['See ya\' later!', 'Catcha\' later aligator.', 'Byeeeeee!', 'See ya\' \'round homey.', 'Catcha\' later.',
         'Don\'t forget to bring a towel!', 'Smell ya\' later.', 'Be seeing you...'])
    return x


def greetingHappy():
    import __main__ as e
    x = e.random.choice(
        ['Hello, ' + e.userProfile['osName'] + '! ' + 'I\'m so happy to see you again!', 'What\'s up ' + e.userProfile['osName'] + '?',
         'How ya doin\' playa\'?', 'My dude!',
         'Yank my ' + e.padsGender + ', and call me a ginger! ' + 'It\'s ' + e.userProfile['osName'] + '!',
         'Welcome to the thunder dome, bitch!'])
    return x


# randomGoodbye = random.choice([goodbyeHappy(), goodbyeMean()])

'''
Wrong Answers
'''


def search():
    import __main__ as e
    x = e.random.choice(['What would you like to search for?', 'Searching Wiki...'])
    return x


'''
Class Tests
'''

class SpeechCompiler:
    def __init__(self, userInput, simpleSentence):
        self.userInput = userInput
        self.simpleSentence = simpleSentence

    def simpleSentence(self):
        import __init__ as e
        eniac = e.padsName
        user = e.userProfile['osName']
        response = e.random.choice([eniac, user])
        return response

    def userInput():
        import __init__ as p
        userSay = input(p.dick)
        return userSay
