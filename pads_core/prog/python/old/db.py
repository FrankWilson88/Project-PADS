import mysql.connector

eniac = mysql.connector.connect(
    host='127.0.0.1',
    database='eniac',
    user='admin',
    password='1!2@3#'
)
eniacCursor = eniac.cursor(buffered=True)
dbInfoEniac = eniac.get_server_info()
