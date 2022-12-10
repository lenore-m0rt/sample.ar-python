from flask import Flask
from flask import render_template
from flaskext.mysql import MySQL


app = Flask(__name__, static_folder='/')
mysql = MySQL()
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_BD'] = 'tpo'
mysql.init_app(app)
@app.route('/')
def index():
    '''    sql = ''
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(sql)
    conn.commit()
'''    
    return render_template('index.html')


@app.route('/samples')
def samples():
    sql = 'SELECT id, descripción FROM tpo.géneros'
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(sql)
    generosList = cursor.fetchall()
    #print(generosList)
    sql2 = 'SELECT id, descripción FROM tpo.instrumentos'
    cursor.execute(sql2)
    instrumentosList = cursor.fetchall() 

    return render_template('samples.html', generos=generosList, instrumentos=instrumentosList)



if __name__ == '__main__':
    app.run(debug=True)

