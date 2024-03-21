-- Criação da database
create database infinityArt;
use infinityArt;

-- Criação da tabela com a informação dos ambientes aonde as obras estão inseridas
create table  ambiente (
idAmbiente int primary key auto_increment,
nomeAmbiente varchar (40),
temperaturaIdeal int,
umidadeIdeal int,
luminosidadeIdeal int
);

-- Inserir dados na tabela de obras
insert into ambiente (nomeAmbiente, temperaturaIdeal, umidadeIdeal, luminosidadeIdeal)
values ('sala1', 18, 44, 150),
	   ('quarto', 22, 40, 50),
       ('armazém', 20, 41, 120),
       ('sala2', 19, 42, 100),
       ('sala3', 18, 40, 100);
       
-- Conferir os dados inseridos
select *
from obras;
       
-- Criação da tabela que vai receber as informações do cadastro de cliente
create table cliente(
idCliente int primary key auto_increment,
nome varchar(100) not null,
tipoCliente varchar(40)
constraint chkCliente check(tipoCliente in('Colecionador', 'Museu', 'Artista')),
nomeUsuario varchar(40),
email varchar(40),
senha varchar(40),
cpf char(8),
cnpj char(14),
fkAmbiente int,
foreign key (fkAmbiente) references ambientes (idAmbiente)
);

-- Alterar o campo cpf, pois está muito pequeno
alter table cliente modify column cpf char(11);

-- Conferir se a modificação ocorreu bem
describe cliente;

-- Inserir dados na tabela com dados dos clientes
insert into cliente (nome, tipoCliente, cpf, nomeUsuario, email, senha)
values ('Marcelo', 'Artista', '01909227021', 'MarceloPereira', 'marcelopererira@gmail.com', '****'),
	   ('Pedro', 'Colecionador', '18148110018', 'PedroPires', 'pedropires@gmail.com', '****'), 
       ('Amanda', 'Artista', '24254967004', 'AmandaBanana', 'amandabanana@gmail', '*****'),
       ('David', 'Colecionador', '60945260075', 'DavidMarcelo', 'davidmarcelo@gmail.com', '****'),
       ('Torres', 'Artista', '59609317022', 'TorresJunior', 'torresjunior@gmail.com', '****');

-- Conferir os dados inseridos na tabela 
select *
from cliente;
 
 -- Atualizar as foreign key na tabela cliente
update cliente
set fkObra = 1
where idCliente = 1;

update cliente
set fkObra = 5
where idCliente = 2;

update cliente
set fkObra = 3
where idCliente = 3;

update cliente
set fkObra = 4
where idCliente = 4;

update cliente
set fkObra = 2
where idCliente = 5;

-- Conferir as alterações feitas
select idCliente, nome, fkObra
from cliente;
 
 -- Criar a tabela com informacao do sensores
create table sensores(
idColeta int primary key auto_increment,
sensor varchar(40),
informacao varchar(40),
dataColeta date, 
fkclienteResponsavel int,
constraint ckSensor check(sensor in('Umidade', 'Temperatura', 'Luminosidade')),
foreign key (fkclienteResponsavel) references cliente (idCliente)
);


drop database infinityArt;