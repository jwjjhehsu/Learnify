<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <!-- CSS -->
    <style type="text/css">
        body {
            overflow-x: hidden; /* Prevent horizontal scrolling */
        }
        .banner-background {
            clip-path: polygon(0% 0%, 100% 0%, 100% 84%, 85% 84%, 100% 100%, 53% 100%, 0 100%);
        }
        .form-control {
            margin-bottom: 15px; /* Spacing between form elements */
        }
        .form-label {
            font-weight: bold; /* Bold labels for better visibility */
        }
        .gender-label {
            margin-right: 15px; /* Spacing between gender options */
        }
        .card {
            border-radius: 10px; /* Rounded corners for the card */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
        }
        .primary-background {
            background-color: #f8f9fa; /* Light background color */
        }
        
        /* Media queries for responsive design */
        @media (max-width: 767px) {
            .container {
                max-width: 100%; /* Full width on small screens */
                padding: 0 15px; /* Add some padding on small screens */
            }
            .col-md-6 {
                flex: 0 0 auto; /* Disable automatic width calculation on small screens */
                width: 100%; /* Full width on small screens */
            }
        }
        
        @media (min-width: 768px) {
            .container {
                max-width: 720px; /* Adjust the max-width as needed */
            }
        }
        
        @media (min-width: 992px) {
            .container {
                max-width: 960px; /* Adjust the max-width as needed */
            }
        }
        
        @media (min-width: 1200px) {
            .container {
                max-width: 1140px; /* Adjust the max-width as needed */
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@ include file="normal_navbar.jsp" %>

<main class="primary-background py-6"> <!-- Adjusted padding -->
    <div class="container">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header text-center primary-background text-white">
                    <span class="fa fa-3x fa-user-circle"></span>
                    <br>
                    <b>Register Here</b>
                </div>
                <div class="card-body">
                    <form action="" method="post" onsubmit="return preventScroll();">
                        <div class="mb-3">
                            <label for="user_name" class="form-label">User Name</label>
                            <input type="text" class="form-control" id="user_name" placeholder="Enter Your Name" required>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter Your Email" required>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Select Gender</label>
                            <div>
                                <input type="radio" id="gender_male" name="gender" value="male" required class="gender-label"> 
                                <label for="gender_male">Male</label>
                                <input type="radio" id="gender_female" name="gender" value="female" class="gender-label"> 
                                <label for="gender_female">Female</label>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <label for="about" class="form-label">About You</label>
                            <textarea name="about" class="form-control" id="about" rows="4" placeholder="Enter something about yourself"></textarea>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                            <label class="form-check-label" for="exampleCheck1">I agree to the terms and conditions</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="card-footer"></div>
            </div>
        </div>
    </div>
</main>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script>
    function preventScroll() {
        document.body.style.overflow = 'hidden'; // Prevent scrolling
        return true; // Allow form submission
    }
</script>
</body>
</html>
