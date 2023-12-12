<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Albums</title>
</head>
<body>
    <h1>Albums</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Action</th>
        </tr>
        % for album in album:
            <tr>
                <td>{{ album[0] }}</td>
                <td>{{ album[1] }}</td>
                <td>
                    
                    <a href="/update/album/{{ album[0] }}">Edit</a>
                    <a href="/delete/album/{{ album[0] }}">Delete</a>
                </td>
            </tr>
        % end
    </table>
    <a href="/">Back to Home</a>
</body>
</html>
