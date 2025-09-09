
<?php

// ajout du header
 include('view/commun/header.php');  
//fin ajout du header


$page = isset($_GET['page']) ? $_GET['page'] : 'accueil';

switch ($page) {
    case 'accueil' :
        include('view/accueil.php');
    break;
    
    default:
        include('view/accueil.php');
        break;
}


// ajout du footer
 include('view/commun/footer.php');  
//fin ajout du footer

?>