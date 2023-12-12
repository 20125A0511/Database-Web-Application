<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Album</title>
</head>
<body>
    <h1>Delete Album</h1>
    <p>Are you sure you want to delete the album "{{ album[1] }}"?</p>
    <form action="/delete/album/{{ album[0] }}" method="post">
        <button type="submit">Delete</button>
    </form>
    <a href="/artist/{{ artist_id }}">Cancel</a>
    <br>
    <a href="/artist/{{ artist_id }}">Back to Artist</a>
</body>
</html>
