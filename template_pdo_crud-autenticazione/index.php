<?php

require_once 'vendor/autoload.php';
require_once 'conf/config.php';

use League\Plates\Engine;
use Model\TodoRepository;
use Util\Authenticator;

$template = new Engine('templates','tpl');
//Fa partire il processo di autenticazione
$user = Authenticator::getUser();

if ($user == null){
    echo $template->render('login');
    exit(0);
}

$id_user = $user['user_id'];
$name = $user['name'];
$objects = TodoRepository::listAll();
$userObjects = TodoRepository::listUserObjects($id_user);
$tokens=TodoRepository::tokens($id_user);
$categories=TodoRepository::listAllCategories();


if (isset($_GET['action'])){
    if (($_GET['action']) == 'logout'){
        Authenticator::logout();
        echo $template->render('login');
        exit(0);
    }
    if (($_GET['action']) == 'account'){
        $objectsBought= TodoRepository::listUserObjectsBought($id_user);
        echo $template->render('account', ['name' => $name, 'objects' => $userObjects, 'token'=>$tokens, 'boughts'=>$objectsBought]);

        exit(0);
    }
    if (($_GET['action']) == 'product'){
        $id = $_GET['id_object'];
        $product_id_seller=$_GET['id_seller'];
        $object= TodoRepository::viewProduct($id);

        echo $template->render('product', ['name' => $name, 'object' => $object, 'seller' =>$product_id_seller, 'id_user' => $id_user]);

        exit(0);
    }
    if (($_GET['action']) == 'buy'){
        $id_object=$_GET['id_object'];
        $id_seller=$_GET['id_seller'];

        TodoRepository::buyOggetto($id_object, $id_user, $id_seller);
        echo $template->render('transaction', ['name'=>$name]);

        exit(0);
    }
    if (($_GET['action']) == 'add'){
        $nome_oggetto=$_POST['nome'];
        $id_category=$_POST['category'];
        $descrizione=$_POST['descrizione'];

        TodoRepository::addOggetto($id_user, $nome_oggetto, $id_category, $descrizione);


        exit(0);
    }

}
//Gestisce l'aggiunta di un nuovo impegno
if (isset($_POST['impegno'])){
    $impegno = $_POST['impegno'];
    $importanza = $_POST['importanza'];
    if (isset($_POST['id'])){
        $id = $_POST['id'];
        if (TodoRepository::owned($id, $id_user))
            TodoRepository::updateTesto($impegno, $importanza, $id);
    }
    else if ($impegno != '') {
        TodoRepository::add($impegno, $importanza, $id_user);
    }
}

$id = null;

if (isset($_GET['action'])){
    $azione = $_GET['action'];
    $id = $_GET['id'];
    //Se l'id dell'impegno è corretto può eseguire l'azione, altrimenti no
    if (TodoRepository::owned($id, $id_user)) {
        //Gestisce il completamento di un impegno
        if ($azione == 'completa') {
            TodoRepository::completa($id);
        } //Gestisce il recupero del testo dell'impegno da modificare
        else if ($azione == 'modifica') {
            $impegno = TodoRepository::getImpegno($id);
            $testo = $impegno['testo'];
            $importanza = $impegno['importanza'];
        } //Gestisce l'eliminazione
        else if ($azione == 'elimina') {
            TodoRepository::delete($id);
        }
    }
}


//$todos = TodoRepository::listAllByUser($user['user_id']);



echo $template->render('crud', [
    //'todos' => $todos,
    'objects' => $objects,
    'id' => $id,
    'name' => $name,
    'categories' =>$categories,
]);