create database unilab;
use unilab;

create table nivel_acesso(
id int(100) not null primary key,
nome varchar(45)
);

create table users(
id int(100) not null primary key,
nome varchar(45),
senha varchar(45),
nivel_acesso int(100)
);

create table user_has_nivel_acesso(
user_id int(100) primary key,
nivel_acesso_id int(100),
foreign key (nivel_acesso_id) references nivel_acesso(id),
foreign key (user_id) references users(id)
);

create table solicitacoes(
id int(100) not null primary key,
dados varchar(45),
user_id int(100),
foreign key (user_id) references users(id)
);

create table relatorio(
id int(100) not null primary key,
nome varchar(45),
dados varchar(45),
data_1 date
);

create table aluno(
id int(100) not null primary key,
aluno varchar(45),
user_id int(100),
foreign key (user_id) references users(id)
);

create table matricula(
id int(100) not null primary key,
matricula varchar(45) not null,
plano_trabalho int(100) not null,
aluno_id int(100),
foreign key (aluno_id) references aluno(id)
);

create table curso(
id int(100) not null primary key,
curso varchar(45),
matricula_id int(100),
foreign key (matricula_id) references matricula(id)
);

create table instituto(
id int(100) not null primary key,
instituto varchar(45),
matricula_id int(100) not null,
curso_id int(100),
foreign key (curso_id) references curso(id)
);

create table edital(
id int(100) not null primary key,
date_start date,
date_end date,
user_id int(100),
foreign key (user_id) references users(id)
);

create table avaliacao(
id int(100) not null primary key,
corretor varchar(45),
dados varchar(45),
date_avaliacao date
);

create table projeto(
id int(100) not null primary key,
nome varchar(45),
date_projeto date,
avaliacao_id int(100),
edital_id int(100),
foreign key (avaliacao_id) references avaliacao(id),
foreign key (edital_id) references edital(id)
);

create table plano_trabalho(
id int(100) not null primary key,
plano varchar(45),
cota varchar(45) not null,
projeto_id int(100),
foreign key (projeto_id) references projeto(id)
);

create table cota(
id int(100) not null primary key,
cota varchar(45),
tipo varchar(45),
agencia varchar(45),
modalidade varchar(45),
start_cota time,
end_cota time,
carga_hora int(100),
frequencia int(100),
cota_id int(100),
plano_trabalho_id int(100)
);

create table funcao(
id int(100) not null primary key,
funcao varchar(45)
);

create table equipe(
id int(100) not null primary key,
start_equipe date,
end_equipe date,
carga_hora int(100),
tipe varchar(45),
equipe_id int(100),
projeto_id int(100),
foreign key (equipe_id) references equipe(id),
foreign key (projeto_id) references projeto(id)
);

create table docente(
id int(100) not null primary key,
equipe_id int(100),
foreign key (equipe_id) references equipe(id)
);

create table frequencia(
id int(100) not null primary key,
referente_mes_ano varchar(45),
data_frenquencia date,
envio date,
valida date,
carga_hora int(100),
cota_id int(100),
foreign key (cota_id) references cota(id)
);

create table atividade(
id int(100) not null primary key,
atividade_start date,
atividade_end date,
descricao varchar(45),
dia date,
frequencia_id int(100),
foreign key (frequencia_id) references frequencia(id)
);