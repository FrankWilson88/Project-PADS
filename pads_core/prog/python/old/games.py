# Imports
import __init__ as e
import brain
import response

# Game start menu
def gameStartMenu():
    print(e.response.gameGreetingHappy())
    print(' 0 = Exit\n 1 = Guess The Number\n 2 = Blackjack')
    enter = input(e.dick)
    if enter == '1':
        guessTheNumber()
    elif enter == '2':
        blackjack()
    elif enter == '0':
        print('Exiting Games...')
        brain.menu()
    else:
        print('You can type "exit" to leave')
        gameStartMenu()



rules = '''                    ---BLACKJACK---
--You may enter "Hit", "Stay" 
--You may enter "Restart", or "Exit" at any time.
        '''

def blackjack():
    def restart():
        print(response.restartResponse())
        replay = input(e.dick)
        replayYes = replay == 'y' or replay == 'Y' or replay == 'Yes' or replay == 'yes'
        replayNo = replay == 'n' or replay == 'N' or replay == 'No' or replay == 'no'
        replayRerun = replay != replayYes or replay != replayNo
        if replayYes:
            blackjack()
        elif replayNo:
            print(response.goodbyeHappy())
            if replayNo:
                gameStartMenu()
        elif replayRerun:
            print(response.yesOrNoError())
            if replayRerun:
                restart()

    def replay():
        return blackjack()

    ace = 0
    total = 0
    eniac = e.eniacName + "\'s " + 'Hand: '
    user = e.osUser + '\'s Hand: '
    enterAce = 'You drew an Ace! 1 or 11?\n' + e.dick
    print(rules)
    while total < 21:
        hand = e.random.choice([ace])
        ehand = e.random.choice([11, 1, 2, 3, 4, 5, 7, 8, 9, 10, 10, 10])
        if hand == ace:
            enter = input(enterAce)
            if enter == '1':
                hand = 1
            elif enter == '11':
                hand = 11
            else:
                print(response.userInputError())
        print(user, str(hand))
        print(eniac, str(ehand))
        print(response.userTurn() + '\nHit, or Stay')
        enter = input('1st Turn: ') # 1st turn
        if enter == 'hit' or enter == 'Hit':
            hand1 = e.random.choice([ace, 1, 2, 3, 4, 5, 7, 8, 9, 10, 10, 10])
            ehand1 = e.random.choice([11, 1, 2, 3, 4, 5, 7, 8, 9, 10, 10, 10])
            if hand1 == ace:
                enter = input(enterAce)
                if enter == '1':
                    hand1 = 1
                elif enter == '11':
                    hand1 = 11
                else:
                    print(response.userInputError())
            total = int(hand) + int(hand1)
            etotal = int(ehand) + int(ehand1)
            print('\n' + user + str(hand) + ' + ' + str(hand1))
            print(eniac + str(etotal))
            print('Total: ' + str(total))
            enter = input('2nd Turn: ') #2nd Turn
            if enter == 'hit' or enter == 'Hit':
                hand2 = e.random.choice([ace, 1, 2, 3, 4, 5, 7, 8, 9, 10, 10, 10])
                ehand2 = e.random.choice([11, 1, 2, 3, 4, 5, 7, 8, 9, 10, 10, 10])
                if hand2 == ace:
                    enter = input(enterAce)
                    if enter == '1':
                        hand2 = 1
                    elif enter == '11':
                        hand2 = 11
                    else:
                        print(response.userInputError())
                total = int(hand) + int(hand1) + int(hand2)
                etotal = int(ehand) + int(ehand1) + int(ehand2)
                print('\n' + user + str(hand) + ' + ' + str(hand1) + ' + ' + str(hand2))
                print(eniac + str(etotal))
                print('Total: ' + str(total))
                enter = input('3rd Turn: ')  # 3rd Turn

        elif enter == 'stay' or enter == 'Stay' or total >= 21:  # 1st Turn
            if hand == 21:
                print(response.userWin())
                restart()
            else:
                aiHand = e.random.choice([1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11])
                print(aiHand)
                if aiHand < hand:
                    print(response.userWin())
                    restart()
                else:
                    print(response.userLost())
                    restart()
        elif enter =='restart' or 'Restart':
            replay()
        elif enter == 'exit' or enter == 'Exit':
            gameStartMenu()
        else:
            response.eniacError()
        total = total
    else:
        print(response.userInputError())
