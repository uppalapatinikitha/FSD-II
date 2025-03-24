<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>

        <style> 

	
        .container {
            background-size: cover;
            background-position: center;
            padding: 20px;
            min-height: calc(100vh - 160px);
            position: relative;
            color: white; 
        }
        .message-container {
            background-color:#000081;  
            padding: 20px;
            border-radius: 10px;
            max-width: 400px;
            margin: auto;
        }
		span
        {
         color:#000081;
        }
     footer 
	 {
    background-color:#000081;
    color: #fff;
    text-align: center;
    padding: 15px;
   }
    </style>
</head>
<body >
		
		<div>
<img src="logo.png" width=500px height=150px />
<span style="font-size:60px;"><b>VIJAYA DIAGNOSTIC CENTER</b> </span>
</div>

		<div class="container">
        <div class="message-container">
            <center>
                <h1>Logout</h1>
                <% 
                    session.invalidate();
                %>
                <p>You have been successfully logged out.</p>
                <p><a href="login.html" style="color: #fff;">Login again</a></p>
            </center>
        </div>
    </div>

    <footer>
        <h4>VIJAYA DIAGNOSTIC CENTER copyrights@nikitha:23765A0512</h4>
    </footer>
</body>
</html>