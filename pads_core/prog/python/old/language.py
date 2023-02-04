import __init__ as e

class Question:
    auxillaryVerb = ['do', 'what', 'why', 'can']
    subject = ['you', 'he', 'i']
    mainVerb = ''

    def __init__(self, enter, auxillaryVerb, subject, mainVerb):
        self.enter = enter
        self.auxillaryVerb = auxillaryVerb
        self.subject = subject
        self.mainVerb = mainVerb

    def yesNo(self):
        print('Yes or No...')
        self.enter = input(e.dick)
        if self.enter == self.auxillaryVerb and self.enter == self.subject:
            print('Caaaaaannnn Do!')
            pass

class Chat:
    def __init__(self, enter,  subject, verb, object):
        self.enter = enter
        self.subject = subject
        self.verb = verb
        self.object = object

    def response(self):
        print('Let\'s talk!')
        self.enter = input(e.dick)
        search = e.re.search('[can you find][a-zA-Z0-9]', self.enter)
        x = e.re.sub('^can you find\s', 'www.', self.enter)
        y = e.re.sub('\s', '', x)
        z = e.re.sub('$', '.com', y)
        if search:
            try:
                print('Sure! Let\'s see...')
                print(e.wikipedia.summary(self.enter, auto_suggest=True))
                return Chat.response(e)
            except:
                print('Searching for', z)
                print(e.webbrowser.open_new_tab(z))
                return Chat.response(e)
            finally:
                print('nope')
                return Chat.response(e)
        else:
            print('I can\'t find that')
            return Chat.response(e)

def chatbot():
    Question.yesNo(Question)
    Chat.response(Chat)

