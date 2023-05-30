<?php

namespace Model;
use Util\Connection;
use PDO;

class TodoRepository{

    public static function listAll(): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT oggetto.nome AS nome, categoria.descrizione AS categoria, oggetto.descrizione AS descrizione, data_offerta, utente.nome AS offerente, oggetto.id AS id_object, id_offerente AS id_seller FROM oggetto, categoria, utente WHERE id_offerente=utente.id AND id_categoria=categoria.id AND oggetto.data_scambio IS NULL ORDER BY data_offerta DESC';
        $stmt = $pdo->query($sql);
        return $stmt->fetchAll();
    }
    public static function listUserObjects(int $id_user)
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT DISTINCT oggetto.nome AS nome, 
                categoria.descrizione AS categoria, 
                oggetto.descrizione AS descrizione, data_offerta,
                oggetto.id AS id_object,
                id_offerente AS id_seller
                FROM oggetto, categoria, utente 
                WHERE id_offerente= :id
                AND id_categoria=categoria.id
                AND id_ricevente IS NULL
                ORDER BY data_offerta DESC';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'id' => $id_user,
            ]
        );
        return $stmt->fetchAll();
    }
    public static function listUserObjectsBought(int $id_user)
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT DISTINCT oggetto.nome AS nome, 
                categoria.descrizione AS categoria, 
                oggetto.descrizione AS descrizione, data_scambio,
                oggetto.id AS id_object,
                id_offerente AS id_seller
                FROM oggetto, categoria, utente 
                WHERE id_ricevente= :id
                AND id_categoria=categoria.id
                ORDER BY data_offerta DESC';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'id' => $id_user,
            ]
        );
        return $stmt->fetchAll();
    }

    public static function viewProduct(int $id_product): ?array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT DISTINCT oggetto.nome AS nome, 
            categoria.descrizione AS categoria, 
            oggetto.descrizione AS descrizione, data_offerta, 
            utente.nome AS venditore, oggetto.id AS id_object
            FROM oggetto, categoria, utente 
            WHERE oggetto.id= :id
            AND id_categoria=categoria.id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $id_product,
        ]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public static function tokens(int $id_user): string
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT gettoni
            FROM  utente 
            WHERE utente.id= :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $id_user,
        ]);

        $result = $stmt->fetchAll();
        $tokens = '';

        foreach ($result as $row) {
            $tokens .= $row['gettoni'] . ', ';
        }

        $tokens = rtrim($tokens, ', '); // Rimuovi l'ultima virgola e lo spazio vuoto

        return $tokens;
    }


    public static function owned(string $id_todo, int $id_user): bool{
        $pdo = Connection::getInstance();
        $sql = 'SELECT id FROM todo WHERE id = :id AND id_user = :id_user';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'id' => $id_todo,
                'id_user' => $id_user
            ]
        );
        return ($stmt->rowCount() == 1);
    }

    public static function buyOggetto(int $id_oggetto, int $id_compratore, int $id_venditore): bool{
        $pdo = Connection::getInstance();
        try {
            //id devono essere diversi
            if ($id_compratore == $id_venditore)
                return false;
            //begin transaction
            $pdo->beginTransaction();
            $sql = 'UPDATE oggetto SET id_ricevente = :id_compratore, data_scambio = NOW() WHERE id = :id';
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                    'id' => $id_oggetto,
                    'id_compratore' => $id_compratore
                ]
            );
            $sql = 'UPDATE utente SET gettoni = gettoni - 1 WHERE id = :id_compratore';
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                    'id_compratore' => $id_compratore
                ]
            );
            $sql = 'UPDATE utente SET gettoni = gettoni + 1 WHERE id = :id_venditore';
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                    'id_venditore' => $id_venditore
                ]
            );
        } catch (PDOException $e) {
            //rollback if something goes wrong
            $pdo->rollBack();
            echo $e->getMessage();
        }
        //commit if everything is ok
        $pdo->commit();
        return true;
    }






}