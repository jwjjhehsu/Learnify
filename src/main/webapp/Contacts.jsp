<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f4f4f4; /* Light background for better contrast */
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background: white; /* Solid white background */
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #007BFF; /* Primary color */
            margin-bottom: 20px;
            font-size: 2em; /* Increased font size */
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold; /* Bold labels for better visibility */
        }

        input[type=text],
        input[type=email],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            transition: border-color 0.3s; /* Smooth transition effect */
        }

        input[type=text]:focus,
        input[type=email]:focus,
        textarea:focus {
            border-color: #007BFF; /* Focus effect */
            outline: none; /* Remove default outline */
        }

        button {
            background-color: #007BFF; 
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s; /* Smooth hover effect */
            font-size: 1em; /* Increased button font size */
        }

        button:hover {
            background-color: #0056b3; 
        }

        .back-button {
            background-color: #6c757d; 
        }

        .back-button:hover {
            background-color: #5a6268; 
        }

        .button-container {
            display: flex;
            justify-content: space-between; /* Space out buttons */
        }

        .social-login {
            display: flex;
            justify-content: space-between;
            margin-top: 30px; /* Increased margin for better spacing */
        }

        .social-button {
            flex-grow: 1; 
            margin-right: 10px; 
            padding: 12px;
            text-align: center;
            cursor: pointer; 
            border-radius: 5px; /* Rounded corners for social buttons */
            color: white; /* Text color */
            font-size: 1em; /* Increased font size */
        }

        .social-button:last-child {
            margin-right: 0; 
        }

        .google { background-color: #db4437; }
        .facebook { background-color: #3b5998; }
        .instagram { background-color: #e1306c; }
    </style>
</head>
<body>

<div class="container">
    <h1>Contact Us</h1>
  
    <form action="submitContact.jsp" method="post">
        
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required placeholder="Enter your name">
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required placeholder="Enter your email">
        </div>
        
        <div class="form-group">
            <label for="message">Message:</label>
            <textarea id="message" name="message" required placeholder="Write your message here..." rows="5"></textarea>
        </div>

        <div class="button-container">
            <button type="submit">Submit</button>
            <button type="button" onclick="window.location.href='index.jsp'" class="back-button">Back</button>
        </div>

    </form>

    <!-- Social Login Section -->
    <div class="social-login">
       <div class="social-button google">Login with Google</div>
       <div class="social-button facebook">Login with Facebook</div>
       <div class="social-button instagram">Login with Instagram</div>
    </div>

</div>

</body>
</html>
