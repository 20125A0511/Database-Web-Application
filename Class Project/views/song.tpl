<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display SONGS</title>
</head>
<body>
    <h1>SONGS</h1>
    <table border="1">
        <tr>
            <th>ALBUM_ID</th>
            <th>SONG TITLE</th>
            <th>Action</th>
        </tr>
        % for song in song:
            <tr>
                <td>{{ song[0] }}</td>
                <td>{{ song[1] }}</td>
                <td>
                    
                    <a href="/update/song/{{ song[0] }}">Edit</a>
                    <a href="/delete/song/{{ song[0] }}">Delete</a>
                </td>
            </tr>
        % end
    </table>
    <a href="/">Back to Home</a>
</body>
</html>
