from flask import Flask
from flask import render_template
from flaskext.mysql import MySQL
from flask import request

    #Conexión con la base de datos
app = Flask(__name__, static_folder='/')
mysql = MySQL()
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_BD'] = 'tpo'
mysql.init_app(app)
@app.route('/')
def index():
    return render_template('index.html')


@app.route('/samples')
def samples():
    return render_template('samples.html', generos=buscar_gen(), instrumentos=buscar_ins())


    #La web carga de la base las opciones de búsqueda
def buscar_gen():
    sql = 'SELECT id, descripción FROM tpo.géneros'
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(sql)
    return cursor.fetchall()
    
def buscar_ins():
    sql = 'SELECT id, descripción FROM tpo.instrumentos'
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(sql)
    return cursor.fetchall()


    #recuperar los valores de filtro
    #construir el query y ejecutarlo
    #asignarselo a resultado_samples

@app.route('/find-samples')
def find_samples():
    
    _genero = request.args.get('genero')
    _instrumento = request.args.get('instrumento')
    _bpm = request.args.get('bpm')
    _todos = request.args.get('todos')
    condicion = ''

    if _genero != '':
        condicion = 'S.Genero=' + _genero
    
    if _instrumento != '':

        if condicion!='':
            condicion += ' AND '

        condicion += 'S.Instrumento=' + _instrumento

    if _todos is None:

        if condicion!='':
            condicion += ' AND '

        condicion += 'S.BPM=' + _bpm


    sql = '''SELECT G.Descripción, I.Descripción, URL FROM tpo.`samples` S JOIN tpo.`géneros` G ON S.Genero = G.ID JOIN tpo.`instrumentos` I ON S.Instrumento = I.ID
    '''
    if condicion != '':
        sql += ' WHERE ' + condicion

    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(sql)
    res = cursor.fetchall()

    return render_template('samples.html', generos=buscar_gen(), instrumentos=buscar_ins(), resultado_samples=res)



    #Corre la app
if __name__ == '__main__':
    app.run(debug=True)

