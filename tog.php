<?php

session_start();
/*
$_SESSION['nam'] = array();

$_SESSION['nam']['jabuke'] = 10;
$_SESSION['nam']['banane'] = 19;
$_SESSION['nam']['ananas'] = 38;


foreach($_SESSION['nam'] as $key => $value)
{
    echo "<p>$key - $value</p>\n";

}*/

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h1>Dobrodosli u supermarket</h1>

    <h2>Odaberite zeljene proizvode te dodajte ih u košaricu</h2>

    <form action="tog.php" method="POST">
    
    <table>
    
    
    <thead>
    
    <tr><th>Proizvod<br><br></th><th>Kolicina<br><br></th></tr>
    
    
    </thead>
    
    <tbody>
    
    <tr><td>Jabuke</td>    <td><input type="text" name="jabuke" size="2"></td></tr>
    
    <tr><td>Banane</td>    <td><input type="text" name="banane" size="2"></td></tr>
    
    <tr><td>Sljive</td>    <td><input type="text" name="sljive" size="2"></td></tr>

    <tr><td>Ananas</td>    <td><input type="text" name="ananas" size="2"></td></tr>

    </tbody>
       
    
    </table>
    
    <input type="submit" value="Dodajte vase proizvode">

    
    </form>

    <?php 

    if(isset($_POST['jabuke'])){

        if(is_numeric($_POST['jabuke'])){
            $_SESSION['nam']['jabuke'] = $_POST['jabuke'];

        }
        elseif($_POST['jabuke'] == "Obrisi")
        {
            unset($_SESSION['nam']['jabuke']);
      

    }
}

    if(isset($_POST['banane'])){

        if(is_numeric($_POST['banane'])){
            $_SESSION['nam']['banane'] = $_POST['jabuke'];


        }

        elseif($_POST['banane'] == "Obrisi"){
            unset($_SESSION['nam']['banane']);

        }


    }

    if(isset($_POST['sljive'])){

        if(is_numeric($_POST['sljive']))
        {
            $_SESSION['nam']['sljive'] = $_POST['sljive'];

        }
        elseif($_POST['sljive'] == "Obrisi"){

            unset($_SESSION['nam']['sljive']);
        }

    }

    if(isset($_POST['ananas']))
    {

        if(is_numeric($_POST['ananas'])){

            $_SESSION['nam']['ananas'] = $_POST['ananas'];

        }
        elseif($_POST['ananas'] == "Obrisi")
        {
            unset($_SESSION['nam']['ananas']);

        }

    }



    ?>
    <br>
    <fieldset style="width:310px">
    <legend>Vasa kosarica</legend>

    <?php 

    if(!isset($_SESSION['nam'])){

        $_SESSION['nam'] = array();
        echo "Vasa kolica su prazna\n";


    }
    else{

        echo "<form action='tog.php' method='POST'>\n";
        echo "<table>\n";

        echo "<tr> <th> Proizvod </th> <th> &nbsp;&nbsp; Kolicina </th></tr>\n";

        foreach($_SESSION['nam'] as $key => $value){

            echo "<tr><td>{$key}</td> <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$value}</td>\n";

            echo "<td><input type='submit' name={$key} value='Obrisi'></td></tr>\n";
        }

            echo "</table>\n";
            echo "</form>\n";
        

    }


    ?>
    
    </fieldset>

</body>
</html>