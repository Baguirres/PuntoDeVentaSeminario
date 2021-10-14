<?php 

    class Correo
    {
        public function CompraRealizada($to,$subject,$message)
        {
            $headers = 'From: kamcanco@gmail.com' . "\r\n" .
            'Reply-To: kamcanco@gmail.com' . "\r\n" .
            'X-Mailer: PHP/' . phpversion();

            mail($to,$subject,$message,$headers);

        }
        
    }
    

?>