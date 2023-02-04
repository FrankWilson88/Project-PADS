import __init__ as e

userLogin = "SELECT login FROM user WHERE login=%s"
saveProfile = "INSERT INTO user (login, name, birthdate, gender, email, os, dir) VALUES (%s, %s, %s, %s, %s, %s, %s)"
userQuery = e.db.eniacCursor.execute(userLogin, (e.osUser,))
loadUser = e.db.eniacCursor.fetchone()
try:  # if user exists, move on
    for user in loadUser:
        if user == e.osUser:  # if the user wants to do something.....
            from brain import menu
            menu()
        elif user != e.osUser:  # if the user wants to do something else.....
            print('goodbye')
        else:  # if the user royally fucked up...
            print(e.response.userInputError())
except:  # if user does not exist, create user
    e.newuser()
    e.newuserBirthday()
    e.newuserGender()
    e.newuserEmail()
    e.db.eniacCursor.execute(saveProfile, (e.osUser, e.userName, e.userBirthday, e.userGender, e.userEmail, e.userOS, e.userDir))
    e.db.eniac.commit()
    print('I\'ve made a new friend!')
    from brain import menu

    menu()
finally:
    e.db.eniac.close()
    print(e.response.exit())
