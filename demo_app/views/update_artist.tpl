<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Artist</title>
</head>
<body>
    <h1>Edit Artist</h1>
    <form action="/update/artist/{{ artist[0] }}" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="{{ artist[1] }}" required>
        <button type="submit">Update</button>
    </form>
    <a href="/artist/{{ artist[0] }}">Back to Artist</a>
</body>
</html>
