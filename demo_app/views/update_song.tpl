<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Song</title>
</head>
<body>
    <h1>Edit Song</h1>
    <form action="/update/song/{{ song[0] }}" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="{{ song[1] }}" required>
        <button type="submit">Update</button>
    </form>
    <a href="/song">Back to Songs</a>
</body>
</html>
