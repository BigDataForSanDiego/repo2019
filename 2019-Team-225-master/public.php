<?php // public.php
    if (isset($_POST["name"])) $name = $_POST["name"];
    else $name = "none";
    
    echo <<<_END
    <!DOCTYPE html>
    <html>
    <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
    /* Always set the map height explicitly to define the size of the div
     * element that contains the map. */
    #map {
height: 100%;
    }
    /* Optional: Makes the sample page fill the window. */
    html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    }
    </style>
    </head>
    <body>
    <nav class="navbar navbar-default">
    <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="#">iCAN</a>
    </div>
    <ul class="nav navbar-nav">
    <li class="active"><a href="#">Home</a></li>
    <li><a href="#">My Queries</a></li>
    <li><a href="#">Resources</a></li>
    <li><a href="#">Community</a></li>
    </ul>
    <p class="text-right">Welcome, <b>$name</b>.</p>
    </div>
    </nav>
    
    <div class="container-fluid"></div>
    <div id="map" height="400px" width="100%"></div>
    <div id="form">
    <table>
    <tr><td>Name:</td> <td><input type='text' id='name'/> </td> </tr>
    <tr><td>Comments:</td> <td><input type='text' id='comment'/> </td> </tr>
    <tr><td>Request:</td> <td><select id='type'> +
    <option value='bus stop' SELECTED>Bus stop</option>
    <option value='stop light'>Stop light</option>
    <option value='pothole'>Pothole</option>
    </select> </td></tr>
    <tr><td></td><td><input type='button' value='Save' onclick='saveData()'/></td></tr>
    </table>
    
    <div id="message">Location saved</div>
    </div>
    <script src="./mapscript.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBibhJM7Es-HagZaGesjhcQ2Xv9HN1r8QA&callback=initMap"></script>
    </body>
    </html>
    
    _END;
    ?>
