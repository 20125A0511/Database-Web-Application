<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Artist</title>
</head>
<body>
    <h1>Delete Artist</h1>
    <p>Are you sure you want to delete the artist "{{ artist[1] }}"?</p>
    <form action="/delete/artist/{{ artist[0] }}" method="post">
        <button type="submit">Delete</button>
    </form>
    <a href="/artist/{{ artist[0] }}">Cancel</a>
    <br>
    <a href="/">Back to Artists</a>
</body>
</html>
