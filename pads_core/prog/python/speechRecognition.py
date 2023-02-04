import __main__ as p

questionWord = ['who', 'what', 'when', 'where', 'how', 'why']
auxiliary = ['am', 'is', 'are', 'was', 'were', 'be', 'do', 'did', 'will', 'has' 'have']
subject = []
obj = []
mainVerb = []

def yesNoQuestion():
  for aux in auxiliary:
    for qw in questionWord:
      if aux in p.userProfile['input'] and qw in p.userProfile['input']:
        print('sure')
      else:
        print('error1')
yesNoQuestion()

def informativeQuestion():
  for aux in auxiliary:
    for qw in questionWord:
      if aux in p.userProfile['input'] and qw in p.userProfile['input']:
        print('Maybe?')
      else:
        print('error2')
informativeQuestion()
