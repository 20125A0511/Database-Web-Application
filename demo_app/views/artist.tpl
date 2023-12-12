<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Artists</title>
</head>
<body>
    <h1>Artists</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Action</th>
        </tr>
        % for artist in artists:
            <tr>
                <td>{{ artist[0] }}</td>
                <td>{{ artist[1] }}</td>
                <td>
                    
                    <a href="/update/artist/{{ artist[0] }}">Edit</a>
                    <a href="/delete/artist/{{ artist[0] }}">Delete</a>
                </td>
            </tr>
        % end
    </table>
    <a href="/">Back to Home</a>
</body>
</html>
