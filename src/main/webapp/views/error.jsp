<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Error SomeThing Unexpected Happens!</title>
    <link rel="stylesheet" type="text/css" href="/error-t/assets/css/style.css" />
    <link href="/error-t/assets/images/favicon.png" rel="shortcut icon" type="image/x-icon" />
</head>

<body>
    <div class="container">
        <img width="50%" height="50%"  src="/error-t/assets/images/unexpected.png" />
        <br />
        <h2>Please Don't Panic It's Just a minor Problem
            <br/>
            <%
            String Msg = request.getParameter("Msg");

            out.write(Msg == null?"Please Login Before Accesing The Features":Msg);

            %>
            </h2>
        <br />
        <% if(Msg == null) { %>
        <a class="buton" href="/">Login</a>
        <% } else { %>
        <a class="buton" href="/home">Go Home</a>
        <% } %>
    </div>
</body>

</html>