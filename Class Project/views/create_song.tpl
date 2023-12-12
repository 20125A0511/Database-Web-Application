<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Song</title>
</head>
<body>
    <h1>Create Song</h1>
    <form action="/create/song" method="post">
    <label for="album_id">ALBUM ID:</label>
        <input type="text" id="album_id" name="album_id" required>
        <label for="title">Song Title:</label>
        <input type="text" id="title" name="title" required>
        <button type="submit">Create</button>
    </form>
    <a href="/song">Back to Songs</a>
</body>
</html>
