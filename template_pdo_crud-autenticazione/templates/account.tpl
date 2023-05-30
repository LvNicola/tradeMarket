<?php $this->layout('home', ['titolo' => 'Account']) ?>

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
        left: -15vw;
        top: 30vw;
    }
    .shape:last-child{
        background: linear-gradient(
                to right,
                #ff512f,
                #f09819
        );
        right: -10vw;
        bottom: 10vw;
    }
    .c-table{
        padding: 3vw; background-color: rgba(255,255,255,0.13);
        backdrop-filter: blur(10px);
        box-shadow: 0 0 40px rgba(8,7,16,0.6);border: 2px solid rgba(255,255,255,0.1);
        border-radius: 10px;
        margin-top: 4vw;
        margin-bottom: 4vw;
    }
</style>
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

<div style="font-size: 4vw">PROFILO</div>
<div class="c-tokens">
    <p style="font-size: 2vw">CREDITO GETTONI: <?=$token?></p>

</div>

<div class="c-table" style="margin-top: 3vw">
    <p style="font-size: 2vw">OGGETTI IN VENDITA</p>

    <?php if($objects == null): ?>
    <p>NON HAI NESSUN OGGETTO IN VENDITA</p>
    <?php else:?>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th>NOME PRODOTTO</th>
        <th>CATEGORIA</th>
        <!--<th>DESCRIZIONE</th>-->
        <th>DATA OFFERTA</th>


    </tr>
    </thead>
    <tbody>

    <?php foreach ($objects as $object):?>
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
        <td><a href="index.php?action=product&id_object=<?=$object['id_object']?>&id_seller=<?=$object['id_seller']?>" class="a-view" style="color:black; padding: 5px;">VISUALIZZA</a></td>

    </tr>

    <?php endforeach; ?>
    </tbody>
</table>

    <?php endif;?>
</div>
    <div class="c-table" style="margin-top: 3vw">
        <p style="font-size: 2vw">OGGETTI COMPRATI</p>
        <?php if($boughts == null): ?>
        <p>NON HAI COMPRATO NESSUN OGGETTO</p>
        <?php else:?>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>NOME PRODOTTO</th>
                <th>CATEGORIA</th>
                <!--<th>DESCRIZIONE</th>-->
                <th>DATA SCAMBIO</th>


            </tr>
            </thead>
            <tbody>

            <?php foreach ($boughts as $bought):?>
            <tr>

                <td>
                    <?=$this->e($bought['nome'])?>
                </td>

                <td> <?=$bought['categoria']?> </td>
                <!--<td><?=$object['descrizione']?></td>-->
                <td><?=date('d-m-Y', strtotime($bought['data_scambio']))?></td>
                <!--<?php if($todo['completato'] == 1):?>
                    <td><i class="icon icon-check text-success"></i></td>
                    <td><i class="icon icon-cross"></i></td>
                    <td><a href="?action=elimina&id=<?=$todo['id']?>"><i class="icon icon-delete"></i></a></td>
                <?php else:?>
                    <td><a href="?action=completa&id=<?=$todo['id']?>"><i class="icon icon-flag text-error"></i></a></td>
                    <td><a href="?action=modifica&id=<?=$todo['id']?>"><i class="icon icon-edit"></i></a></td>
                    <td><a href="?action=elimina&id=<?=$todo['id']?>"><i class="icon icon-delete"></i></a></td>
                <?php endif;?>-->
                <!--td><a href="index.php?action=product&id_object=<?=$object['id_object']?>&id_seller=<?=$object['id_seller']?>" class="a-view" style="color:black; padding: 5px;">VISUALIZZA</a></td-->

            </tr>

            <?php endforeach; ?>
            </tbody>
        </table>
        <?php endif;?>

</div>