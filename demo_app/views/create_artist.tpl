<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Artist</title>
</head>
<body>
    <h1>Create Artist</h1>
    <form action="/create/artist" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Create</button>
    </form>
    <a href="/artist">Back to Artists</a>
</body>
</html>
