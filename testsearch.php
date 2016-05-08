<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<?php include("headers.html");?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quick Search | Team Warriors</title>
        <meta name="keywords" content="NBA Statistics, NBA, Statistics">
        <meta name="description" content="Quick search">
        <meta name ="author" content="Manny R">
        
        <script type="text/javascript" src="javascript.js"></script>
        <link rel="stylesheet" href="header.css"/>
        <!-- <link rel="stylesheet" type="text/css" href="stylesheet.css"> -->
    </head>
    <body onload="init()">
        <h1>Auto-Completion search AJAX</h1>

        <form name="autofillform">
            <table border="0" cellpadding="5">
                <tbody>
                    <tr>
                        <td><strong>Player Name:</strong></td>

                        <td><input type="text"
                                   size="40"
                                   id="complete-field"
                                   onkeyup="doCompletion();">
                        </td>
                    </tr>
                    <tr>
                        <td id="auto-row" colspan="2">

                        <td/>
                    </tr>
                </tbody>
            </table>
        </form>

    </body>
</html>
