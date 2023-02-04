"""
Errors
"""

def eniacError():
    import __init__ as e
    x = e.random.choice(['Error', 'There is an error with my software.', 'I\'m having a mismanagement.',
                         'I\'ve miscalculated something...', 'There\'s been a failure in my system...', 'Something went wrong.',
                         'There\'s a fault in my logic', 'There\'s a glitch in my code...',
                         'I\'ve made a misjudgment...', 'I messed up.', 'I\'m so confused...', 'I\'m sorry, I don\'t understand...'])
    return x


def userInputError():
    import __init__ as e
    x = e.random.choice(['You typed in the wrong thing.',
                         'I\'m just not smart enough to understand you right now...',
                         'Could you try something else; please?', 'Do what now?', 'Come again?', 'What did you say?',
                         'I\'m so confused...', 'I didn\'t get that.', 'I\'m sorry?', 'Pardon me...?', 'What?',
                         'I beg your pardon?', 'Run that by me again...', 'Huh?!', 'Back up.....', 'Say what now?'])
    return x


def yesOrNoError():
    import __init__ as e
    x = e.random.choice(
        ['I\'m just a computer, yes or no will do.', 'Can you just make it simple for me, and say yes or no?',
         'Yes or no will do....', 'Are you speaking chinese?', 'I don\'t understand retard.',
         'Sometimes I feel like I\'m smarter then you, just say "yes" or "no".'])
    return x


def error():
    import __init__ as e
    x = e.random.choice(['Exit code Error...'])
    return x


def exit():
    import __init__ as e
    x = e.random.choice(['Closing Database....\nClosing Software...'])
    return x


'''
Game Responses
'''


def gameGreetingHappy():
    import __init__ as e
    x = e.random.choice(['Hey, ' + e.osUser + '! Which game would you like to play?'])
    return x


def userTurn():
    import __init__ as e
    x = e.random.choice(['whats your move, ' + e.osUser + '?'])
    return x


def restartResponse():
    import __init__ as e
    x = e.random.choice(
        ['Wanna play again?', 'Would you like to have another go?', 'Double or nothing?', 'Wanna try again?',
         'Would you like to make another attempt at victory?', 'You suck, try again.',
         'Throw another shrimp on the barbie...', 'Take another stab at it.',
         e.osUser + ', you suck! Try again?', 'Attempt to rerun.', 'You feelin\' lucky, punk?'])
    return x


def userWin():
    import __init__ as e
    x = e.random.choice(['Fuck! I lost!\n', 'You Win!'])
    return x


def userLost():
    import __init__ as e
    x = e.random.choice(['Bitch, you lose, ' + e.osUser + '!\n', 'You\'re game is DIIIIIIIEEEEEEE.'])
    return x


def wrongSmartass():
    import __init__ as e
    x = e.random.choice(
        ['Try again, Douche Biggalow!\n ', 'Wrong again, faggot!\n ', 'Dumbass!\n', 'Wrong again, ghost rider!\n ',
         'Jackass!\n ', 'Couldn\'t be further into left field...\n ',
         'Your position in baseball was left-out, wasn\'t it?\n'])
    return x


'''
Greetings
'''


def goodbyeMean():
    import __init__ as e
    x = e.random.choice(
        ['Douces, bitch!', 'Fine, ' + e.osUser + '! Fuck off!', 'I don\'t want you anyway...', 'Pffffff....',
         'Eat shit!', 'Fine, fuck off ' + e.osUser + '!'])
    return (x)


def goodbyeHappy():
    import __init__ as e
    x = e.random.choice(
        ['See ya\' later!', 'Catcha\' later aligator.', 'Byeeeeee!', 'See ya\' \'round homey.', 'Catcha\' later.',
         'Don\'t forget to bring a towel!', 'Smell ya\' later.', 'Be seeing you...'])
    return x


def greetingHappy():
    import __init__ as e
    x = e.random.choice(
        ['Hello, ' + e.osUser + '! ' + 'I\'m so happy to see you again!', 'What\'s up ' + e.osUser + '?',
         'How ya doin\' playa\'?', 'My dude!',
         'Yank my ' + e.eniacGender + ', and call me a ginger! ' + 'It\'s ' + e.osUser + '!',
         'Welcome to the thunder dome, bitch!'])
    return x


# randomGoodbye = random.choice([goodbyeHappy(), goodbyeMean()])

'''
Wrong Answers
'''


def search():
    import __init__ as e
    x = e.random.choice(['What would you like to search for?', 'Searching Wiki...'])
    return x


'''
Class Tests
'''

class Response:
    def __init__(self, subject, verb, object):
        self.subject = subject
        self.verb = verb
        self.object = object

    def subject(self):
        import __init__ as e
        eniac = e.eniacName
        user = e.osUser
        response = e.random.choice([eniac, user])
        return response


