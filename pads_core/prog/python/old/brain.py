import __init__ as e


def menu():
    print(e.response.greetingHappy())
    info = '''Menu:
    0 = Exit
    1 = Game Menu
    2 = Wikipedia Search
    3 = Web Search
    4 = Accounting Software(not working)
    5 = Chat(WIP)
    9 = Software Info'''
    print(' Today: ', e.today, '\n', info)
    enter = input(e.dick)
    if enter == '1':
        import games as g
        g.gameStartMenu()
    elif enter == '2':
        Search().wiki()
    elif enter == '3':
        Search().web()
    elif enter == '4':
        pass
    elif enter == '5':
        import language as l
        l.chatbot()
        pass
    elif enter == '9':
        print(e.copyright, '\n', e.license)
        print('Eniac: ', e.eniacProfile)
        menu()
    elif enter == '0':
        print('Fine! Fuck off!\n')
        pass
    else:
        print('Pick a number jackass!')
        menu()


class Search:
    def __init__(self, greeting='hello', menu='0 = Menu', response='Done!', exit='Exiting to Menu...'):
        self.greeting = greeting
        self.menu = menu
        self.response = response
        self.exit = exit

    def wiki(self):
        print(self.greeting, self.menu)
        search = input('Wiki Search: ')
        if search == '0':
            print(self.exit)
            menu()
        else:
            print('Searching...')
            print(e.wikipedia.summary(search), '\nLoading Summary...')
            print(e.wikipedia.search(search), '\n', self.response)
            return Search().wiki()

    def web(self):
        print(self.greeting, self.menu, '1 = Spotify')
        search = input('Web Search: ')
        if search == '0':
            print('Exiting to Menu...')
            menu()
        elif search == '1':
            e.webbrowser.open_new_tab('https://open.spotify.com/#_=_')
            return Search().web()
        else:
            print('Loading Browser...')
            print(e.webbrowser.open_new_tab(search), self.response)
            return Search().web()


def ai():
    print('logged out')
    pass
