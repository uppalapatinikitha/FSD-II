<html>
<html>
<head>
<style>
body, html {
  height:100%;
  margin:0;
  font-family:Arial,Helvetica,sans-serif;
}

*{
  box-sizing:border-box;
}

.bg-image{
  /* The image used */
  background-image:url("loginfailed.jpg");
 
  /* Add the blur effect */
  filter: blur(8px);
  -webkit-filter:blur(8px);
 
  /* Full height */
  height:100%;
 
  /* Center and scale the image nicely */
  background-position:center;
  background-repeat:no-repeat;
  background-size:cover;
}

/* Position text in the middle of the page/image */
.bg-text {
  background-color:rgb(44, 59, 181,0.5); /* Fallback color */
  background-color:rgb(44, 59, 181,0.5); /* Black w/opacity/see-through */
  color:black;
  font-weight:bold;
  border:3px solid #f1f1f1;
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%, -50%);
  z-index:2;
  width:80%;
  padding:20px;
  text-align:center;
}
</style>
</head>
<body>

<div class="bg-image"></div>

<div class="bg-text">
  <h1 style="color:white">LOGIN FAILED</h1>
  <h1 style="color:white; font-size:20px;">INVALID USERNAME OR PASSWORD</h1>
  <a href="login.html" style="color:white">try again</a>
</div>

</body>
</html>