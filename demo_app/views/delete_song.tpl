<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Song</title>
</head>
<body>
    <h1>Delete Song</h1>
    <p>Are you sure you want to delete the song "{{ song[1] }}"?</p>
    <form action="/delete/song/{{ song[0] }}" method="post">
        <button type="submit">Delete</button>
    </form>
    <a href="/song">Cancel</a>
</body>
</html>
