<?php
/**
 * Questo commento serve solo a eliminare l'indicazione di errore
 * da parte di PHPStorm per la variabile $studenti
 * @var $todos
 * @var $testo
 * @var $id
 * @var $importanza
 * @var $displayed_name
 */
?>

<style>
    .name{
        background:white;
        margin-top: 2vw;
        height: 2vw;
        width: 7vw;

        text-transform: uppercase;
        text-align: center;
        border-radius: 5px;

        color: black;
        text-decoration: black;

    }
    td{
        text-transform: uppercase;
    }
    .a-name{
        color: black;
        text-decoration: black;
    }

    .h1{
        display: flex;
        justify-content: left;
        font-size: 32px;
        font-weight: 500;
        line-height: 42px;
        text-align: center;

    }
    *{
        font-family: 'Poppins',sans-serif;
        color: #080710;
        letter-spacing: 0.5px;
        outline: none;
        border: none;
    }
    .background{
        width: 430px;
        height: 520px;
        position: absolute;
        transform: translate(-50%,-50%);
        left: 50%;
        top: 50%;
    }
    .background .shape{
        height: 200px;
        width: 200px;
        position: absolute;
        border-radius: 50%;
    }

    .shape:first-child{
        background: linear-gradient(
                #1845ad,
                #23a2f6
        );
        left: -10vw;
        top: -80px;
    }
    .shape:last-child{
        background: linear-gradient(
                to right,
                #ff512f,
                #f09819
        );
        right: -15vw;
        bottom: -80px;
    }
    .a-view{
        background: linear-gradient(
                #1845ad,
                #23a2f6
        );
        color: green;
        border-radius: 5px;


    }

    .container-add{
        display: flex;
        justify-content: center;
        flex-direction: column;
        border: 2px solid rgba(255,255,255,0.1);
        border-radius: 10px;
        margin-top: 4vw;
        padding: 2vw;
        background-color: rgba(255,255,255,0.13);
        backdrop-filter: blur(10px);
        box-shadow: 0 0 40px rgba(8,7,16,0.6);
    }
    .add-category{
        display: flex;
        flex-direction: row;
    }
    .add-category-select{
        border-radius: 5px;
        background: white;
        margin-left: 2vw;
        text-align: center;

    }
    .add-section{
        border: solid;
        border-radius: 10px;
        border-width: 1px;
        justify-content: center;
        text-align: center;
        margin: 1vw;
    }
    .container-market{
        padding: 3vw; background-color: rgba(255,255,255,0.13);
        backdrop-filter: blur(10px);
        box-shadow: 0 0 40px rgba(8,7,16,0.6);border: 2px solid rgba(255,255,255,0.1);
        border-radius: 10px;
        margin-top: 4vw;
        margin-bottom: 4vw;
    }

</style>

<?php $this->layout('home', ['titolo' => 'TradeMarket - Home']) ?>

<div class="background" >
    <div class="shape"  ></div>
    <div class="shape" ></div>
</div>

<header class="navbar" style="width: 100%; margin-top: 3vw ">

    <section class="navbar-section">

    </section>
    <section class="navbar-section" style="justify-content: flex-end; display: flex; flex-direction: column">
        <a class="a-name" href="index.php" style="font-size: xx-large; color: #080710; text-decoration: #080710" > TradeMarket</a>
    </section>


    <section class="navbar-section" style="justify-content: flex-end; display: flex; flex-direction: row">
        <a class="a-name" href="index.php?action=account" style="margin-right: 1vw">
        <button class="name btn-action tooltip tooltip-bottom" data-tooltip="Account">

            <?=$name?>

        </button></a>
        <a class="a-name" href="index.php?action=logout">
        <button class="name btn-action tooltip tooltip-bottom" style="width: 2vw;" data-tooltip="Logout">

                <i class="icon icon-share"></i>

        </button></a>
    </section>
</header>
<form class="" method="POST" action="index.php">
    <div class="container-add">
        <div class="add-title" style="text-align: center; font-size: 2vw">
            <div>AGGIUNGI UN OGGETTO AL MERCATO</div>
        </div>
        <div class="add-section" >
            <div><input type="text" id="nome" name="nome" placeholder="Nome oggetto" style="text-align: center"></div>
        </div>
        <div class="add-section" style="display: flex; flex-direction: row">
            <select class="add-category-select" id="category" name="category" >
                <option value="" selected disabled hidden>Categoria</option>
                <?php foreach ($categories as $c): ?>
                <option value="<?=$c['id']?>"><?=$c['descrizione']?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="add-section" >
            <div><input type="text" id="descrizione" name="descrizione" placeholder="Descrizione oggetto" style="text-align: center"></div>
        </div>
        <div class="add-btn" style="display: flex; justify-content: center">
            <button class="a-view" type="submit" name="action" value="add" style="color: black; padding: 5px">AGGIUNGI</button>
        </div>
    </div>



<div class="container-market">
<h1 class="h1" >Mercato attuale</h1>

    <div class="form-group">
        <label for="todo">

        <!--</label><textarea name="impegno" class="form-input form" id="todo" placeholder="Aggiungi un impegno" rows="3">
<?php if ($testo != ''):?>
<?=$this->e($testo)?>
<?php endif;?></textarea>
    </div>
    <?php if ($id != null):?>
        <input type="hidden" name="id" value="<?=$id?>">
    <?php endif; ?>
    <div class="form-group">
        <select class="form-select" name="importanza">
            <?php for($i = 1; $i <= 5; $i++):?>
                <option <?php if ($importanza == $i) echo 'selected'?> >
                    <?=$i?>
                </option>
            <?php endfor;?>
        </select>
    </div>


    <button>
        <?php if ($testo == ''):?>
            Aggiungi un impegno
        <?php else:?>
            Modifica il testo
        <?php endif; ?>
    </button>
</form>-->

<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>NOME PRODOTTO</th>
            <th>CATEGORIA</th>
            <!--<th>DESCRIZIONE</th>-->
            <th>DATA OFFERTA</th>
            <th>VENDITORE</th>
        </tr>
    </thead>
    <tbody>



        <?php foreach ($objects as $object):?>
        <!--?php   if($id == $object['id_seller']): ?-->


        <tr>

            <td>

                    <?=$this->e($object['nome'])?>

            </td>

            <td> <?=$object['categoria']?> </td>
            <!--<td><?=$object['descrizione']?></td>-->
            <td><?=date('d-m-Y', strtotime($object['data_offerta']))?></td>
            <!--<?php if($todo['completato'] == 1):?>
                <td><i class="icon icon-check text-success"></i></td>
                <td><i class="icon icon-cross"></i></td>
                <td><a href="?action=elimina&id=<?=$todo['id']?>"><i class="icon icon-delete"></i></a></td>
            <?php else:?>
                <td><a href="?action=completa&id=<?=$todo['id']?>"><i class="icon icon-flag text-error"></i></a></td>
                <td><a href="?action=modifica&id=<?=$todo['id']?>"><i class="icon icon-edit"></i></a></td>
                <td><a href="?action=elimina&id=<?=$todo['id']?>"><i class="icon icon-delete"></i></a></td>
            <?php endif;?>-->
            <td> <?=$object['offerente']?> </td>

            <td><a href="index.php?action=product&id_object=<?=$object['id_object']?>&id_seller=<?=$object['id_seller']?>" class="a-view" style="color:black; padding: 5px;">VISUALIZZA</a></td>
            </tr>


        <?php endforeach; ?>
    </tbody>
</table>
    </div>


