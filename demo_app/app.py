from bottle import Bottle, run, template, request, redirect
import sqlite3

app = Bottle()

# Connect to the SQLite database
conn = sqlite3.connect('music.db')
cursor = conn.cursor()

# Create tables if they don't exist
cursor.execute('''
    CREATE TABLE IF NOT EXISTS artist (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
    )
''')

cursor.execute('''
    CREATE TABLE IF NOT EXISTS album (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        artist_id INTEGER,
        FOREIGN KEY (artist_id) REFERENCES artist(id)
    )
''')

cursor.execute('''
    CREATE TABLE IF NOT EXISTS song (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        album_id INTEGER,
        FOREIGN KEY (album_id) REFERENCES album(id)
    )
''')

conn.commit()
@app.route('/')
def home():
    # Redirect to the index page
    return template('index')



#VIEW ALL ARTISTS
@app.route('/artist')
def artist():
    # Display a list of artists
    cursor.execute('SELECT * FROM artist')
    artists = cursor.fetchall()
    return template('artist', artists=artists)




#CREATE FOR ARTIST
@app.route('/create/artist', method='GET')
def create_artist_form():
    # Display a form to create a new artist
    return template('create_artist')

@app.route('/create/artist', method='POST')
def create_artist():
    # Create a new artist
    name = request.forms.get('name')
    cursor.execute('INSERT INTO artist (name) VALUES (?)', (name,))
    conn.commit()
    redirect('/')
#UPDATE FOR ARTIST
@app.route('/update/artist/<artist_id>', method='GET')
def update_artist_form(artist_id):
    # Display a form to update an existing artist
    cursor.execute('SELECT * FROM artist WHERE id = ?', (artist_id,))
    artist = cursor.fetchone()
    return template('update_artist', artist=artist)

@app.route('/update/artist/<artist_id>', method='POST')
def update_artist(artist_id):
    # Update an existing artist
    name = request.forms.get('name')
    cursor.execute('UPDATE artist SET name = ? WHERE id = ?', (name, artist_id))
    conn.commit()
    redirect('/')
#DELETE FOR ARTIST
@app.route('/delete/artist/<artist_id>', method='GET')
def delete_artist_form(artist_id):
    # Display a confirmation page before deleting an artist
    cursor.execute('SELECT * FROM artist WHERE id = ?', (artist_id,))
    artist = cursor.fetchone()
    return template('delete_artist', artist=artist)

@app.route('/delete/artist/<artist_id>', method='POST')
def delete_artist(artist_id):
    # Delete an artist and associated albums and songs
    cursor.execute('DELETE FROM artist WHERE id = ?', (artist_id,))
    conn.commit()
    redirect('/')
















#---------------------------------ALBUMS---------------------------------#
#VIEW ALL ALBUMS
@app.route('/album')
def album():
    # Display a list of albums
    cursor.execute('SELECT * FROM album')
    album = cursor.fetchall()
    return template('album', album=album)

#CREATE FOR ALBUM
@app.route('/create/album', method='GET')
def create_album_form():
#display form create album
    return template('create_album')


@app.route('/create/album', method='POST')
def create_album():
    title = request.forms.get('title')
    artist_id = request.forms.get('artist_id')  # Retrieve the artist_id from the request form
    
    cursor.execute('INSERT INTO album (title, artist_id) VALUES (?, ?)', (title, artist_id,))
    conn.commit()
    
    redirect('/')



#UPDATE FOR ALBUM
@app.route('/update/album/<album_id>', method='GET')
def update_album_form(album_id):
    cursor.execute('SELECT * FROM album WHERE id = ?', (album_id,))
    album = cursor.fetchone()
    return template('update_album', album=album)

@app.route('/update/album/<album_id>', method='POST')
def update_album(album_id):
    title = request.forms.get('title')
    
    cursor.execute('UPDATE album SET title = ? WHERE id = ?', (title, album_id))
    conn.commit()
    
    # Fetch artist_id associated with the album for redirection
    cursor.execute('SELECT artist_id FROM album WHERE id = ?', (album_id,))
    #artist_id = cursor.fetchone()[0]
    return template('update_album', album=album) #artist_id=artist_id)

    #redirect('/artist/{}'.format(artist_id))



#DELETE FOR ALBUM
@app.route('/delete/album/<album_id>')
def delete_album(album_id):
    # Fetch artist_id associated with the album for redirection
    cursor.execute('SELECT artist_id FROM album WHERE id = ?', (album_id,))
    artist_id = cursor.fetchone()[0]

    cursor.execute('DELETE FROM album WHERE id = ?', (album_id,))
    conn.commit()

    redirect('/artist/{}'.format(artist_id))

#---------------------------------SONGS---------------------------------#

#DISPLAY SONGS

@app.route('/song')
def album():
    # Display a list of albums
    cursor.execute('SELECT * FROM song')
    song = cursor.fetchall()
    return template('song', song=song)


@app.route('/create/song', method='GET')
def create_song_form():
    # Display a form to create a new song
    return template('create_song', album_id=None)

@app.route('/create/song', method='POST')
def create_song():
    # Create a new song without associating it with a specific album
    title = request.forms.get('title')
    cursor.execute('INSERT INTO song (title) VALUES (?)', (title,))
    conn.commit()
    redirect('/')

@app.route('/update/song/<album_id:int>', method='GET')
def update_song_form(album_id):
    # Display a form to update an existing song
    cursor.execute('SELECT * FROM song WHERE id = ?', (album_id,))
    song = cursor.fetchone()

    if song:
        return template('update_song', song=song)
    else:
        return "Song not found"

@app.route('/update/song/<album_id:int>', method='POST')
def update_song(album_id):
    # Update an existing song
    title = request.forms.get('title')
    cursor.execute('UPDATE song SET title = ? WHERE id = ?', (title, album_id))
    conn.commit()
    redirect('/')

@app.route('/delete/song/<album_id>', method='GET')
def delete_song_form(album_id):
    # Display a confirmation page before deleting a song
    cursor.execute('SELECT * FROM song WHERE id = ?', (album_id,))
    song = cursor.fetchone()
    return template('delete_song', song=song)

@app.route('/delete/song/<album_id>', method='POST')
def delete_song(album_id):
    # Delete a song
    cursor.execute('DELETE FROM song WHERE id = ?', (album_id,))
    conn.commit()
    redirect('/')


#Search songs

@app.route('/search/song', method='GET')
def search_song():
    # Get the search query from the URL parameters
    search_query = request.query.get('search_query', '').strip()

    # Search for songs that match the query
    cursor.execute('SELECT * FROM song WHERE title LIKE ?', ('%' + search_query + '%',))
    search_results = cursor.fetchall()

    return template('search_song', results=search_results)










# Run the application
if __name__ == '__main__':
    run(app, host='localhost', port=8080)
