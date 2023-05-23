create table categoria
(
    id int unsigned auto_increment
        primary key,
    descrizine text not null
);

create table utente
(
    id int unsigned auto_increment
        primary key,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    email varchar(100) not null,
    username varchar(50) not null,
    password varchar(50) not null,
    gettoni int unsigned not null
);

create table oggetto
(
    id int unsigned auto_increment
        primary key,
    nome varchar(100) not null,
    descrizine text not null,
    id_categoria int unsigned not null,
    immagine varchar(200) not null,
    data_offerta datetime not null,
    data_scambio datetime not null,
    id_offerente int unsigned not null,
    id_ricevente int unsigned not null,
    constraint categoria___fk
        foreign key (id_categoria) references categoria (id)
            on update cascade,
    constraint oggetto_utente_fk
        foreign key (id_offerente) references utente (id)
            on update cascade,
    constraint oggetto_utente_id_fk
        foreign key (id_ricevente) references utente (id)
            on update cascade
);

create table messaggio
(
    id int unsigned auto_increment
        primary key,
    testo text not null,
    data_ora datetime not null,
    id_oggetto int unsigned not null,
    id_mittente int unsigned not null,
    id_ricevente int unsigned not null,
    constraint messaggio_oggetto_null_fk
        foreign key (id_oggetto) references oggetto (id)
            on update cascade,
    constraint messaggio_utente_fk
        foreign key (id_mittente) references utente (id)
            on update cascade,
    constraint messaggio_utente_null_fk
        foreign key (id_ricevente) references utente (id)
            on update cascade
);

create index categora_fk
    on oggetto (id_categoria);