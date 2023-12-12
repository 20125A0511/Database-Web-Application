<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Album</title>
</head>
<body>
    <h1>Create Album</h1>
    <form action="/create/album" method="post">
        <label for="name">Name:</label>
        <input type="text" id="title" name="title" required>
        <label for="Artist_id">Artist_id:</label>
        <input type="number" id="artist_id" name="artist_id" required>
        <button type="submit">Create</button>
    </form>
    <a href="/album">Back to Albums</a>
</body>
</html>

