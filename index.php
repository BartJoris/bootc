<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cool PHP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: white;
            text-align: center;
        }
        .container {
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
        }
        h1 {
            font-size: 3em;
            margin: 0;
        }
        p {
            font-size: 1.2em;
        }
        .time {
            font-size: 2em;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to My Cool PHP Page</h1>
        <p><?php echo "Today is " . date("l, F j, Y") . "."; ?></p>
        <p class="time"><?php echo "The current time is " . date("h:i A"); ?></p>
    </div>
</body>
</html>