<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Album</title>
</head>
<body>
    <h1>Edit Album</h1>
    <form action="/update/album/{{ album[0] }}" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="{{ album[1] }}" required>
        <button type="submit">Update</button>
    </form>
    <a href="/album">Back to ALBUMS</a>
</body>
</html>
