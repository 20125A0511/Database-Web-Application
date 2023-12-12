<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Songs</title>
</head>
<body>
    <h1>Search Songs</h1>
    <form action="/search/song" method="get">
        <label for="search_query">Search:</label>
        <input type="text" id="search_query" name="search_query" required>
        <button type="submit">Search</button>
    </form>
    <a href="/">Back to Home</a>

    <h2>Search Results</h2>
    <ul>
        % for result in results:
            <li><a href="/song/{{ result[0] }}">{{ result[1] }}</a></li>
        % end
    </ul>
</body>
</html>
