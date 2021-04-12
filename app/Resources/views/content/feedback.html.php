<!DOCTYPE html>
<html lang="en">
<head>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
}
body:before {
	content: '';
	position: fixed;
	width: 100vw;
	height: 100vh;
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('background/el.jpg');
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	-webkit-background-size: cover;
	background-size: cover;

}
.contact-form {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	height: 400px;
	padding: 90px 40px;
	background: rgba(0, 0, 0, 0.5);
}
.avatar {
	position: absolute;
	width: 80px;
	height: 80px;
	border-radius: 50%;
	overflow: hidden;
	top: calc(-80px/2);
	left: 190px;
}
.contact-form h2 {
	margin: 0;
	padding: 0 0 20px;
	color: #fff;
	text-align: center;
	text-transform: uppercase;
}
.contact-form p {
	margin: 0;
	padding: 0;
	font-weight: bold;
	color: #fff;
}
.contact-form input {
	width: 100%;
	margin-bottom: 20px;
}
.contact-form input[type=email] {
	border: none;
	border-bottom: 1px solid #fff;
	background: transparent;
	outline: none;
	height: 40px;
	color: #fff;
	font-size: 16px;
}
.contact-form input[type=submit] {
	height: 30px;
	color: #fff;
	font-size: 15px;
	background: red;
	cursor: pointer;
	border-radius: 25px;
	border: none;
	outline: none;
	margin-top: 15%;
}
.contact-form a {
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	text-decoration: none;
}


</style>

<meta charset="UTF-8">
	<title>feedback</title>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;900&display=swap" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
</head>

<body>
	<div class="contact-form">
		<img alt="" class="avatar" src="https://i.postimg.cc/zDyt7KCv/a1.jpg">
		<h2>Feedback Form</h2>
			<form action="#" onsubmit="return validation()" method = "post">

					
				<p>First name</p>	<input type="text" name="firstname" class="form-control" id="user" autocomplete="off">
					<span id="username" class="text-danger font-weight-bold"></span>
				

        
				<p>	Last name</p><input type="text" name="lastname" class="form-control" id="user" autocomplete="off">
					<span id="username" class="text-danger font-weight-bold"></span>
				

			
				<p>Email</p>	<input type="text" name="email" class="form-control" id="emails" autocomplete="off">
					<span id="emailids" class="text-danger font-weight-bold"></span>
				

        
				<p>Review	</p><input type="text" name="comment" class="form-control" id="user" autocomplete="off">
					<span id="username" class="text-danger font-weight-bold"></span>
			
				<input type="submit" name="submit" value="submit" class="btn btn-success">
				
			</form>
	</div>
		
	</body>

    
        <?php
            $firstname = $_POST['firstname'];
            $lastname = $_POST['lastname'];
            $email = $_POST['email'];
            $comment = $_POST['comment'];

            // if(isset($firstname)) {
            //   $feedback = new \Pimcore\Model\DataObject\Feedback();
      
            //   $feedback->setKey($firstname); 
            //   $feedback->setPublished(true); 
            //   $feedback->setParentId(36); 
            //   $feedback->setFirstname($_POST['firstname']); 
              
            //   $feedback->save();

            if(isset($firstname) && isset($lastname) 
            && isset($email) && isset($comment)) {
                $feedback = new \Pimcore\Model\DataObject\Feedback();
        
                $feedback->setKey($firstname); 
                $feedback->setPublished(true); 
                $feedback->setParentId(20); 
                $feedback->setFirstname($_POST['firstname']); 
                $feedback->setLastname($_POST['lastname']); 
                $feedback->setEmail($_POST['email']); 
                $feedback->setComment($_POST['comment']); 
                $feedback->save();



                $mail = new \Pimcore\Mail();
                // $mail->addTo('oprachi2@gmail.com');
                // $mail->setSubject('Products Feedback');
                $mail->setDocument('/feedbackMail');
                // $mail->setParams($params);
                $mail->send();

               
            }
            
            // dump ($firstname);
            // dump ($lastname);
            // dump ($email);
            // dump ($comment);
            // die();  
        ?>  

    <h1><?= $this->input("headline", ["width" => 540]); ?></h1>

    <?php while ($this->block("contentblock")->loop()) { ?>
        <h2><?= $this->input("subline"); ?></h2>
        <?= $this->wysiwyg("content"); ?>
    <?php } ?>

</html>