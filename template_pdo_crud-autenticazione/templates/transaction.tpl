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
<h1>TRANSAZIONE AVVENUTA CON SUCCESSO</h1>