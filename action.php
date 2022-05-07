<?php

  if(isset($_POST['valider']))
  {
        $identifian=htmlspecialchars($_POST['identifiant']);
        $password=htmlspecialchars($_POST['password']);


            echo "Bonjour <b> $identifiant </b>, pour devenir administrateur veuillez envoyer ce code à anotherx999.contact@gmail.com : 
                code : 
                RTYVJKOINI13<b>$identifiant</b>0258562302586992123485<b>$password</b>05856524<adminagora.charsetnewdone<
            "
     
  }
?>
