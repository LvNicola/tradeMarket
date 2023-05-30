<?php $this->layout('home', ['titolo' => 'Product']) ?>

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
        left: -33vw;
        top: -80px;
    }
    .shape:last-child{
        background: linear-gradient(
                to right,
                #ff512f,
                #f09819
        );
        right: -33vw;
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
    .a-command{
        border-radius: 20px;
        padding: 2vw;
    }

    .t-p{
        font-size: 2vw;
        text-align: left;
    }

    .container{

        display: flex;
        justify-content: center;
        flex-direction: column;


    }
    .container-row{
        padding: 3vw; background-color: rgba(255,255,255,0.13);
        backdrop-filter: blur(10px);
        box-shadow: 0 0 40px rgba(8,7,16,0.6);border: 2px solid rgba(255,255,255,0.1);
        border-radius: 10px;
        margin-top: 4vw;
        margin-bottom: 4vw;
    }
    .p{
        margin-top: 3vw;
        display: flex;
        flex-direction: row;
        text-align: left;
        align-items: center;
        border: solid;
        border-radius: 10px;
        border-color: black;
        padding: 3vw;
        border-width: 1px;



    }
    .p2{
        margin-left: 2vw;
        font-size: 2vw;
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

<div class="container">
    <div class="container-row">
    <div class="p" style="border: none; justify-content: space-between; text-align: center;">
        <div class="t-p" style="text-align: center; padding-left: 10vw "><?=$object['nome']?></div>
        <?php if($id_user == $seller): ?>
        <div class="container-obj-btn " style="padding-right: 10vw">
            <a href="index.php?action=delete&id_object=<?=$object['id_object']?>" class="a-command" style="background: linear-gradient(
                to right,
                #ff512f,
                #f09819
        ); color: black; border-radius: 30px">RIMUOVI</a>
        </div>
        <?php else:?>
        <div class="container-obj-btn " style="padding-right: 10vw">
            <a href="index.php?action=buy&id_object=<?=$object['id_object']?>&id_seller=<?=$seller?>" class="a-command" style="background: linear-gradient(
                #1845ad,
                #23a2f6
        ); color: black; border-radius: 30px">ACQUISTA</a>
        </div>
        <?php endif;?>


    </div>

    <div class="p">
        <div class="t-p"> CATEGORIA</div>
        <div class="p2"><?=$object['categoria']?></div>
    </div>
    <div class="p">
        <div class="t-p">DESCRIZIONE</div>
        <div class="p2" style="font-size: 1vw"><?=$object['descrizione']?></div>
    </div>
    <?php if($id_user == $seller): ?>

    <?php else:?>
    <div class="p">
        <div class="t-p">VENDITORE</div>
        <div class="p2"><?=$object['venditore']?></div>

    </div>
    <?php endif;?>
    </div>

</div>
<div style="margin-bottom: 5vw"></div>