'''
    while total < 21:
        hand = random.choice([ace, 1, 2, 3, 4, 5, 7, 8, 9, 10, 10, 10])
        print('whats your move, ' + b.profile['name'] + '?')
        if hand == ace:
            enter = raw_input('Is Ace 1 or 11?')
            if enter == '1':
                hand = 1
            elif enter == '11':
                hand = 11
            else:
                print(b.userInputError())
        print('Hit, Stay, or Exit?\nHand: ' + str(hand))
        enter = raw_input('1st Turn: ')
        if enter == 'hit' or enter == 'Hit':  # First turn
            hand1 = random.choice([ace, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10])
            if hand1 == ace:
                enter = raw_input('Is Ace 1 or 11?')
                if enter == '1':
                    hand1 = 1
                elif enter == '11':
                    hand1 = 11
                else:
                    print(b.userInputError())
            total = int(hand) + int(hand1)
            print('Hand: ' + str(hand) + ' + ' + str(hand1))
            print('Total: ' + str(total))
            enter = raw_input('2nd Turn: ')
            if enter == 'hit' or enter == 'Hit' or total <21:  # 2nd Turn
                hand2 = random.choice([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 'ace'])
                if hand2 == ace:
                    enter = raw_input('Is Ace 1 or 11?')
                    if enter == '1':
                        hand2 = 1
                    elif enter == '11':
                        hand2 = 11
                    else:
                        print(b.userInputError())
                total = int(hand) + int(hand1) + int(hand2)
                print('Hand: ' + str(hand) + ' + ' + str(hand1) + ' + ' + str(hand2))
                print('Total: ' + str(total))
                enter = raw_input('3rd Turn: ')
                if enter == 'hit' or enter == 'Hit' or total < 21:  # 3rd Turn
                    hand3 = random.choice([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 'ace'])
                    if hand3 == ace:
                        enter = raw_input('Is Ace 1 or 11?')
                        if enter == '1':
                            hand3 = 1
                        elif enter == '11':
                            hand3 = 11
                        else:
                            print(b.userInputError())
                    total = int(hand) + int(hand1) + int(hand2) + int(hand3)
                    print('Hand: ' + str(hand) + ' + ' + str(hand1) + ' + ' + str(hand2) + ' + ' + str(hand3))
                    print('Total: ' + str(total))
                    enter = raw_input('4th Turn: ')
                    if enter == 'hit' or enter == 'Hit':  # 4th Turn
                        hand4 = random.choice([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 'ace'])
                        if hand4 == ace:
                            enter = raw_input('Is Ace 1 or 11?')
                            if enter == '1':
                                hand4 = 1
                            elif enter == '11':
                                hand4 = 11
                            else:
                                print(b.userInputError())
                        total = int(hand) + int(hand1) + int(hand2) + int(hand3) + int(hand4)
                        print('Hand: ' + str(hand) + ' + ' + str(hand1) + ' + ' + str(hand2) + ' + ' + str(
                            hand3) + ' + ' + str(hand4))
                        print('Total: ' + str(total))
                        enter = raw_input('5th Turn: ')
                        if enter == 'hit' or enter == 'Hit':  # 5th Turn
                            hand5 = random.choice([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 'ace'])
                            if hand5 == ace:
                                enter = raw_input('Is Ace 1 or 11?')
                                if enter == '1':
                                    hand5 = 1
                                elif enter == '11':
                                    hand5 = 11
                                else:
                                    print(b.userInputError())
                            total = int(hand) + int(hand1) + int(hand2) + int(hand3) + int(hand4) + int(hand5)
                            print('Hand: ' + str(hand) + ' + ' + str(hand1) + ' + ' + str(hand2) + ' + ' + str(
                                hand3) + ' + ' + str(hand4) + ' + ' + str(hand5))
                            print('Total: ' + str(total))
                    elif enter == 'stay' or enter == 'Stay' or total >= 21:
                        if total == 21:
                            print(b.userWin())
                            restart()
                        else:
                            print('4')
                            restart()
                elif enter == 'stay' or enter == 'Stay' or total >= 21:  # 3rd Turn
                    if total == 21:
                        print(b.userWin())
                        restart()
                    else:
                        print('3')
                        restart()

        elif enter == 'stay' or enter == 'Stay' or total >= 21:  # 1st Turn
            if hand == 21:
                print(b.userWin())
                restart()
            else:
                aiHand = random.choice([10])
                print(aiHand)
                if aiHand < hand:
                    print(b.userWin())
                    restart()
                else:
                    print(b.userLost())
                    restart()
        elif enter == 'exit' or enter == 'Exit':
            import game_menu
            gameStartMenu()
else:
print(b.userInputError())
        elif enter == 'stay' or enter == 'Stay' or total >= 21:  # 1st Turn
            if hand == 21:
                print(b.userWin())
                restart()
            else:
                aiHand = random.choice([10])
                print(aiHand)
                if aiHand < hand:
                    print(b.userWin())
                    restart()
                else:
                    print(b.userLost())
                    restart()
        elif enter == 'exit' or enter == 'Exit':
            import game_menu
            gameStartMenu()
        else:
            print(b.userInputError())
        total = total
        continue
    else:
        print(b.userLost())
    restart()
'''
# blackjack()


rules = '''                    ---Guess The Number---
--Pick a number between 1-10. If it's correct, you win. 
--You may enter "Restart", or "Exit" at any time.
        '''

def guessTheNumber():
    def replay():
        guessTheNumber()

    def restart():
        print(response.restartResponse())
        replay = input(e.dick)
        replayYes = replay == 'y' or replay == 'Y' or replay == 'Yes' or replay == 'yes'
        replayNo = replay == 'n' or replay == 'N' or replay == 'No' or replay == 'no'
        replayRerun = replay != replayYes or replay != replayNo
        if replayYes:
            guessTheNumber()
        elif replayNo:
            print(response.goodbyeHappy())
            if replayNo:
                gameStartMenu()
        elif replayRerun:
            print(response.yesOrNoError())
            if replayRerun:
                restart()

    print(rules)
    num = e.random.randint(1, 10)
    entry = 1
    while entry < 6:
        print('Guess the Number(1-10): ')
        enter = input(e.dick)

        if enter == 'restart' or enter == 'Restart':
            replay()
        elif enter == 'exit' or enter == 'Exit':
            gameStartMenu()
        elif enter != str(num):
            print(response.wrongSmartass() + str(entry) + '/5\n')
        elif enter == str(num):
            print('Fuck! I lost!\n' + 'The number was: ' + str(num) + '\n')
            restart()
        entry = entry + 1
    else:
        print('Bitch, you lose, ' + e.osUser + '!\nThe number was: ' + str(num) + '\n')
        restart()
# guessTheNumber()