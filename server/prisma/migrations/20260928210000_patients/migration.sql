CREATE TABLE `patients` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `source_code` INTEGER NOT NULL,
  `record_number` VARCHAR(40) NULL,
  `full_name` VARCHAR(180) NOT NULL,
  `sex` INTEGER NULL,
  `marital_status` INTEGER NULL,
  `cpf` VARCHAR(14) NULL,
  `email` VARCHAR(180) NULL,
  `phone` VARCHAR(40) NULL,
  `birth_date` DATE NULL,
  `insurance_code` INTEGER NULL,
  `notes` TEXT NULL,
  `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `patients_source_code_key` (`source_code`),
  INDEX `patients_full_name_idx` (`full_name`),
  INDEX `patients_cpf_idx` (`cpf`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038422, '248', 'Abigail De Araujo Vieira', 2, 2, '03172808211', NULL, NULL, '1995-01-30', 3, 'deseja engravidar, alega que o metodo contraceptivo que fazia uso da pilula do dia seguinte.
conduta: usgtv, exames lab.

04/03/24
apresenta resultado de exames, exames lab ndn.
histerssalpinografia 19/05/21  trompas pervias
espermograma maioria sptz imovel.
Conduta: encaminhamento para urologia, aguardo de usgtv.

---------------
Paciente refere presenças de lesões bolhosas em região íntima com tratamento com parceiro com a ciclovia sem melhoras solicita exames laboratoriais ultrassom transvaginal alega também que tomou algum chás caseiro e que saiu descamação de endométrio interroga possível gravidez solicita exames laboratoriais retorno para elucidação do diagnóstico

conduta: exames lab, preventivo, usg tv', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61071133, '763', 'Ada Cleia Sichinel Dantas Boabaid', 2, 0, NULL, NULL, '(69) 9239-8271', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59070729, '306', 'Adelayde Lima', 2, 0, NULL, NULL, '(69) 9351-9769', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61515013, '860', 'Adria Rafaela Panoff', 2, 1, '02580493247', NULL, '(69) 9955-7923', '1995-12-11', 1, 'idade: 30 anos 
G0 P0 
DUM: 19/04
MC: DIU DE COBRE- INSERCAO EM DEZ DE 2025
UPCCU: JANEIRO DE 2026
SONO: SONO INTENSO
INTESTINO: REGULAR
EXERCICIO FISICO: REGULAR 

QP: AVALICAO DE NINFOPLASTIA 

PRESENCA DE HIPERTROFIA CLITORIANA 
PRESENCA DE HIPERTROFIA DE PEQUENOS LABIOS 

AO ESPECULAR:
COLO CILINDRICO PRESENCA DE FIO DE DIU, PRESENCA DE SECRECAO ESBRANQUICADA, E AMARROZADA, COM GRUMOS EM PAREDE

CONDUTA: 
ORIENTACOES
REALIZAR NINFOPLASTIA E PERINEO POSTERIOR, PACIENTE CIENTE QUE NAO SERA REALIZADO NENHUM PROCEDIMENTO NO CLITORIS, VALOR TOTAL 7200,00, INCLUSO OS 2 LASER INTRAOPERATORIO E DIA ANTERIOR 
TERICIN AT 

--------------
10/06
PACIENTE VEM PARA RETIRADA DO PONTOS 
FACO FOTO, RETIRO PONTOS ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060803, '284', 'Adriana Araujo Moreira', 2, 2, '05038914284', NULL, NULL, '1990-07-06', 3, 'Q.P: paciente refere secreção vaginal esbranquiçada, com odor e puriginosa.
conduta: secnidazol, gynotran, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59581969, '523', 'Adriana de Mesquita Silva de Oliveira Costa.', 2, 2, '42055555200', NULL, '(69) 9965-3369', '1971-05-05', 1, 'histerectomia miomatose uterina há 1 ano
G4 P1 A3
UPCCU: 2025

PACIENTE ALEGA QUEDA CAPILA, VAI REALIZAR EXAMES LAB 


CONSULTA CASAL 350,00 REAIS CADA.

07/07/2025
ID: 54 ANOS 
DN: 05/05/1971
DUM: 19/02/2024
UPCC: NOV 2024 
MMG: NOV 2024
MEDICAÇÃO EM USO: TRIPLINEX- COLIRIO , VITAMINA D 15.000 VI SEMANAL, PIELOX / MINOXIDIL, PANTOGAR
CIRUGIAS: HISTERECTOMIA, CESÁREA, PROTESE MAMARIA.
COMORBIDADES: GLAAUCOMA OCULAR, ANSIEDADE, CLAUTOFOBIA.
ALERGIA: IADO
VACINA: OK
ACIDENTE AUTOMIVO 1993, PROTESE NA CBÇ, FEMUR. 

DENSITOMETRIA OSSEA NEGA, EXERCICO FISICO REGULAR DE SEGUNDA A SEXTA, MUSCULAÇÃO, SONO INSONIA QUANDO ESTÁ ANSIOSA, F INTESTINAL CONSTIPAÇÃO DISBIOSE.
LIBIDO: OK
RELAÇÃO SEXUAL 1X NA SEMANA, CONSEGUE CHEGAR AO ORGASMO, VAGINA NORMAL , FAZ USO DE GEL LUBRIFICANTE MAIS AO LADO DO PARCEIRO.
Q.P: QUEDA CAPILAR, HIPERCROMIA FACIAL +- 5 ANOS.

CONDUTA: PROXIMO LASER CAPILAR SEGUNDA.
---------------------------------------------------------------------
ESPOSO LEVI DE OLIVERA COSTA

ID: 62 ANOS
DN: 12/01/1963
HERNIA UMBILICAL, HERNIA DE ESPIGAL : C GERAL.
COMORBIDADES: HAC, NÃO TOMA MEDICAÇÃO.
MEDICAÇÃO: COMODART H.P.B
PSA: FEV 2025, FAZ ACOMPANHAMENTO UROLOGISTA.
VACINA: OK 
EXERCICO FISICO EVENTUALMENTE, SONO NORMAL, F. INTESTINAL TODOS OS DIAS, DENSITOMETRIA OSSEA NEGA, LIBIDO EJACULAÇÃO PRECOCE.
CIRUGIAS: COLUNA HERINIA DE DISCO.

Q.P: PACIENTE REFERE GINECOMASTIA, REALIZADO USG DE MAMAS, REFERE DIFICULADADE NA PERDA DE PESO, PESO 110 KG.
-------------------------------- /// -----------------------

15/07/2025
ADRIANA DE MESQUISA
RESULTADO DE EXMAES 
Hemograma do dia 10/07/2025 hemoglobina 12,9 hematócrito 37,3 vcm 90,1 LEUCOCITOS  5240 PLQUETA 229000
Hemoglobina glicada 5% tsh 1,50 t 4 livre 1,08 fsh 99,42 LH 47,84 como cisteína 15,33 Vitamina D 39,7 Vitamina A 0,61 Vitamina B12 372 estradiol 19,4 progesterona 0,21, Zinco 100 cobre 79,8 insulina 12,2 ácido úrico 4,1 tgo 18 tgp 16gama GT 28 glicose 81 triglyceride 80 colesterol 218 HDL 68 ldl 134 ureia 40 creatinina 0,8 cálcio 10,3 magnésio 1,7 e há esse não infeccioso

REPOSICA DE VITAMINA D, VIT B 12, MAGNESIO, COBRE


LEVI
RESULTADO DE DENSITOMETRIA OSSEA

----------------  // ------------------------
ORCAMENTO DA ADRIANA 
VITAMINA D, B12, K2MK7 480,00
MAGNESIO, COBRE, SORO 350,00
TOTAL: 830,00

ADEK + B12, D, SORO = TOTAL 1130,00





RETORNO DE 29/-7/2025
ADRIANA
USG DE ABDOME TOTAL: 16/07: NORMAL 
USG DE PAREDE ABDOMINAL 16/07 : NORMAL
DENSITOMETRIA OSSE 16/07: OSTEOPENIA 

CONDUTA: 
MAGNESIO DIMALATO 260 MH 
1 COMPRIMIDO AS 7 H 
MAGNESIO L TRONATO 260
01 CP AS 21H
GLICINA 300 MH 
1 CP AS 21H 
_________________________// +____________________

ESPOSO LEVI DE OLIVERA COSTA

ID: 62 ANOS
DN: 12/01/1963
HERNIA UMBILICAL, HERNIA DE ESPIGAL : C GERAL.
COMORBIDADES: HAC, NÃO TOMA MEDICAÇÃO.
MEDICAÇÃO: COMODART H.P.B
PSA: FEV 2025, FAZ ACOMPANHAMENTO UROLOGISTA.
VACINA: OK 
EXERCICO FISICO EVENTUALMENTE, SONO NORMAL, F. INTESTINAL TODOS OS DIAS, DENSITOMETRIA OSSEA NEGA, LIBIDO EJACULAÇÃO PRECOCE.
CIRUGIAS: COLUNA HERINIA DE DISCO.

USG DE REGIAO INGUINAL  01/07/25:  HERNIA UMBILICAL 
USG DE ABDOME TOTAL 30/05/25: NORMAL 
VITAMINA C 0,14
DENSITOMETRIA OSSE 10/07/2025: OSTEOPENIA EXAMES LAB 15/07:
Hemograma do dia 8 do 7 hemoglobina 15,7 e matou 44,7 leu 4230 plaqueta 337000 hemoglobina glicada 5,9 tsh 2,10 t 4 livre 1,05 como cisteínas 18,36 zinco 82 ácido úrico 4,8 gama GT 27 triglicerídio 92 colesterol 211 uréia 36 creatinina 0,90 cálcio 9,9 magnésio 1,8 FOSFATASE ALCALINA  84 urina não infeccioso Vitamina D, 3 cobre 97 insulina 18 Vitamina A 0,5 vitamina B12 336
FAZENDO USO DE VITAMINA D 15 SEMANAL 




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59055963, '269', 'Adriana Do Nascimento Santana', 2, 2, '05038914284', NULL, NULL, '1975-09-10', 3, 'Retorno/ apresentar resultados de exames.
preventivo 22/06/22 negativo para neoplasia + candidiase.
exames lab 07/07/22 ndn, digo fsh 40, lh 24,89, vit d 24, col 18.
mmg 25/07/22 bi-rads 1
conduta: alta d 7000 vi, vivosso, amora+ isoflavona 2x ao dia.

retorno 19/01/24
alega uso de isoflavona no momento vem para rotina ginecologica.
conduta: exames lab, exames de imagem.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59156158, '391', 'Adriana Do Nascimento Santana', 2, 0, '61260070263', NULL, '(69) 99229-8866', '1975-09-10', 3, 'IDADE 48 ANOS 
UPCCU: 2021
G5 P5 A0
MC LT 
DUM: JAN / 2025
MMG: ----

QP: PACIENTE REFERE FOGACHO NOTURNO,  

CONDUTA: ORIENTACOES, SOLICITO EXAMES LAB , MMG, USG TV 

17/04/2025

PACIENTE VEM PARA COLETA DE PREVENTIVO
AO EXAME:
COLO ANTERIOR, MUCO HIALINO
CONDUTA: ORIENTACOES, COLETADO PREVENTIVO

07/05/2025

PREVENTIVO: (ASC - US)

CONDUTA: COLPOSCOPIA VALOR 600,00

28/05: PACIENTE VEM PARA APRESENTAR RESULTADO DE EXAMES:
Triglicerídeos 103,7 colesterol 196 HDL 52, Ldh 122 glicemia 92 urina oxalato de cálcio 2 cruzes ligeiramente turvo hemoglobina 11 hematócrito 37 leucócitos 6560 plaquetas 362 Vitamina D 19,2 vitamina B12 487 estradiol 29 fsh 28,9 hemoglobina glicada 5,6 LH 17,06 progesterona 0,32 testosterona 23 t 4 livre 1,12 testosterona livre 35,6 tsh 1,2 urocultura não houve crescimento bacteriano

CONDUTA: ORIENTACOES, REPOSICAO DE VITAMNIA D E B12 , K2MK7 R$ 400,00 - fazer manutecao para casa 
aguardo realização de colposcopia  VALOR 600,00

--------------------------------------------------------------------------------------------------------------------------

08/09

29/04/2025  PREVENTIVO: Células escamosas atípicas de significado indeterminado (ASC - US)

PACIENTE NAO REALIZOU COLPOSCOPIA, SEM QUEIXAS NO MOMENTO DA CONSULTA 

CONDUTA: 
ORIENATCOES 
COLPOSCOPIA E COLETA DE PREVENTIVO MEIO LIQUIDO 
SOLICITO USG DE MAMAS, USG TV, MMG , EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61090172, '771', 'Adriana dos Santos Silva', 2, 0, '03540714243', NULL, '(69) 9210-9632', '1997-06-20', 1, 'IDADE: 28 ANOS 
DUM: 06/02/2026
DIU DE COBRE
UPCCU: OUT 2025 ( SEM RESULTADO) 

PACIENTE VEM COM QUEIXAS DE FLACIDEZ VAGINAL, COM PUM VAGINAL, DIMINUICAO DA LIBIDO 

CONDUTA: 
ORIENATCOES 
LASER INTIMO, OBSERVO SECRECAO AMARELADA COM ODOR - observo maior área de flacidez no meio do canal vaginal 
FLUCONAZOL DOSE UNICA

-----------------
17/01/2026 
VEM PARA COLETA DE PREVENTIVO

ao exame;
 colo centralizado, visualizo fio do diu
seccrecao amarelada com grumos em parede, com odor forte 

conduta: 
orientações
coletado preventivo em meio liquido  
exames lab 
ginotran 2 caixas, fluconazole hoje e repetir com 7 dias
secnidazol para o casal
ginobiotta 
-----------
07/05/2026
REPOSICAO DE VITAMINAS INJETAVEL 
580,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59056303, '271', 'Adriana Molino De Castro', 2, 2, '05038914284', NULL, NULL, '1988-11-06', 3, 'paciente refere dispareunia proxima ao ciclo menstrual, lombalgia, sangramento escuro nos primerios 3 dias, apos 7 dias ocorreu sangramento vaginal durante 5 dias, neste mês a mentruação desceu normal, duração 3 dias, fluxo normal, porém com 3 dias apresentou sangramento novamente.
pa 130x 80 mmghg.
conduta: exames lab, mrpa, eliana ciclo.
 08/01/24
paciente retorna, alega que não consegiu realizar os exames, pa 130x80mg fazendo o uso de losar 50mg dia e aas, alega metarrogia.

06/02/24
paciente refere historia de pa 220x130 mmhg em ps.
exames lab 30/01/24
hb 13,90, ht 42,10, leuc 14,490, fsh 3,67, lh 1,26, tsh 1,87, t4 livre 1,39, glicose 98, bhcg negativo.
Conduta: cardiologista, solicito sorologia, programar preve', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61502699, '855', 'ADRIELE BATISTA DE SOUZA', 2, 0, '02969039222', NULL, '(69) 99327-5317', '1998-02-04', 3, '28 ANOS 
GO PO 
DUM: 10/04
UPCCU: 2021
MC: NENHUM 
QP: PACIENTE GESTANTE, VEM PARA INICIAR PRE NATAL 
BETA HCG POSITIVO 07/05/2026

NOME: ADRIELE BATISTA DE SOUZA


USO ORAL



1.	PARACETAMOL 500 MG ___________01 CAIXA
Tomar 01 comprimido VO 6/6 horas, se dor ou febre 

2.	MECLIN 25 MG ____________________01 CAIXA
Tomar 01 comprimido VO, 8/8 horas, se náuseas ou vômito 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59036621, '239', 'Adriele Beatriz Leite', 2, 1, '05038914284', NULL, NULL, '2003-01-03', 3, 'Exames lab 03/07/24
hb 13, ht 41, leuc 8,300, plq 28 0 300, eas não infeccioso, glicose 73, col 171, trig 171, cret 0,58, bhcg -, tsh 1,56, t4 livre 1,06.

Conduta: usgtv.

Retorno 30/01/25
usgtv 30/11/24
utero 70,4 cm, od 10, oe 9,5 
exame normal.
Conduta:orientações.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60635364, '694', 'ADRIELE BRITO DO PRADO', 2, 0, '00961378271', NULL, '(69) 98147-2852', '1991-08-02', 3, '07/06/2023 USG TV : UTERO 92,57 MIOMA SUBSEROSO, OD 4,58. 0E 8,39 
22/05/2025: INCONTAVEIS PIOCITOS, REALIZOU TTO COM CEFALEXINA
PACIENTE REFERE SECRECAO ESBRANQUICADA, PRURIGINOSA, SEM ODOR 

CONDUTA: UROCULTURA, GYNOTRAN ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060716, '281', 'Adriele Dayane Olivera Melo', 2, 1, '05038914284', NULL, NULL, '1992-03-06', 3, 'Q.P: disminorreia, irregularidade menstrual, disuria.
Conduta: exames lab, usgtv, programar colposcopia.

03/04
apresenta resultado de exame 15/03/23
hb 12,2, leuc 7,200, plq 337,400, glicose 78, trig 87, colesterol 202, tgo 12, tgp 10, ureia 25, creat  0,61.

Conduta: aguardo usgtv, preventivo, dieta, caminhada diaria 30 min, repetir perfil  lipidico 30 dias.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59156205, '392', 'Adriele Satana Dos Santos Souza', 2, 0, '05669665228', NULL, '(69) 99229-8866', '2001-04-05', 3, 'IDADE: 23 ANOS
DUM:  08/03
G1 P1 
MC: DIU DE COBRE 

PACIENTE REFERE DISPAREUNIA, REFERE SECRECAO VAGINAL COM ODOR , PIORA APOS RELACAO SEXUAL E MENSTRUACAO

CONDUTA: ORIENTACOES, USG TV , AGUARDO EXAMES LAB 

17/04/25:
AO EXAME
COLO ANTERIOR, PRESENCA DE SECRECAO ESBRANQUICADA, COM GRUMOS EM PAREDE 
COLETADO PREVENTIV, GYNOTRAN, SECNIDAZOL

07/05: PACIENTE VEM PARA RETORNO COM RESULTADO DE PREVENTIVO 29/04: NEGATIVO PARA NEOPLASIA
APRESENTA USG TV UTERO 135,  ENDOMETRIO 6MM, OD 10,2, OE 8,6, DIU NORMOPOSICIONADO 
PACIENTE REFERE QUE FEZ O USO DA MEDICAO E OBTEVE MELHORA NO QUADRO CLINICO 
CONDUTA: ORIENTCAOES, ROTINA GINECOLOGICA SEMESTRAL OU ANTES SE INTERCORRENCIAS ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59106891, '344', 'Adrieli Camargo da Silva', 2, 0, '06366354227', NULL, '(69) 9244-0076', '2000-11-19', 1, 'idade:24 anos 
DUM: 12/03
MC: ACI MENSAL

ALERGIA NEGA
UPCCU: FINAL DE 2024
COMORBIDADES: NEGA 
MEDICACAO NEGA 

QP: PACIENTE REFERE INCOMODO COM VESTIMENTA, DOR NA RELACAO SEXUAL, VERGONHA DO PARCEIRO, DA DEPILADORA, VERGONHA DA REGIAO INTIMA

AO EXAME:
HIPERTROFIA DE PEQUENOA LABIO, ESCURECIMENTO DE REGIAO INTIMA E FLACIDES DE GRANDES LABIO 
8 MIL

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59191482, '421', 'Adrielly Beatriz Leite Rolom', 2, 0, '03957457211', NULL, '(69) 99244-4169', '2003-01-03', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61013670, '742', 'Adrielly Forcelini Scandolara', 2, 0, '02247605214', NULL, '(97) 8453-9186', '2005-06-22', 1, 'menarca: 13 anos 
sexarca 17 anos 
3 parceiros 
dum: 18/01/2026
mc: aco belara -  duracao de 7 dias, fluxo aumentado, 
nega medicação/ alergia/comorbidade
paciente refere que faz faculdade de medicina no Paragaui, retorna dia 05/-2/2026
nunca realizou preventivo 
conduta: usg tv 
deseja implanon


PACIENTE REALIZOU A INSERÇÃO DO IMPLANON EM HUMAITA, NO DIA 31/01/26.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58938371, '91', 'Adrielly Honorato da Silva Prieto', 2, 0, '03599497206', NULL, '(69) 9208-3718', '2000-06-19', 1, 'IDADE 24 ANOS
DUM: 12/03/25
MC: IMPLANON

PACIENTE VEM PARA RETIRADA E INSERCAO DE NOVO IMPLANON, ASSINA TERMO DE CONSENTIMENTO 

PACIENTE EM BRACO ESQUERDO FLETIDO, ASSEPSIA, ABERTURA COM BISTURI, RETIRADA DO BASTAO DE IMPLANON, PACIENTE VISUALIZAD O IMPLANTE
INSIRO NOVO IMPLANTE DE IMPLANON EM BRACO ESQUERDO, PACIENTE SENTE O IMPLANTE NO BRACO, REALIXO CURATIVO COMPRESSIVO
RECEITA DE CEFADROXILA, TRIPLO A , E HIRUDOID', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61908491, '942', 'Adriely Acioly Melo', 2, 2, '04814200293', NULL, '(69) 98479-9485', '1999-04-29', 1, 'Paciente vem junto com a Sogra Campanha da Amizade', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61914969, '945', 'Alawara Bezerra Brito', 2, 1, '06389084269', 'alawarabezerrabrito@gmail.com', '(69) 99609-0163', '2007-09-03', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59027513, '209', 'Albelina Brasi', 2, 2, '62646184204', NULL, '(69) 9373-8826', '1974-08-25', 1, '50 anos

paciente refer dor em baixo ventre, nega sinussorragia, nega dispareunia 
ao exame:
colo centralizado, presença de polipo endometrial, presença de secreção esbranquiçada com bolhosas 

conduta: orientcoes
solicito anatomopatológico
metronidazol 400 mg 12/12 horas por 7 dias, triplo a, secnidazol
2 º dose de vitamina d e b 12 
melatonina e magnesio dimalato

28/10/2025
51 ANOS 
DUM: MENOAUSA 45 ANOS 
G2 P2 A0
LT
PACIENTE SEM QUEIXAS NO MOMENTO DA CONSULTA, NEGA SANGRAMENTO, NEGA SAIDA DE SECRECAO VAGINAL, NEGA DISPAREUNIA
REFERE PERDA URINA AOS PEQUENOS ESFORCOS 
05/04 RETIRADA DE POLIPO 
nao esta fazendo uso de medico nem suplementação 

CONDUTA: 
ORIENTACOES
EXAMES LAB 
---------------
16/04/2026
COLO CENTRALIZADO, SECRECAO EM GRUMO ESVERDEADA, COM ODOR 

CONDUTA
SECNIDAZOL
GYNOTRAN 2 CAIXAS 
GINOBIOTTA 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61950326, '962', 'Alcione Gomes da Silva', 2, 0, '52864464268', NULL, '(69) 99265-6241', '1987-02-20', 3, '39 anos 
dum: 09/08/2026
mc: PRESERVATIVO
G1 P1C A0
MENARCA 12 ANOS 
UPPCU: HA 3 ANOS 

QP: VEM PARA ROTINA GINECOLOGICA 

mamas: ausencia de nódulos 
presença de nodulo em hipocondria esquerdo ( lipoma )
PA 120 X 80 MMHG
PESO 77 KG 

CONDUTA: 
ORIENTACOES 
EXAMES LAB
USG DE MAMAS
USG TV 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62171990, '992', 'ALCIONE NUNES ALVES DE ABREU', 2, 0, '72264810220', NULL, '(69) 99200-3107', '1981-12-21', 3, 'ANAMNESE GINECOLÓGICA

Paciente: Alcione Nunes Alves de Abreu
Idade: 44 anos.

Queixa principal:
Sangramento uterino anormal persistente, apesar do uso de progestagênio, em acompanhamento para tratamento cirúrgico.

História da doença atual:
Paciente de 44 anos, G2P2A0, com diagnóstico de endometriose e miomatose uterina, em acompanhamento ginecológico com Dr. Eduardo Tammes. Encontra-se com histerectomia programada pelo SUS. Refere uso atual de Dienogeste e Primolut-Nor®, porém evolui com manutenção de sangramento uterino anormal.
Apresenta ultrassonografia transvaginal realizada em 04/08/2026, evidenciando útero aumentado de volume, com volume estimado em 179 cm³, apresentando duas formações miometriais intramurais na parede anterior, medindo aproximadamente 35 × 32 mm, além de formações subserosas na parede anterior, medindo aproximadamente 16 mm e 13 mm. Endométrio medindo 6 mm. Ovário direito com volume de 12,4 cm³ e ovário esquerdo com volume de 13,9 cm³.
Quadro compatível com leiomiomatose uterina associada a sangramento uterino anormal, em paciente com antecedente de endometriose e tratamento cirúrgico definitivo já programado.

Antecedentes pessoais:
Hipertensão arterial sistêmica.
Endometriose.
Nega outras comorbidades informadas.

Alergias:
Penicilina.

Antecedentes cirúrgicos:
Sem cirurgias prévias informadas.
Histerectomia programada pelo SUS.

Antecedentes ginecológicos:
Menarca aos 14 anos.
Endometriose.
Miomatose uterina.
Sangramento uterino anormal persistente.
Antecedentes obstétricos:
G2 P2 A0.
Hábitos de vida:
Realiza atividade física, principalmente caminhada.

Exames complementares:
USG transvaginal – 04/08/2026:
Útero: 179 cm³, aumentado de volume.
Miométrio: duas imagens intramurais em parede anterior, maior medindo 35 × 32 mm.
Imagens subserosas em parede anterior, medindo 16 mm e 13 mm.
Endométrio: 6 mm.
Ovário direito: 12,4 cm³.
Ovário esquerdo: 13,9 cm³.
Impressão diagnóstica:
Leiomiomatose uterina (miomas intramurais e subserosos).
Útero aumentado de volume.
Sangramento uterino anormal provavelmente relacionado à miomatose uterina.
Endometriose pélvica, conforme antecedente.

Conduta registrada
Paciente em tratamento hormonal, porém mantendo sangramento uterino anormal. Considerada terapia antifibrinolítica com ácido tranexâmico (Transamin®) para controle do sangramento, enquanto aguarda tratamento cirúrgico definitivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61588234, '874', 'Aldelaine Camilo dos Santos Monteiro', 2, 0, '74035916234', NULL, NULL, '1986-05-31', 1, 'IDADE: 40 ANOS
G3 P2 A1
DUM: 12/05/2026
MC: VASECTOMIA 
UPCCU: JAN 2026
USG TV JAN 2026
USG DE MAMAS JAN 2026 BI RADS 2 
SONO: REPARADOR
INTESTINO: REGULAR
EXERCICIO FISIO REGULAR - DIARIO 
ALERGIA :  MINESULIDA 
CIRURGIAS PREVIAS : EXTRACAO DENTARIA 

QP: PACIENTE VEM PARA AVALICAO DE POSSIVEL NINFOPLASTIA 

PACIENTE APRESENTA PREGA ACESSORIA BILATERAL, HIPERTROFIA E ASSIMETRIA ( LADO ESQUERDO MAIS ALTO), 
NINFOPLASTIA E PREGA ACESSORIA 





ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: Aldelaine Camilo dos Santos Monteiro
Procedimentos:
•	Labioplastia
•	Correção de Prega Acessória
 
Prezada Aldelaine,
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia.
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
A associação com a correção de prega acessória permite um resultado mais completo, proporcionando melhora estética, maior conforto íntimo, aumento da autoestima e bem-estar funcional.
 
Valor dos Procedimentos:
R$ 11.500,00 Crédito  em 10 
2.500,00 á vista 
 
Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação do pós-operatório (uma no pré-operatório imediato e outra no dia anterior ao 
•	
•	
•	procedimento).
•	Este orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou início do parcelamento.

Atenciosamente,

Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038447, '249', 'Aldeneide A da silva', 2, 2, '05038914284', NULL, NULL, '1981-10-23', 3, 'entega de resultado de preventivo 19/10/22 negativo para neoplasia+ grandenella.
conduta: metronidazol, secnidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61983809, '968', 'Alessandra Corsini Fernandes', 2, 2, '00554608286', 'alessandra_corsinefernandes@hotmail.com', '(69) 99974-3352', '1994-06-01', 1, 'Paciente Alessandra Corsini Fernandes, 32 anos.
Puérpera há aproximadamente 3 meses, Paciente realizará Consulta para Solicitar Exames, se Necessário, e USG, Caso Indicado.
Deseja Também Orientação sobre o melhor método contraceptivo para prevenção de nova Gestação
_____________________________
17/08/2026
PLANO DE SAUDE UNIMED 
32 ANOS 
ARIQUEMES 
G1 Pc A0 11 05/26
MC: -----
UPCCU: 25/ SET / 2025
COMORBIDADES: BARIATRICA  
ALERGIA: NEGA 
PROTESE MAMÁRIA 29/09/26
HISTORIA DE CA DE MAMA  NA MAE 

QP PACIENTE POS CESAREA DESEJA CONTRACEPCAO, NAO AMAMENTA 

PACIENTE DESEJA SOLICITAR DIU DE MIRENA PELA UNIMED
REALIZAR USG TV E PREVENTIVO NA CLINICA NO PARTICULAR 

SOLCITO EXAMES LAB / USG DE ABDOME TOTAL E USG DE MAMAS', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60695302, '698', 'Alessandra dos Santos Guimarães', 2, 0, NULL, NULL, '(97) 8108-8384', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061414, '293', 'Alexandra Cunha De Araujo', 2, 3, '05038914284', NULL, NULL, '2024-12-06', 3, 'Paciente refere dor em baixo do ventre, secreção esbranquiçada com purido.
especular: secreção amarelada fluida, com odor.
Conduta: metronidazol, secnidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58983019, '147', 'Alexsandra Cunha De Araujo', 2, 0, '74862383220', NULL, '(69) 99250-5779', '1981-03-20', 3, 'retorno 
paciente refere melhora do quando clinico 

ao exame:
colo centralizado, presença de secreção amarela, com odor

conduta: metronidazol creme vaginal e secnidazol

30/05/2025
paciente com queixade secreção vaginal amarelada, com odor e pruriginosa
secnidazol e metronidazol creme vaginal ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61799528, '914', 'Alice Jesus Dias Rocha', 2, 1, '08287967260', NULL, '(69) 99233-5339', '2008-11-10', 3, 'Paciente primeira Vez Alice Jesus sobrinha da Ednelza Cortesia
PACIENTE ACOMPN HADA DA SOGRA ARIANA 

ATLETA - JOGA FUTEBOL 

MC: 
ACI MENSAL - 06/07
DUM: ----

PACIENTE FEZ USO DE ACI PAROU POR CONTA PRÓPRIA E RETORNOU EM JULHO 
RETORNO COM RESULTADO DE EXAMES: 

VITAMINA B 12 457 E VIT D 30, DEMAIS NORMAL
USG TV13/07: NORMAL

CONDUTA: REPOSICAO DE VIT B E D 
RETORNO EM OUTUBRO PARA AVALIAR CICLO MENSTRUAL 

NOME: Alice Jesus Dias Rocha

Uso oral
1.	ALTA D 50.000UI  ____________________01 caixa
Tomar 01 comprimido via oral por SEMANA, durante 30 dias. 
2.	FLUCONAZOL 150 MG _____________01 comprimido
Tomar 01 comprimido via oral, dose única 

Uso sublingual 
1.	Dozemast 1000mcg _________________________01 caixa
01 comprimido SL 1 vez ao dia, por 30 dias 

Uso tópico
1.	Trok _____________________________________01 tubo
Aplicar 3 vezes ao dia, por 7 dias 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59069297, '302', 'alicia vitoria santos de castro', 2, 1, '05038914284', NULL, NULL, '2006-02-17', 3, 'Paciente refere que parou por conta propria a noregya, que fez uso por 3 meses consecutivos, porém desde o inicio do uso de noregyna não mesntruou.
conduta: exames lab, usg pelvica.

Dum 24/01/24
30/01/24 paciente com secreção vaginal esbranquiçada puriginosa +- 2 semanas.
conduta: exames lab, sorol, bhcg, eas.

04/03/24
dum 25/02/24
entrega de exames
20/02/24
snr, hb 11, ht 36,30, bhgc negativo, metodo contraceptivo de escolha pela paciente foi mci mensal.
cnduta: noregyna.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60028931, '568', 'Aline Alves De Lima', 2, 0, '95005331204', NULL, '(69) 99264-1971', '1989-02-21', 3, '
DUM: 12/07/2025
MC: LT
G3P3
UPCCU: + 3 ANOS 
paciente vem devido miomatose uterina
apresenta uso tv 09/09/2020 - utero 95,83, end 6,8 
mioma submucoso intramural, od 7,92 oe 9,10 
paciente refere hipermenorreia e dispareunia

COLETA DE PREVENTIVO COM VIDEO 180,00 PIX
SOLICITO USG TV ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59337862, '452', 'Aline De Olivera Gonçalves', 2, 0, '03456882289', NULL, '(69) 99251-4132', '1997-04-01', 3, 'IDADE: 28 ANOS
DUM: 05/04/2025
MC: ----
G 2 P2 A0 
UPCCU: + 1 ANO

PACIENTE REFERE POS PARTO VAGINAL HÁ 1 ANO, FAZI USO DE MAMADES E PAROU POR CONTA PRORPIA, POIS APRESENTAVA ESCAPE
NAO ESTA AMAMENTANDO 

CONDUTA; SOLICITO EXAMES LAB, USG TV, PROGRAMAR COLETA DE PREVENTIVO 

08/07/2026

Data da última menstruação dia 4/07/2026 
método contraceptivo nenhum 
G 2 P2 A0 
menarca 12 anos 
comorbidade hipotiroidismo 
medicação em uso levo tiroxina 
último preventivo a 3 anos 
queixa principal dor na mamas ainda de líquido amarelado sinais vitais PA 107 x 66 peso 74 700 ao exame mamã o número de 2 ausência de nódulos presença de saída de secreção amarelada em mama direita 
conduta 
solicito exames laboratoriais e ultrassonografia de mamas

Exames laboratoriais do dia 1/07/2026
 t 4 1,25 TSH 3,97 hemoglobina 13, hematócitos 37,9 leuko 12100 plaqueta 337000 sorologias não reagente exceto vdrl reagente 14 ura é 23 TGO 20 creatinina 0,8 ferro 59 glicose 78 hemoglobina glicada 4,8 triglicerídeos 85 colesterol total 149 ferritina 76 estradial 172 prolactina 23,26 Vitamina B12 396 Vitamina D 26,5 progesterona 0,7 herpes GG positivo e GM negativo fsh 7 LH 29 ultrassonografia de mamas do dia 10/07/2026 cisto simples mamário bilateral BI RADS 2

PACIENTE REFERE SIFILIS TRATADA EM GESTACAO HA 2 ANOS 

CONDUTA: ORIENTACOES 
REPETIR VDRL 
SOLICITO FTABS 

1.	Vita E ciclos _____________________________ 03 caixas
Tomar 2 comprimidos via oral, por 3 meses 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060619, '279', 'Aline De Olivera Gonçalves', 2, 2, '05038914284', NULL, NULL, '2023-07-19', 3, '26 anos
Q.P:  purido vaginal, nega secreção vaginal, fez uso de creme vaginal ( tinidazol), porém com melhora parcial.
Conduta: gynotran.

19/03/24
paciente refere secreção esverdeada, sem odor com purido.
bcf:147 36 sem e 5 dias.
especular secreção em mod quant esveredeada e grumos e parede.
conduta: sinais de alarme mmme, gynotran.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60213088, '609', 'Aline Fernanda Silva', 2, 0, '05408853209', NULL, '(69) 99239-3629', '2004-02-08', 3, 'IDADE: 21 ANOS
MC:  PRESERVATIVO
DUM: 06/08/2025
UPCCU: = 3 ANOS 
QP: PACIENTE REFERE QUE EM ABRIL APRESENTOU SUA , JULHO MELHOROU. REFERE SECRECAO VAGINAL 

SOLICITO USG TV E PROGRAMAR COLETA DE PREVENTIVO, EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60271455, '616', 'Aline Fernandes Silva', 2, 0, NULL, NULL, '(69) 9239-3629', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61942413, '954', 'Aline Ramos da Costa', 2, 0, '02075302200', 'alineramosdacostadesouza@gmail.com', '(69) 99909-6516', '1995-08-27', 1, '**EVOLUÇÃO – CONSULTA GINECOLÓGICA**

**Identificação:**

* Idade: 30 anos
* DUM: 25/07/2026
* Método contraceptivo: Laqueadura tubária (LT)
* G2 P2 A0
* Último exame citopatológico do colo uterino: há 6 anos
* Comorbidades: nega
* Alergia medicamentosa: nega
* Atividade física: irregular
* Hábito intestinal: constipação
* Última ultrassonografia transvaginal: há 6 anos

**Queixa principal:**
Irregularidade menstrual associada a aumento do fluxo menstrual.

**História clínica:**
Paciente refere cansaço excessivo, sonolência intensa, queda capilar e irregularidade menstrual. Relata aumento do volume do fluxo menstrual, com presença de coágulos. Informa que a menstruação inicia com fluxo intenso por aproximadamente 3 dias, seguido de redução do sangramento por 2 dias; posteriormente ocorre interrupção do fluxo e, em seguida, escapes menstruais até o término completo, totalizando cerca de 7 dias de sangramento.

Refere que, no mês de julho, apresentou dois episódios menstruais, um no início e outro no final do mês.

Apresenta mastalgia cíclica. Nega dispareunia. Refere dismenorreia.

**Exame ginecológico:**

* Colo uterino cilíndrico, canal vaginal ressecado 
* Orifício cervical externo puntiforme.
* Presença de ectopia cervical.
* Secreção vaginal hialina, sem características sugestivas de infecção.

**Conduta:**

* Coletado exame citopatológico cervical em meio líquido.
* Solicitar exames laboratoriais.
* Solicitar ultrassonografia transvaginal.
* Solicitar ultrassonografia das mamas.

**Plano:**
Retorno após realização dos exames para avaliação dos resultados e definição da conduta terapêutica.

02/09/2026

EXAMES LAB VIT D BAIXA, COLESTEROL E LDL AUMENTADO, EOSINO AUMENTADO 

CONDUTA: 
ANITA
APLICACAO DE VIT D E COENZIMA Q 10 
DIU DE MIRENA 3600,00 INSERIDO COM ANESTESIA E USG TV 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61095692, '774', 'Aline Santos de Souza', 2, 0, '03273355212', NULL, '(97) 8423-4851', '1997-08-29', 1, 'retorno on line 
nextela, vitamina b 12 e vitamina d via oral por 3 meses ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038057, '246', 'aline santos rocha', 2, 2, '05038914284', NULL, NULL, '1997-02-10', 3, 'Q.P: disminorreia, sem outras queixas.
conduta: usgtv, exames lab, preventivo', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60581625, '666', 'Aline Santos Scherer', 2, 0, '04698156122', NULL, '(66) 9212-1624', '1995-06-27', 1, 'DUM: 11/10/2025
GO PO
UPCCU: 
MC -------
UPCCU: + 3 ANOS 

Ultrassonografia transvaginal do dia 24/10/2025 colo uterino normal útero presença de cistos intra miometriais volume uterino normal para a idade paridade endométrio central regular e normal ovário direito dentro da normalidade ovário esquerdo dentro da normale normalidade fundo de saco de Douglas presença de líquidos livres o conclusão exame ecográfico compatível com adenomiose

PACIENTE REFERE INCHACO ABDOMINAL DURANTE  FINAL DO DIA, REFERE DISPAREUNIA 
AO EXAME:

COLO CENTRALIZADO, PUNTIFORME, SANGRANTE A COLETA, PRESENCA DE VARIOS CISTO DE NABOTH, SECRECAO FLUIDA ESBRANQUICADA
TV: DOR A MOBILIZACAO DO COLO

CONDUTA: 
Uso Injetável
1.	Ceftriaxona 500 mg_______________________01 ampola
Aplicar meia ampola IM em região glútea.
 
Uso oral
1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos VO dose única, para o casal
2.	Azitromicina 500 mg _________________02 comprimidos
Tomar 02 comprimidos VO dose única.
3.	Pantoprazol 40 mg ___________________01 caixa
Tomar 01 comprimido VO pela manhã
4.	Triplo A ___________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas por 3 dias.
5.	Multi -bi ___________________________01 caixa
Tomar 01 comprimido VO 1 vez ao dia, por 3 meses

Uso vaginal

1.	Gynotran  _____________________________01caixa 
Aplicar 01 óvulo VV, á noite, durante 7 dias.

coletado preventivo

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60033130, '574', 'Almira ferreira calado', 2, 2, '72651326291', NULL, '(69) 9334-3460', '1978-08-22', 1, '47 anos 
dum: diu mirena
linquen escleroso / ANSIEDADE/ INSONIA 

QP:  SECURA VAGINAL

AO EXAME: COLO CENTRALIZADO, PRESENCA DE SECRECAO AMARELADA, BOLHOSA, SEM ODOR 

CONDUTA: TROK, TERACIN AT ( ENTREGO AMOSTRA) BEPANTOL DERMA, 
20/10/2025
PACIENTE REFERE QUE FEZ USO DA MEDICACAO E OBTEVE MELHORAS
APRESENTA RESULTADO DE EXAMES 
23/06/2025
HB 14
HT 41
LEUCO 7650
PLQ 192.000
HEMOGLOBINAGLICADA 5
TSH 2,48
T 4 LIVRE 1,22
FSH 2,87
HL 6,27
INSULINA 11,3
VIT B 12 591 
ESTRADIOL 184VIT C 1,04 
VIT D 83
COL 224 
COL LDL 150
GLICOSE 90
CREAT 0,80 
UREIA 32 
FERRITINA 128, 

VEM PARA O LASER INTIMO E FACO HIDRATACAO INTIMA COM FOTOBIOMODULACAO 
NOME: Almira Ferreira Calado

USO ORAL
1.	FLUCONAZOL 150 MG __________________01 CAIXA 
         TOMAR 01 COMPRIMIDO VIA ORAL DOSE ÚNICA 

USO SUBLINGUAL 

2.	MELATONINA FAST _______________________01 CAIXA
01 COMPRIMIDO SL 1VEZ AO DIA 

USO VAGINAL 

1.	PROVAGIN   _____________________________ 01 CAIXA
APLIACAR A CADA 3 DIAS.

USO TÓPICO

1.	DIPIPROPIONATO DE BETAMETASONA 0,5 MG/G _01 CAIXA
    APLICAR A CADA 3 DIAS 


PROVAGIN

19/11/2025
Exames laboratoriais do dia 11 do 11 de 2025 hemoglobina 14,7 hematócrito 42,9 leuco 7340 plaquetas 182000 hemoglobina glicada 5,2 tsh 1,61 t 4 livre 1,21 FCH 1,54 LH 1,93 testosterona zero ponto 32 testosterona livre testosterona total 22 vitamina zero ponto 71 estradiol 121 progesterona 6 cortisol 11,4 vitamina D55 Vitamina B12 792 tgo 20 tgp 19 glicose 92 colesterol total 190 triglyceride 84 ureia 29 creatina

26/01/2026
laser intimo 

----------------------
15/04/26
paciente:
laser intimo
presença de foliculite com pontos de pustulacao
fissura no introito vaginal 
NOME Almira Ferreira Calado



USO ORAL


1.	Zelix 150 mg ________________________________________02 comprimidos 
      Tomar 01 comprimido hoje e repetir com 7 dias 

USO TÓPICO

1.	Higi calm  ________________________________________01 Tubo 
Higienizar 2 vezes ao dia  

2.	Trok – N _______________________________________01 tubo
Aplicar 3 vezes ao dia, por 7 dias 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59043050, '256', 'Alzilene Moreira Da Cruz Firmiano', 2, 0, '05038914284', NULL, NULL, '1979-10-05', 3, 'usgtv 12/07/22
utero 204, adenomiose, adenomiose+ intramural.
Conduta: gestinol, transmin, piroxxican.

27/05/22
desconforto com secreção vaginal, com odor, fez uso de metronidazol 7 dias, com mellhora após uso, porém refere disuria.
exames lab.
programdo coleta de preventivo 02/06/22', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59927139, '547', 'Alzira De Olivera Lins', 2, 1, '32580835253', NULL, '(69) 8488-7863', '1970-01-18', 3, 'EXAMES DE SANGUE 
A VISTA 485,40
CREDITO 536,00




RETORNO
05/08/2025
HISTERECTOMIA 2021
PACIENTE REFERE FOGACHO, PELE SECA, VAGINA SECA, 
EXAMES LAB 16/07/2025 
Exames laboratoriais do dia 16/07/2025 
ácido úrico 3,16 glicose 83 triglicerídeos 59,7 UREIA 36,4 creatinina 0,70 colesterol total 191 cálcio 10 hemoglobina glicada 5,75 desde o 22 tgp 17 Vitamina B12 480, estradiol inferior a 5 T 4 LIVRE 1,18 progesterona inferior a 0,05 tsh 1,07 Vitamina D 39,6 hemoglobina 13,2 hematócrito 39 leUCO 5890 plaqueta 234000

CONDUTA: USG TV, USG DE MAMAS, MMG, PREVENTIVO 
VITAMINA S 240,00. 
PREVENTIVO 180,00

18/08/25
PACIENTE REFERE SINCOPE 3 EPSODIOS, COMPARECEU A PRONTO ATENDIMENTO E AO CARDIOLOGISTA, ONDE NAO FOI OBSERVADO NENHUMA INTERCORRENCIA
NO MOMENTO APRESENTA -SE PALIDA, ACOMPANHADA DO FILHO, ALEGA QUE O PRIMIRO EPSODIO DE SINCOPE VEIO ACOMPANHADO DE CONVULSAO (SIC)
PA 120 X 70 MMHG 
paciente vem para reposição de vitamina b 12
JA ESTA AGENDADA CONSULTA COM NEUROLOGISTA 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59170213, '407', 'Amanda Caroliny de Oliveira', 2, 0, '05038914284', NULL, '(97) 8443-9281', '1999-11-19', 1, '09/04/2025 CONSULTA ONLINE
MÃE: PATRICIA OLIVERA SANTOS/ HUMAITA 180

ID: 17 ANOS
MENARCA: 12 ANOS
DUM: 23/03/24    3-4 DIAS MODERADO, NO MOMENTO REFERE DO FLUXO MENSTRUAL
SEXARCA: 0
VACINA: OK
COMORBIDADES: SINUSITE, BRONQUITE, RINITE

Q.P: PACIENTE REFERE QUE HÁ 18 MESES REFERE DISMINORREIA E AUMENTO DO FLUXO MENSTRUAL, ACOMPANHADA DE COAGULO, SECREÇÃO ESBRANQUIÇADA COM GRUMOS, AZEDO E AS VEZES PURIDO.

CONDUTA: TROK 7 DIAS, FLUCUNAZOL HCP, PONSTAN 8/8H
ORIENTAÇÕES: DOCE, CARBOIDRATO, CALCINHA.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59059212, '273', 'Amanda Ferreira Menchaca', 2, 1, '05038914284', NULL, NULL, '2006-12-11', 3, 'paciente refere sangramento uterino anormal, nega dispareunia.
conduta: solicito exames lab + sorologia + usgtv.
planejamento familiar diu+ encaminhamento cimi.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62214936, '1001', 'Amanda Gomes dos Santos', 2, 0, '03544085267', 'amandagomess091@gmail.com', '(69) 99389-3067', '2009-01-25', 1, 'Paciente já realizou o Retorno no dia 16/09/26 em Humaitá. 
Exames anexados', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60044524, '578', 'Amanda Kelry Chaveiro Pinto', 2, 1, '02334822299', NULL, '(69) 9313-4299', '1996-07-09', 1, 'idade: 29 anos
G1 P0 A1
dum: 15/07/25
MC: IMPLANON

COMORBIDADES: NEGA 
UPCCU: 2024

QP: PACIENTE VEM DEVIDO SANGRAMENTO IRREGULAR APOS USO DE IMPLANON, VEM PARA ROTINA GINECOLOGICA, PACIENTE REFERE FALTOS 

AO EXAME
COLO CENTRALIZADO, PUNTIFORME, SANGRANTE A COLETA, PRESENCA DE SECRECAO ESBRANQUICADA, GRUMOS EM PAREDE

CONDUTA: CREVAGIN, SECNIDAZOL( FLATOS), SOLICITO USG TV (SUA), EXAMES LAB INCLUSO PROLACTINA, COLETADO PREVENTIVO 



EXAMES DE SANGUE 903,41 A VISTA E 993,20 CREDITO





RETORNO 
PACIENTE DESEJA RETIRADA DE IMPLANON 
APRESENTA USG TV DO DIS 15/08
UTERO 34,8
END 3,1 MM
OD 7,2
OE 6,5 
CISTO VAGINAL 0,9 X 07 CM, SINAIS DE  ADENOMMIOSE FOCAL

PACIENTE DEITADA, ANESTESIA, EXERESE  COM BISTURI NUMERO 11, RETIRADA DE BASTAO DE IMPLANON COM KELY CURVA, PACIENTE VISUALIZA RETIRADA DE IMPLANON, FILMA E TIRA FOTO, REALIZO APENAS CURATIVO COMPREENSIVO 
AO EXAMES ESPECULAR: NAO VISUALIZO CISTO VAGINAL, PRESENCA DE SECRECAO ESBRANQUICADA COM ODOR 

CONDUTA: TRIPLO A, SECNIDAZOL E CREVAGIN.

retorno em novembro, repetir exames
triplo , secnidazol, crevagin, alta d 50 mil ui, dozemast, avaliar padrão de sangramento ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61375889, '826', 'AMANDA LARISSA MAIA LEÃO', 2, 0, '05820582284', NULL, '(69) 99383-4016', '2002-07-18', 3, 'IDADE:23 ANOS
SEXARCA 18 ANOS  
DUM: IRREGULAR 
G O PO 

PACIENTE REFERE IRREGULARIDADE MENSTRUAL, DISMENORREIA, METRORRAGIA 

CONDUTA:
ORIENTACOES 
USG TV
EXAMES LAB 
--------------
PESO 78,400g
cc 96 cm 
PACIENTE RETORNA COM RESULTADO DE EXAMES 
Exames laboratoriais do dia 14/04/2026 hemoglobina 12,6 hematócrito 35,7 leuco 10940 plaqueta 283000 glicose 87,5 triglicerídeos 124 uréia 20,9 creatinina 0,5 colesterol total 161 colesterol hdl 34 colesterol ldl 101 ferritina 93 hemoglobina glicada 4,8 tgo 26,6 tgp 48,2 ferro sérico 65,5 Vitamina B12 515 sorologia não reagente tsh 5,15 t 4 livre 1,06 Vitamina D 17,5 exame de urina infeccioso
Ultrassonografia pélvica do dia 17/04/26 útero Retro verso fletido volume 50,8 em do metro 9,9 mm ovário direito 18,8 ou vários que 9,4 ou vários de morfologia PolicISTICO 
conduta 
orientações 
dieta alimentar 
exercício físico para perda de peso 
Diane 35 r
CIPROFLOXACINA
SOPI
Reposição de vitamina D 
retorno com 1 mês para avaliar adesão academia perda de peso com 3 meses solicitar exames laboratoriais novamente para avaliar lipidograma tsh t 4 e vitamina D


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59089126, '328', 'Amanda Lima De Olivera Carvalho', 2, 2, '01666281239', NULL, '(69) 99202-9362', '1995-01-09', 3, '30 ANOS
G 3 P2 C 1 N A 0
LT
COMORBIDADES NEGA 
NEGA USO DE MEDICACAO
UPCCU julho de 2024 / Negativo para lesão intraepitelial ou malignidade.

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA DISURIA
AO EXAMES
FOLICULITE, ESCURECIMENTO DA REGIAO INTIMA 
HIPERTROFIA DE PEQUENOS LABIOS, PAREDE DE PEQUENOS LABIOS APRESENTANDO FISSURAS E VARIZES
ESPECULAR: COLO CILINDRICO, EM FENDA, PRESENCA DE SECRECAO AMARELADA

CONDUTA: SOLICITO EXAMES LAB, SOLICITO USG TV, AGUARDO AGENDAMENTO PARA COLETA DE PREVENTIVO 
INDICO NINFOPLASTIA, PROTOCOLO DE CLAREAMENTO INTIMO, TRATAMENTO PARA FOLICULITE
SECNIDAZOL, GYNOTRAN

----------  // -------

EM USO DE GYNOTRAN, ALEGA MELHORA DO QUADRO CLINICO
APRESENTA RESULTADO DE EXAMES:14/03/25 
VIT D 34, E VIT B 12 453 TS O RH +, SNR TSH 1,22/ T4 LIVRE 1,22 

CONDUTA: RETORNAR COM RESULTADO DO PREVENTIVO, NAO SAIU RESULTADO ATE O MOMENTO, REPOSICAO DE VIT D E 12 ( 460,00)

---------------------- /// ------------------------

EXAMES LAB 26/02/26
VITAMANINA D 30,0 / VIT B 12 477

SUPLEMENTACAO DE VITB12 E D 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59037567, '240', 'Amanda Moreira Cecilio', 2, 1, '05038914284', NULL, NULL, '2005-11-05', 3, 'rotina.
dum 20/08. aminorreia 18/11/24
eas normal, bhcg negativo, col 154, vitd 28,5, vitb12 472, trig 61, glic 84, tsh 3,14, t4 1,31, hb 12,9, ht 33,2, leuc 12,200, plq 311,000.
conduta: usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59059316, '276', 'Ana  Gabriela Da Silva Ramalho', 2, 1, '05038914284', NULL, NULL, '2006-12-04', 3, 'Acompanhada da mãe Luiza, vem para contracepção.
Conduta: metodo de escolha injetavel mesal.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060504, '278', 'Ana Alice Cunha', 2, 2, '05038914284', NULL, NULL, '1969-02-10', 3, 'Exames lab 23/08/22
eas: ox de calcio, estradiol 12,7, fsh 93.

Usgtv: utero 43,9, exame normal.
Ao exame mamas n2 presença de nodulo +- 1cm em mama esquerda as 3h.
Preventivo 06/12/21 asg-h ( em acompanhamento no hospital do amor)
Conduta: usg de mamas, ao reumato (artrite reumt).

Retorno 22/11/22
usg de mamas bi-rads 2
usg tv 11/11/22 normal
Conduta: tibolona, antrofi,  crevagin, vitamina d3.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61638905, '885', 'Ana Beatriz C. De Oliveira', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, '
Paciente Ana Beatriz 32 anos data da última menstruação 29 de maio método contraceptivo nenhum gesta um parto zero aborto um com morbidade nega medicação nega o último preventiva há 2 anos queixa principal vem para escolha de métodos contraceptivos 

CONDUTA: NEXTELA 
RETORNO COM 1 MES ( ADAPTACAO DO METODO) ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59037895, '242', 'Ana Beatriz Monteiro Da Silva', 2, 1, '05038914284', NULL, NULL, '2004-07-21', 3, 'usg pelvica 20/09/22 normal
bacterioscopia+ secreção vaginal= vaginose.
Conduta: flogo rosa, secnidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60308149, '632', 'Ana Beatriz Monteiro Da Silva', 2, 2, '05523164232', NULL, NULL, '2004-07-21', 3, 'IDADE 21 ANOS 
DUM: 07/09/25
MC: DIU DE COBRE
G0P0

QP: PACIENTE REFERE DISMENORREIA, APRESENTA USG TV 
UTERO 51,8, END 6,1 MM / OD 8,6 / OE 6,4 DIU DISTANDO 25 MM DO FUNDO UTRINO 

CONDUTA: ORIENTACOES, RECOMENDO USO DO PRESERVATIVO E IR A MMME PARA TROCA DE DIU, PIUS PACIENTE NAO TEM CONDICOES FINACIERA PARA TROCAR NO PARTICULAR ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61062404, '760', 'ANA CARDOSO SANTIAGO', 2, 0, '02017078107', NULL, '(69) 99341-2386', '1986-11-08', 3, 'IDADE 39 ANOS 
DUM: 6/ 01/2026
MC: ACO 
G 4 P3 A1
UPPCU: 2023

QP: ROTINA GINECOLOGICA, 

CONDUTA: ORIENTACOES
EXAMES LAB
USG TV
USG DE MAMAS 


-----4/03

DUM; 06/03/2026

--------- // -----------
mc: ciclo 21
dum: 25/03/2025

Exames laboratoriais do dia 28 do 2 t 4 livre 1,07 tsh 1,37 LH 0,2 progesterona inferior a 5 ferritina 109 fsh 1,83 hemoglobina 12,2 hematócrito 36,2 leuco 12000 plaqueta 275000 estradiol inferior a 20 vitamina B12 641 vitamina D21 ferro 50 triglicerídeos 73 colesterol 183
paciente refere mudança de ciclo 21 para ecrazzete

conduta: 
orientacoes
vit d 
Manipular

1. Testosterona 5 mg _____________________________
Gel transdérmico base hormonal QSP 60 g
Aplicar 1g de gel sobre a pele seca e limpa em região sem pêlos, uma vez por semana.

2. Arginina HCI 100 mg
Ginseng Siberiano 100 mg
Maca peruana 150 mg
Mucuna 150 mg
Vitex Agnus Castus 200 mg
Ashawganda 100 mg
Tomar 01 dose (02 cápsulas) ao dia.
vitergan cog, calde max, colatene force, dozemast 

retorna para refazer usg tv ( usg tv com presença de cisto ) 
------------------
RETORNO PARA REPETIR USG TV
ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 7,06x 2,29x 5,28cm (volume: 44,38cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.
. 
Endométrio: centrado, ecogênico e com espessura de 8 mm de basal a basal.

Ovário direito: tópico, volume de 4,07cm³, de forma habitual, contorno preservado e textura normal. Cisto de paredes finas e conteúdo homogêneo, Medindo 2,13 x 2,01 x 1,36mm 


Ovário esquerdo tópico: volume de 1,24cm³, de forma habitual, contorno preservado e textura normal.

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Cisto de paredes finas e conteúdo homogêneo 
Presença de liquido em fundo de saco 


OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.

repetir em agosto controle de cisto ovariano direito 

secnidazol gynotran
triplo a 
-------------------------------

09/09
PACIENTE COMPARECE PARA USG TV, ALEGA SECRECAO VAGINAL ESBRANQUICADA, COM PRURIDO
AO EXAME:
 COLO CENTRALIZADO, PRESENCA DE SECRECAO ESBRANQUICADA, ESPESSA

CONDUTA:
REALIZO USG TV
NOME: ANA CARDOSO SANTIAGO 

Uso oral

1.	Secnidazol 1 g______________________04 comprimidos 
Tomar 02 comprimidos via oral dose única para o casal.

2.	Zaila ___________________________01 caixa
Tomar o1 comprimido via oral, 1 vez ao dia, por 30 dias.  

Uso vaginal

1.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.

SOLICITO EXAMES LAB 
NOME: ANA CARDOSO SANTIAGO

SOLICITO

HEMOGRAMA   
FERRO
FERRITINA                                      
GLICOSE
VITAMINA D3
VITAMINA B12
FSH
LH 
ESTRADIOL
PROGESTERONA




NOME: ANA CARDOSO SANTIAGO

DATA: 09/09/2026

DUM: 28/08/2026

ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico, presença de cisto de Naboth

Útero:  em anteversoflexão, centralizado medindo 3,42 x 7,94 x 3,9 cm (volume:  55,3 cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.


Endométrio: centrado, ecogênico e com espessura de 1,6 mm de basal a basal.

Ovário direito: não caracterizado ao exame, devido à interposição de alças intestinais gasosas.

Ovário esquerdo tópico: não caracterizado ao exame, devido à interposição de alças intestinais gasosas.

Ausência de  líquido livre patológico em fundo de saco.

IMPRESSÃO: 
Cisto de Naboth no colo uterino.
Ovários não caracterizados, devido à interposição gasosa.
B Demais estruturas pélvicas sem alterações ultrassonográficas significativas.

OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.




___________________________________
DRA CHRISTIANE ALVES CALIXTO 
CRM 3316/RO



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038619, '253', 'Ana Caroline Alves Nascimento', 2, 0, '05038914284', NULL, NULL, '1994-04-29', 3, 'rotina ginecologica.
conduta: exames lab, usg de abdome, usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038504, '250', 'Ana Caroline Da Silva Bentes', 2, 1, '05038914284', NULL, NULL, '2007-10-24', 3, 'primeira consulta ginecologica, dismirroreia.
conduta: bacterioscopia, exames lab, apresentar usg pelvica.

08/08/24
usg pelvica 12/07/23 utero 68,7, end 6mm, od 10, oe 4,8, exame normal.
exames 16/07/24
eas não inf, hb 16,3, ht 50,4, leuc 5500, plw 38800, tsh 175, t4 123, vitd 26,6, vitb12 393, col 163, trig 45,2.
bacterioscopia gram + 
conduta: secnidazol, ibuprofeno, retornar 30 a 40 dias, repor vit d e b12, iniciar iumi no mes de setembro.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59055926, '268', 'Ana Caroline De Souza Barbosa', 2, 2, '05038914284', NULL, NULL, '1996-10-24', 3, 'Q.P: menstruação irregular spot
Preventivo + 1 ano, nega nodulo mamario.
Conduta: usgtv, usg mamas, preventivo, exame lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61915101, '931', 'Ana Caroline dos Passos Lopes', 2, 2, '04977419200', 'kl0979651@gmail.com', '(69) 99338-0461', '2000-08-31', 3, 'IDADE: 25 ANOS 

G3 P0 A3??? SEM CURETAGEM 

PACIENTE DESEJA ENGRAVIDAR 
PACIENTE REFERE QUE FEZ TESTE RAPIDO 3 VEZES POSITIVO, AO REALIZAR USG SEM TEM GRAVIDEZ 



PREVENTIVO : 09/05/2025 _ NEGATIVO 
EXAMES LAB  - 09/05/25
TS O RH POSITIVO
TSH 1,94
T4 LIVRE 1,19
SNR 
ANTI HBS REAGENTE 
RUBEOLA SUCEPTIVE

VITAMINA B 12 242 
VITAMINA D 13 
USG TV 04/06: UTERO AVF 53
END 2 MM
OD 5,9
OE 6,6 EXAME NORMAL 

CONDUTA:
EXAMES LAB PARA INVESTIGACAO 
USG TV PARA AVALIAR COLO UTERINO 
REALIZAR VACINA PARA RUBEOLA - AGUARDAR 1 MES PARA ENGRAVIDAR 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59667609, '531', 'Ana Caroline Rodolfo De Farias', 2, 5, '00179731203', NULL, '(69) 99231-4437', '1993-02-19', 3, 'UPCCU: HÁ MAIS OU MENOS 3 ANOS 
PACIENTE USUÁRIA  DE DIU DE COBRE INSERIR A MAIS OU MENOS 9 ANOS, FAZ MAIS DE 2 ANOS QUE NAO FAZ ACOMPANHAMENTO 
NO MOMENTO ESTA MENSTRUADA E COM DURAÇÃO DE MAIS OU MENOS 15 DIAS 
CONDUTA: PROGRAMAR COLETA DE PREVENTIVO
SOLICITO EXAMES LAB
SOLICITAR USG TV 

EXAMES DE SANGUE 
A VISTA 531 CREDITO 610,00


RETORNO 

EXAMES NORMAIS
PREVENTIVO 18/07: NEG PARA NEOPLASIA E GARNERELLA
USG TV 25/07: DIU NORMOPOSISICONADO, MIOMA SUBSEROSO, OVARIOS NORMAIS
EXAMES LAB VIT D E B 12 BAIXA
CONDUTA: ORIENTACOES, 
REPOSICAO DE VIT D E B 12 
460,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061382, '291', 'Ana Celia Andrade Nunes', 2, 2, '05038914284', NULL, NULL, '1978-09-04', 3, ' rotina ginecologica.
conduta: malalt.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60617815, '690', 'Ana Clara', 2, 0, NULL, NULL, '(31) 9739-0620', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60606235, '680', 'ANA CLARA ALBUQUERQUE GONÇALVES', 2, 0, '05843159299', NULL, '(69) 99378-3476', '2004-12-04', 3, '20 anos
DUM: 09/10/25
MC: PRESERVATIVO, MAS PROVAVELMENTE IRÁ INSERIR IMPLANON
UPCCU: + 2 ANOS
QP: PACIENTE REFERE QUE APRESENTOU NODULOS PARECIDOS ACNE, PRURIDO, MAS AGORA NAO ESTA MAIS APARECENDO, ALEGA DISPAREUNIA 

CONDUTA: EXAMES LAB E USG TV 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59059190, '272', 'Ana Clara Olivera Gil', 2, 1, '05038914284', NULL, NULL, '2000-08-04', 3, 'Q.P: dor em baixo ventre, disminorreia.
usgtv 18/10/23, utero 40,9, od 4, oe 3,1, diu normoposicionado, liquido em fundo de saco de douglas.
conduta: tto p/ dip, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061302, '288', 'Ana Clara Ramos Da Silva', 2, 0, '05038914284', NULL, NULL, '2002-02-17', 3, 'Planejamento familiar.
conduta: exames lab.

retorno 13/08
glicose 82, col 144, trigl 76, bhcg +, hb 12,3, ht 37, eas normal.
ig: 11 sem e 6 dias.
conduta: transvaginal

18/09/24
usg obstetrica 04/09/24
18 sem e 4 dias
solicito exame pré-natal, bacteriscopia, usg morfologica 2 trim, olhar exame e se tsh alt encaminhamento pnar', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60213351, '610', 'Ana Claudia Vieira Pinto', 2, 2, '87395541200', NULL, '(69) 99226-4326', '1981-10-10', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60074435, '596', 'Ana Cleude Dantas', 2, 0, '71166904334', NULL, '(69) 99318-3858', '1975-08-15', 3, 'IDADE: 49 ANOS

CLIMATERIO AOS 35 ANOS 
 PACIENTE REFERE QUE AOS 35 ANOS VEM COM IRREGULARIDADE MENSTRUAL DE CADA 3 0U 4 ANOS, E NO MOMENTO FAZ 4 ANOS QUE NAO VEM MAIS 
REFERE FOGACHO 
APRESENTA RESULTADO DE EXAMES LAB 
Exames laboratoriais do dia 17/07/2025 ácido úrico 4,5 PCR 0,8, LH 44,5 prolactina 6,8 VHS 10
 exames laboratoriais do dia 24/07/2025 estradiol inferior a 20 Vitamina D 28,9
 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59971185, '555', 'Ana cristina da Silva gines', 2, 0, NULL, NULL, '(69) 9226-1420', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61348905, '819', 'Ana Cristina da Silva Gomes', 2, 2, '69532796215', NULL, '(69) 9226-1420', '1982-06-17', 1, 'idade: 43 anos 
g 1 p1 a0
DUM: 07/04/26
MC: PRESERVATIVO
UPCCU: MARCO DE 2026

DESEJA NINFOPLASTIA 
ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: Ana Cristina da Silva Gomes 
Procedimentos: Labioplastia

Prezada Ana,
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia.
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
Procedimento: Rejuvenescimento Íntimo a Laser
Valor: R$ 1.800,00 cada sessão
  À vista com desconto: R$ 1.600,00
 
Benefícios do Laser Íntimo:
• Melhora da lubrificação vaginal
• Redução do ressecamento e desconforto íntimo
• Aumento da firmeza e tonicidade vaginal
• Auxílio no tratamento da flacidez vaginal
• Melhora da autoestima e da qualidade de vida sexual
• Procedimento rápido, seguro e minimamente invasivo
• Sem necessidade de afastamento das atividades diárias
 



Esses procedimentos, quando realizados em conjunto, proporcionam melhoria estética, conforto íntimo, aumento da autoestima e bem-estar funcional da paciente.
Valores dos procedimentos:
•	Labioplastia: 

Total: R$ 7.5000,00 à vista
 
Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação de pós-operatório (imediato e dia anterior ao procedimento) 
•	O orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou do início do parcelamento, data prevista para o dia 18/04/2026 ás 9 horas.

Atenciosamente,

Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima

=========================
18/05/2026
laser intimo
paciente refere que pequeno labio do lado direito ficou mais durinho após ninfoplastia (FOTO)
RETIRAR PREGA ACESSORIA Á ESQUERDA


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61386542, '834', 'ANA CRISTINA RODRIGUES DA SILVA', 2, 0, '04432285230', NULL, '(69) 99387-5829', '2003-11-26', 3, 'IDADE: 22 ANOS 
DUM: 03/04
MC: ------
G 0P0
UPCCU: HA 2 ANOS 

QP: PACIENTE REFERE SINDROME DO OVARIO POLICICISTICO, ALEGA AMENORREIA, POREM DISMENORREIA NO PERIODO QUE PROVAVELMENTE IRIA MENSTRUAR, ALEGA SINUSSORRAGIA 
SENSACAO DE BEXIGA CHEIA, POREM NAO FAZ XIXI, NEGA DISURIA, REFERE LOMBALGIA COM DOR INTENSA 

AO EXAME: GIODANO POSITIVO Á DIREITA 

CONDUTA:
PREVENTIVO 
USG TV
USG DE RINS E VIAS URINARIAS 
EXAMES LAB 
MAGNEM FEMME 

-------------------------
13/04/2026
Ultrassom de abdômen total do dia 13/04/2026 sinais de infiltração gordurosa hepática correspondendo esteatose hepática grau1 NEFROLITIASE NÃO OBSTRUTIVA 
 ultrassom transvaginal do dia 13 do 4 de 2026 útero anti verso fletido volume 44.4 endométrio 4 mm ovário direito 10,22 são vários esquerdo 9,87 

AO EXAME
COLO ANTERIOR, CILINDRICO, PRESENCA DE SECRECAO ACINZENTADA BOLHOSA
COLETADO PREVENTIVO CONVENCIONAL 
1.	Secnidazol 1 g ______________________02 comprimidos
Tomar 02 comprimidos via oral dose única.
2.	GINOBIOTTA ___________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses 
3.	TRIPLO A _______________________01 CAIXA 
               Tomar 01 comprimido via oral,12/12 horas, por 3 dias 
Uso tópico
1.	Higi Calm ______________________01 tubo
 Higienizar 2 vezes ao dia, ou sempre que necessário.

Uso vaginal 

4.	Gynotran ___________________________01 caixa
Aplicar 01 óvulo via vaginal, à noite, por 7 dias. 
atestado de 1 dia 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61358191, '821', 'Ana Cristina Silva de Mello', 2, 0, '61599824272', NULL, '(97) 8122-9290', '1975-04-19', 1, '50 ANOS
ASSISTENTE DO PREFEITO DE HUMAITA - DEDEI
DUM: HISTERECTOMIA
COMORBIDADES: NEGA 
ALERGIA SULFA E PELO DE GATO 

QP: ASSINTOMÁTICA

Ultrassom transvaginal do dia 14/02/2026 paciente histerectomizada OVARIO  direito 7, 39 ovário esquerdo 13, 25 o ovário esquerdo aumentado de volume apresentando uma formação cística medindo 3,24 cm em seu maior diâmetro ultrassom de mama do dia 14/02/2026 bi hatz 1
 exames laboratoriais do dia 16/02/2026 hemoglobina 13,4 hematócrito 41 leu 4720 plaqueta 261000 glicemia de jejum 81 colesterol total 227 triglicerídio 169 creatinina zero ponto 84 ureia 27 TGU 20 e tgp 32 magnésio 1,88 ferro Sério 64 exame de urina não infeccioso porém com presença de leveduras hemoglobina glicada 4,7% t 4 livre 1,25 tsh 3,57 estradiol de 32 LH 19.1 fsh 25 progesterona zero ponto 21 ferritina 87 vitamina B12 361 Vitamina D 45,1
DENSITOMETRIA OSSEA 26/02/2026: NORMAL 

CONDUTA; REPOSICAO DE VITAMINA B12, VITAMINA D, DIETA ALIMENTAR , ZELIX PARA FUNGO 
INDICO LASER INTIMO 
-----------------------
15/04
1 sessao laser intimo 

belamy
---------------------------------
02/05
ALEGA MELHORA DA IUE, RESSECAMENTO VAGINAL 
2 LASER INTIMO 
PROVAGIN
REPOSICAO DE B 12 

------------------------------
20/06/2026
3 SESSAO LASER
REFERE QUE AINDA PERDE URINA 
CONDUTA: SOLICITO EXAMES LAB
 E ORIENTO MAIS UMA SESSAO DE LASER 

--------------------------
# EVOLUÇÃO GINECOLÓGICA

**DUM:** Histerectomia
**Comorbidades:** Nega
**Alergias:** Sulfa e pelo de gato

### Queixa principal

Assintomática no momento da avaliação.

---

## EXAMES COMPLEMENTARES

### Ultrassonografia transvaginal — 14/02/2026

Paciente histerectomizada.

* Ovário direito: **7,39** — unidade não informada no laudo transcrito.
* Ovário esquerdo: **13,25** — unidade não informada.
* Ovário esquerdo aumentado de volume, apresentando **formação cística medindo 3,24 cm em seu maior diâmetro**.

**Observação:** recomenda-se acompanhamento ultrassonográfico conforme características morfológicas da formação cística e avaliação clínica.

### Ultrassonografia das mamas — 14/02/2026

* **BI-RADS 1.**
* Exame sem alterações mamárias suspeitas.

### Densitometria óssea — 26/02/2026

* **Resultado: normal.**

---

## EXAMES LABORATORIAIS — 16/02/2026

### Hemograma

* Hemoglobina: **13,4 g/dL**
* Hematócrito: **41%**
* Leucócitos: **4.720/mm³**
* Plaquetas: **261.000/mm³**

### Metabolismo glicêmico

* Glicemia de jejum: **81 mg/dL**
* Hemoglobina glicada: **4,7%**

### Perfil lipídico

* Colesterol total: **227 mg/dL**
* Triglicerídeos: **169 mg/dL**

### Função renal

* Creatinina: **0,84 mg/dL**
* Ureia: **27 mg/dL**

### Função hepática

* TGO (AST): **20**
* TGP (ALT): **32**

### Minerais e ferro

* Magnésio: **1,88**
* Ferro sérico: **64**
* Ferritina: **87**

### Função tireoidiana

* T4 livre: **1,25**
* TSH: **3,57**

### Perfil hormonal

* Estradiol: **32**
* LH: **19,1**
* FSH: **25**
* Progesterona: **0,21**

Perfil hormonal compatível com **redução da função ovariana/transição menopausal**, devendo ser correlacionado com idade, sintomas e histórico clínico. Como a paciente é histerectomizada, o padrão menstrual não pode ser utilizado para definir menopausa; nessa situação, sintomas e avaliação hormonal podem auxiliar na caracterização.

### Vitaminas

* Vitamina B12: **361**
* Vitamina D: **45,1**

### Urina

* Exame de urina: **sem sinais de infecção bacteriana**, porém com presença de **leveduras**.

A presença de leveduras deve ser correlacionada com sintomas e exame ginecológico, evitando tratamento exclusivamente pelo achado laboratorial quando a paciente está assintomática.

---

# EVOLUÇÃO DO TRATAMENTO

### 15/04/2026

* Realizada **1ª sessão de laser íntimo**.

### 02/05/2026

Paciente refere:

* **Melhora da incontinência urinária de esforço (IUE)**.
* Persistência de **ressecamento vaginal**.

**Conduta:**

* Realizada **2ª sessão de laser íntimo**.
* Prescrito **Provagin**.
* Orientada **reposição de vitamina B12**.

### 20/06/2026

* Realizada **3ª sessão de laser íntimo**.
* Paciente refere que **ainda apresenta perdas urinárias**.

**Conduta:**

* Solicitação de exames laboratoriais para reavaliação.
* Orientada nova sessão de laser, conforme avaliação clínica e resposta ao tratamento.

---

# IMPRESSÃO CLÍNICA

1. **Incontinência urinária de esforço**, com resposta parcial ao tratamento realizado.
2. **Ressecamento vaginal**, possivelmente relacionado à redução estrogênica/climatério.
3. **Formação cística em ovário esquerdo, 3,24 cm**, em paciente histerectomizada.
4. **Dislipidemia**, com colesterol total de 227 mg/dL e triglicerídeos de 169 mg/dL.
5. **Vitamina D adequada** no exame atual.
6. **Densitometria óssea normal.**
7. **Ultrassonografia mamária BI-RADS 1.**
8. Presença de **leveduras na urina**, sem sinais de infecção bacteriana e sem sintomas urinários no momento.

# ORIENTAÇÕES / CONDUTA

* Manter acompanhamento ginecológico periódico.
* Reavaliar a formação cística do ovário esquerdo conforme características ultrassonográficas, idade e contexto clínico, podendo ser indicado controle por ultrassonografia.
* Para o ressecamento vaginal, considerar medidas locais não hormonais, como hidratantes vaginais e lubrificantes. Em casos persistentes e quando não houver contraindicação, discutir opções terapêuticas específicas para síndrome geniturinária da menopausa. A redução estrogênica pode causar ressecamento, alteração da elasticidade vaginal e sintomas urinários.
* Para a **incontinência urinária de esforço persistente**, recomenda-se avaliação do assoalho pélvico e **fisioterapia pélvica**, além de reavaliação clínica da gravidade e impacto dos sintomas.
* Quanto ao laser vaginal, orientar a paciente sobre a **evidência ainda limitada para eficácia e segurança a longo prazo**, especialmente para incontinência urinária; a ACOG destaca que os dados disponíveis são limitados e que esses procedimentos não devem ser apresentados como tratamento comprovadamente estabelecido.
* Orientar medidas de estilo de vida para redução do colesterol e triglicerídeos, incluindo alimentação equilibrada, aumento de fibras, redução de gorduras saturadas e alimentos ultraprocessados e prática regular de atividade física.
* Manter reposição de vitamina B12 conforme indicação clínica e reavaliar níveis em acompanhamento.
* Na ausência de sintomas urinários ou vaginais, o achado isolado de leveduras na urina deve ser correlacionado clinicamente antes de instituir tratamento.

RESUMO DE EXAMES LABORATORIAIS 09/07/2026
1. Metabolismo glicêmico
Hemoglobina glicada (HbA1c): 5,2%
Glicemia de jejum: 85 mg/dL
Interpretação: parâmetros glicêmicos dentro da faixa de normalidade.
2. Função tireoidiana
TSH: 2,6
T4 livre: 1,1
Interpretação: função tireoidiana aparentemente preservada.
3. Avaliação hormonal
Estradiol: 19
LH: 36
FSH: 31
Progesterona: 0,2
Interpretação: perfil hormonal com níveis baixos de estradiol e progesterona e elevação de FSH/LH, podendo ser compatível com transição menopausal/perimenopausa ou menopausa, dependendo da idade, padrão menstrual e eventual uso de hormônios.
4. Vitaminas e reservas nutricionais
Ferritina: 67
Vitamina B12: 498
Vitamina D: 49,8
Ferro sérico: 79
Interpretação: reservas de ferro, vitamina B12 e vitamina D sem alterações relevantes pelos valores apresentados.
5. Hemograma
Hemoglobina: 13,2 g/dL
Hematócrito: 39%
Leucócitos: 5.530/mm³
Plaquetas: 271.000/mm³
Interpretação: hemograma sem alterações relevantes nos parâmetros informados.
6. Função renal
Creatinina: 0,6 mg/dL
Ureia: 39,2 mg/dL
Interpretação: função renal aparentemente preservada, considerando os valores apresentados.
7. Função hepática
TGO (AST): 15
TGP (ALT): 21
Interpretação: enzimas hepáticas dentro dos valores habituais.
8. Perfil lipídico
Colesterol total: 238 mg/dL
Triglicerídeos: 117 mg/dL 

resposta pelo whatsapp dia 10/08: Ana Cristina, seguem algumas orientações sobre seus exames e sintomas:
Ressecamento vaginal: como seus níveis hormonais estão em redução, isso pode contribuir para o ressecamento vaginal. Recomendo utilizar hidratante vaginal regularmente e lubrificante nas relações( pode ser o Belamy). Caso os sintomas persistam, podemos avaliar outras opções de tratamento.
Perda de urina se ainda estiver mantendo: recomendo iniciar/acompanhamento com fisioterapia pélvica, para fortalecimento e melhora da musculatura do assoalho pélvico. Podemos também manter as sessões de laser íntimo, conforme sua evolução e resposta ao tratamento.
Colesterol e triglicerídeos estão elevados. É importante manter uma alimentação equilibrada, aumentar o consumo de fibras, frutas, verduras e legumes, e reduzir frituras, gorduras saturadas, açúcar e alimentos ultraprocessados. A prática regular de atividade física também é importante.
Vamos acompanhar sua evolução e reavaliar os exames no próximo retorno. Caso mantenha dúvidas e deseja uma avaliação presencial, estarei essa semana no Humaitá - dia 13/08 - 15/08



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060765, '283', 'Ana Elara Ramos Do Nascimento', 2, 1, '05038914284', NULL, NULL, '2010-05-03', 3, 'Iregularidade mesntrual, disminorreia ( melhora com atroveran).
Exame fisico, paciente em bom estado geral, hidratada, eupneica, deambulando, acompanhada da mãe, pilificação normal.
Conduta: exames lab, usg pelvica', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61044584, '753', 'Ana Felícia Marques Martins', 2, 0, '78582695268', NULL, '(69) 9268-0936', '1992-05-09', 1, 'EXAMES DA PACIENTE NO PRONTUARIO
IDADE 33 ANOS 
DUM: 2023
MC: DIU DE MIRENA  - SETEMBRO DE 2024
G 1 PC A0
UPCCU; MAIO DE 2025
COMORBIDADES: DEPRESAO POS PARTO(VENAFAXINA) / LIPEDEMA (EM ANEXO) / REPOSIACAO DE VITAMINA C E B9
SONO: PRESERVADO
EXERCICO FISICO: MUSCULACAO 5 VEZES NA SEMANA
PLANO DE SAUDE: SULAMERICA

QP: 
PADRAO MENSTRUAL: DURACAO DO CICLO 3 DIAS, FLUXO MODERADO/POUCO/ NEGA DISMENORREIA 
ALEGA QUE APOS USO DE ZINCO QUELATO DE 30 MG APRESENTOU MELHORA NA SECRECAO VAGINAL 

AO EXAME
MAMAS NUMERO DE 2, PRESENCA DE PROTESE BILATRAL, AUSENCIA DE NODULOS
HIPERTROFIA DE CICATRIZ DE CESAREA
PRESENCA DE HIPERCROMIA EM REGIAO INTIMA, RAIZ DA COXA, INTERGLUTEO 
ESPECULAR: COLO ANTERIOS, PRESENCA DE SECRECAO ESPESSA ESBRANQUICADA, COM GRUMOS EM PAREDE, VISUALIZO FIO DO DIU

CONDUTA:
COLETADO PREVENTIVO EM MEIO LIQUIDO ATRAVES DE VIDEOCOLPOSCOPIO, ENTREGO A PACIENTE PARA LEVAR NO PORTO
GINOBIOTTA 
CONVERSO SOBRE POSSIBILIDADE DE TROCA DE MIRENA POR DIU DE PRATA GUIADA POR USG 
CONVERSO SOBRE POSSIBILIDADE DE SUSPENSAO DE VENAF
USG DE MAMAS
USG TV 

ORCAMENTO 
LASER 400,00 

--------------------------

PACIENTE SEM QUEIXAS 
NAO INICIPU GINOBIOTA
JA INIICOU USO DE SABONETE , ESFOLIANTE E CLAREADOR 


07/03/26
PACIENTE REALIZA LASER PARA CICATRIZAÇÃO

--------------------- // --------------------------

30/03/2026

paciente vem para peeling e laser cicatrização 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59055678, '266', 'Ana Isabele Olivera Alves', 2, 1, '05038914284', NULL, NULL, '2010-02-04', 3, 'Q,P: irregularidade mesntrual.
Conduta: exames lab, usg pelvica.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60537073, '648', 'Ana Julia de Queiroz', 2, 0, NULL, NULL, '(69) 9356-2252', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59043209, '260', 'Ana Julia Reis Fonseca', 2, 0, '04950177281', NULL, NULL, '2004-04-17', 3, 'consulta ginecologica
conduta: exames lab,usgtv.

20/08/2025

PACIENTE RETORNA COM RESULTADO DE EXAMES 
MC: ---
PACIENTE REFER QUE FEZ USO DA PIPULA DO DIA SEGUINTE 
SNR/ GLICOSE / HB 13,7/ HT 42,6/ LEUCO 82000/ GLICOSE 85 
USG TV 12/08: CISTO SIMPLE EM OVARIO ESQUERDO 
CONVERSO SOBRE IMPLANON
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60596248, '674', 'Ana Julia Souza Nascimento', 2, 0, '05038914284', NULL, '(69) 99225-6358', '1999-11-19', 3, 'idade: 19anos
DUM: 10/10
G0
SEXARCA: 19 ANOS
MENARCA: 11 ANOS
1 PARCEIRO
refere vacinação em dia

qp: primeira consulta ginecologica, nega dispareunia, dum tem duravcao de 7 dias, fluxointenso/moderado
nega discar, nega secreção vaginal.

conduta: usg tv , exames lab ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60689534, '697', 'Ana Karla Martines Gomes', 2, 0, NULL, NULL, '(97) 8433-2089', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59059284, '275', 'Ana Kenia Melo Dos Santos', 2, 0, '05038914284', NULL, NULL, '1998-06-07', 3, 'Usgtv.
Od cisto misto, septado, complexo.
Oe ciso simples.
Conduta: encaminhado p/ cirugia ginecologica.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61964632, '965', 'ANA LETICIA FERNANDES DE SOUZA', 2, 0, '00330129201', NULL, '(69) 99388-0242', '2014-04-14', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58923896, '39', 'Ana Lucia Batista Lopes', 2, 1, '59236272215', NULL, '(69) 9941-6853', '1975-11-03', 1, 'idade:
dum: 

QP: IUE,  preventivo dezembro de 2024, negativo para neoplasia e g. vaginalis, 


AO EXAME; PRESENCA DE POLIPO ENDOMETRIAL

CONDUTA; 
GYNOTRAN, SECNIDAZOL, AZITROMICINA REPETIR COM 7 DIAS
USG TV ( POLIPO), MMG, USG DE MAMAS, DENSITOMETRIA OSSEA, USG DE TIREOIDE, EXAMES LAB 

ninfoplastia 6000,00
laser 1800, 00 credito e 1500, 00 a vista 

PODE FAZER NINFOPLASIA 6 MIL E O LASER 1500, 00 NO CREDITO



29/07/2025
paciente retorna pos ninfoplastia 
refere que ainda esta inchado e cm prurido 
sem pontos no local da cicatriz
realizo fotobiomudulacao 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59067623, '298', 'Ana Lúcia de Santana Silva', 2, 0, '82566860220', NULL, '(69) 9329-7410', '1985-03-12', 1, 'PACIENTE COM EXCESSO DE PELE EM CLITORIS E PEQUENOS LABIO ESQUERDO
REALIZO 1 SESSAO DE LASER INTIMO  = 1500, 00 A VISTA NO PIX

CONDUTA: COLETA DO PREVENTIVO
EXAMES LAB
EAS E UROCULTURA
ESTUDO URODINAMICO
NINFOPLASTIA 6 MIL A VISTA OU 6500,00 EM 5 VEZES 
CLAREAMENTO 400, 00 A SESSAO ( PROTOCOLO COM LASER E OUTRAS SESSOES COM PEELING + POTENCIALIZACAO EM DIA SEGUINTE INCLUSO NO VALOR DE 400,00) 
VENDO SABONETE LIQ 150 ML (120,00) E LOCAO CALMANTE ( 160 = CREDITO 2 VEZES 

22/04/2025
resultado de preventivo 11/03/25: negativo para neoplasia 

paciente refere que após a primeira sessao do laser observou melhora na IUE ( ao espirar) e e diminuiu a ida ao banheiro 

24/01/2026
IDADE: 40 ANOS 
G2P2A0
MC: PRESERVATIVO
DUM: 13/01/2026
UPCCU: resultado de preventivo 11/03/25: negativo para neoplasia 

QP: NEGA SECRECAO VAGINAL, NEGA PRURIDO, NEGA DISURIA, NEGA PERDA DE URINA, 

AO EXAME:

COLO CENTRALIZAD, EM FENDA, PRESENCA DE SECRECAO AMARELADA, COM ODOR E BOLHAS
CONDUTA: 
ORIENTACOES
3 SESSAO DE LASER
GYNOTRAN E SECNIDAZOL
COLETADO PREVENTIVO CONV 
USO ORAL


1.	Secnidazol 1 g  ______________________________________04 comprimidos 
Tomar 02 comprimido via oral dose única para o casal.

2.	Ginobiotta _____________________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses.
3.	Zelix 150 mg _________________________________01 comprimido
      Tomar 01 comprimido oral dose única


USO VAGINAL 

1.	Gynotran  _____________________________ 1 caixa
Aplicar 01 óvulo via vaginal, por 7 dias.


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59089280, '329', 'Ana Luiza Da Silva Braga', 2, 2, '03420963203', NULL, '(69) 99249-0680', '2005-09-05', 3, 'G1 P0
 IG 31 SEM 2 DIAS ( USG DO DIA 02/11/2024 COM 12 SEM 4 DIAS) E DUM 06/08/2024

TS A RH NEGATIVO
ESPOSO O RH POSITIVO 
CI NEGATIVO 13/11 E 18/01/2025
SNR
TOXO SUCEPTIVEL
GLICEMIA 77,6

PA 120 X 70 
AGUARDO SNR, HBSAG, ANTIHCV, HIV, VITAMINA B12 E VITAMINA D, 
ORIENTACOES 

ANA LUIZA
30/04
IG 38 SEM E 1 DIA 
SEM QUEIXAS 
PA: 120 X 70 MMHG
PESO 72KG 
BCF: 140 BPM 

CONDUTA: ORIENTACOES, PROCEURAR A MMME CASO, PERDA DE LIQUIDO, SANGRAMENTO VAGINAL, CONTRACOES, DIMINUICAO E PARADA DO MOVIMENTO FETAL 
PACIENTE DESEJA IMPLANON 2400,00


retorno 29/07
2 MESES pos parto cesarea (DCP) MMME, EM USO DE SULFATO FERROSO

PACIENTE OPTOU POR INSERIR DIU DE MIRENA (?)
USG TV  11/ 07/2025
UTERO 64/ OD 105 /OE 69 
DIU NORMOPOSICIONADO

REGENESIS
RETORNO 4 MESES

-----------------   // ------------

DUM
paciente em uso de diu e cobre, apresentando distrai e secreção amarelada, pruriginoso e ardência 


NOME: Ana Luiza Da Silva Braga

Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos via oral dose única para o casal.
2.	ZELIX 150 mg _________________02 comprimidos
Tomar 01 comprimido via oral dia 08 e repetir com 7 dias     (dia 12/11/2025) 
3.	GINOBIOTTA ___________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses 


Uso vaginal 

4.	Gynotran ___________________________01  caixa 
Aplicar 01 óvulo via vaginal, à noite, por 7 dias.


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61950352, '963', 'Ana Luiza Gomes de Macedo', 2, 0, '06544056200', NULL, '(69) 99265-6241', '2013-08-24', 3, 'IDADE: 12 ANOS 
MENARCA DEZ DE 2025
DUM: 16/07/2026
SEXRACA: NEGA
COMORBIDADES: NEGA 
PESO 42 KG
PA 110 X 60 MMHG

QP: PACIENTE ACOMPANHADA DA MAE, VEM PARA ROTINA GINECOLOGICA, ALEGA 3 EPSODIO DE SINCOPE ( 1 APOS P. BENZATINA, 2º APOS FRATURA DO DEDO, 3º MES DE JULHO EM UMA LOJA - ALEGA JEJUM INTERMITENTE
JA APRESENTOU HISTORICO DE VITAMINAS BAIXA
NAO PEGA SOL
NEGA ALIMENTACAO SAUDAVEL 

CONDUTA; ORIENTACOES 
EXAMES LAB 

NOME: Ana Luiza Gomes de Macedo

SOLICITO

HEMOGRAMA  
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
EAS


10 / 08 /2026

NOME: Ana Luiza Gomes de Macedo

SOLICITO

USG DE MAMAS E AXILARES


NÓDULOS EM MAMAS ? 
ASSIMETRIA MAMARIAS 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061406, '292', 'Ana Luiza Silva Braga', 2, 5, '05038914284', NULL, NULL, '2005-09-05', 3, 'Paciente gestante já iniciou o pré-natal.
Especular: colo posterior, amarelado com fluido e grumos na parede, odor.
bcf:
pa:
Conduta: metronidazol, secnidazol p/ parceiro.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59857758, '541', 'Ana Maria Cordeiro Teixeira', 2, 0, NULL, NULL, '(69) 9376-9512', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61341843, '814', 'ANA PAULA NUNES DA SILVA', 2, 0, '05826332220', NULL, '(69) 99394-7622', '2009-05-05', 3, 'idade
16 anos 

paciente acompanhada do pai (Marcelo), alega dor incapacitante durante período menstrual, 
apresenta usg TV 15/08/26: útero 95,5, end 0,9 cm/ od 3,8 oe 9,1  exames normal

conduta: 
orientações 
dieta alimentar 
solicito RNM 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038601, '252', 'Ana Paula Reis Fonseca', 2, 1, '05038914284', NULL, NULL, '2008-08-16', 3, 'paciente acompanhada da mãe, refere que iniciou atividade sexual, sem contracepção e desprotegida.
exames:  hb 12,5, ht 38,3, glicose, tsh 1,25, t4 1,20.
conduta: sorologia, urocultura, iumi, encaminhamento p ciri, diu.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061417, '294', 'Ana Paula Silva frota', 2, 2, '05038914284', NULL, NULL, '1998-02-28', 3, 'Disminorreia, secreção vaginal de muco hialino.
apresenta usgtv 21/11/22
utero 72,2cm, od 8,2, oe 11,2, ovarios micropolicisticos.
conduta: exames lab.

28/01/25
cesarea 07/02/24
em amamentação, no momento paciente refere ser usuaria de diu de cobre, alega fluxo menstrual intenso, realizou usgtv eo diu está normoposicionado, realizou exame lab com anemia e hipovitaminose.
Conduta:  exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59056223, '270', 'Ana Paula Silva Pinto', 2, 2, '05038914284', NULL, NULL, '1976-04-14', 3, 'Hidrossalpinge a esquerda rnm 10/22
Conduta: profenid
Paciente refere que ainda continua com dor pelvica e ardencia pós relação sexual.
Conduta: eas+ urocultura.
profenud+ omeprazol 5 dias + crevagin.

Retorno 24/01/23
paciente refere tto com ciprofloxina 24/10/22
assitomatica no momento.
colonoscopia negativo 31/08/22
urocultura negativo 31/08/22
snr 22/11/22
preventivo 11/11/22
conduta: usgtv, mmg

16/01/24
paciente refere dor pelvica a esquerda inicio de dezembro com duração de 2 dias, internada no hospital jp realizou tc.
apresenta exames mmg 11/23 bi-rads 0.
usg abdome total 15/11/23 colelitiase, esteatose hepatica
usgtv 15/11/23 hidrossalpinge a esquerda.
 Especular ausencia de colo, ausencia de dor a mobilização.
conduta: usg de mama, usgtv, metronidazol, profenid
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61703810, '902', 'Ana Sophia Lopes da Silva', 2, 0, '04436122263', NULL, '(69) 99917-0403', '2013-12-16', 1, '12 ANOS 
MENARCA 9 ANOS
COMORBIDADE: ASMA - ANSIEDADE - AUTISMO 2 -DESLEXIA 
MEDICCACAO DE VEZ EM QUANDO FLUOXETINA, AEROLIN, ALENIA 
DUM: 16/06/2026

QP: PACIENTE ACOMPANHADA DA MAE, REFERE QUE EXITE ATRASO MENSTRUAL DE 2 MESES ( MARCO E ABRIL ). 16 DE MAIO A MENSTRUAÇÃO VEIO COM FLUXO INTENSO E ACOMPANHADO DE COAGULOS, COM PAUSA DE 7 DIAS E APOS VEIO A MENSTRUAÇÃO NOVAMENTE COM DISMENORREIA INTENSA, PROCUROU SERVIÇO MEDICO, ONDE FOI PRESCRITO TRAMAL DE 6/6 HORAS 

Ultrassom de abdômen total realizado dia 17/06/2026 hipótese diagnóstica insisto anexial à direita observa-se imagens cística de contorno regular medindo 6,4 cm de diâmetro e volume de 124 cm³
Exames laboratoriais no dia 10/04/2026 glicose 95 triglicerídeos 101 uréia 18 creatinina 0,5 colesterol total 167 ferritina 45 hemoglobina glicada 5,9 tgo 19 tgp 16 ferro sérico 63 vitamina B12 425 tsh zero ponto 89 t 4 livre 1,26 vitamina D22 hemoglobina 12,3 hematócrito 38 leucócito 11700 plaqueta 490000


conduta: orientacoes
dipirona 1 g
triplo 
transamim 
usg pelvica 
exames lab 

ATESTADO MÉDICO

			


ATESTO PARA OS DEVIDOS VINS QUE A SRA Ana Sophia Lopes da Silva NECESSITA DE 01 (HUM) DIA DE AFASTAMENTO DE SUAS ATIVIDADES LABORAIS, APARTIR DESTA DATA.


CID Z01.4


DECLARAÇÃO MÉDICA PARA AFASTAMENTO DE EDUCAÇÃO FÍSICA



Declaro, para os devidos fins, que a aluna Ana Sophia Lopes da Silva, encontra-se em acompanhamento médico devido a quadro ginecológico em investigação, apresentando sintomas que contraindicam a realização de atividades físicas, esportivas e exercícios de impacto neste momento.
Recomenda-se o afastamento das aulas de Educação Física e demais atividades que exijam esforço físico pelo período de  10 dez dias, a contar de 19 /06 /2026.

A aluna poderá permanecer nas demais atividades escolares, desde que respeitadas as limitações clínicas atuais.







Dra. Christiane Alves Calixto
CRM: 3316

------------------------------  // -------------------------
RETORNO: 03/07

DUM: 03/07
USG PELVICA 24/06/2026: UTERO 89, OD 15,3 ( FOLICULO DOMINANTE) OE 6,8 - EXAME NORMAL 
PCIENTE REFERE QUE A MENSTRUACAO DESCEU HOJE, FLUXO MODERADO

CONDUTA: PONSTAN 

---------------------------------------------
08/07/2026
colesterol 198 triglicerídeos 117 glicose 95 Ferros 31 to 16 tgp 18 é 22,5 vitamina B12 632 vitamina D 31,7 t 4 livre 1,26 tsh 1,4 insulina 35 ferritina 11 hemoglobina glicada 6,1 hemoglobina 11,1 hematócrito 35 leu 10920 plaqueta 525 ultrassonografia pélvica útero 89 cm³ ovário direito 15,3 ovário esquerdo 6,8 exame dentro da normalidade

RNM DA PELVE COM SEDACAO 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60749516, '706', 'Analdir Nascimento moura Batista', 2, 0, NULL, NULL, '(69) 9249-0942', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60595942, '673', 'Anarrio Acel Sobrinho rodrigues', 2, 0, '93404522249', NULL, '(69) 99992-6220', '1991-03-07', 3, 'IDADE: 34 ANOS 
DUM: 25/10
MC; PRESERVATIVO
RISCO DE TROMBOSE 
PCCU: 16/06/2025: NEGATIVO PARA NEOPLASIA - GARDNERELLA
usg tv 16/06/25: utero didelfo, end 7 e 8 mm, od 4,4 e oe 4,8 
exames lab 16/06: vitamina b12 e D baixas, SNR, Tsh 1,35/ t4 livre 1,12, trig 90 

QP: PACIENTE REFERE HISTORICO DE VAGINOSE E CANDIDIASE DE REPETICAO, FEZ USO DE 
CLINDAMICINA 30 MG DE 12/12 HORAS POR 7 DIAS, SECNIDAZOL, CREVAGIN, FLUCONAZOL, KRONEL
gynotran, secnidazol, ginobiotta 
retorno em 1 mes saber sobre a resolução vaginose e candidíase 


----------------
27/01/2026
paciente refere melhora parcial, alega secreção vaginal amarelada com odor 
colo centralizado, secreção esbranquiçada bolhosa, com odor 

conduta: 
tericin at
secnidazol 
solicito lab 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61950036, '956', 'Anataly Borges Xavier', 2, 0, '04832711288', 'borgesx4v1ee@gmail.com', '(69) 99218-6839', '2008-12-17', 3, '17 ANOS 
SEXARCA  - NEGA 
MENARCA 9 ANOS 
COMORBIDADES NEGA 
DUM: 08/08/2026 

QP: PACIENTE ACOMPANHADA DA MAE, REFERE CEFALEIA, ENXAQUECA, DISMENORREIA E INAPETENCIA 

EXAMES LAB 

CONDUTA: EXAMES LAB 
NOME: Anataly Borges Xavier

SOLICITO

HEMOGRAMA  
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 


10 / 08 /2026


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59396089, '470', 'Andrea Schwantes Dos Passos', 2, 0, NULL, NULL, '(97) 98113-8882', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59059237, '274', 'Andrea Souza De Sousa', 2, 4, '05038914284', NULL, NULL, '1971-11-12', 3, 'Fogacho.
Conduta: usgtv, preventivo, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61502783, '856', 'ANDRÉIA ALVES FERREIRA', 2, 0, '82926433204', NULL, '(69) 99399-7201', '1982-10-14', 3, 'G2 P2 C A 0
DUM: 15/04/2026
LT
COMORBIDADES NEGA 
UPCCU: 2025
PESO 61.800
PA 99 X 65 MMHG

PACIENTE REFERE SINTOMAS DO CLIMATERIO, ALEGA PERDA DE URINA DE AOS PEQUENOS ESFORCOS 
ALEGA QUE FEZ 2 CIRURGIA DO FRIO DA LINGUA
ACIDENTE AUTOMOBILISTICO AOS 12 ANOS 

ALEGA CARROCO NA VULVA
EXAMINAR NO RETORNO 
EXAMES LAB 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60641086, '696', 'Andreia dos Santos Magalhães de Morais', 2, 0, NULL, NULL, '(69) 9956-9898', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59037928, '243', 'Andreia Farias M da conceição', 2, 2, '05038914284', NULL, NULL, '1989-11-25', 3, 'rotina ginecologica
conduta: exames lab, usg, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62171995, '993', 'ANDREIA MACIEL MARQUES', 2, 0, '00650512200', NULL, '(69) 99313-5088', '1987-08-07', 3, '### ANAMNESE GINECOLÓGICA

**Paciente:** Andréia Maciel Marques
**Idade:** 39 anos.

**Queixa principal:**
Secreção vaginal esverdeada, associada a prurido vaginal.

**História da doença atual:**
Paciente de 39 anos comparece à consulta ginecológica referindo **corrimento vaginal de coloração esverdeada, sem odor, associado a prurido**. Nega outras queixas no momento, conforme informações fornecidas.

**Antecedentes pessoais:**

* Hipertensão arterial sistêmica.
* Outras comorbidades: não informadas.
* Alergias medicamentosas: nega.

**Antecedentes cirúrgicos:**

* Artroplastia prévia.
* Laqueadura tubária.
* Nega outras cirurgias prévias.

**Antecedentes ginecológicos:**

* Menarca aos 14 anos.
* DUM: 18/08/2026.
* Último exame citopatológico do colo uterino (preventivo): realizado em 2025.

**Método contraceptivo:**

* Laqueadura tubária.

**Hábitos de vida:**

* Realiza atividade física regularmente, com prática de academia.

**Medicações em uso:**

* Paciente não soube informar as medicações em uso no momento da consulta.

**Dados antropométricos e sinais vitais:**

* Peso: 64 kg.
* PA: 130 × 80 mmHg.

**Exame ginecológico:**
COLO CENTRALIZADO, PRESENCA DE SECRECA ESPESSA ESVERDEADA, COM ODOR 

**CONDUTA:**
NOME: ANDREIA MACIEL MARQUES

Uso oral

1.	Secnidazol 1 g______________________02 comprimidos 
Tomar 02 comprimidos via oral dose única.

2.	Zaila ___________________________01 caixa
Tomar o1 comprimido via oral, 1 vez ao dia, por 30 dias.  

Uso vaginal

1.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038575, '251', 'Andreia Maria Nogueira Dos Reis Vargues', 2, 2, '05038914284', NULL, NULL, '2024-04-16', 3, 'Alega que no periodo mesntrual, apresenta tontura, fraqueza, secura nos olhos, irritabilidade.
conduta: exames lab, usgtv, trazer na proxima consulta resultado ppccu e mmg.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62071312, '969', 'Andreia Miranda Seibert de Alencar', 2, 2, '61127523287', 'andreia_seiber@hotmail.com', '(69) 99961-4898', '1978-06-24', 1, 'Acompanhamento da Paciente Inicio de Emagrecimento.
Estomago 95CM
Barriga 105 CM
Glúteo 119  CM 
Peso de 94 kg agora por 88kg

Realizando o Inicio dos Protocolos Marcar o Acompanhamento e Hormônios.

1 Dose de Antioxidante 22/08/26
1 Dose de Ativador Metabólico 11/09/26
Paciente Ganhou de Cortesia Através da compra do Protocolo Uma Hidratação com Laser Intimo 
Total de unidade de protocolos 8 

Valor Total  ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61056129, '758', 'ANDREYNA DA SILVA MARQUES', 2, 0, '03065137224', NULL, '(69) 99939-4098', '2000-04-25', 3, '25 ANOS 
DUM:01/02/26
MC: DIU DE COBRE
G2P2A0
UPCCU: 2022

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA

CONDUTA: ORIENTACOES 
PREVENTIVO
USG TV 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061213, '287', 'Andriele Lima Dos Santos', 2, 0, '05038914284', NULL, NULL, '1995-08-25', 3, 'Q,P: paciente refere dor de ovulação, nega  disparaunia, nega secreção vaginal, refere menstruarão regular.
apresenta exames lab 10/06/24
hb 12,5, ht37,3, leuc 8640, plq 295,00, calcio 9,2, tsh 3,66, t4 6,5, t60 17, tlap 13, trig 122, col 181, glicemia 93, eas 5 a 6 pioc.
conduta: solicito usgtv

09/10/21
usgtv: utero 113, end 12mm, od 22cm, oe 32cc, micropolicisitco.
usg de mamas bi- rads 1
conduta: metformina, diane 35, sop.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61915460, '947', 'Angela da Conceição Bilio', 2, 3, '52768554200', 'angelabilio.29@gmail.com', '(69) 98501-1554', '1986-08-13', 3, 'G2 P2 A0
DUM: 28/07/2026
MC: ELAINE CICLO 
paciente referente dor durante a penetração, alega secreção com odor e disuria
ao exame
colo centralizado, puntiforme, presença de secreção acinzentada, bolhosa, sangraste a coleta

conduta:
ciprofloxacin
secnidazol
gynotran 
coletado preventivo em meio liquido ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61638899, '881', 'Angela Gois Cavalcante', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, 'Ângela Conceição Góes 
idade 43 anos 
data da última menstruação 7/05/2026 
método contraceptivo laqueadura 
gesta 3 partos 3 abortos zero 
comorbidade nega 
medicação nega 
método contraceptivo laqueadura tubária bilateral 
preventivo maio de 2025 
queixa principal o paciente vem para mostrar resultado de exame:
 ultrassonografia transvaginal do dia 3/06/2026 útero médio versus fletido volume de 40,17 cm³ endométrio de 3,5 mm ovário direito de 3,7 cm³ ovário esquerdo de 6,89 cm³ 
preventivo do dia 20/05/2026 negativo para neoplasia microrganismo presença de gardnerella vaginalis 
conduta solicita exames laboratoriais prescrevo ginottran secnidazol para O CASAL 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061327, '290', 'Angela Maria A De Olivera', 2, 1, '05038914284', NULL, NULL, '1993-03-27', 3, 'Dor pelvica, disminorreia, irregularidade menstrual, disminorreia, aumento de fluxo (absorvente noturno).
Apresenta resultado
pcr  não reagente, hb 12,5, ht 39,9, leuc 7,300, plq 325,000.
citologia oncotica 18/05 neg para neoplasia.
Conduta: usgtv, mamas, rins e vias urinarias, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60908880, '729', 'ÂNGELA MARIA DE FREITAS COSTA', 2, 0, '66700035287', NULL, '(69) 99356-7655', '1975-10-16', 3, 'IDADE: 50 ANOS 
G 9 P7 A1 
DUM: 08/01/2026
LT 
UPCCU: 2024
COMORBIDADE: IMC ALTO

QP: PACIENTE REFERE FOGACHO, SECURA VAGINAL ( ESAT SEM ATIVIDADDE SEXUAL) DIMINUICAO DA LIBIDO, SINUSSORRAGIA ( POLIPO ENDOMETRIAL)

CONDUTA:
 EXAMES DE IMAGEM E EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60063163, '589', 'Ângela Maria Ramos De Castro', 2, 0, '77153367268', NULL, '(69) 99355-9609', '1974-04-14', 3, 'IDADE: 51 ANOS
DUM:
 OUT 2024 
UPCUU: 2024
COMORBIDADES: HIPERTENSAO 

QP: PACIENTE REFERE FOGACHO, DOR EM BAIXO VENTRE, NEGA DISPAREUNIA, DEVIDO A DOR NAO ESTA TENDO RELACAO SEXUAL
CONDUTA: EXAMES LAB E IMAGEM
MAPA 

EXAMES DE SANGUE 
419,92 A VISTA E 538,00  CREDITO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924488, '48', 'Angela Nunes Barros', 2, 2, '05038914284', NULL, NULL, '1971-07-15', 3, 'PACIENTE NO CLIMATERIA, COM QUEIXA DE SECURA VAGINAL, FOGACHO, IRREGULARIDADE MENSTRUAL.
CONDUTA: USGTV, EXAMES LAB.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59055867, '267', 'Angela Ramos De Castro', 2, 3, '05038914284', NULL, NULL, '1974-04-14', 3, 'Q.P: dor pelvica que irradia para pernas, alega fogacho, irritabilidade, insonia, alega disuria.
Ao exame giordano positivo a direita.
Especular, colo centralizado, presença de ectopia, secreção amarelada, sem odor.
Conduta: orientações, usgtv, preventivo, exames lab, gynotran.

08/01/23
dum agosto 23
paciente refere fogacho, irritabilidade,  baixa libido, dor articular, alega atividade fisica hoje, nega nodulo mamario, alega que realizou mamografia e está aguardando resultado.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60595534, '669', 'Angela Santos Anselmo', 2, 2, '43807356215', NULL, '(69) 98108-1894', '1976-02-20', 3, 'IDADE: 49 ANOS 
DUM: 17/10/2025
MC: NEOVLAR
G0 P0
UPCCU: 14/08/2025: NEGATIVO PARA NEOPLASIA 
UMMG: 09/9/2025: BI RADS 1 

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, REFER QUE NESSE CICLO APRESENTOU SANGRAMENTO COM COAGULO, ALEGA UMA DISCRETA CEFALEIA, ALEGA PRURIDO VAGINAL, NEGA SECRECAO VAGINAL
EXAMES LAB 
Exames laboratoriais 18 setembro de 2020 hemoglobina 11,7 hematócrito 36,3 leuco 7600 plaqueta 345000 hemoglobina glicada 5,93% ácido duro 8,4 colesterol 218 ldh 118 triglicerídio 359 glicose 87,8 TGP 13,2 tgo 19,3 creatina 3 t 4 livre 1,1 tsh 1,48 EAS INFECCIOSO 

CONDUTA: USG TV, USG DE MAMAS, USG DE RINS E VIAS URINARIAS
SOLICITO EXAMES LAB 
INICIO CIPROFLOXACINA, lipless e  HEMOLIP POR 60 DIAS 
retorno', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61876878, '936', 'Angelica de Sousa Lopes Pardo', 2, 0, '45746222291', 'angelpvh@hotmail.com', '(69) 98404-1404', '1975-10-25', 1, 'IADE: 50 ANOS 
G2 P2 A0
DUM: HISTERECTOMIA EM 2024 - MIOMATOSE UTERINA /. ADENOMIOSE / ADERENCIAS = BIOPSIA SEM INDICIO DE MALIGNIDADE
UPPCU: 2024
COMORBIDADE: PRE - DIABETES / HIPERTRIGLICERIDEMIA 
MEDICACAO: MONJARO 3 APLICACOES 2,5 UI- CAROLINE MARTINS / DONAREN / VITAMINAS D, B12 / LENZETTO - OESTROGEL/CREATINA/ 
SONO: AS 3 HORAS ACABA O SONO 
EXERCICIO FISICO: ACADEMIA REGULAR E DIARIO
INTESTINO: REGULAR
USG DE MAMAS E MMG - REALIZADO - CISTO DE MAMA
COLONOSCOPIA: POLIPO INTESTINAL = BIPSIA NEGATIVO PARA NEOPLASIA 
ENDOSCOPIA= GASTRITE -  2025 
DENSITOMETRIA OSSEA OK

QP: PACIENTE REFERE QUE JA OERDEU PESO 4 QUILOS, ATUALMENTE  65 KG, 
OESTROGEL 
PACIENTE REFERE HIPERTROFIA DE PEQUENOS LABIOS, ALEGA DOR NO ATO SEXUAL E USO DE VESTIMENTA
AO EXAME:
PRESENCA DE HIPERCROMIA EM REGIAO INTIMA
HIPERTOFIA DE CLITORIZ E PEQUENOS LABIOS 
PRESENCA DE FLACIDEZ CANAL VAGINAL PROXIMO AO COLO UTERINO 

CONDUTA:
INDICO LASER INTIMO 3 SESSOES
CAPUZPLASTIA E NINFOPLASTIA 

ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: Angelica de Sousa Lopes Pardo
Procedimentos:
•	Labioplastia
•	Capuzplastia
 
Prezada Angelica de Sousa Lopes Pardo
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia  e capuzplastia
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
A associação com a correção da labioplastia e capuzplastia permite um resultado mais completo, proporcionando melhora estética, maior conforto íntimo, aumento da autoestima e bem-estar funcional.
 
Valor dos Procedimentos:
R$ 15.648,00 parcelado em 6 vezes no cartão de crédito 
R$ 15.000,00 á vista 
 







Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação do pós-operatório (uma no pré-operatório imediato e outra no dia posterior ao procedimento).
•	Este orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou início do parcelamento.


Atenciosamente,



Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima

-----------------------------------

10/09 retirada de pontos e foto
 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59043362, '261', 'Angelina Nascimento De Souza', 2, 1, '05038914284', NULL, NULL, '2024-10-06', 3, 'Q.P: paciente encaminhada devido a miomatose uterina, refere sangramento uterino anormal, em uso de sufato ferroso, realizou tto p/ sifis (sic)
exames lab 15/05
hb, 11,10, vdrl +, piocitos sg p/ campo realizou tto.
usgtv, utero 145 miomatose, intramural e subseroso, endometrio 6mm, od 4,3, oe 2,4.
conduta: gestinol 28, solicito urocultura+ vdrl.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61920383, '948', 'Anna Caroliliny Kalike', 2, 0, '04653581282', NULL, '(69) 98133-8413', '2007-03-17', 1, 'IDADE: 19 ANOS 
MENARCA: 13 ANOS
SEXARCA: 15 ANOS 
G0 P0
DUM: 26/ 07/2026
MC: -----    AZORPERNIA ?
UPCCU: NUNCA REALIZOU
PARCEIROS 3 
VACINA HPV: NAO 
EXERCICIO FISIO AS VEZES - ACADEMIA 
INTESTINO: CONSTIPACAO 
ALERGIA A MEDICACAO: NEGA
USO DE MEDICACAO: VITAMNA B 12 - POR CONTA PROPRIA 

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, NEGA SECRECAO VAGINAL, NEGA DISURIA, NEGA DISPAREUNIA, DISMENORREIA, DURACAO DO FLUXO DE 6 DIAS, FLUXO MODERADO, 
NEGA NODULO MAMARIO

ao exame: colo centralizado, puntiforme, presença de secracao esbranquiçada com discretos grumos em parede, sem odor 
presença de hipertrofia de clitoris e pequeno lábio grau 4

CONDUTA:
 ORIENTACOES 
CERTIFICAR SE TOMOU VACINA HPV
crevagin
coletado preventivo em meio liquido 


ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: Anna Caroliliny Kalike
Procedimentos:
•	Labioplastia
•	Capuzplastia
 
Prezada Anna Caroliliny Kalike 
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia  e capuzplastia
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
A associação com a correção de prega acessória e capuzplastia permite um resultado mais completo, proporcionando melhora estética, maior conforto íntimo, aumento da autoestima e bem-estar funcional.
 
Valor dos Procedimentos:
R$ 15.648,00 parcelado em 6 vezes no cartão de crédito 
 
Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação do pós-operatório (uma no pré-operatório imediato e outra no dia posterior ao procedimento).




•	Este orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou início do parcelamento.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59865520, '545', 'Anne Caroline Menezes Santos', 2, 5, '01122490275', NULL, '(69) 99360-3139', '1994-04-02', 3, 'idade: 31 anos 
DUM: 03/07
MC: ACI MENSAL - NOREGYNA
UPCCU: 2024
QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA QUE ACI SE ADAPTOU BEM
ASSINTOMARTICA NO MOMENTO DA CONSULTA 
CONDUTA: AGENDAR PREVENTIVO ( NO MOMENTO MENSTRUADA), EXAMES LAB, USG TV ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060686, '280', 'Anne Karolyne Santana Leite', 2, 1, '05038914284', NULL, NULL, '2004-08-06', 3, '1 vez  consulta ginecologica
menarca 13 anos
sexarca 17 anos
conduta: exames lab, usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59337826, '451', 'Anny Beatriz Abreu De Almeida', 2, 0, '06680722292', NULL, '(69) 99251-1905', '2010-07-19', 3, 'IDADE; 14 ANOS 
DUM: 14/03/2025

MENARCA: 11 ANOS
SEXARCA: 13 ANOS
MC: PRESERVATIVO

ESCOLA JOAO BENTO - 1 ANO - PROGRAMADORA 
NAMORADO - 1 ANO - 15 ANOS 

CONDUTA: ORIENTACOES, INICIAR CARTELA NO DIA DO CICLO, RETORNO COM 30 DIAS ( ADESAO AO ACO)
AVALIAR ESTUDO 

30/05/2025
PACIENTE REFERE QUE FEZ USO ERRADO DO METODO
EXPLICO NOVAMENTE 
ACO IUMI 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59529532, '506', 'Anny Caroline Martins Oliveira', 2, 0, '06197661233', NULL, '(69) 99203-6518', '2003-08-02', 3, 'IDADE: 22 ANSO
DUM: 28/05/2025 ( IRREGULARIDADE )
SEXARCA: 15 ANOS 
G 0 P0
UPCCU: NUNCA REALIZOU
COMORBIDADE: TIREOIDEOPATIA 
QP; PACIENTE REFERE IRREGULARIDADE MENSTRUAL, DISMENORREIA 
exames lab, usg tv, programar preventivo

EXAMES DE SANGUE 260,00 REAIS A VISTA

24/06/25
colo ectopia, secrecao bolhosa, discreto odor
dor na coleta de preventivo
tv: dor a mobilização do colo de utero 

conduta; coletado preventivo
gynotran, secnidazol, triplo a 
suplementar vitamina d 250,00




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060931, '285', 'Anny Caroline Martins Olivera', 2, 0, '05038914284', NULL, NULL, '2003-08-02', 3, 'Paciente refere  que apresentou d.v.a, com disminorreia.
abd dolorosa a palpicie.
conduta: exames lab, ibuprofeno, usgtv, retorno.

reotorno 17/01/24
utero 46,44, end 6,3, od 12,22, oe 12,34, ovarios micropolisciticos.
usg de abd 20/07/24 esteatose hepatica leve, nefrolitiase biliar não obstrutiva 0,4 cm.
bhcg -
tsh 9,42
t4 livre 1,14 ao endocrino, hb 15, ht 45,9, leuc 6,180, plq 26,900, coag normal, glicemia 100, col 215, trig 203.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62249746, '917', 'Antônia de Cássia Matos Ribeiro', 2, 1, '09519715223', 'antoniadecassiamatos48@gmail.com', '(69) 99336-0351', '2008-11-29', 1, 'Paciente: Antônia de Cássia Matos Ribeiro Idade 17 Anos 
Relata que Nunca foi em uma ginecologista, e Teve a sua primeira Relação Sexual recentemente.
Paciente gostaria de realizar uma consulta e se prevenir e ter todos os cuidados necessários.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061323, '289', 'Antonia Martins Olivera', 2, 0, NULL, NULL, NULL, NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59037621, '241', 'Antonia Moreira Nunes', 2, 2, '05038914284', NULL, NULL, '1985-11-01', 3, 'rotina ginecologica, assitomaico no momento.
conduta: exames lab, programar preventivo, usgtv.

05/06/23
retorno
usgtv 03/06/23, utero 149cm, endometrio medindo 41 a direita e 4,3 a esquerda, colo uterino unico, ovarios sem alt.
utero bicorno.
exames lab 20/05/23 tsh 2,70, t4 livre, bhcg negativo, trig 80, tgp 11, tgo 15, creat 0,60, col total 123, glicose 80, hb 12,5, ht 37,2, plq 238,000.
Especular: colo centralizado lialino, tv ausencua de dor a mobilização.
Conduta: solicito preventivo.

retorno 10/07/23
resultado do preventivo negativo para neoplasia.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060748, '282', 'Antonia Rosileuda S de olivera', 2, 2, '05038914284', NULL, NULL, '1986-01-13', 3, 'Rotina ginecologica, alega  j.u,e, nega disuria, dispareunia, nega secreção vaginal.
Conduta: orientações.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60236506, '612', 'Araci Barros Ramada', 2, 0, NULL, NULL, '(97) 8401-1856', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59043092, '258', 'Ariana Nascimento Da Luz', 2, 5, '05038914284', NULL, NULL, '1987-01-16', 3, 'rotina ginecologica.
exames lab, usgtv, programar preventivo.

23/07/24
retorno
exames 09/07
col 151, trig 57,  glicose 91, hb 12,9, leuc 7,750,  plq 244,00, t4 1,11, tsh 3,81.
usgtv 09/07/24  utero 115,2, end 8mm, od  7,6, oe 8,3, sem alteração.
conduta:orientções.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61010342, '738', 'ARIELLY KETHELEN GALEAZI DA SILVA', 2, 0, '06662535281', NULL, '(69) 99359-2547', '2001-11-24', 3, 'IDADE 24 ANOS 
DUM: 27/01/2026
MC: PRESERVATIVO

G0P0

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA
ALEGA PELA NA FACE, LINHA ALBA, REGIAO INTIMA, ACNE, MENSTRUACAO IRREGULAR: SOP?

CONDUTA: 
ORIENTACOES
EXAMES LAB
USG TV
PROGRAMAR  PRVENTIVO 
---------------------------
Exames laboratoriais do dia 2/04/2026 sorologia não reagente insulina 4,8 b 12 699 vitamina D 22 estradiol 72 ferritina 140 ácido úrico 3,2 ferro 12 Hemoglobina 14,9 e matou a 43,8 leuco 4610 plaqueta 319 hemoglobina glicada 5,1 creatinina 1, 81 magnésio 1,8 tgo 30 tgp 38 purê 16 colesterol 89 triglicerídio 30 LH 9 progesterona 0,2 t 4 livre 1,6 tch 0,9 fsh 5,7 testosterona 54

5700,00 ninfoplastia 
se parcelar acrescentar o juros do cartão 
coletado preventivo

ao exame
colo com presença de ectopia, secreção esbranquiçada com grumo s( fot)
avaliar resultado de preventivo se alterado indicar colposcopia 
-----------------------
02/06/2026
paciente refere que no local da aplicação da vitamina esta com prurido e um pouquinho inchado
local endurecido 
Uso tópico

Hirudoid gel _______________________01 tubo
Aplicar 3 vezes ao dia no local, por 7 dias 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61027044, '745', 'ARIELY MENEZES DOS SANTOS FIRMINO', 2, 0, '04290975224', NULL, '(69) 99315-8489', '1998-12-12', 3, '27ANOS
G2 P2N
mc aco
UPCCU: JAN DE 2025 

PACIENTE REFERE ARDENCIA NO CANAL VAGINAL 
AO EXAME: VAGINOSE E FUMNGO
USO ORAL


1.	Secnidazol 1 g  ______________________________________04 comprimidos 
Tomar 02 comprimido via oral dose única para o casal.

2.	Zelix 150 mg _________________________________02 comprimidos 
      Tomar 01 comprimido hoje e repetir com 7 dias 


USO VAGINAL 

1.	Gynotran  _____________________________ 1 caixa
Aplicar 01 óvulo via vaginal, por 7 dias.

COLETADO PREVENTIVO CONV
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59500988, '496', 'Arima Rodrigues de Lima', 2, 0, NULL, NULL, '(69) 8106-9761', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038623, '254', 'Arineidy Farias Da Guarda', 2, 2, '05038914284', NULL, NULL, '1965-05-22', 3, 'dor pelvica +- 5 dias esporadica, melhora com uso de dipirona,
Apresenta usgtv 05/07, utero 51,7, mioma intramural, endometrio 6mm, od 28, oe 2,0, utero compativel com miomas.
Conduta: exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59043160, '259', 'Aristela  Rodrigues Ramos', 2, 4, '05038914284', NULL, NULL, '1973-05-08', 3, 'retorno, ficha anterior não acharam.
exames 08/05/24
urocultura não houve cresc.
bact normal
estradiol 98, tsh 13, lh 18, prog 0,09, shbg 108, testo 21, eas normal.
conduta:synt cont.

retorno 26/06/24
paciente refere que fez uso systen cont, e obteve melhora, porém alega que o valor está alto pra ela e deseja mudar.
conduta: natifa', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59157436, '393', 'Artemizia Silva De Souza', 2, 2, '00532174208', NULL, '(69) 99277-7466', '1988-11-06', 3, 'IDADE: 36 ANOS 
QP: PACIENTE REFERE RETIRADA DIU EM FEV DE 2024, FAZENDO USO DE ACI MENSAL, VEM DEVIDO AMENORREIA E ALEGA QUE PAROU DE FAZER O USO DE ACI 
APRESENTA PREVENTIVO 21/02/25: NEGATIVO PARA NEOPLASIA 
BETAHCG NEGATIVO DO DIA 21/02/25 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62240766, '1006', 'Athiley Ferreira Analeto', 2, 0, '02259312225', 'athiley.analleto@gmail.com', '(97) 99197-9927', '1995-06-15', 1, 'Paciente: Athiley Ferreira Analeto
Realiza Consultas em Humaitá
Injetáveis realizados; Vacinas Cândida 14/05, 18/07, 12/09 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061148, '286', 'Aurea Justino Benta', 2, 0, '05038914284', NULL, NULL, '1999-11-19', 3, '08/08/24
51 anos
histerectomia 05/05/23
em uso de sandrena gel e promestrieno vv, tanslosina.
exames lab 28/06
tsh 2,02, t4 livre 8,8, tshh 26,36, testo 18, prog 0,21, estradiol 397, vitb12 397, ac urico 3,4, t60 29, tgp 25, glicose 80, trig 79, col  239, ureia 31, creat 0,70, hb 14, ht 43, plq 28300, vitd3 33,8.
mmg bi-rads 2 19/07/24
preventivo neg para neoplasia 26/07/24
densitrometria ossea 14/07/24 osteopenia.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59043393, '262', 'Aurineide Marques da silva', 2, 1, '05038914284', NULL, NULL, '1971-11-06', 3, 'vem devido miomatose uterina.
usgtv 15/04/24 mioma intramural, od não vizualizado, oe 1,3 cm, utero 95,6 cm.
conduta: aguardando preventivo, usg de mamas e mmg.

05/11/24
exames 21/06
eas normal, hb 13,80, ht 42,6, leuc 6,170, plq 289,000, tsh 1,4, t4 1,08, vit b12 399, vit 28,2, creat 0,70, glicese 80, tgo 20, tgp 20,5, ureia 30,30, ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62191306, '996', 'Aurineide Marques da Silva', 2, 0, '65320956215', NULL, '(69) 99243-2200', '1971-11-06', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60732072, '705', 'AURISANDRA RÉGIS BRAGA', 2, 0, '69533024291', NULL, '(69) 99375-0152', '1981-03-05', 3, 'Paciente 44 anos fazia uso de medroxiprogesterona parou em julho de 2025 até o momento está em amenorréia alega ondas de calor irritabilidade insônia apresenta exames laboratoriais do dia 31 do 10 ferro 91 PCR 2,6 colesterol 159 triglicerídeos 114 GLICOSE  jejum 115 
TGP 32 tgo 18 creatinina 0,88 ureia39 calço 9 com 59 T4 livre 1, 
 tsh 5,08 
hemoglobina 14 
hematócrito 43.2 l
eucócito 7100 
plaqueta 209000
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989590, '164', 'Beatriz De Araujo victor', 2, 1, '05038914284', NULL, NULL, '1999-09-23', 3, 'paciente refere disminorreia +- 2 meses, refere tto p/ cisto ovariano +- em 2023.
Conduta: usgtv, preventivo,bicerto.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59973063, '556', 'Beatriz Ribeiro dos Santos', 2, 2, '97302040206', NULL, '(69) 9272-8373', '1980-08-28', 1, 'IDADE: 44 ANOS
PLANO DE SAUDE UNIMED 
G0P0
MC: PRESERVATIVO
DUM: MAIO DE 2024
UPCCU: MAIO DE2024
COMORBIDADE: NODULOS MAMÁRIOS 
MEDICACAO : NEGA
ALERGIA PARACETAMOL, 

QP: PACIENTE REFERE FOGACHO, SECURA VAGINAL E SENSIBILIDADE
FEZ USO DE HIZOFITO SEM MELHORA
USG TIREOIDE 14/04: TI-RADS II
USG DE MAMAS 14/04/2025 : NODULO EM MAMA 12 /1 E 9 H 
MAMA ESQUERDA: 2 11H
BI RADS 3 
USG DE ABDOME  14/04: NORMAL 
USG TV 14/04: UTERO AUMENTO 106, DEVIDO MIOMA INTRAMURAL, SUBSEROSO 
ENDOMETRIO 4 MM, OD 3,5 OE 3,6: NORMAL 

CONDUTA: 
EXAMES LAB
MAMOGRAFIA 
DENSITOMETRIA OSSEA 
BELAMY 
ISOFLAVONA 
CONVERSO SOBRE O LASER INTIMO - PACIENTE TEM DISPONIBILIFDADE PARA SETEMBRO 
Exames laboratoriais do dia 14/8 
hemoglobina 13,3 hematócrito 41,5 leu 4900 plaquetas 177000 oreia 34,4 creatinina um TGU 22 tgp 20 ferro 82 GLICOSE 88 hemoglobina glicosilada 5,9 colesterol total 235 triglicerídio 87 magnésio 2,3 gama GT 22 ácido úrico 3,9 ferritina 79,3 insulina 4,4 cortisol 15,3 estradiol inferior a 20 progesterona 0,20 fsh 86 LH 31 tsh 6,2 t 4 livre 0,89 sorologia não reagente EAS não infeccioso urocultura a ausência de crescimento omo cisteína 15,8 Vitamina A 0,6 vitamina C 6 Vitamina D 24.3 Vitamina B12 528 testosterona 17 anti hbs 7,4

DENSITOMETRIA OSSE 13/08: OSTEOPENIA 

PREVENTIVO: 28/07: NEG PARA NEOPLASIA 

MMG 13/08: BI RADS 3 

CONDUTA: 
REPOSICAO DE VITAMINA D E B12 
PACIENTE TERA DIREITO AO MOVO RETORNO PARA MOSTAR PARECER DO MASTOLOGISTA E ENDOCRINOLOGISTA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59214779, '431', 'Beatriz Smilax Bezerra Silva', 2, 0, '04238828216', NULL, '(69) 99342-0912', '2001-09-16', 3, 'IDADE: 23 ANOS
DUM: 
MC: DIU DE COBRE ( DEZEMBRO 2024)
UPCCU: + 2 ANOS 
G0 P0 

QP: PACIENTE REFERE SANGRAMENTO VAGINAL HÁ MAIS DE 15 DIAS, ALEGA SANGRAMENTO COM ODOR, NEGA FEBRE 
APRESENTA RESULTADO DE EXAME: 
HB 13,2/ HT 40,5/ LEUCO 5560 / PLQ 338 000

CONDUTA: SOLICITO EXAMES LAB BETA HCG, USG TV,PROGRAMAR PREVENTIVO
AVALIAR PROCESSO INFECCIOSO NO VIDEOCOLPOSCOPIO 

17/04/2025

PACIENTE REEFERE SECRECAO VAGINAL ESBRANQUICADO, NEGA PRURIDO, REFERE DISCRETO ODOR 

APRESENTA USG TV 11/04/25: UTERO 40,2, ENDOMETRIO 6MM, DIU NORMOPOSICIONADO, OD 13,7, OE 7,3 
DOS EXAMES LAB APRESENTADO VITAMINA D E B 12 ENCONTRA-SE BAIXA 

AO EXAME: COLO CENTRALIZADO, SECRECAO AMARELADA COM ODOR 

CONDUTA: GYNOTRAN, COLETADO PREVENTIVO, REPOSICAO DE VITAMINA B 12 E D ( 460, 00 A VISTA )

------------------ // -------------------------
( 06/02/2026)
IDADE: 24 ANOS 
DUM: ------ 
PACIENTE REFERE SECRECAO ESBRANQUICADA COM PRURIDO, HÁ 4 DIAS 

USG TV 14/10/2025
UTERO 44, END 7 MM, PRESENCA DE DIU POUCO ABAIXO DO HABITUAL, HIDROSSALPINGE A DIRETTA 
AO EXAMES FISICO:

EDEMA DE GRANDES LABIOS , GRANDE QUANTIDADE DE SECRECAO ESBRANQUICADA
CONDUTA: 
BETA HCG QUANTITATIVO INF A 2,30 (NEGATIVO) 
------------------ /// ----------
11/02
PACIENTE RETORNA XOM RESULTADO DE BETA HCG 
BETA HCG QUANTITATIVO 06/02: INF A 2,30 (NEGATIVO) 
DUM: 08/02
PACIENTE REFERE QUE MANTEM QUADRO, ESTA MENSTRUADA NO MOMENTO

CONDUTA: 
FLUCONAZOL 1/3/7/MES 
FENTIZOL CREME 
RETORNO PARA AVALIACAO 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61056630, '759', 'BIANA SOUSA SANTOS ANDRADE', 2, 0, '74884980204', NULL, '(69) 98117-2620', '1980-09-01', 3, 'IDADE: 45 ANOS 
DUM: 01/01/26
G 3 P3 A0
MC: VASECTOMIA 
UPCCU: 2021
COMORBIDADE: DM MAS NAO FAZ USO DE MEDICACAO 

QP: PACIENTE REFERE DOR HIPOCONDRIO ESQUERDO, 
buscopan
usg de abdome total
exames lab ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60635220, '692', 'BIANCA AUXILIADORA MIRANDA FERREIRA', 2, 0, '04079586221', NULL, '(69) 99342-7721', '2000-05-24', 3, '25 ANOS
DUM: 23/10/2025, DURACAO DE 5 DIAS, FLUXO MODERADO 
UPCCU: NUNCA REALIZOU
MC: PRESERVATIVO
G0 P0

QP: ROTINA GINECOLOGICA 

EXAMES E USG TV
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989618, '165', 'Bianca Duarte Da Conceiçao Braga', 2, 2, '05038914284', NULL, NULL, '1988-12-10', 3, 'Rotina ginecologica, disminorreia, nega secreçãp vaginal,nega nodulo mamario.
conduta: exames lab, usgtv e mamas, preventivo para programar.

---------------------
12/06/2026
IG: 32 SEM E 2 DIAS 
FORMIGAMENTO NAS MAOS  E DOR NA PELVE QUANDO ABRE AS PERNAS 
PESO 73
PA 100 X60
BCF 147

20/06
09/07
15/07 SOLICITAR USG COM DOPPLER
PARTO 19-20', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60970655, '732', 'Bianca Martins Duarte', 2, 2, '02726412270', NULL, '(69) 8447-3964', '1996-02-19', 1, 'IDADE: 29 ANOS 
G1 P1N A 0
DUM; 05/11/2026
PESO 65.700G 
PA 100 X 60 MMHG 
IG 10 SEM E 6 DIAS PELO DUM 

PACIENTE REFER QUE JA REALIZOU USG 
CONDUTA:
ORIENTACOES 
REGENESIS, UMIDITA, MECLIN, 
USG 1 TRIM
--------
03/02
paciente com queixa de nauseas, porem está em uso de simeco Plus, exames lab apresentando rubeola inconclusiva, roxo sucetíveis, deficiência de vitamina c, d e b 12
Pa 100 x 60
peso 67Kg
conduta:
orientações
repenseis
vit d IM 
vit C EV
Dozemast
aguardo urocultura 
--------
09/04/26
apceinte assintomática
usg morfologica do 2 trim mostrando polidramnio leve e feto gig
bcc 145 bpm 
conduta: orientações, exames pre natal, eco cardiograma fetal, totg', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61812560, '917', 'Bianca Silva dos Santos', 2, 0, '01883972213', NULL, '(69) 99259-9603', '1995-09-22', 1, 'Idade 30 anos
 data da última menstruação dia 10/07/2026
 método contracetivo preservativo 
menarca aos 13 anos 
sexarca  20 anos 
o último preventivo há 8 meses 
comorbidades nega 
medicação diária nega 
exercícios físicos parou a mais ou menos 8 meses 
intestino regular 
sono reparador 
queixa principal paciente refere fissuras após coito alega também secreção vaginal pruriginosa sem odor após menstruação e coito 
ao exame físico colo uterino lateralizado à esquerda presença de secreção acinzentada tendendo a amarelada presença de muco em orifício cervical interno do colo uterino presenças de inúmeras fissuras em introiito vaginal visualizado o videocoposcópio paciente visualiza também presença de hipercromia em região íntima raiz da coxa interglúteo 
conduta 
orientações 
exames laboratoriais 
ultrassonografia transvaginal 
indico 3 seções de laser íntimo no valor de 1500 à vista e 1800 no crédito 
indico a aplicação de ácido hialurônico na região de introito vaginal valor 550 aplicação com 1 mês e reforço com =/ 15 A mais ou menos 15 há 30 dias30 dias 
--------------------------------------------------------------------------------------------------------------------------------------------------------

Data 23/09 Paciente Adiantou 100,00.
 Irá realizar o Lazer íntimo + aplicação de ácido hialurônico na região de introito ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61386516, '833', 'BIANCA WALESCA FELIX PEIXÔTO', 2, 0, '06753077243', NULL, '(69) 99211-8358', '2007-01-01', 3, 'IDADE 19 ANOS 
G 1 P0
DUM: ????

PACIENTE REFERE BETA HCG POSITIVO DO DIA 04/04/26
CONDUTA: 
EXAMES PRA NATAL
USG OBSTRICA 
REGENESIS 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59526401, '502', 'Biany CRISTINY Soares de Freitas', 2, 0, NULL, NULL, '(69) 9229-5130', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989669, '166', 'Brenda Carla M lacerda', 2, 1, '05038914284', NULL, NULL, '1999-12-19', 3, 'Q.P: menstruação irregular, nega dispareunia, nega secreção vagianl.
Conduta: usgtv e mamas, exames lab.

retorno 22/09/23
usgtv 18/08/23 ovario micropolicistico.
usg mamas 18/08/23 bi-rads 1
glicose 18/08:85 , col 164, trig 63, eas normal, hb 12,6, ht 39,1, leuc 6,900, plo 335,00
preventivo aguardo o resultado.
paciente refere atraso mesntrual, alega relação sexual desprotegida, alega que faz uso da pilula do dia seguinte.
conduta:bhch quantitativo.

planejamento: exercico fisico, sopi, atc não quer fazer uso devido efeitos colaterais.

25/10/23: paciente com queixa nausea epigastralgia.
usg 28/09/23
conduta: usg morfologica 1 trim, exames lab, dtn, alta p, omega  3.

 16/01/24
ig:22 sem, sem queixa, exames lab.
glicemia 94, o rh negativo, anti hbs reagente, eas 8-9 piocitos, urocultura +.
conduta: nutricionista, usg morofologica 2, agenda eco, vit d, omega 3.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60606534, '681', 'Brenda Carla Moura Lacerda', 2, 0, '03671078219', NULL, '(69) 99327-7584', '1999-12-19', 3, '1 ano e 5 meses parto cesarea e insercao de diu de cobre 
alega que há mais ou menos apresenta dismenorrreia 
apresenta usg tv 10/09/2025
utero avf, 100,6, endometrio 8,2mm, diu normoposicionado ovarios com dimensiones aumentadas oe 11,9 od 21,8 

conduta: triplo a e voric 
solicito exames lab 
Uso sublingual

1.	VÓRIC 10 MG  _____________________ 01 CAIXA
           Tomar 01 comprimido sublingual  de 8/8 horas, se dor intensa.

Uso oral

2.	Triplo A ___________________________01 caixa
     Tomar 01 comprimido via oral de 12/12 horas,por 3 dias 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989980, '167', 'Brenda Jaine R de Olivera', 2, 2, '05038914284', NULL, NULL, '1997-01-23', 3, 'Sangramento vaginal desde 03/10/22, acompanhada de dor em baixo do ventre.
Conduta: exames lab,usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61814455, '922', 'Bruna de Souza Monteiro', 2, 0, '02168645264', NULL, '(69) 99211-6800', '1992-11-12', 1, 'ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: BRUNA DE SOUZA MONTEIRO 
Procedimentos:
•	Labioplastia
•	Capuzplastia
 
Prezada BRUNA 
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia.
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
A associação com a correção de prega acessória e capuzplastia permite um resultado mais completo, proporcionando melhora estética, maior conforto íntimo, aumento da autoestima e bem-estar funcional.
 
Valor dos Procedimentos:
R$ 12.648,00
 
Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação do pós-operatório (uma no pré-operatório imediato e outra no dia anterior ao 
•	
•	
•	procedimento).
•	Este orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou início do parcelamento.

Atenciosamente,

Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59349447, '454', 'Bruna ferreira', 2, 0, '06852805271', NULL, '(69) 9266-9650', '2002-11-18', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61949998, '955', 'Bruna Martins Xavier', 2, 2, '73517275204', 'brunahenrik@hotmail.com', '(69) 99327-3282', '1984-10-04', 3, 'IDADE: 41 ANOS 
DUM: 31/07/2026
G6 P2 A4
MC: ----
COMORBIDADES: HAC 
MAMOGRAFIA HÁ 5 ANOS - NODULO DE MAMA SIC  - SEM EXAMES 
UPCCU: + 12 ANOS 
QP: PROXIMO A MENSTRUACAO ALGIA MAMARIA, PAROU USO DE ACI HA 4 ANOS, NO MOMENTO SEM PREVENCAO DE GRAVIDEZ, ALEGA PRESENCA DE MIOMAS, NAO APRESENTOU EXAMES 

ao exame;
algia em mama esquerda em quadrante superior - empastamento / nódulo ? 
CONDUTA; 
ORIENTACOES 
USG TV
USG DE MAMAS
MAMOGRAFIA 
EXAMES LAB 
PREVENTIVO 
 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60722536, '702', 'Bruna Moura do nascimento da Costa', 2, 0, '00458861219', NULL, '(69) 9393-7772', '1993-06-19', 1, 'idade: 32 anos
ORIGEM REALIDADE - AM 
G2 P2  - PACENTE TROCOU DE PARCEIRO ( SEM FILHOS)
COMORBIDADES; NEGA 
DUM: 25''11''25
paciente deseja engravidar 
COLETADO PREVENTIVO 
SECRECAO AMARRONZADA, FLUIDA 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61382189, '829', 'BRUNA SOUZA LOPES', 2, 0, NULL, NULL, '(69) 99366-6443', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59048518, '263', 'Bruniele cruz da silva', 2, 0, NULL, NULL, '(97) 8411-2143', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59083829, '321', 'Caina Cristiane Dos S. O Dias', 2, 2, '05038914284', NULL, NULL, '1990-11-02', 3, 'Gravidez ectopica set 2022.
anatomopatologico 03/09/22
embrião 7 semanas, parede tubaria integra, aus da molar,
conduta: exames+ eas+usgtv, programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59083676, '320', 'Camila  Belém De Souza', 2, 0, '05038914284', NULL, NULL, '1989-05-21', 3, 'Dor  em baixo do ventre, alega constipação.
ao exame:
abd: semi globoso, sem visceromegalia, com dor difusa a palpação profunda.
especular: colo puntiforme, muco lialino.
conduta: usgtv, exames lab, cevagggin, tamarin, tripo a.
------------------------------------
paciente refere a disminorreia, apresenta resultado de exame.
07/12/22 trig 257, colesterol total 280.
27/01/23 usgtv normal.
alega que realizou dieta devido tontura, mau estar cansaço,
conduta: lipidograma.
---------------------------
retorno 24/03/23
preventivo negativo para neoplasia+ candidiase.
alega secreção vaginal, alega desconforto.
cnduta: flucunazol, cevigin, lipidograma.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59084189, '324', 'Camila  Gomes Da Silva', 2, 1, '05038914284', NULL, NULL, '1995-10-23', 3, 'paciente deseja inserção de diu, paciente refere cefaleia e diminuição da cavidade visual.
conduta: solicito exames, usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61144705, '783', 'Camila Aiala Ferreira', 2, 0, '01703311213', NULL, '(69) 9349-4906', '1995-08-13', 1, 'IDADE: 30 ANOS 
G 3 P1C A1  ( CESAREA HIPERTENSAO GESTACIONAL) A EM AGOSTO DE 2025 
DUM: ?

PACIENTE GESTANTE DE 20SEM  PELO USG DIA 15/01/2026 COM 13 SEM , ACOMPANHADA DA MAE, ASSINTOMÁTICA NO MOMENTO DA CONSULTA 
40 SEMANAS DE 15 A 22 DE JULHO 
DPP 23/07/2026 

USG MORFOLOGICA DO 1º TRIMESTRE: GESTACAO DE 13 SEM, CCN 69MM, TN 1,5MM, OSSO NASAL PRESENTENORMAL  COLO 3,5MM 

AU : 20 CM 
BCF: 145 
PA 100 X 60 MMHG 
PESO 87.500G

CONDUTA: USG MORFOLOGICA 2 TRIM
REGENESIS 
VACINAS 

--------------
27/03/2026
Paciente com queixa de cansaço, alega que esta em uso de vitamina d e regeneses premium lipinova 

Pa 120 x 80
89,400
148bpm
mf presente
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59082082, '314', 'Camille Paulo Dos Santos', 2, 1, '05038914284', NULL, NULL, '2005-03-09', 3, 'Paciente  vem para planejamento familiar, deseja a.c.o, oriento sobre dst e como utilizar o metodo.
conduta: iumi es.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62168231, '989', 'Carina Nogueira Duran Dallarmi', 2, 0, '26119247831', 'carinaduran2016@gmail.com', '(69) 99959-1504', '1978-04-27', 1, 'RELATÓRIO MÉDICO
Paciente: Carina Nogueira Duran Dallarmi
A paciente acima identificada foi submetida a tratamento cirúrgico para obesidade, tendo realizado gastroplastia em 2023. Evoluiu posteriormente com aumento importante do fluxo menstrual, contribuindo para a intensificação de quadro de anemia ferropriva previamente existente.
Em investigação ginecológica, realizou ultrassonografia pélvica com mapeamento para endometriose em 25/02/2026, que evidenciou sinais de adenomiose uterina difusa, além de achados compatíveis com endometriose no compartimento posterior.
Diante do quadro de sangramento menstrual aumentado associado à adenomiose, endometriose e anemia ferropriva, está indicado tratamento hormonal intrauterino com sistema intrauterino liberador de levonorgestrel (DIU Mirena), com objetivo de reduzir o fluxo menstrual e proporcionar controle dos sintomas ginecológicos, contribuindo também para o manejo da anemia relacionada às perdas menstruais.
Solicito, portanto, a autorização e disponibilização do DIU Mirena (sistema intrauterino liberador de levonorgestrel) para inserção, conforme indicação médica e após avaliação ginecológica.
Atenciosamente,
Dra. Christiane Alves Calixto
Médica Ginecologista e Obstetra
CRM: __________________
Data: //________

6500,00. NINFOPLASTIA  + LASER POS NINFOPLASTIA 
1600,00.  INSERCAO DO DIU 
8100,00. TOTAL EM 3 X 
7800,00 A VISTA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59069418, '305', 'Carina Vital Dos Santos', 2, 5, '05038914284', NULL, NULL, '1994-02-12', 3, 'paciente  refere  secreção acizentada com odor, piora após relaçao sexual.
conduta: exames lab soro, programar preventivo, gynotran.

29/09/23
preventivo 15/09/23 neg p/ neoplasia.
13/09 snr, hb 12,4, glicose 80, trigl 83, tsh 3,66, t4 livre 1,12, eas 03 pitocitos por compa.
Paciente refere que fez uso do gynotran, mas alega disuria.
conduta: eas, usgtv.

Carina
id 30 anos
dum 20/10/24
nc: acj mensal
upccu 15/09/23 neg para neoplasia
Q.P: paciente refere disuria e dificuldadde de eliminação completa de urina.
conduta: exames lab, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59584490, '525', 'Carine Paula Dos Santos', 2, 0, '06553652228', NULL, '(69) 99272-6770', '2006-06-18', 3, 'idade: 19 anos
menarca: 13 anos
sexarca: -----
comorbidades: imc 

QP: DESDE A PRIMEIRA MESTRUACAO APRESENTA DISMENORREIA E IRREGULAR, FEZ USO DE MEDICACAO NAO LEMBRA O NOME
REFERE QUE NO ULTIMO CICLO PRE4SENTOU DISMENORREIA INTENSA E INCAPACITANTE 

CONDUTA: SOLICITO RNM DA PELVE COM PREPARO INTESTINAL E EXAMES LAB 


EXAMES DE SANGUE 348,32 A VISTA E 407,00 CREDITO
----------------------------------------------------------------------------------

03/09/2026
idade: 20 anos 
DUM: 27/08/206
SEXARCA: 20 ANOS 
MC: preservativo

QP: paciente nao realizaou os exames solicitados 
alega que mantem dor pelvica 
vem para planejamento familiar 


conduta: 
orientacoes 
usg tv com preparo intestinal
slinda, digo entrego amostra de ammy 
voric para dor intensa ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59668393, '533', 'Carine Sthéfane Moreira Borges', 2, 1, '02757563270', NULL, '(69) 8163-0658', '1993-10-04', 3, 'idade 31 anos
DUM: 10/06
MC: NEGA
UPCCU: + 3 ANOS 
QP: PACIENTE REFERE SECRECAO VAGINAL, ESBRANQUICADA, PRURIDO, COM ODOR

CONDUTA: EXAMES LAB, USG TV, PROGRAMAR PREVENTIVO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59521473, '500', 'Carla Beatriz Sobreira Santana', 2, 0, '70573901228', NULL, '(69) 9203-5235', '2008-09-11', 1, 'idade: 16 anos 
dum: 02/06/25
menarca: 11anos
sexarca nega
comorbidades: bronquiolite e sinusitemedicacao nega 
alergia nega

QP: PACIENTE REFERE QUE APOS 15 ANOS APRESENTA DISMENORREIA INTENSA, NECESSITADO DE SERVICO DE SAUDE, ELAGA USO DE MEDICACAO COM MELHORA PARCIAL, REFERE SINCOPE, HIPOTENSAO, NEGA SECRECAO VAGINAL, POREM REFERE ODOR NO CANAL VAGINAL, NEGA DISURIA, NEGA NODULO MAMARIO
AO EXAME
ACNE EM FACE, COLO, E DORSO
MAMAS: AUSENICA DE NODULO, EXPRESSAO NEGATIVA
ABDOME: PLANO SEM VISCEROMEGALIA, AUSENCIA DE DOR A PLAPALCAO PROFUNDA
PRESENCA DE ODOR EM CANAL VAGINAL
PRESENCA DE HEMATOMA EM BRACO ESQUERDO

CONDUTA: PROTEX LIQUI, NEOMICINA BACITRACINA, FLOGO ROSA, SECINIDAZOL, EXAMES LAB E RNM DE PELVE
, EXAMES LAB E RETORNO
ALIMENTAR SE A CADA 3 HORAS 


REALIZOU EXAMES NA CLINICA 371,00 CREDITO 2X





26/06/2025
retorno com resultado de exame
vitamina D 20,8 -  b12 430 / hb 11,8 /ht 34,5 / vcm 78

conduta: noripurum, vitu e vit d 
660,00 

SEGUNDA REPOSIÇÃO DE NORI 140 A VISTA', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60608668, '686', 'Carol dos Santos Araujo', 2, 2, '00202672239', NULL, '(69) 9370-3340', '1996-06-26', 1, 'vem para retirada de pontos 
fo limpa e seca 
contractube ou kelocort ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59084126, '323', 'Carolina Costa Cabral', 2, 2, '05038914284', NULL, NULL, '1997-02-12', 3, 'Q.P: paciente com dispareunia, diminuição da libido, secreção vaginal esbranquiçada, sem odor, sem purido, nega disuria, nega nodulo mamario, alega alteração no preventivo anterior, nega constipação, nega perda de urina , nega laceração no parto, refere  disminorreia  (buscofem).
Mamas n02, sem nodulo, se, retração, experessão mamaria negativa.
Especular: colo centralizado, em fenda, discreta secreção em grumo de parede.
Conduta: retorna academia, exames lab, usgtv e mamas, coletado preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61197010, '786', 'Caroline Costa Mendonça', 2, 0, '01977291260', NULL, '(97) 8437-3513', '1995-12-20', 1, 'CAROLINE COSTA MENDONCA 06/03/2026

idade: 30 anos 
DUM: 25/02/2026
MC: ELANI CICLO
UPCCU: 2024

QP; PACIENTE ASSINTOMÁTICA, VEM PARA COLETAR PREVENTIVO 
AO EXAME:
COLO CENTRALIZADO, PRESENCA DE SECRECAO FLUIDA, BOLHOSSA, SEM ODOR , DISCRETOS GRUMOS EM PAREDE VAGINAL 

CONDUTA: 
ORIENTACOES 
COLETADO PREVENTIVO
AVALIAR RESULTADO DE PREVENTIVO DEVIDO SECRECAO COM BOLHAS
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61207171, '795', 'Caroline Mioranza Veit', 2, 0, '04199956255', NULL, '(69) 8445-4268', '2000-02-08', 1, 'IDADE: 26 ANOS 
MENARCA 15 ANOS 
SEXARCA AOS 15 ANOS 
COMORBIDADE: IUE  (ESTUDO URODINAMICO SEM CAUSA/ USG DE RINS / TOMO NORMAL) / CISTITE INTERSTICIAL / ENDOMETRIOSE / ARRITMIA / DEPRESSAO /
MC: DIU DE MIRENA INSERCAO EM 2023 
UPPCU HA MAIS DE 3 ANOS 
MEDICACAO EM USO: PROPANOLOL/ BUBIONA 300 ESCITALOPRAM 30/ VEVANSA
PACIENTE REFERE DISPAREUNIA,  ESTA EM USO DE IUMMI HÁ MAIS OU MENOS 11 MESES DEVIDO ESCAPE, ULTIMOS MESES ALEGA DISMENORREIA, 
INSTETINO OK
SONO:  ALEGA SONO INTENSO DURANTE O DIA 


CONDUTA: 
ORIENTACOES 
EXAMES LAB 
SOLICITO USG TV PARA PESQUISA DE ENDOMETRIOSE 
USG DE MAMAS E AXILARES 
COLETAR PREVENTIVO EM MEIO LIQUIDO
INDICO LASER INTIMO  
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59084453, '326', 'Caroline Paula Dos Santos', 2, 1, '05038914284', NULL, NULL, '2005-03-09', 3, 'Q.P: algia mamaria, presença de nódulo direita +- 40 dias.
Sexarca: jan 2023, menarca 2015.
Ao exame: mamas n 02, presença de nodulo +- 1 cm as 12 horas, +- 5cm, distante da aureola, móvel, doloroso a apalação (mama d), expressão mamaria negativa, oco axilar livre.
Conduta: usg de mamas.
---------------------------------------------
Retorno 06/04/23
 usg de mamas 28/03/23 nodulo  1,8x 0,9 cm 12 horas, 7cm de mamilo, mama direita. BI-RADS3.
Conduta: usg da mamas 6 meses, retorno 3 meses.
---------------------------------------------
Retorno 16/07/24
Paciente refere algia mamaria.
usg 30/04 usg de mamas bi-rads 3
nodulo 1h, 1,3x1,2
nodulo 06 h 0,5x0,5x0,3 mama direita 

mama esquerda 1 h 0,6x 0,5x 0,5
11 h 1x0,9x0,5.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59397606, '474', 'Caroline Paula Dos Santos', 2, 0, '06559711226', NULL, '(69) 99377-4424', '2005-03-09', 1, 'Solteira
Mcc: nenhum
Parto: 0
Preventivo: fevereiro de 2024, não apresentou na consulta
Medicação: setrolina, carbodilitio.

Paciente refere nódulos nas mamas, fez uso de vitamina E, no momento refere dor em baixo do ventre e secreção vaginal amarelada com odor.
Conduta:  Gynotran, secnidazol, triplo a, exames lab e programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59069179, '300', 'Caroline Santos De Souza', 2, 1, '05038914284', NULL, NULL, '1997-10-17', 3, 'Usuaria de diu, refere sangramento vaginal após relação sexual (inico +- 18 dias).
Apresenta usgtv 09/09/23
Diu normoposicionado, utero 101,89, end 11mm, od 8,85, oe cisto hemorragico 52,42 cm.
Conduta: tantim 2 cx, tenoxican, secnidazol, gynotran, atestado, usgtv 3 meses, retorno.

19/01/24
usgtv 18/01/24 diu normoposicionado.
Paciente refere sangramento mesmo com uso de anticocpcional e transamin.
Deseja retirar diu.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61235972, '801', 'Cássia Damásio', 2, 2, '03417941202', NULL, '(69) 9378-7897', '1994-09-20', 1, 'ITAPUAM
IDADE: 31 ANOS 
DUM: HISTERECTOMIA - NIC 3 - ABRIL DE 2024 - DR MURILO

PACIENTE REFERE CANDIDIASE DE REPETICAO 
ALEGA DISURIA 
PREVENTIVO 23/04/25: NEG PARA NEOPLASIA 
PESQUISA DE DNA PARA HPV DETECTADO 31, 33, 39, 51,56,58,59,66 E 68 
23/04/25: UREAPLASMA UREALYTICUM 
04/06/25: FRAGMENTOS DA CUPULA GRANULOMA?
ENDOMETRIOSE EM TECIDO FIBROCONJUNTIVO 

PACIENTE ATUALMENTE ESTA APRESENTANDO SECRECAO VAGINAL COM ODOR, ALEGA DISURIA, 
MEDICAO QUE FEZ USO CEFTRIAXONA IM, METRONIDAZOL VIA ORAL, AZITROMICINA.
teste de biologia molecula

1.	Ciprofloxacina 50Omg _____________________________ 14 comprimidos 
Tomar 1 comprimido via oral de 12/12 horas por 7 dias 

2.	PYRIDIUM 200 MG  _________________________01 CAIXA
Tomar 01 comprimido via oral de 12/12 horas, por 5 dias 
Uso Injetável
1.	Ceftriaxona 500 mg_______________________01 ampola
Aplicar meia ampola IM em região glútea.
 
Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos VO dose única, para o casal
2.	Azitromicina 500 mg _________________04 comprimidos
Tomar 02 comprimidos VO dose única para o casal
3.	Pantoprazol 40 mg ___________________01 caixa
Tomar 01 comprimido VO pela manhã
4.	Triplo A ___________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas por 3 dias.

Uso vaginal

1.	Gynotran  _____________________________2caixas 
Aplicar 01 óvulo VV, á noite, durante 7 dias, após 1 vez por semana.

retorno sera on line
paciente vem 1 x no mês em PVH
----------------------------------------
14/04
RETORNO ON LINE 
QUEIXA SE DE UMA LESAO EM REGIAO INTIMA 
CONDUTA: 
EXAME LAB E USG TV
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59082038, '313', 'Cecilia Da Chagas Silva', 2, 1, '78200920259', NULL, '(69) 98101-6910', '1982-11-22', 3, 'Dor pelvica tipo colica, mais de 3 meses.
conduta: exames lab, usgtv, preventivo.

Retorno: 06/04/23
exames 24/03/23
hb 12,1, leuc 8,000, plq 265,00, glicose 83, ureia 19, creat 0,66, tgo 15, t6p 14, col 214, trig 13, tsh 1,62, t4 1,29,  eas picocitos 3, fosfato amorfo+ vitami d 22.

usgtv 25/03/23
utero 87,4, od 8,7, oe 4,3, cisto de nobth.
conduta: dieta, exercico fisico, exames lipidograma 30 dias, retorno, preventivo.


05/08
IDADE: 42 ANOS
DUM: 18/07/2025 BORRA DE CAFE E DURACAO DE 2 DIAS
LT
UPCCU: 

QP: DOR EM BAIXO VENTRE, NEGA DISPAREUNIA, NEGA DISURIA 

CONDUTA: 
ORIENTACOES 
EXAMES LAB, USG TV, USG DE MAMAS, PROGRAMAR PREVENTIVO 

EXAMES DE SANGUE 
552,67 A VISTA E 593,50 CREDITO


exames lab 09/08: vitamina b12 (246) e d (20,6) baixa, demais ok 
USG TV 09/08: utero 138, mioma submerso parede posterior 1,6, endometrio 12,6 mmm, OD 6,47, OE 8,89, 
USD de mamas 09/08: cisto 2 e 4 h mamária á esquerda , BIRADS 3 

conduta: TRIPLO A PARA DISMENORREIA, REPETIR USG DE MAMAS COM 6 MESES, REPOSICAO DE VIT B12 E D via oral, repetir os exames com 1 mês, aguardando usg tv 
-------------------

09/09/2026

### ANAMNESE GINECOLÓGICA

**Paciente:** Cecília das Chagas Silva
**Idade:** 43 anos.

**Queixa principal:**
Dor pélvica.

**História da doença atual:**
Paciente de 43 anos, G3 P3 A0, comparece à consulta para avaliação ginecológica. Refere **dor pélvica no momento da consulta**. Sem outras queixas ginecológicas informadas.

**Antecedentes pessoais:**

* Comorbidades: nega.
* Alergias medicamentosas: nega.

**Antecedentes cirúrgicos:**

* Três cesarianas.
* Laqueadura tubária.
* Nega outras cirurgias prévias.

**Antecedentes ginecológicos:**

* Menarca aos 13 anos.
* DUM: 26/08/2026.
* Último exame citopatológico do colo uterino (preventivo): realizado em 2024.
* Última ultrassonografia: realizada em 2025.

**Antecedentes obstétricos:**

* G3 P3 A0.
* Três partos cesáreos.

**Método contraceptivo:**

* Laqueadura tubária.

**Hábitos de vida:**

* Pratica atividade física regularmente, com realização de academia.

**Dados antropométricos e sinais vitais:**

* Peso: 70 kg.
* PA: 110 × 70 mmHg.

**Impressão clínica:**
Paciente de 43 anos, G3P3, com antecedente de três cesarianas e laqueadura tubária, sem comorbidades ou alergias conhecidas, em consulta ginecológica apresentando **dor pélvica**, necessitando investigação etiológica.

### CONDUTA

* Solicitados exames laboratoriais, conforme avaliação clínica.
* Solicitada **ultrassonografia pélvica transvaginal** para investigação da dor pélvica.
* Solicitada **ultrassonografia das mamas**.
* Programada coleta de **exame citopatológico do colo uterino (preventivo)**, considerando que o último exame foi realizado em 2024.
* Orientada quanto à importância do acompanhamento ginecológico periódico e investigação da dor pélvica conforme resultados dos exames.


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59363324, '461', 'Cecilia Gabriela De Castro Gomes', 2, 0, '05313969242', NULL, '(69) 99249-8941', '2004-03-12', 3, 'idade: 21 anos 
G0 P0
DUM: 14/04
MC: ACI MENSAL
UPCCU: NUNCA REALIZOU 

QP: PACIENTE SEM QUEIXAS NO MOMENTO DA CONSULTA, VEM PARA ROTINA GINECOLOGICA  

CONDUTA: SOLICITO EXAMES LAB, USG TV, PROGRAMAR PREVENTIVO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61800254, '916', 'CECÍLIA GABRIELA DE CASTRO GOMES', 2, 1, '05313969242', NULL, '(69) 99249-8941', '2004-03-12', 3, 'Primeira Consulta ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61950191, '960', 'Cecilia Humeniuk Lima', 2, 0, '00955807271', NULL, '(69) 98423-6362', '2007-11-04', 3, 'IDADE 18 ANOS 
DUM: 1 ANO
MC: INJETAVEL TRIMESTRAL
COMORBIDADE HIPOTIREOIDISMO
MENARCA 12 ANOS 
PREVENTIVO: NAO FEZ

PA 120 X 80 MMHG 

QP; PACIENTE COM 11 MESES POS PARTO NORMA;, ALEGA DESCONFORTO NO ATO SEXUAL, E FALTA DE LIBIDO, EM AMAMENTACAO 

CONDUTA; 
ORIENTACOES 
EAMES LB 
USG TV
PREVENTIVO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061441, '296', 'Cecilia Humeniuk Lima', 2, 0, '05038914284', NULL, NULL, '2007-11-04', 3, 'Paciente refere secreção, fluida/pastosa, esbranquiçada com purido, fez uso de creme vaginal nistantina e flucunazol há +- 10 dias.
Especular:  hipertofria de pequenos labios, valor: 5,500 10x no credito.
Colo centralizado, secreção amarelada, com grumos em parede.
Conduta: gynotran, secnidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60574269, '664', 'Cecília Ladeira Lopes Costa', 2, 0, '05249718620', NULL, '(32) 8821-4727', '1983-03-31', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59082150, '316', 'Cecilia Maia De Olivera', 2, 1, '05038914284', NULL, NULL, '1981-12-08', 3, 'Retirada colo do utero em 2009.
Q.P: rotina ginecologica, assitomatica no momento.
conduta: exames, preventivo, mmg, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59082116, '315', 'Cecilia Soares Silva', 2, 1, '05038914284', NULL, NULL, '2002-10-10', 3, 'Q.P: secreção amarelada com odor.
Ao exame: colo em fenda, presença secreção fluida  amarelada com odor, não visualizo fio do diu.
conduta: secnidazol, gynotran, coleta de preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59398865, '476', 'CEILA CUNHA DA COSTA', 2, 2, '58952551249', NULL, '(69) 9229-1446', '1975-06-05', 1, 'Ceila 
PROFISSAO: RH - SERVIDORA PUBLICA- TRABALHA O MAIOR TEMPO SENTADA 
Idade: 49 anos 
upccu: 20223
G5 P3N 1 C  A1
LT
dum: 2017 histerectomia - SUA (miomatose uterina/ cisto ovariano / ?)
curetagem uterina  ?
TROMBOSE VENOSO E UMBILICAL ( TTO COM DR JOSE ROSA 2017/2018)
RNM ABDOME TOTAL 22/04/2025: DIASTESE RETO ABDOMINAL/ ESTEATOSE HEPATICO GRAU I/ VARIZES PELVICA A ESQUERDA 

PACIENTE ACOMPANHADA DO ESPOSO CHAMADO FABIO , PACIENTE REFERE DOR INCAPACITANTE EM FLANCO ESQUERDO, ACOMPANHADO DE  hematoquezia( 17 DE ABRIL ), ALEGA QUE REALIZOU COLONOSCOPIA 
COLONOSCOPIA 29/04/2025: NORMAL 
ecodoppler venoso de mmii esquerdo: ausencia de sinais de trombose venosa profunda 
tc computadorix=zada de abdome total 18/04: normal 
RNM 22/04/25: DIASTASE/ ESTEATOSE HEPATICA GRAU I/ VARIZES PELVICA É ESQUERDA 

AO EXAME: ABDOME SEMIGLOBOSO, PRESENCA DE DIASTESE, A MANOBRA DE VALSALVA
ESPECULA: AUSENCIA DE COLO ( HISTERECTOMIA), PRESENCA DE SECRECA ESBRANQUICABOLHOSA COM ODOR, PRESENCA DE  DSECRECA COM FOCOS AMARELADA EM FUNDO DE SACO DE DOUGLAS, 
TV DOR A MOBILIZACAO 

CONDUTA: CEFTRIAXONA, SECNIDAZOL, GYNOTRAN, TRIPLO A, AZITROMICINA, 

ALEGA QUE MANTEM DISCRETA DOR 
PRESCREVO METRONIDAZOL E GYNOTRAN 
VEM PARA REPETIR PREVENTIVO

11/07
VEM PARA MOSTRAR RESULTADO DE USG TV 
HISTERECTOMIA 
OD 2,2 / OE 2,O 
DIASTESE DE RETOABDOMINAL, SINAIS DE ENDOMETRIOSE EM RETOSIGMOIDE 

PLANO ALIMENTAR, RECOMENDACOES DE ALIMENTO A SEREM EVITADOS , PIETRA ( ENTREGO 3 CAIXAS PARA TRATAMENTO )
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61393774, '836', 'CELIA GOMES DA SILVA', 2, 0, '42075971234', NULL, '(69) 99318-2940', '1973-09-08', 3, 'IDADE 53 ANOS 
G 5 P3 A2
DUM: 2023 SEM TRH 
UPCCU + 2 ANOS 
COMORBIDADES: NEGA 

QP: PACIENTE SINTOMAS DA MENOPAUSA, ALEGA MIOMA

CONDUTA: 
 ORIENTAÇÕES 
EXAMES LAB 
USG TV
PREVENTIVO 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61090309, '773', 'Cenilda Moura Pereira dos Santos', 2, 0, '77849787234', NULL, '(97) 7400-7745', '1977-01-26', 1, 'INIDICAÇÃO ALBELINA BRASIL

IDADE: 49 ANOS 
DUM: 20/01/2026 ( DURACAO DE 3 DIAS, FLUXO NORMAL,NEGA DISMENORREIA)
G3P3A0
LT
UPCCU: 03/12/2025: NEGATIVO PARA NEOPLASIA + GARDNERELLA
USG DE RINS - IDENTIFICANDO MIOMA 
02/12/2025USG TV COMO PRESENCA DE CISTO OVARAIANO ESQUERDO 

CONDUTA: ORIENTACOES
SOLICITO USG TV 

retorno on line
03/02
miojo uterina hemograma normal
conduta: orientações ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61697781, '900', 'Chrysce da Silva Santos', 2, 0, '90620504099', NULL, '(97) 7400-7392', '2000-12-15', 1, 'Deixe mensagem, sobre se há alteração, nos exames, e se há possibilidade de receitar um remédio pra Azia. 

Uma consulta vídeo chamada pra mim não favorece, uma vez que eu cliente só quero saber se os exames pedidos estão alterados e se a minha queixa é Azia. 

Falar com a Dr. por vídeo chamada, toma tanto o tempo dela, quando o meu. Sejamos práticos

Gelmax 10 ml, 30 minutos após as refeições ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59082184, '317', 'Cintia Pessoa  Correia Ribeiro', 2, 2, '05038914284', NULL, NULL, '1981-11-13', 3, 'Q.P:  rotina ginecologica, em tratamento para vaginose, alega cisto mamario.
Apresenta: exames lab 16/01
hb 11,0, ht 34,7, leuc 5,430, plq 309,000.
mamas: n02, presença de nodulo +-2cm em mama direita as 11h.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62172403, '995', 'Cíntia Rafaela Silva Monteiro Magalhães', 2, 0, NULL, NULL, '(69) 9394-4585', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60700982, '699', 'CINTIA SOARES SAMPAIO', 2, 0, '00201926229', NULL, '(69) 98157-1147', '1991-06-14', 3, 'IDADE: 34 ANOS
G2 P2C A 0
MC: ACI MENSAL
DUM: 22/10/2025UPCCU: 3 ANOS 

QP: PACIENTE REFERE DISPAREUNIA, ALEGA SECRECAO COM ODOR E PRURIDO, ALEGA DURACAO DO CLICO DE 15 DIAS 

CONDUTA: ORIENTACOES
EXAMES LAB 
USG TV
GYNOTRAN E SECNIDAZOL 
VIDEOCOLPOSCOPIO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59078785, '309', 'Clara Giovana Ferreira Martins', 2, 1, '05038914284', NULL, NULL, '2003-12-01', 3, 'Paciente refere disminorreia e irregularidade da mesntruação.
orientações: solicito usg pelvica e exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59083905, '322', 'Clara Souza Silva', 2, 2, '05038914284', NULL, NULL, '1982-10-17', 3, 'Q.P: paciente refere purido vaginal e disuria.
alega que fez uso de miconazol e ticonazol creme vaginal, sem melhora, nega secreção vaginal.
conduta: flucunazol, crevagin.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60536993, '647', 'Clarice Guizoni Humaita', 2, 2, '03013301155', NULL, '(97) 8422-0214', '1988-01-07', 1, 'DUM: 21/10/2025
MC: DIU DE PRATA -  INSERCAO 2020
QP: PACIENETE ASSINTOMATICA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62171997, '994', 'CLAUBENISA DA SILVA SÁ', 2, 0, '93687532291', NULL, '(69) 99330-8679', '1988-11-08', 3, '### ANAMNESE GINECOLÓGICA


**Idade:** 37 anos.

**Queixa principal:**
Consulta ginecológica de rotina e desejo de troca do método contraceptivo.

**História da doença atual:**
Paciente de 37 anos, G2 P2 A0, comparece à consulta para avaliação ginecológica de rotina. Refere desejo de **trocar o método contraceptivo atualmente utilizado (anticoncepcional oral Ciclo 21)**. Após orientação e avaliação das opções contraceptivas, paciente optou por **novo anticoncepcional oral**.

**Antecedentes pessoais:**

* Comorbidades: não informadas.
* Alergias medicamentosas: não informadas.

**Antecedentes cirúrgicos:**

* Nega cirurgias prévias.

**Antecedentes ginecológicos:**

* Menarca aos 11 anos.
* DUM: 19/08/2026.
* Último exame citopatológico do colo uterino (preventivo): realizado há aproximadamente 3 anos.
* Mamografia: nunca realizou.

**Antecedentes obstétricos:**

* G2 P2 A0.
* Dois partos cesáreos.

**Método contraceptivo atual:**

* Anticoncepcional oral combinado – Ciclo 21.

**Novo método contraceptivo:**

* Anticoncepcional oral **Nextela®**, conforme escolha da paciente após orientação contraceptiva.

**Hábitos de vida:**

* Atualmente não realiza atividade física.

**Dados antropométricos e sinais vitais:**

* Peso: 92 kg.
* PA: 140 × 80 mmHg.

**Impressão clínica:**
Paciente de 37 anos, G2P2, em consulta ginecológica de rotina, com desejo de mudança do método contraceptivo oral. Apresenta pressão arterial de **140 × 80 mmHg** e peso de 92 kg, sendo importante considerar esses dados na avaliação de elegibilidade e segurança do método contraceptivo escolhido.

### CONDUTA

* Realizada avaliação ginecológica.
* Solicitados exames laboratoriais.
* Solicitada **ultrassonografia pélvica transvaginal**.
* Solicitada **ultrassonografia das mamas**.
* Programada atualização do **exame citopatológico do colo uterino (preventivo)**, considerando que o último foi realizado há aproximadamente 3 anos.
* Realizada troca do **Ciclo 21® pelo Nextela®**, conforme escolha da paciente.
* Fornecida **1 caixa de amostra do medicamento**.
* Orientada quanto ao uso correto do novo contraceptivo, possíveis efeitos adversos, sinais de alerta e necessidade de acompanhamento.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60929039, '730', 'Claudia Braga camurça', 2, 2, '74680366249', NULL, '(69) 9248-8814', '1983-05-18', 1, '42 ANOS 
G3 P3 A0
MC: DIU DE MIRENA 
medicação em uso 
calde max
alta d 50 000 ui 
coenzima q 10 
oestrogel 

EXAMES :
Exames laboratoriais do dia 17/11/2025 você a tinina 0.8 hemoglobina glicada 5,1 e Aécio não infeccioso EPF negativo tsh 3,05 t 4 livre 1,01 anti tpo inferior a 3 estradiol inferior a 20 fsh 39,5 LH 14,4 progesterona inferior a 0,5 testosterona livre 30,4 testosterona total 17,6 Vitamina B12 269 vitamina D 23,2
Hemoglobina 14 leuco 7300 plaqueta 463000 glicose 84 colesterol 137 tgo 42 tgp 65 triglicerídeos 152 o oreia 32 
ultrassonografia de mamas do dia 18/11/2025 exames sem anormalidade birra TRES
 ultrassonografia pélvica transvaginal do dia 18/11/2025 o útero mantivesse o fletido 109,3 endométrio de 7 mm de o bem posicionado ovário direito não caracterizado ovário esquerdo 1,4

MELHORA DA DISPOSICAO
ALEGA DIFICULDADE PERDA DE PESO 
ALEGA INCHACO NAS PERNAS 
PA 130 X 70 MMHG

CONDUTA: 
SOLICITO EXAMES LAB 
ENCAMINHO CARDIO, NUTROLOGO 
SOLICITO USG DE ABDOME TOTAL 

--------------------------------
30/01/2026
Exames laboratoriais do dia 22/01/2026 
GLICOSE 82 colesterol 188 triglicerídeos 140 uréia 24 CRET 0,80 TGO 19 TGP 22 gama GT 23 magnésio 1.7 PCR inferior a 6 
hemoglobina 15,2 hematócrito 43.2 leu 6600 plaqueta 334000 tsh 3,86 t 4 livre 0, 73 insulina 11,13 testosterona 23,7 Vitamina B12 524
FERRO 55
FERRITINA 128
VIT 30
ESTRADIOL 199,90
PROG 0,33
PREVENTIVO 23/01/2026: NEG PARA NEOPLASIA  COCOCS, INFLMACAO BACTERIANA 
Ultrassonografia de abdômen total do dia 23/01/2026 estruturas visible usadas em alterações evidente ao método o preventivo do dia 23/01/2026 flora de Cocos compatível com inflamação bacteriana negativo para células neoplásicas eletrocardiograma dentro dos limites da normalidade


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59069343, '303', 'Cleice Bernado Rodrigues', 2, 5, '05038914284', NULL, NULL, '1985-09-18', 3, 'Exames 24/10/24
eas nitrito +.
24/10/24 piocitos 17 p/ comp , tto monuril
hb 13,6, ht 40, leuc 9,100, plq 430,500, glicose 83, snr, antibs +, tsh 2,06, t4 livre 1,04, estradiol 11,3, tsh 0,405.
conduta: secnidazol, metronidazol, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61914922, '944', 'Cleide Gomes Batista', 2, 2, '75272288220', 'cleide.gomes.ii2015@gmail.com', '(69) 99356-1843', '1982-12-17', 1, 'idade: 43 anos 
DUM: 10/07/2026
MC: -----
G 3 P1 A2 
UPCUU: 2025
ALERGIA : TRAMAL
2014 REALIZOU CALTERIZACAO DE COLO UTERINO 
TECNICO DE ENFERMAGEM 


QP: PACIENTE VEM PARA ROTINA GINECOLÓGICA, ALEGA CICLO MESNTRUAL AUMENTADO, ALEGA MIOMA ACOMPANHADA DE DOR PELVICA 
FEZ USO DE TAMISA 30 SEM PARAR ( ESTA NA 2 CAIXAS) DEVIDO MESNTRUACA DE 15 DIAS, DISMENORREIA 

CONDUTA: USG PARA PREPARO INTESTINAL - ENDOMETRIOSE 
EXAMES LAB 
PREVENTIVO 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60601087, '679', 'Cleide Pereira Silva', 2, 0, NULL, NULL, '(69) 8100-6811', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59069392, '304', 'Cleide Ribeiro Da Silva', 2, 3, '05038914284', NULL, NULL, '1971-12-24', 3, 'Paciente sem queixas , alega que deseja rotina.
conduta: usgtv, mmg.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59078797, '310', 'Cleidiane Da  SIlva Costa', 2, 5, '05038914284', NULL, NULL, '1985-06-19', 3, 'Dor em flanco, que irradia pela perna, disuria.
apresenta  resultado de mmg 20/04/23 bi-rads 2
ao exame: mama n2, presença de nodulo as 15h em mamam esquerda? expressão mamaria+ em ambas mamas.
conduta: exames lab, usg mamas, atestado 1 dia.

06/02/24
alega aborto em outubro de 2023, sem necessidade de curetagem uterina (sic) não apresentou usg.
09/12/23 usg de mamas: mama d bi-rads 1, mama e bi rads 3.
conduta: planejamento familiar, usg de mamas com 6 meses, retorno em maio ou antes se intercorrencias.

18/09/24
Encaminho paciente ao mastologista, devido aumento de nodulo cistico em mama esquerda.
usg 16/08/24 mama esquerda 12h 13x7.
bi-rads 3
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59069240, '301', 'Cleidiane Da S. Ferreira', 2, 2, '05038914284', NULL, NULL, '1989-12-09', 3, 'Paciente com dor em baixo do ventre, com secreção vaginal amarelada, com dispareunia.
Ugtv 09/04/24
utero 70,3, diu normoposicionado, od 3,1, oe 6,2.
Ao exame dor a mobilização no colo do utero.
conduta: programar preventivo, celtriaxona, gynotran, azitromicina.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60032945, '571', 'Cleidiane Da Silva Ferreira', 2, 0, '91666945234', NULL, '(69) 99216-9672', '1989-12-09', 3, 'IDADE: 35 ANOS 
G3 P3 A 0
DUM: 14/07
MC: DIU DE COBRE 
UPCCU: + 2 ANOS 

PACIENTE REFERE 
USG TV 11/07/2025; UTERO 63,7 END 7MM / OD 25,3 / 0E 4,6 CISTO HEMORRAGICO EM OD 

CONDUTA: TRIPLOM A POR 5 DIAS 
PROGRAMAR COLETA DE PREVENTIVO 

08/08: VEM PARA COLETA DE PREVENTIVO
COLO SANGRANTE A COLETA, SECRECAO AMARELADA
DOR A MOBILIZACAO DO COLO DE UTERO 
GYNOTRAN, SECNIDAZOL, TRIPLOA , CEFTRIAXONA 

paciente refere que ainda nao fez uso de Gynotran 
preventivo: Negativo para lesão intra-epitelial e malignidade
RETORNAR APOS USO DO GYNOTRAN 
AGUARDO EXAMES LAB  

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60561338, '656', 'Cleidiane Fonseca Nogueira', 2, 2, '00884443256', NULL, '(69) 9213-5184', '1993-06-17', 1, 'IDADE 32 ANOS 
DUM: 22/10/2025
MC: COITO INTERROPIDO
G 4 P2 A 2

QP: ROTINA GINECOLOGICA, HISTORIA DE LESAO DE COLO DE UTERO HÁ 2 ANOS 

CONDUTA: ZELIZ, GINOBIOTTA, GYNOTRAN

RETORNO DIA 22/11/2025
PACIENTE REFERE QUE COM O USO DA OVULO APRESENTOU QUEIMACAO NO CANAL VAGINAL 
NO MOMNETO EM USO DE GINOBIOTTA 
APRESENTA RESULTADO DE EXAMES 
Preventivo em meio líquido negativo para câncer do colo do útero realizado no dia 7/11/2025 resultado de patologia molecular PCR para HPV não foram detectados alto risco para HPV 
ultrassonografia transvaginal do dia 14/11/2025 útero Retro verso flexão volume de 89,5 cm³ endométrio 9,4 mm ovário direito 1,5 cm³ ovário esquerdo 5,4 cm³ e posso diagnósticas Cisto para tubário à esquerda OVARIO direito de dimensão reduzida 
ultrassonografia de mamas e regiões axilares exame normal – BI RADS 1 

Preventivo em meio líquido negativo para câncer do colo do útero realizado no dia 7/11/2025 resultado de patologia molecular PCR para HPV não foram detectados alto risco para HPV 
ultrassonografia transvaginal do dia 14/11/2025 útero Retro verso flexão volume de 89,5 cm³ endométrio 9,4 mm ovário direito 1,5 cm³ ovário esquerdo 5,4 cm³ e posso diagnósticas Cisto para tubário à esquerda OVARIO direito de dimensão reduzida 
ultrassonografia de mamas e regiões axilares exame normal – BI RADS 1 

Preventivo em meio líquido negativo para câncer do colo do útero realizado no dia 7/11/2025 resultado de patologia molecular PCR para HPV não foram detectados alto risco para HPV 
ultrassonografia transvaginal do dia 14/11/2025 útero Retro verso flexão volume de 89,5 cm³ endométrio 9,4 mm ovário direito 1,5 cm³ ovário esquerdo 5,4 cm³ e posso diagnósticas Cisto para tubário à esquerda OVARIO direito de dimensão reduzida 
ultrassonografia de mamas e regiões axilares exame normal – BI RADS 1 


CONDUTA: SOLICITO EXAMES LAB PARA INVESTIGACAO DA REDUCAO DE OVARIO D 
ARFLEX 200 MG POR 3 DIAS ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62087107, '973', 'Clemilda Benarroque Garcia Pelozato', 2, 0, '75268973215', 'Clemildabenarroque@hotmail.com', '(69) 99913-3966', '1982-03-11', 1, 'Paciente Com Plano de saúde.
Gostaria de realizar uma consulta e realizar o Procedimento de Ninfoplastia. 
idade: 44 anos 
DUM: 04/09/2026
G 2 P2C A0
LT
UPCCU: JANEIRO 2025
ALERGIA: NEGA
COMORBIDADE: ANSIEDADE E DEPRESSAO
MEDICACCAO SERTRALINA, Dimesilato de Lisdexanfetamina

QP: PACIENTE VEM PARA ROTINA GINECOLOGICO, ALEGA DOR PELVICA ( FOSSA ILICA ESQUERDA ) NO PERIODO DA MENSTRUACAO 
SECURA VAGINAL
NO MOMENTO PACIENTE ESTA MENSTRUADA 
DESEJA AVALIACAO PARA NINFOPLASTIA 

CONDUTA: ORIENATCOES 
EXAMES LAB
MMG
USG DE MAMAS 
USG TV 
densitometria ossea

retorno para avalaiacao do colo com video e orçamento da ninfoplastia 
faΩer suplementacao de vit apos analise de exames ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59083610, '319', 'Cleo Alicia Sodre Chagas', 2, 1, '05038914284', NULL, NULL, '2005-08-07', 3, 'Paciente acompanhada de  mãe, refere mama pequena não desenvolveu.
ao exame mama n02, pendulares, sem nodulo, expressão negativa, ausencia de mama acessoria.
conduta: usg de mamas.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59959101, '553', 'Cleo Olenski', 2, 0, NULL, NULL, '(69) 9395-3003', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61420954, '840', 'CLEONICE AVELAR', 2, 2, '00672630206', NULL, '(69) 99371-2048', '1973-10-16', 3, 'idade 53 anos 
DUM. AOS 40 ANOS 

QP: PACIENTE REFERE ALGIA MAMÁRIA, SEM USO DE MEDICAAO, 
PACIENTE ACOM[ANHADA DO ESPOSO, REFERE QUE ESSA ALGIA INICO H AMAKIS OU MENOS 3 ANOS, FEZ ACOMPANHAMENTO E FOI DIAGNOSTICADA COM ANSIEDADE, FEZ USO DE MEDICACAO ( FLUXETINA, POREM ALEGA TONTURA COM USO DA MEDICAO, ONDE A PACIENTE PAROU A MEDICAO POR CONTA PROPRIA)
O MESMO RELATA QUE SEMANA PASADO APRESENTOU QUADRO DESCONFORTAVEL COM A FAMILIA E ALEGA QUE O QUADRO RETORNOU, POREM A PACIENTE REFERE QUE NO MOMNETO APRESENTA DOR COM SESANCAO DE CALOR QUI INICIA NAS COSTA E IRRADIA PARA MAMA ESQUERDA, NEGA ALGIA NA MAMA DIREITA 
AO EXAME
MAMS FLACIDAS, PENDULARES,  EM NUMERO DE 2 , AUSENCIA DE NODIUKOS, EXSPRESSAQO NEGATIVA
DOR EM REGIAO TORACICA ESQUERDA ( MUSCULA?)

CONDUTA: ORIENTACOES
ACHEFLAN 
TRIPLOA 
USG DE MAMAS
MMG ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59512600, '498', 'Cleonice Francisco de Souza Monteiro', 2, 0, NULL, NULL, '(69) 9935-7409', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60051310, '581', 'CLEONICE NO', 2, 0, NULL, NULL, NULL, NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59575903, '516', 'Cleonice Nonato Lima', 2, 2, '50521993334', NULL, '(69) 9269-8242', '1974-02-18', 1, 'IDADE: 52 ANOS
G4 P4 A 0
 MENOPAUSA 2023 - NAO FAZ USO DE TRH
UPCCU: 2024
MMG; 2024
USG DE MAMAS: ----
USG TV 2024

QP; PACIENTE REFERE FOGACHO, FALTA DE DISPOSICAO, LIBIDO DIMINUIDO, IRRITABILIDAE, PELE SECA, VAGINA SECA, INSONIA, 

CONDUTA: 
ORIENTACOES
EXAMES LAB
USG DE MAMAS / uso tv / 
DENSITOMETRIA OSSEA 

EXAMES DE SANGUE 
A VISTA 995,42
CREDITO 1118,50 2X





04/08/2025
PACIENTE RETORNA COM RESULTADO DE EXAMES 
HB: 11,8 / HT 36,7 / FERRITINA 117 / VIT B 12 390 / VIT D 23 / VIT A E C BAIXAS COL 213 / ESTRADIOL 20, 8 / PROG INF 0,15 / FSH 40/ LH 29,8 / ANTI - HBS NAO REAGENTE/ VDRL REAGNTE 1/4 
CONDUTA: ORIENTCAOES
PROGRAMAR COLETA DE PREVENTIVO
AGUARDO EXAMES DE IMAGEM 
REPOSICAO DE FERRO E VITAMINAS  E REFORCO 710,00 





05/08/2025
1 sessao de soroterapia
protocolo de menopausa  ( diluído em 250 ml de sf 0,9%)+ noripurum ( diluído em 500 mlsf0,9%)
braco esquerdo
ao exame 
especular: colo centralizado, em fenda, presença de secreca brancoazincentada, bolhosa, com odor 

conduta: gynotran, secnidazol 
retorno com uma semana para novo protocolo de menopausa, avaliar exames de imagem
melhorar lubrificação vaginal ( antrofi) 
programar laser intimo - paciente prefere para setembro 
solicito VDRL

retorno 13/10/2025
vdrl do parceiro negativo 
USG TV DO DIA 12/08/2025: NORMAL
USG DE MAMAS E AXILARES 12/08/2025: BI RADS 1 
DENSITOMETRIA OSSE: 13/08/2025 NORMAL FEMUR E OSTEOPENIA DA COLUNA LOMBAR 
PACIENTE ENCONTR- SE DESIDRATADA SEM CONDICOES DE ACESSO VENOSSO, 3 TENTATIVAS VEIA ROMPE E SEM SAIDA DE SANGUE 
APLICO COMPLEXO B E C 
CONDUTA: HIDRATACAO VIA ORAL E  RETORNO NA SEXTA PARA APLICACAO DE PROTOCOLO DA MENOPAUSA 

vitergan cog, calde max, hidralit e agua de coco 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59082205, '318', 'Cleonilda Miranda Da Silva', 2, 2, '05038914284', NULL, NULL, '1977-03-22', 3, 'Q.P: retorno para apresentar exames.
hb 12,5, ht 35, leuco 7200, glicose 105,7, fsh 25, lh 18, trig 280.
conduta: liplees, retorno com o resultado do perfil lipidico.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59396042, '469', 'cleuri fatima agustinha', 2, 0, NULL, NULL, '(97) 99185-2743', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59089787, '331', 'Cleusa Adriana Reis Batista Duarte', 2, 2, '64989690249', NULL, '(69) 99237-8515', '1977-03-19', 3, 'IDADE 48 ANOS
DUM: 10/03/25
MC: LT
G4P3A1
UPCCU: 2024
UMMG: 2024

QP: PACIENTE REFERE MASTALGIA DURANTE SEMANS ANTES DO CICLO, ALEGA CANDIDIASE ANTES DA MENSTRUACAO 

CONDUTA: ORIENTACOES, EXAMES LAB, USG TV, USG DE MAMAS, MMG , PROGRAMARA COLETA DE PREVENTIVO 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59061430, '295', 'Clicia Vitoria Santos De Castro', 2, 0, '07250272233', NULL, '(69) 99276-0325', '2006-02-17', 3, 'Paciente refere que dia 31/11/24, apresentou sangramento vaginal, com fluxo moderado 3 dias, após apresentou borra de café que mantém até hoje, não realizou a dose de noregina em dezembro, devido ao escape. Alega  relação sexual nesse perido, não fez uso de preservativo, faz uso de protetor  diario, refere dor em baixo do ventre e dispareunia.
Solicito usgtv.

Retorno 30/01/25
usgtv 28/01/25
utero 43,99, end 5mm, od 4,8, oe 7,75, exame normal.
conduta: bhcg, oriento sobre metodo contraceptivo.

-----------
08/04
20 ANOS 
MC: ----
DUM: 08/02/2026
USG OBSTETRICA 24/03/26: GESTACAO 6 SEM E 2 DIAS, EMBRIAO CCN 5 MM
PACIENTE EM USO DE ACIDO FOLICO E SULFATO FERROSO
ALEGA NAUSEA E AZIA,  USO DE METOCLOPRAMIDA 

SOLICITO EXAMES PRE NATAL 
USG DE  1 TRIM
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59119165, '351', 'Clivia Denise Estevo Barros', 2, 0, '03951156201', NULL, '(69) 99382-0370', '1999-11-08', 3, 'UPCCU: 3 ANOS 
DOR EM BAIXO VENTRE, REFERE DISPAREUNIA, POS COITO SENTE SENSIBILIDADE, 
CONDUTA: SOLICITO USG TV ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61118700, '779', 'Crisanere Maria Bernardo de Souza', 2, 0, NULL, NULL, '(34) 9963-2187', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61075649, '767', 'CRISLAYNE GOMES DA SILVA', 2, 0, '08960894443', NULL, '(69) 99312-9890', '2004-12-19', 3, '21 ANOS
MENARCA 15 ANOS 
SEXARCA; 19 ANOS 
DUM: 27/12
MC: PRESERVATIVO 
UPPCU: ---- 

QP:  PACIENTE REFERE DISMENORREIA E SINUSSORRAGIA, SECRECAO VAGOINAL COM ODOR 
CONDUTA: 
ORIENTACOES 
EXAMES LAB
USG TV 


14/02/2026

Nome: CRISLAYNE GOMES DA SILVa

ULTRASSONOGRAFIA  TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino: anatômico

Útero:  em anteversoflexão, centralizado medindo 7,36 x 6,17 x 3,02 cm (volume: 71,3cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.
. 
Endométrio: centrado, ecogênico e com espessura de 7,2 mm de basal a basal.

Ovário direito: tópico, volume de  9,19 cm³, de forma habitual, contorno preservado e textura normal. Com presença de folículos periféricos.

Ovário esquerdo tópico: volume de 8,7 cm³, de forma habitual, contorno preservado e textura normal. Com presença de folículos periféricos.

Ausência de líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Exame de ultrassonografia dentro dos limites da normalidade.


OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.

-------- ///-----
05/03/26 
VIT D 26 
VIT B 12 449
HB 12
HT 39
LEUCO 5 MIL
PLQ 258 MIL
DEMAIS NORMAL 
 CONDUTA: ORIENTACOE S
DOZEMAS E ALTA D 50 000 UI
RETORNO COM 30 DIAS 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989477, '163', 'Cristiane Da S Botelho', 2, 1, '05038914284', NULL, NULL, '1974-03-07', 3, 'paciente com queixa de metarrogia.
apresenta resultado de exames lab 02/08/23
hb 7,40, ht 28,80, ferritina 2,79, eas 76 p/ campo.
hbsag, hiv snr, vdrl reagente, 1/1 refere tto para sifilis há 2 anos.
usgtv 09/08/23, utero 294,95, presença de mioma submuco >50% intramural tipo 2 1,89, 1,69, 1,99 e outros, presença de cisto o.d 40,7 cm.
conduta:tamisa sem parar,  benzetina 1,200 em cada nadegas, noripurum, hemolip.

29/09/23
paciente refere que fez o uso de noripurum, p benzatina.
apresenta exame 13/09 hb 11,30, ht 38, ferretina 35, ferro 45, vdrl + 70,02.
Conduta: sulfato ferro por 30 dias, vdrl+ hc, encaminhamento para cirugia ginecologica.

16/04/24
paciente vem para pegar solicitação de exames pq a mesma perdeu o pedido.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59084230, '325', 'Cristiane Da Siva Souza', 2, 0, '05038914284', NULL, NULL, '1984-04-20', 3, 'Cesarea 04/07/22 g2 p 2 a0
em amamentação exclusiva, digo com complementação, paciente sem queixas no momento da consulta.
ao exame:
mamilos flacidos, lacteo, fo em cicatrização.
conduta: orientações, totg.
-------------------------------------------------------
retorno 18/08
totg 11/08/22
jejum 79, 1h 106, 2h 85.
conduta: orientações.
------------------------------------------------------
22/09/23
paciente refere dor em baixo do ventre , secreção vaginal 
ao exame especular.
colo centralizado, secreção vaginal fluida e bolhosa, presença de lesão fissruria em cicatriz de cesarea.
conduta: exames lab, neomicuna+ bacteracina, metronidazol + miconazol+ secnidazol p/casal, usg de mamas.
------------------------------------------------
24/10/23
entrega de exames lab 27/09 normal,
usg tv 27/09/23 miomas intramurais.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59864329, '542', 'Cristiane Olivera Dos Santos', 2, 1, '00311491200', NULL, '(62) 99822-1892', '1989-11-17', 3, 'IDADE; 35 ANOS
DUM: 25/04/25
G 1 P0 A0 

PACIENTE GESTANTE JA INICIOU PRÉ- NATAL, PACIENTE DESEJA PARTO CESAREA
EXAMES LAB 11/06: 
HB 10/ HT 26,7 / GLICEMIA 97 / TRACO DE FALCIFORME - ASSINTOMÁTICA
TOXO SUCESPTIVEL / A RH POSITIVO/ SNR 
USG TV 11/06: GESTACAO DE 6 SEMANAS 
COMORBIDADES  TRACO DE FALCIFORME - ASSINTOMÁTICA / RINITE 

IG: 9 SEM E 2 DIAS  ( QUARTA FAZ SEMANA )
QP: ASSINTOMÁTICA, DISCRETA NAUSEA FINAL DO DIA 
EM USO DE SANY D 50 000UI/ OFALATO D / MECLIN/ REPOSICAO DE VITAMINA D IM GLUTEO DIREITO , NAIRE ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60596603, '675', 'Dabny luana do nascimento dantas', 2, 0, '06564539231', NULL, '(69) 99283-1809', '2009-01-22', 3, 'IDADE: 16 ANOS
MENARCA: 11 ANOS
SEXARCA: 2 
VACAINA OK
MC: IMPLANON; ABRIL DE 2024 - 

PACIENTE ACOMPANHADA DA MÃE VANESSA, ALEGA SECRECAO VAGINAL, ACOMPANHADA DE DOR EM BAIXO VENTRE

SOLICITO USGTV, EX LAB  E BACTERIOSCOPIA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58976331, '130', 'Daiana Regina Pereira Da Silva', 2, 1, '56985339204', NULL, '(69) 99213-3098', '1976-08-27', 3, 'Rotina ginecologica, nega secreção vaginal, purido vaginal.
Conduta: preventivo, usgtv, mamas, mmg, exames lab.
-------- /// -----------------
05/03/2026
IDADE: 49 ANOS 
DUM: FEV DE 2026

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA 

CONDUTA: ORIENTACOES 
USG TV
PREVENTIVO
MMG
USG DE MAMAS 


------------------------
12/06

PESO 94.700G  PA 135 X 84 MMHG 
Hemoglobina glicada 6.3 hemoglobina 12,7 hematócrito leu 9040 plaquetas 284000 coagulograma normal e Aécio não infeccioso albumina 4,6 ácido úrico 5 glicose 88 como cisteína 10 uréia 26 creatinina 0.9 sódio 139 potássio 4.4 ferritina 14 Tg Ham 29 tgp 23 gama GT 125 ferro sérico 42 vitamina B12 582 estradiol 31 fsh 16 LH 14 sorologia não reagente SHBG 25 tsh 1,8 t 4 livre 1,25 testosterona total 22 cortisol 7 vitamina D49 3

CONDUTA:  AGUARDO DEMAIS EXAMES ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59090226, '335', 'Daiana Silva', 2, 0, NULL, NULL, '(97) 8421-6893', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59979067, '557', 'Daiane Pereira', 2, 0, NULL, NULL, '(49) 15231-30145', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58987599, '154', 'Daiane PONTES DE Melo MAGALHÃES', 2, 0, '66998018304', NULL, '(69) 98129-3618', '1985-01-05', 1, 'DUM: 28/05/2025
G2P2
LT
UPCCU 2024
odor na urina 
urocultura com crescimento bacteriano
exames Lab com baixa dosagem de b12 e D

conduta;
 ciprofloxacin, multi bi, reposição de vitamina ades, e coenzima q 10 
posso e dozemast 
retorno com 30 dias para avaliar dosagem de vitamina caso precise de reforço 

10/06/2025
NO AGUARDO DE TOMOGRAFIA ( LITIASE RENAL) - MOCRODANTINA, PYRIDIUM, URO-VAXOM, CRABERRY 100MG 1 CP POR 4 MESES 
ALEGA MELHORA DA DISURIA 
AO EXAME: COLO LATERALIZADO A ESQUERDA, PESENCA DE SECRECAO AMRELADA, BOLHOSA, COM GRUMOS EM PAREDE 
CLINDAMICINA GEL, SECNIDAZOL
PROGRAMA VACINA IMUNIDADE, CANDIDIASE E GARDNERELLA 





02/01/2026
IDADE: 40 ANOS 
DUM: 25/12/2025
LT
PREVENTIVO: JUNHO DE 2025

PACIENTE REFERE NAUSEAS, CEFALEIA, ALEGA TAMBEM SENSIBILOIDADE NA REGIAO EXTERNA 
AO EXAME
COLO CENTRALIZADO, PRESENCA DE SECRECAO AMARELADA

CONDUTA: ORIENTACACOES
EXAMES LAB
TERICIN AT + SECNIDAZOL + FLUCONAZOL 
GYNOTRAN POR SEMANA 

DUM 21/01 
PACIENTE REFERE DOR AO SENTAR EM FOSSA ILIACA ESQUERDA
AO EAME; COLO CENTRALIZADO, PUNTIRFOME, PRESENCA DE SECRECAO EABRANQUICADA, FLUIDA SEM ODOR,
TV: DOR A MOBILIZACAO DO COLO PARA ESQUERDA
SEM VISCEROMEGALIA

CONDUTA; CALDE MAX E ARFLEXA RETARD 200 MG 
SOLICITO USG TV E EAS 

-------------------------------------------
07/01/2026
paciente apresenta usg tv 04/02/2026
utero 87,4, endometrio 9,1, od 7,8 oe 8,5 exame normal

paciente vem para laser intimo

ao exame: presença de secreção amarelada , com odor 

conduta:  secnidazol para o casal, fluconazol
------------------------------------------------------------


---------------------------------------------------
30/03/2026

DUM: 18/03/26
LT
PREVENTIVO: JUNHO DE 2025

Paciente assintomática, vem para o laser intimo
------------------
02/05
Paciente assintomática, vem para o laser intimo

 NOME: DAIANE PONTES DE MELO MAGALHÃES

Uso oral

1.	ZELIX 150 mg _________________01 comprimidos
Tomar 01 comprimido via oral dose única.     

Uso tópico
1.	Higi Calm ______________________01 tubo
 Higienizar 2 vezes ao dia, ou sempre que necessário.
__________________________
05/08/2026
USG TV  04/02/2026 utero 87,4, endometrio 9,1, od 7,8 oe 8,5 exame normal
PREVENTIVO: JUNHO DE 2025

paciente com historia de influenza b e bronquite 

paciente refere secreção vaginal esbranquiçada, sem prurido e nao sabe dizer se tem odor, porque nao esta com olfato, ALEGA TAMBEM SENSIBILIDADE NA REGIAO EXTERNA 

ao exame: colo anterior , puntiforme, secreção esverdeada com grumos 



conduta:
orientações 
exames lab 
SOLICITO Mamografia : Rastreio / Prótese mamária , usg de mamas , usg TV
vacina para candidíase 

03/09

RETORNO

exames laboratoriais do dia 19/08/2026
LH 12 vitamina D33 vitamina D12 647 estradiol 73 progesterona 5,2 hemoglobina 14 hematolic 42 leu 5530 plaqueta 255000 hemoglobina glicada 5,2% glicemia média estimada 102 tsh 0,95 t 4 livre 1,33 fsh 8,14 TGO 22 TGP 48 glicose 89 triglicerídeos 56 colesterol 193 hdl 55 ldl 123 ureia 35 creatinina 0.8 ferritina 64 ferro 88 o urocultura não houve crescimento bacteriano exame de urina não infecioso mamografia BIRADS 2

USG TV De 19/08/2024 o volume uterino 9,2 cm³ endométrio 4,6 mm ovário direito 3,4 cm³ ovário esquerdo 8,1 cm³

ao exame:
colo centralizado, secreção bolhosa, amarelada com odor 

CONDUTA: 
ALTA D 50000 UI
SOLICITO DENSITOMETRIA OSSEA


Uso oral

1.	ALTA D 50.000UI____________________01 caixa 
Tomar 01 comprimido via oral, 1 vez por semana.

Uso vaginal

1.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.

2.	Gynotran ______________________________01 caixa
Aplicar 01 óvulo via vaginal, 1 vez por semana. 

aguardo densitometria 

coletar preventivo 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58974212, '125', 'Daiane Postigo Paula', 2, 1, '05038914284', NULL, NULL, '2004-07-15', 3, 'Apresenta exame 11/07
Bhcg negativo
Usgtv 01/06/22 normal
Alega secreção vaginal com odor e purido.
Conduta: secnidazol, gynotran, triplo a, herps I e II.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926747, '62', 'Daiany Silva Barroso', 2, 0, '02252909285', NULL, '(69) 9259-3494', '1997-12-01', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58974487, '128', 'Dalva Vieira De Araujo Bento', 2, 2, '05038914284', NULL, NULL, '1974-10-16', 3, 'Preventivo: proc inflamatório moderado + negativo para neoplasia, gurd veginalis.
Retorno 05/06/23
Paciente refere dor vaginal tipo latejante , negou secreção vaginal, aumento de fluxo menstrual, ao exame fistula em introite vaginal, colo centralizado, presença secreção vaginal esbranquiçada bolhosa.
tv: dor a mobilização do colo.
Conduta: coletado preventivo, ceftriaxona, gynotran, azitromicina, ibuprofeno, dipirona.

Retormo 10/07/23
mmg 27/06/23  bi-rads 0
usg mamas bi-rads 3/4
glicose 190
trige 217
colesterol 288
usgtv 30/06/23 utéro 160cm, mioma intramural, endometrio 9mm, od 60 cm, oe 5,4 cm, hidrossalpinge a direita.
Conduta: metrozidazol+bicerta= hidrossalpinge fenofibrato.
aguardo resultado do preventivo, ao mastologista usg de mamas bi-rads 4
solicito lipidograma p/30 dias.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61352080, '820', 'Damaris da Costa Barboza', 2, 0, '04532010241', NULL, '(97) 8422-2064', '2001-01-01', 1, 'ASC-H , COLPOSCOPIA
dum 13/03
mc: ----
g3 p2 a1
LAUDO DE COLPOSCOPIA

Paciente: Damaris da Costa Barboza
Data: 09/04/2026
Aparelho: Colposcopia Medpej com Sistema de Vídeo


Vulvoscopia
Vulva revestida por pele apropriada para a idade.
Ausência de pelos (depilação sic)
Ausência de anormalidade à vulvoscopia simples com uso de ácido acético a 5%

Vaginoscopia
Sem alteração em parede vaginal e fundo de saco ao uso de ácido acético 5% e solução de schiller.

Cervicoscopia
Colo uterino de forma cilíndrica, voltado para parede vaginal anterior. Orifício externo puntiforme. Junção escamo-colunar visível, coincidente com orifício externo. 


Aspecto das Lesões
Epitélio acetobranco denso, pontilhado vasculares evidente, área extensa iodo negativo ao lugol, superfície irregular e friável com focos hemorrágicos 

Conclusão
Realizada biopsia as 11 horas.

conduta: trivagel e triplo a 
encaminho para biopsia 
ATESTADO MÉDICO

			


ATESTO PARA OS DEVIDOS VINS QUE A SRA Damaris da Costa Barboza, NECESSITA DE 02 (dois) DIAS DE AFASTAMENTO DE SUAS ATIVIDADES LABORAIS, APARTIR DESTA DATA.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59089869, '333', 'Daniela Colares De lima', 2, 0, '04979078281', NULL, '(69) 99319-1230', '2002-10-18', 3, 'retorno 
uso tv 10/03/25: utero 88, ENDOMETRIO 12 MM, DIU INVERTIDO
PREVENTIVO: 30/01/25: NEGATIVO PARA NEOPLASIA + GARDNERELLA ( REALIZADO TRATAMETO COM GYNOTRAN) 
PACIENTE REFERE QUE FEZ USO GYNOTRAN COM MELHORA PARCIAL, NO MOMENTO REFERE SECRECAO VAGINAL ESBRANQUICADA, COM PRURIDO

CONDUTA: ENCAMINHO AO CIMI PARA AVALIAR DIU E PRESCREVO TRIVAGEL N 

09/04/25
PACIENTE REFERE QUE FOI NO CIMI E RETIROU DIU, POREM ALEGA LOMBALGIA, REFERE MELHORAR DA SECRECAO VAGINAL, NAO FEZ USO DE TRIVAGEL
PACIENTE NAO DESEJA USAR DIU,

CONDUTA: SOLICITO USG TV,  SLINDA, RETORNO, RELACAO SEXUAL COM PRESERVATIVO 

20/08/2025

DUM: 30/07/2025
RETORNO
USG TV 12/08: EXAMES NORMAIS 

CONDUTA: SLINDA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58974424, '127', 'Daniela Colares De Lima', 2, 2, '05038914284', NULL, NULL, '2002-10-18', 3, 'Q.P: irregularidade mesntrual, nunca realizou preventivo.
Conduta: exames lab+ usgtv, programar prevntivo.

22/01/2025
Q.P: Paciente usuaria de diu, alega usg com diu ivertido sic, alega disuria e encomodo na relação, refere também secreção vaginal.
Ao exame: colo centralizado, secreção amarelada com odor.
Conduta: coletado preventivo, usgtv, gynotran, seenidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59864600, '544', 'Daniela De Lima Pereira', 2, 3, '77259980206', NULL, '(69) 99941-5118', '1981-12-02', 3, 'idade: 43 aos
G4 P4 
UPCCU: 2023
COMORBIDADE: SOBREPESO, PICO PRESSORICO
CIRURGIAS PREVIAS : COLECISTECTOMIA E LT

PACIENTE REFERE DIFICULDADE PARA EMAGRECER, APRESENTA SINAL HIPERCROMICO EM FACE LATERAL ESQUERDA ( PROXIMO DOS OLHOS ), APARECEUHÁ MAIS OU MMENOS 7 MESES, E VEM CRESCENDO,  DOR EM HIPOCONDRIO DIREITO, REFERE COLECISTECTOMIA E LT

ABDOME: SEMI GLOBOSO, DOR A PLAPACAO PRUFUNA EM HD E FANCO DIREITO 

CONDUTA: ORIENTACOES, EXAMES LAB, USG TV, USG DE ABDOME TOTAL E PROGRAMAR  PREVENTIVO 

EXAMES DE SANGUE 432,92 A VISTA E 476,00 CREDITO

preventivo 11/07/2025: neg para neoplasia 

vit d e b12 baixa 460,00
colesterol, triglicerideo e glicose aumentada
usg TV 26/09; colecistectomia e esteatose hepática grau II (26/09) 
NOME: Daniela De Lima Pereira

Uso oral

1.	VITERGAN COG  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, durante 30 dias. 

2.	Caldê max __________________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia.

3.	Vitergan master- n ______________________01 caixa 
Tomar 01 comprimido via oral 1 vez ao dia, após o café 

4.	Coenzima Q10 _________________________01 caixa 
Tomar 01 comprimido via oral 1 vez ao dia. 

retorno 3 meses ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61446620, '844', 'Daniela Matos VILA Seca', 2, 0, NULL, NULL, '(65) 9977-1272', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61813278, '919', 'Danielle da Silva Feitosa', 2, 0, NULL, NULL, '(82) 98180-3851', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61027316, '749', 'DANIELLE PEREIRA GOMES', 2, 0, '02270424255', NULL, '(69) 99367-6413', '1991-08-27', 3, 'IDADE: 34 ANOS 
G4P2A2
DUM: 30/01/2027 IRREGULAR 
MC:  -------


PACIENTE REFERE DOR EM AIXO VENTRE E DISPAREUNIA, ALEGA SECRECAO VAGINAL ESBRANQUICADA SEM PRURIDO, COM ODOR, ALEGA DISURIA  E CEFALEIA, NO MOMENTO ESTA MENSTRUADA  

APRESENTA USG DO DIA 20/01/2026

UTERO. AVF 87,8, END 4 MM, OD 15,4 PRESENCA DE CISTO E VARIZES PELVICA
OE 9,89

CONDUTA: 
ORIENTACOES 
CIPROFLOXACINA 
EAS, UROCULTURA, EXAMES LAB 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58908027, '4', 'Danielle Ramos Ferreira Gracio', 2, 2, '16793815717', NULL, '(31) 8221-8182', '2000-05-02', 1, 'paciente sem queixas no momento, nega algia, vem para avaliar cordinha do dia e solicitar uso tv ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59562905, '513', 'Danielly Pereira Almada', 2, 0, '70008178283', NULL, '(69) 9254-0338', '1997-01-12', 1, 'idade: 28 anos
MENARCA: 14 ANOS
SEXARCA: 21 ANOS 
PARCEIROS: + 10 
DUM: 12/06/25
MC: ACO CICLO 21 
UPCCU: 2023
G0 P0 
QP: PACIENTE REFERE QUE NAO FAZ PAUSA NO ACO, ALEGA HEMATURIA FEZ USO DE ATB POR CONTA PROPRIA, NEGA DISURIA, NEGA SECRECAO VAGINAL, NEGA NODULO NA MAMA 
REFERE CONSTIPACAO,  SONO RUIM APOS RINOPLASTIA, PAROU ACADEMIA EM SETEMBRO DE 2024

COLO LATERALIZA A ESQUERDA, PRESENCA DE SECRECA ESBRANQUICADA CO GRUMOS EM PAREDE , SANGRANTE A COLETA 
CONDUTA; SOLICITO EXAMES, USG TV, COLETADO PREVENTIVO

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60615184, '689', 'DANIETE DA SILVA SANTOS', 2, 0, '00159020212', NULL, '(69) 9267-2193', '1989-12-22', 1, 'DOUTORA OLHOU OS  EXAMES E NECESSITA DE B12 E D E PREVENTIVO ESTÁ NORMAL', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58974360, '126', 'Dayane Da Silva Veloso Gomes', 2, 0, '05038914284', NULL, NULL, '1989-07-11', 1, 'Paciente refere metarrogia, alega uso de transamin e aco sem melhora.
usgtv 10/03/23, utéro 98,2 cm, od 9,2, oe 14,4, exame normal.
4-5 dias de fluxo menstrual.]
dum 16/02/23 com 18 dias de fluxo, alega presença de coagulo e disminorreia acompanhada de cefaleia.
Conduta: exames lab, transmin sem parar, programar preventivo.

Retorno 27/03/23
Resultado de exame lab 17/03
hb:12,68, plaq 457,600, glicose 105, ttpa:44,7
Conduta: solicito novamente cogulograma e hemograma.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60481753, '640', 'Dayse Castro viera', 2, 2, '61390377350', NULL, '(69) 9205-4211', '1999-04-09', 1, 'cesarea 8 meses - MMME 

amamentando 

dum: 10/03/2025
MC: DEPROVERA


PACIENTE REFER DERMATITE ATOPICA E RINITE MAIS INTENSA APOS 6 MESES 
VEM PARA ORIENATCAO DE CONTRACEPCAO
COLO CENTRALIZADO, SANGRANTE A COLETA 

CONDUTA: ORIENTACOES, SOLICITO EXAMES LAB, COLETO PREVENTIVO CONVENCIONAL .


FALTA SOMENTE O DE VITAMINA C PREVISTO PARA O DIA 24/10
 E VITAMINA A PREVISTO PARA O DIA 28/10

PACIENTE DISSE QUE O RETORNO DELA ERA URGENTE POR CONTA DE UMA ALERGIA.

21/10/2025
PREVENTIVO20/10/2025: Negativo para lesão intra-epitelial e malignidade
EXAMES LAB: PRESENCA DE EOSINOS, COLESTEROL ALTO, PROGESTERONA INFERIOR, VIT D BAIXA 

CONDUTA: ESALERG 5 MG, VIT D, MELHORAR DIETA 

--------------
27 ANOS
DUM: JAM
MC: ACI TRIMESTRAL
PREVENTIVO20/10/2025: Negativo para lesão intra-epitelial e malignidade

exames de sangue ficou em R$ 593,00, porém, para pagamento à vista, conseguimos conceder o valor de R$ 538,00.

realizar usg tv amanha 
prescrevo nextela 
vitamina d ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61799999, '915', 'Debhora de Araujo da Silva Gomes', 2, 2, '01645979210', NULL, '(69) 99300-4266', '1991-12-25', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59060204, '277', 'Débora de Sousa Nascimento Ferreira', 2, 2, '03501871260', NULL, '(69) 9250-1736', '1997-09-17', 1, 'G1 P0 A0
DUM?????
BETA HCG POSITIVO DIA 27/03
COMORBIDADES: NEGA
ALERGIA NEGA 

PACIENTE REFERE BETA HCG POSITIVO DIA 27/03/25, ALEGA SANGRAMENTO VAGINAL TIPO BORRA DE CAFE, DOR EM BAIXO VENTRE E ALGIA MAMARIA 
AO EXAME: PRESENCA DE SANGRAMENTO VAGINAL TIPO BORRA DE CAFE, 

CONDUTA: SOLICITO EXAMES DE PRE NATAL, USG TV E PRESCREVO REGENESIS 
RETORNO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58934022, '86', 'Débora de Souza Freire', 2, 1, '05233711281', NULL, '(68) 9905-3498', '1999-12-26', 1, 'NOME: DEBORA DE SOUZA FREIRE 
amiga da bianca 
31/01/2025
CONTATO: 68 999053498 
PLANO DE SAUDE : NÃO 
IDADE.  25 ANOS
DN: 26/12/1999
DUM: 01/01/2025
MC: IMPLANON
G.  1 P. 0 A 1
MENARCA   13 ANOS
COMORBIDADES: NEGA 
MEDICAÇÃO EM USO: NEGA 
CIRURGIAS PREVIAS: 15 DIAS POS LIPO E MASTOPEXIA
ÚLTIMO PREVENTIVO: + 3 ANOS

QP: PACIENTE REFERE ARDENCIA NA VAGINA E SECRECAO VAGINAL ESBRANQUICADA, 
EXAMES PREVIOS:  NÃO APRESENTOU 
AO EXAME:  COLO CENTRALIZADO, PUNTIFORME PRESENCA DE SECRECAO ESBRANQUICADA, COM GRUMOS EM PAREDE DE GRANDE QUANTIDADE
CONDUTA: 
ORIENTACOES 
CREVAGIN 10 DIAS, FLUCONAZOL 1 COMRIMIDO, REPETIR COM 7 DIAS 
COLETADO PREVENTIVO 

---------------------------   /// -------------
Retorno dia 17/02/2025
Paciente retorna, entrego resultado de preventivo coletado dia 04/02/2025; negativo para neoplasia e candidíase 

paciente com 32 dia de pós mastopexia
realizo 1 sessão de laser para cicatrização 
pix 180,00
retorno com 10 dias para 2 sessao de laser


2 SESSAO DE LASER - FOTOBIOMODULACAO PARA CLAREAENTO CICATRIZ MAMAS
__________________________

IDADE 25 ANOS
DUM: 24/08 
IMPLANON

QP: PACIENTE REFERE SUA, INSERIU IMPLANON EM 29/08/2024, DESDE ENTAO PACIENTE REFERE SUA, NEGA SECRECAO VAGINAL, NEGA DISMENORREIa, nega dispareunia, nega algia mamaria, nega insônia 

conduta: orientados, usg tv, exames lab , 
Uso oral


1.	ACIDO MEFENÂMICO 500 MG ________01 caixa
Tomar 01 comprimido via oral de 8/8 horas, por 5 dias  


2.	DOXICICLINA 100 MG ______________01 caixa
Tomar o1 comprimido via oral 12/12 horas por 5 dias 

-----------------------  // --------------------------

16/10/2025
preventivo coletado dia 04/02/2025; negativo para neoplasia e candidíase 
USG TV DO DIA 22/09/2025:  UTERO 74,99, ENDOMETRIO 5 MM, OD 6,886/ OE 2,96 = EXAME NORMAL

PACIENTE REFER TER FEITO USO DE DOXICLINA E ACIDO MEFENAMICO, COM MELHORA DO SUA
ALEGA DUM: 07/10/2025 COM DURACAO DE 9 DIAS, FLUXO 3 DIAS DE FLUXO MODERADO E DEPOIS LEVE 

CONDUTA: AC MEFENAMICO SE DOR TIPO CÓLICA 
REALIZO SUPLEMENTACAO DE VITAMINA B12 E D E REPETIR COM 1 MES 
RETORNO EM JANEIRO DE 2026 PARA ROTINA GINECOLOGICA ( EXAMES , USG TV, USG DE MAMAS, PREVENTIVO ) 
-------------------------------------
03/08
paciente vem para coleta de preventivo em meio liquido e USTV 

ao exame
especular; colo centralizado, presença de sececao esbranquiçada com odor 

conduta: 
coletado preventivo em ML
gynotran e secnidazol 

---------------
19/08/2026 

Preventivo ginecológico — 07/08/2026
Neoplasia: negativo
Gardnerella: positivo
Hemograma
Hemoglobina: 13,0 g/dL
Hematócrito: 39,4%
Leucócitos: 4.560/mm³
Eosinófilos: 8%
Plaquetas: 219.000/mm³
Glicemia / metabolismo
Hemoglobina glicada (HbA1c): 5,1%
Insulina: 4,6
Ferro: 58
Ferritina: 47,1
Vitamina B12: 420
Vitamina D: 30
Função renal
Ureia: 22
Creatinina: 0,72
Ácido úrico: 3,4
Perfil lipídico
Colesterol total: 152
HDL: 54
LDL: 98
Triglicerídeos: 60
Função hepática
TGO (AST): 15
TGP (ALT): 13
Gama-GT: 33
Tireoide
TSH: 2,49
T4 livre: 1,69
Hormônios
FSH: 5,3
LH: 4,7
Sorologias
HIV: não reagente

---------------------------
20/ 08 / 2026 

PROGRAMACAO DE ACOMPANHAMENTO CLINICO

Protocolo antioxidante

Benefícios: antioxidante “dexintoxicar”, aumento da  energia e disposição,  melhora do metabolismo, função muscular e nervosa. Participação na formação de colágeno. 

Administração: IM

4 doses com intervalo de 1 semana entre as doses.





', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61104934, '777', 'Deise Macedo Soares dos Reis', 2, 0, '02901383297', NULL, '(69) 8122-0540', '1995-10-14', 1, 'idade: 30 anos 
dum:  08/03
G2 P2 ( UPC 2023)
MC: PRESERVATIVO, ESPOSO DESEJA VASECTOMIA 

QP: AVALIACAO DE NINFOPLASTIA 

TERMO DE ANAMNESE




1)	Você tem escurecimento da área genital?                   (   X   ) sim     (      ) não 
2)	Você tem aumento dos pequenos lábios?                   (  X    ) sim     (      ) não 
3)	Você tem alargamento do canal vaginal?                     (    x  ) sim     (      ) não 
4)	Você tem frouxidão dos grandes lábios?                      (      ) sim     (  x    ) não 
5)	Você tem aumento do clitóris?                                       (      ) sim     (      x) não 
6)	 Você tem alguma insatisfação com capz clitoriano?  (      ) sim     (   x   ) não 
7)	Alguma outra insatisfação com sua área intima?        (      ) sim     (      ) não 
8)	Qual?   excesso de pele    

_______________________________________________________________________
_______________________________________________________________________

9)	O quanto estas queixas interferem na sua sexualidade 0 a 10?     8

ao exame
colo centralizado grande quantidade de seccrecao esverdeada com grumos em parede 
presença de labio extra e assimetria a esquerda 

conduta: orientacoes
coletado preventivo
gynotran, secnidazol 
realizo orçamento 

Paciente: Deise Macedo Soares dos Reis
Procedimentos: Labioplastia 

Prezada Deise,
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia.
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
O tratamento para clareamento íntimo, combina o uso do laser íntimo, que atua estimulando a renovação celular e a produção de colágeno, com o peeling químico íntimo, que auxilia na uniformização do tom da pele e na redução de manchas. O protocolo é individualizado, respeitando as características da pele e a necessidade da paciente.
Esses procedimentos, quando realizados em conjunto, proporcionam melhoria estética, conforto íntimo, aumento da autoestima e bem-estar funcional da paciente.
Valores dos procedimentos:
•	Labioplastia: R$ 5.720,00 crédito em 6 vezes ou à vista R$ 5.000,00
•	Clareamento íntimo 400,00 a sessão

NOME: Deise Macedo Soares dos Reis

Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos via oral dose única para o casal.
2.	ZELIX 150 mg _________________02 comprimidos
Tomar 01 comprimido via oral dia 08 e repetir com 7 dias     
3.	GINOBIOTTA ___________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses 

Uso tópico
1.	Higi Calm ______________________01 tubo
 Higienizar 2 vezes ao dia, ou sempre que necessário.

Uso vaginal 

4.	Gynotran ___________________________01 caixa
Aplicar 01 óvulo via vaginal, à noite, por 7 dias. 




 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59611320, '528', 'Denise Matos Cordeiro Ortega', 2, 2, '61695882253', NULL, '(69) 8402-1129', '1980-04-22', 1, 'Denise Matos Cordeiro Ortega
IDADE: 45 ANOS
MENARCA 13 ANOS
 G2 P2 NC 
MC: VASECTOMIA 
DUM: MENOPAUSA HÁ 5 ANOS  
TRH: PROGESTERONA 100 MG  VIA VAGINA / ESTRADIOL 1,5MG / 
TESTOSTERONA ________300 MGC
 VEICULO TRANSDERMICO 
EMBALAGEM DE 30 ML ( SLIMLOOK)
APLICAR FACE INTERNA DO BRACO 1 DIA 

ESTRADIOL 1,5 MG ------------ 60 ML
VEICULO TRANSDERMICO ---------QSP 1ML
EMBALAGEM (SLIMLOOK)
APLICAR 1 ML NA FACE INYETRNA NO BARCO 

COMORBIDADE: TIREOIDE  - EUTIROX 125
MEDICACOA: COENZIMA Q 10, OMEGA 3, D, B12, CURCUMA, BARIT XR, 
EXERCICIO FISICO : REGULAR 
QP: PACIENTE PERDE URINA AOS PEQUENOS ESFORCOS  

laser intimo 1800,00 3 sessões 
encaminho para fisioterapia pelvica

----------------------------------
28/06
1 SESSAO DE LASER INTIMO
BELAMY
FLUCONAZOL 

______________
28/07/2025
2 SESSAO DE LASER INTIMO 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59190981, '419', 'Diana Araujo Ferreira', 2, 2, '67496415200', NULL, '(69) 98411-4649', '1976-12-15', 3, '48 anos 
upccu 2 anos
DUM: 02/2025 - 3 DIAS DE DURACAO  

QP: PACIENTE REFERE CANSACO, FOGACHO, MAU ESTAR, BAIXA LIBIDO, 

CONDUTA: EXAMES LAB, USG TV, USG DE MAMAS, MMG, PROGRAMAR COLETA DE PREVENTIVO 

27/01/26
49 ANOS 
DUM: IRREGULAR 
PACIENTE REFERE MENSTRUACAO IRREGULAR COM DURACAO PROLONGADA, IRRITABILIDADE, CALOR NOTURNO, FOGACHO, INSONIA

CONDUTA:
ORIENTACOES
USG TV
EXAMES LAB 
MMG
USG DE MAMAS 
PREVENTIVO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61099285, '776', 'Diana Garcia do Nascimento Nogueira', 2, 2, '75142694287', NULL, '(69) 9325-2321', '1983-01-19', 1, '43 anos 
DUM: 12 DE FEVEREIRO
G 3 P2 A1
LT
UPCCU: NOV DE 2025
COMORBIDADES: NEGA 
MEDICACAO EM USO: SUPLEMENTACAO DE VITAMINAS 

QP: HIPERTROFIA DE PEQUENO LABIO E ASSIMENTRIA, REFERE INCOMODO MAIOR POR ESTETICA 

AO EXAME:
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59335231, '449', 'Diana Lustosa Lopes.', 2, 0, NULL, NULL, '(69) 9925-3309', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59445394, '484', 'Diene Miranda', 2, 0, '05038914284', NULL, '(69) 99207-3730', '1999-11-19', 1, 'ID: 50 ANOS 
G 4  P2C A2
DUM: 11/06/2025
MEDICAÇÃO?
ALERGIA?
UPCCU: ABRIL 2025 / AGUARDO RESULTADO.

Q.P: PPACIENTE COM DIMINUIÇAÕ DE LIBIDO. DIMINUIÇÃO DA CONCENTRAÇÃO, MEMORIA RECENTE, NEGA FOGACHO, NEGA IRRITABILIDADE, NEGA INSÔNIA, REFERE SECURA VAGINAL, CEFALEIA, RIGIDEZ DAS ARTICULAÇÕES.

EXAMES 12/11/24
HB: 13,7 , HT 41 , LEUCO 5680, PLQ 320.00 , HBGLICADA 4,9 , TESTO 25 , CRET 0,73 , VIT D 51,3 , TESTO LIVRE 52,9 , VIT B12 394 , ESTRADIOL 91,9 , FERRO 90 , FERRITINA 30 , FSH 12,25 , LH 6,93 , GLICOSE 85 , UREIA 22 , K 4,2 , MG 2,0, AC FOLICO 9,0, HOMOC 9,9 , SHBG 52,9 , PTH 82,1 , COL 203 , TRIGL 103 , VIT C <0,3 , PCR 3,47 , PRG 0,22 , PROLACTINA 6,1 , T4 1,08, TGO 23 , INSULINA 9,2 , SELENIO 70, ZINCO 80,6.

USG DE MAMAS E AXILARES 04/02/2025
NODULO M.D,  1 H  12X7X9MM
NODULO FINOS SEPTOS M.E 4H 
BIRADS 3 

CONDUTA: VITAMINA B12 240,00 REAIS 
PROTOCOLO DE ESTIMULO
MELHORA LIBIDO >
MELHORA COGNIÇÃO > 

PRECISO DA T.R.H 

PACIENTE TEM INTERESSE EM IMPLANTE HORMONAL.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58973918, '124', 'Diesse Rodrigues Miranda Gomes', 2, 2, '00151462275', NULL, '(69) 99219-5274', '1989-09-25', 3, 'Q.P: disminorreia, dor em baixo do ventre, cefaleia.
usgtv 14/10/21 normal.
preventivo 15/10/22 asc-us, negativo para neoplasia+granderella.
conduta:gynotran, secnidazol.

21/11/22
Ao exame, colo em fenda, centralizado,ectopia. Presença secreção esbranquiçada com gruomos em parede, teste de schiler.
Conduta:crevagim, flucunazol, coletado preventivo, realizo colposcopia+ biopsia,

03/12/22 preventivo: negativo p/cel, neoplasia, inflamação bacteriana, biopsia endocervicite crônica.

19/07/23
Q.P: dor em baixo do ventre, nega secreção vaginal, nega dispareunia, alega disuria.
exame especular colo em fenda, presença secreção esbranquiçãda.
conduta: exames lab, usgtv, coletado preventivo( etrego p paciente), crevagin.

22/11/23
preventivo 27/07/23 negativo para neoplasia, exames 11/11/23, eas normal urucultura não houve cresc.
usgtv 10/11/23 utéro 92,35, mioma intramural 1,3x1,2 em parede posterior. endometrio 2,8mm, od 4,03, oe 2,86, sinais sugestivo de hidrossalpinge a esquerda.

06/02/24
Paciente refere dor em baixo do ventre tipo colica, esporadicamente  melhora sem medicação, refere a secreção vaginal com odor, esbranquiçada sem purido.
Conduta: secnidazol, metronidazol, usgtv, exames lab+ sorologia.

27/03/25
DUM: 17/03/25
Paciente com dor em baixo ventre, nega secreção vaginal, apresenta usg 24/03/25: útero 69,1, endometriose 2,9mm, presença de mioma intramural 0,8 x 0,6 x 0,7 mm, od 3 oe 6, nódulo uterino , que pode corresponder a leiomioma 
ao exame  
colo centralizado, em fenda, presença de secreção acinzentada e bolhosa,
doa a mobilização do colo 

conduta: secnidazol, ceftriaxona, gynotram, ibuprofeno

23/06/2025
35 anos 
paciente refere dor em MMII, sensação  de pernas pesadas independente do período menstrual, corrimento esbranquiçada, sem prurido e sem odor, 
apresenta usg 24/03/25: útero 69,1, endometriose 2,9mm, presença de mioma intramural 0,8 x 0,6 x 0,7 mm, od 3 oe 6, nódulo uterino , que pode corresponder a leiomioma 
PR4EVENTIVO DO DIA 01/04/2025: NEGATIVO PARA NEOPLASIA ( GARDNERELLA - TRATADO ANTERIORMENTE )
diosmim creme, TRIPLO A, crevagin, eas E LAB 



EXAMES DE SANGUE 343,82 A VISTA E 446,96 CREDITO
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62155993, '984', 'Dina Patrícia Gois de Carvalho', 2, 0, '96847689234', NULL, NULL, '1988-04-02', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60133781, '600', 'DIVA ANDRADE', 2, 0, '78946000244', NULL, '(69) 9248-3502', '1985-09-23', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58976360, '131', 'Dorislane Rocha Silva', 2, 0, '05038914284', NULL, NULL, '1991-08-01', 3, 'Paciente gestante 11 semas, usg 01/06/24 7 semanas e 5 dias.
Em uso de ácido folico.
Conduta:se sangrar procurar mmme, usar protetor solar, realizar exames de pré-natal e usg morfologica 1 trimestre.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61518920, '862', 'Ediene Correia Mendes', 2, 0, '68567709016', NULL, '(69) 9995-6399', '2000-12-15', 1, 'EDIENE 
IDADE: 36 ANOS 
DUM: HISTERECTOMIA – ADENOMIOSE 07/02/26 - dr Mauricio - por video 
G 4 P1 A2 
UPCCU: 2026

QP; PACIENTE REFERE QUE APÓS HISTERECTOMIA POR ADENOMIOSE E DOR  PELVICA  TIPO RASGANDO QUE IRRADIA PARA MEMBROS INFERIOR ESQUERDO, FAZENDO USO DE MEDICACAO (TESTOSTERONA 2% EM PETRAVAN 90 G , APLICAR NA VULVA 1 X AO DIA 
VECASTEN VIA ORAL E TOPICO
LASER INTIMO ( 1400,00) E FOTOBIOMODULACAO EXTERNA 
NINFOPLASTIA 7200,00 A VOISTA 7900,00 CREDITO 
REALIZADO 1 SESSAO DE LASER INTIMO 
------------------------------------------------------
02/06/2026

APOS A 1º SESSAO  DE LASER INTIMO A PACIENTE REFERE MELHORA DE DOR NA ESCALA DE 0 A 10 RESPONDE 5
NO MOMENTO FAZENDO USO AMITRIPTILINA, NAO REALIZADO A FISIOTERAPIA PELVICA 
LUTO PELA TIA PATERNA 
ALEGA QUE NO RESULTADO DA BIOPSIA APRESENTOU ADENOMIOSE E ADERENCIA, SEM SINAIS DE MALIGNIDADE, APRESENTOU O RESULTADO PARA O DR MAURICIO 
ALEGA DOR TIPO RASGANDO EM MII INFERIOR ESQUERDA 
CONDUTA:
- LASER INTIMO
- FOTOBIOMODULACAO
-FISIOTERAPIA PELVICA
-TERAPIA 
- AMTRIPTILINA 

laser 2 sessao 1400,00
CONDUTA: FLUCONAZOL 
ANTROFI 15 DIAS, APOS DIAS ALTERNADOS ATE O RETORNO PARA O 3 LASER 
COLETAR EXAMES HORMONAIS NO RETORNO 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60305681, '628', 'Edilene Alves Da Silva', 2, 2, '66938910200', NULL, '(69) 98170-1640', '1978-07-24', 3, '45 ANOS 
PACIENTE REFERE SINTOMAS DA MENOPAUSA, FAZ USO DE DIU DE COBRE
DUM: 02/09/2025
PREVENTIVO: HÁ 2 ANOS 

CONDUTA; ORIENTACOES, EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59023580, '205', 'Edilene Da Cruz Olivera Alves', 2, 3, '05038914284', NULL, NULL, '1985-02-11', 3, 'Sem queixas, vem para mostrar resultado de exames de preventivo 03/07negativo
Conduta: elane 28

22/10/24
paciente refere dor em baixo do ventre, secreção esbranquiçada, apresenta usgtv 11/07/24 utero 59cm, endometrio fino, od 2,2, oe 3,9, exame normal.
Conduta: flucunazol, miconazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61241483, '802', 'EDILENE DA SILVA SOARES MARQUES', 2, 2, '00362053200', NULL, '(69) 9221-1211', '1989-09-13', 1, 'IDADE: 36 ANOS 
DUM: DIU DE MIRENA - INSERCAO 2021
G 2 P 2C A0 
LT 
COMORBIDADE: FIBROADENOMA - REALIZADO BIOPSIA / CONSTIPACAO 
UPCCU: 2024

QP: PACIENTE REFERE CANDIDIASE DE REPETICAO ( FEZ USO DE LASER INTIMO COM MELHORA SIGNIFICANTE), ALEGA DOR EM FOSSA ILIACA ESQUERDA QUE MELHORA APOS USO DE IBUPROFENO E REFERE EDEMA NO LOCAL 
PACIENTE REFERE RESSECAMENTO VAGINAL E IRRITABILIDADE, ALGIA A ESQUEIRDA CICLICA 

AO EXAME

MAMAS PRESENCA DE VARIOS NODULOS DIFUSOS EM AMBAS AS MAMAS, EXPRESSAO NEGATIVA
ABDOMINAL PLANO, DOR A PLAPACAO PROFUNDA EM FOSSA ILIACA ESQUERDA
ESPECULAR NAO VISUALIZO FIO DO DIU, PRESENCA DE SECRECAO FLUIDA AMARONZADA, PRESENCA DE ECTOPIA, SANGRANTE A COLETA 

CONDUTA:
REALIZO COLETA DE PREVENTIVO EM MEIO LIQUIDO 
EXAMES LAB
USG TV COM PREPARO INTESTINAL
USG DE MAMAS 
PROBIOTICO BIFILAC SII 
USO ORAL


1.	Vita E ciclos _____________________________ 03 caixas
Tomar 2 comprimidos via oral, por 3 meses 


USO VAGINAL


2.	Crevagin _________________________________ 01 tubo 
Aplicar á noite, por 7 dias.
------------------------------
04/05

USG DE MAMAS 28/04/26: BI RADS 3 ( REALIZADA PELO DR EUDES- SEGUIMENTO ANUAL ) 
USG TV 24/04: UTERO 1089,7, END 3,2 MM DIU ACIMA DO OCI / OD 9,6 OE 3,0 
SINAIS DE ENDOMETRIOSE EM COMPARTOIMENTO POSTERIOR  E INGUINAL ESQUERDO 


CONDUTA: 
VORIC E HEMOLIP
SUPLEMENTACAO DE VITAMINAS 

460, 00
VIT B E D 
VITAMINA ADEK E B12 720,00
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61950100, '957', 'Edinalva da Conceição da Silva', 2, 2, '51534444220', 'dina2silva@gmail.com', '(69) 99276-6275', '1980-11-26', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61950101, '958', 'Edinalva da Conceição da Silva', 2, 0, '51534444220', NULL, NULL, '1980-11-26', 3, 'PACIENTE RETORNA COM RESULTADO DE EXAMES 
# Resumo de Exames

### 1. Exames laboratoriais — 08/07/2026

**Hemograma**

* Hemoglobina: 14,5 g/dL
* Hematócrito: 42,6%
* Leucócitos: 5.650/mm³
* Plaquetas: 249.000/mm³

**Metabólicos e tireoidianos**

* Hemoglobina glicada (HbA1c): 5,0%
* Glicose: 86 mg/dL
* Insulina: 10
* TSH: 1,31
* T4 livre: 1,29

**Hormônios**

* FSH: 5,5
* LH: 3,7
* Estradiol: 116
* Progesterona: 22
* Testosterona: 10

**Vitaminas e minerais**

* Vitamina D: 27
* Vitamina B12: 371
* Vitamina C: 6,8
* Ferro sérico: 79
* Ferritina: 27
* Ácido úrico: 2,1

**Função renal e hepática**

* Creatinina: 0,7
* Ureia: 27
* TGO (AST): 18
* TGP (ALT): 14
* Gama-GT: 16

**Perfil lipídico**

* Colesterol total: 150
* Triglicerídeos: 54

---

### 2. Densitometria óssea — 18/07/2026

* Avaliação da coluna lombar e fêmur.
* **Resultado: normal.**

### 3. Mamografia — 18/07/2026

* **BI-RADS 2.**

### 4. Estudo urodinâmico — 23/07/2026

**Queixa principal:**

* Perda urinária aos pequenos esforços.
* Sem urgência miccional.

**Interpretação diagnóstica:**

* Incontinência urinária de esforço, tipo 3.
* Obstrução infravesical média.

### 5. Ultrassonografia das mamas — 08/08/2026

* **BI-RADS:** não foi informado o número na anotação original.

### 6. Ultrassonografia transvaginal — 08/08/2026

* Status pós-histerectomia.
* Demais estruturas visualizadas sem alterações evidentes ao método.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60019304, '564', 'Edinilce Pinheiro dos Santos', 2, 0, NULL, NULL, '(69) 9265-0211', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60543393, '653', 'Edna Ferreira Da Silva', 2, 0, '19694229200', NULL, '(69) 99208-1798', '1954-07-15', 3, '71 anos 
G 4 P N3 C1  A 0
COMORBIDADES: DM , E HAC, ENFISEMA PULMONAR, HIDROCEFALIA, HEMOREDECTOMIA.
ACOMPANHADA DO ESPOSO
Q. P: PACIENTE REFERE A INCONTINENCIA URUINARIA, COM URGENCIA URUINARIA, NECESSITANDO DO USO DE FRALDA.
ESTUDO URODINAMICO 24/11/2018: HIPERATIVIDADE DETRUSORA

CONDUTA: ENCAMINHAMENTO CIRUGIA , LAUDO PARA DISPONIBILIDADE DE FRALDA DESCARTAVEIS.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60032772, '570', 'Edna Monteiro De Olivera Brito', 2, 2, '75011379272', NULL, '(69) 99234-4587', '1982-07-07', 3, 'IDADE: 43 ANOS
UMMG ---
UPCCU: NOV 2023
PACIENTE VEM PARA  ROTINA GINECOLOGICA, SEM QUEIXAS NO MOMENTO DA CONSULTA 
EXAMES Lb do dia 15/07: 
glicose 97, col 166, tra 272, vt b12 407, estradiol 47, ssh 7 /lh 9,12/ t4 livre 0,83/ progesterona 0,12 / vit d 26 / hb 12/ ht 37/ leech  7050 pls 262 mil 

CONDUTA: ORIENCTACOES, USG DE MAMAS, USG TV, MMG, PROGRAMAR COLETA DE PREVENTIVO 
vit d via oral
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59119704, '353', 'Edna Vaz Martins Correa', 2, 0, '82742499253', NULL, '(69) 98109-2975', '1983-12-17', 3, 'IDADE 41 ANOS
UPCCU: 29/11/24 
G2P2
QP: PACIENTE ENCAMINHADA DEVIDO MIOMATOSE UTERINA
USG TV 29/11/24: UTERO 122,5, MIOMA INTRAMURAL ANTERIOR , OD 10,2 , OE 9,3 
CONDUTA: RETORNO COM 3 MESES PARA AVALIAR VIT D 
RETORNO 1 MES PARA AVALIAR PRURIDO VULVAR', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58974615, '129', 'Edvania Armini da Silva', 2, 0, '05038914284', NULL, '(69) 9373-1173', '1999-11-19', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59214429, '430', 'Elaine Da Silva Ds Santos', 2, 0, '06447618224', NULL, '(69) 93740-0044', '2005-07-14', 3, 'IDADE: 19 ANOS 
DUM: 28/12/25
MC: ----
UPCCU: NUNCA REALIZOU
MENARCA: 12 ANOS 
SEXARCA: 15 ANOS 

QP: PACIENTE REFERE DOR EM BAIXO VENTRE, NEGA SECRECAO VAGINAL,  

conduta: exames lab, use tv e programar preventivo', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59236410, '438', 'Elaine Ferreira Moreira da Silva', 2, 2, '98379895215', NULL, '(69) 9243-4122', '1988-06-15', 1, 'IDADE 36 ANOS
DUM: 04/2025
MC: ACO 
G1 PC A0 (UC HÁ 6 ANOS)
UPCCU: HÁ 3 ANOS 
ALERGIA; NIMESULIDA E XAROPE EXPEC

QP: PACIENTE REFER FOGACHO, IRRITABILIDADE, DIMINUICAO DA LIBIDO, PRESNCA DE ACNE, DOR EM BAIXO VENTRE, NEGA DISPAREUNIA, NEGA SINUSSORRAGIA, FADIGA, INDIPOSICAOREFERE QUE ESAT FAZENDO USO DE VITAMINA B 12 
AO EXAME: 
COLO CENTRALIZADO, PUNTIFORME, PRESENCA DE DISCRETA SECRECAO ESRANQUICADA, ECTOPIA 

CONDUTA: EXAMES LAB, COLETADO PREVENTIVO, SOLICITO USG TV

______________________
12/05/2025

PACIENTE COM QUEIXA DE CANSACO
APRESENTA RESULTADO DE EXAMES
25/04/2025: PREVENTIVO: Negativo para lesão intraepitelial ou malignidade
USG TV 24/02/2025: UTERO 61,8, END 0,9 CM, OD 3,8, OE 2,7 EXAME. NORMAL 
EXAMES LAB: 22/04; HB 11,3 / HT 35,1/ LEUCO 8800/ PLQ 400.00/ TSH 0,81 / T 4 LIVRE 1,41GLICOSE 84 / HB GLICADA5,1 /  INSULINA 13,9/ / COLEST 193/ TRIG 160/ AC URIDO 5,1 / GAMA GT 23 / MAGNESIO 2,2/ FERR 71 /FERRITINA 101/  EAS 4 PIOCITOS / TESTOSTERONA 171/ VITAMINA D 48,2 / VIT B 12 2000 / VIT A 0,89 / ESTRADIOL 25/PROGESTERONA 0,38 /FSH 0,30/ LH 0,12 / 


CONDUTA: ORIENTACOES: SUPLEMENTACAO DA VITAMINA C E NORIPURUM 
NOVA CONSULA 40 DIAS / 3 MESES / 6 MESES/ 1 ANO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59337803, '450', 'Elaine Gomes De Abreu', 2, 5, '64906108253', NULL, '(69) 9925-1190 5', '1979-11-01', 3, 'IDADE 45 ANOS
DUM: MARCO DE 2025
G 2 P 2 N A 0
MC: PRESERVATIVO E ACO
UPCCU: +1 ANO - ACOMPANHAMENTO NO HOSPITAL DO AMOR - AGENDADO PARA MAIO

QP: PACIENTE DESEJA CONTRACEPCAO CIRURGCA, ALEGA UM NODULO NA REGIAO DE GRANDES LABIOS APOS DEPILACAO, FEZ USO DE TROK SEM MELHORAS 
AO EXAME:
CONDILOMA?, FISSURA? GLANDULA DE BARTHOLIN DO LADO ESQUERDO 

CONDUTA: ORIENTACOES, OBSERVAR, SOLICITO EXAMES LABORATORIAL 

30 /05 
VEM PARA MOSTRAR EXAMES 
Urocultura negativa hemoglobina 12,5 hematócrito 37,5 leucócitos 10000 plaqueta 252000 sorologia não reagente glicose 94 uréia 15 CREATININA  0,56 tgo 20,9 tgp 10,7 colesterol 193 triglicerídeos 75 ferro 87 Vitamina B12 319 Vitamina D 22,3 tsh 2,033 ET 4 livre 1,16 progesterona 0,15 estradiol 164 f ch 4,94 LH 15,7
VITAMINA D E B12 530 CARTAO EM 2 VEZES / 460,00 A VISTA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020733, '201', 'Elaine Gomes Dos Reis', 2, 1, '05038914284', NULL, NULL, '2005-05-25', 3, '20/04/23
Paciente apresenta irregularidade menstrual.
usgtv 15/04/23 ovario  micropolicistico
conduta: exames lab.

Paciente refere que está no retorno, alegando melhora da irregularidade menstrual, que não precisou fazer uso de aco.
Conduta: retorno com 2 meses.

13/06/24
paciente  sem queixas, em uso de metformina e sop
usgtv 22/05/23
utero 48,8 cm, end 5mm, od 6,6, oe 8,3 exame sem alteração.
Conduta: retorno em novembro, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59668443, '534', 'Elciane Ferreira Lima', 2, 1, '62363930282', NULL, '(69) 9273-4334', '1976-11-05', 3, 'IDADE: 48 ANOS 
MENOPAUSA 44 ANOS - NAO REALIZA TRH
UPCCU: 2024
MMG: 2024
USG TV: ------
COMORBIDADE: OBESIDADE, REFERE ALTERACAO DE GLICEMIA, POREM NAO FAZ USO DE MEDICACAO 
QP; PACIENTE REFERE INCHACO NO CORPO, CANSACO NAS PERNAS, LOMBALGIA, 

EXAMES DE SANGUE
A VISTA 387,92
CREDITO 466,0
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61553829, '870', 'Elen Mara da Silva Neves', 2, 0, '90620504099', NULL, '(97) 98406-6621', '2000-12-15', 1, 'Pagou a consulta 02/06 - R$ 550.00 (confirmado) NAO COBREI CONSULTA SOMENTE COLPOSCOPIA 650,00 BIOPSIA 200,00 LAB AP 370,00
Fazer o exame de colposcopia 02/06 - falta pagar

preventivo 23/03/2026- LIBG/LSIL INFECCAO COMPATIVEL COM HPV 
ATESTADO MÉDICO

			


ATESTO PARA OS DEVIDOS VINS QUE A SRA Elen Mara da Silva Neves, NECESSITA DE 02 (DOIS) DIAS DE AFASTAMENTO DE SUAS ATIVIDADES LABORAIS, APARTIR DESTA DATA.


CID-10 Z12.4
CID-10 N87.0

FOTOS DA COLPOSCOPIA 
--------------
20/08/2026
idade: 40 ANOS 
DUM: 04/08/2026
MC; DIU DE COBRE
G4 P4N A0
UPCCU: preventivo 23/03/2026- LIBG/LSIL INFECCAO COMPATIVEL COM HPV 

PACIENTE VEIO PARA REALIZACAO DE COLPOSCOPIA DIA 02/06/2026 DEVIDO PREVENTIVO ALTERADO, 
RESULTADO DA BIOPSIA 17/06/2026: NIC I 

FOI REALIZADO ATENDIMENTO GINECOLOGICO DIA 15 DE AGOSTO NA CLINICA DO DR PAULO, ONDE FOI SOLICITADO EXAMES LAB E USG TV, APOS AVALIACAO DO RESULTADO DA BIOPSIA (NICI) ORIENTADA REALIZACAO DE CAF 
PRESCREVO ALBOCRESIL EM DIAS ALTERNADOS 

CONDUTA: 
ORIENTACOES 
REALIZADO CONSULTA ON LINE PARA AVALIACAO DOS EXAMES LAB QUE DEMONSTRA VITAMINA B12 LIMITROFE
AGENDADO CAF PARA SETEMBRO - 1800,00 Á VISTA 
PROTOCOLO  DA IMUNIDADE 960,00 Á VISTA OU PAGAMENTO NO DIA DA APLICACAO ( 480,00 CADA) 
VITAMINA B12 + VITAMINA C 
OFERECER VACINA PARA IMUNIDADE  550,00

OBS PACIENTE REFERFE QUE UBS NECESSITA DE ENCAMINHAMENTO PARA VACINA HPV
PACIDENTE REFERE QUE IRA INICIAR OS PROTOCOLOS EM SETEMBRO NO DIA DO CAF 

-----------------------------------
15/09
REALIZADO CAF NO COLO DE UTERO E CALTERIZACAO
REALIZO BIOPSIA 
FOTO EM ANEXO 
REALIZADO VACINA 
REALIZADO CRMO/ CAFEINA/ CURCUMA/ LIDOCAINA IM

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61386128, '830', 'Elenice Prestes Ferreira', 2, 0, NULL, NULL, '(69) 9287-1162', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60457378, '634', 'Elenice Vasconcelos Ribeiro', 2, 3, '41885260253', NULL, '(69) 9983-9547', '1972-01-31', 1, 'PACIENTE NAO TEM PLANO DE SAUDE 
VEM PARA FAZERR O LASER INTIMO 
PACIENTE REFERE INCONTINENCIA URINARIA 
ALEGA QUE FA LASER INTIMO COM A PAMELA 
ACHO A INTIMAVIE PELA INTERNET 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61136400, '780', 'Eleny Pereira da Silva Alcantara', 2, 0, '68357222234', NULL, '(97) 9157-8921', '1970-09-03', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62216405, '1004', 'ELEONARA DA CRUZ BRASIL', 2, 0, '06720605232', 'eleonarabrasil309@gmail.com', '(97) 98116-0929', '2005-08-30', 1, 'Paciente: ELEONARA DA CRUZ BRASIL Idade 21 Anos
G 0, P 0, A 0 
Dum: Maio / 2026 
Sop
Data 12/09/26: Solicito Citologia Oncótica', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59929975, '551', 'Eli Simone Toaldo', 2, 0, NULL, NULL, '(69) 9239-2278', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020585, '197', 'Eliana Lopes Brito', 2, 2, '79654223287', NULL, NULL, '1983-03-18', 3, 'Retorno- ficha anterior não acharam.
Paciente sem queixas, vem para mostrar os exames.
Usgtv 07/05/24: utero 118,0 cm, mioma intramural, od 7,1, oe 6,7.
Preventivo 07/05/24 negativo para neoplasia.
Exames lab 06/05/24 hb 12,4, leuc 6,760, glicose  124, col 272.
Coonduta: dieta alimentar, exercico fisico, rotina anual, aguardo de mmg e usg de mamas, retorno de 3 meses para avaliar colesterol e glicemia.

18/11/24
41 anos
Dum 15/10/24 fica tendo escape todos os dias até o proximo ciclo.
Conduta:  exames lab, usgtv.

----------
30/01/2026

42 ANOS 
PACIENTE SEM QUEIXAS 
VEM PARA ROTINA GINECOLOGICA
Preventivo 07/05/24 negativo para neoplasia.
Usgtv 07/05/24: utero 118,0 cm, mioma intramural, od 7,1, oe 6,7.

CONDUTA: SOLICITO EXAMES LAB, USG TV, USG DE MAMAS, PREVENTIVO 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038331, '247', 'Eliane Aguiar da Silva Magalhães', 2, 0, NULL, NULL, '(69) 9279-2694', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59214059, '428', 'Eliane Aguiar De Assis', 2, 0, '80956114253', NULL, '(69) 99232-4891', '1984-04-08', 3, 'IDADE 41 ANOS 
DN 08/04/1984
DUM: 17/03
MC: -----
UPCCU: 08/05/2024NEGATIVO PARA NEOPLASIA 
COMORBIDADES: NEGA 

QP: PACIENTE REFRE QUE PAROU O USO DE CONTRACEP HÁ 2 ANOS PARA ENGRAVIDAR,  ALEGA QUE O FLUXO E A DURACAO DA  MENSTRUAL REDUZIU, REFERE TAMBEM QUE HÁ MAIS OU MENOS 6 DIAS, APRESENTOU SECRECAO VAGINAL ESBRANQUICADA COM PRURIDO E ODOR 

AO EXAME LAB: 
03/03/25 - INSULINA 11,5 
EAS NAO INFECCIOSO 

CONDUTA: ORIENTACOES, SOLICITO USG TV E PROGRAMAR PREVENTIVO 

24/04/2025

PACIENTE VEM PARA COLETA DE PREVENTIVO
DUM: 15/04/2025
G2 P1 A1 
AO EXAME:
COLO CILINDRICO, CENTRALIZADO, EM FENDA, ECTOPIA
DOR A MOBILIZACAO DO COLO DE UTERO 
CONDUTA: ORIENTACOES, CEFTRIAXONA, AZITROMICINA, GYNOTRAN, TRIPLOA, PANTOPRAZOL 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59032679, '214', 'Eliane Aguiar De Assis Silva', 2, 2, '05038914284', NULL, NULL, '1984-04-08', 3, 'Apresenta exames lab 04/05/23, vit D 19,7, deseja engravidar.
Conduta: usgtv, aguardo resutado de preventivo (coletado semana passada)

Retorno com os exames:
Vitamina A 0,52
Preventivo 04/05/23 neg para neoplasia
Usgtv  15/06/23 cisto simples a esquerda não houve ovulação.
Conduta: manter dtn fol,repetir usg.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59396228, '472', 'Eliane Correia da Silva', 2, 2, '49895923287', NULL, '(69) 8111-6373', '1974-12-12', 1, 'idade: 50 anos 
histerectomia há 20 anos
TRH: estradiol e testosterona 
hipercromia na região intima 
raiz da coxa e grandes labios

conduta: sabonete , esfoliante e clareador 
coletado preventivo em meio liquido 

preventivo: 14/05/2025: negativo para neoplasia 
exames Lab 10/05/25: hemoglobinaglicada 5,3, vitamina b12: 559 / 
estradiol 19  (21/12/24 144, 20/07: 20,  26/02/24:  19 ------------------ julho de 2023 implante 
 progesteron 4,66 / vitmaina d 64/ glicose 89 / trig 35/. colesterol 198 /
ferritina. 27,9 , 21/12/24 69,6
hb 14/ ht 39,7/ leuco 6250/ pls 246.000

conduta: orientcacoes
suplementação de vitamina b 12
noripurum 

26/05/25

PACIENTE REFERE QUE REALIZOU A NORIPURUM 4 AMPOLAS E VEM PARA 1 SESSAO DE PEELING INTIMO, REALIZO FOTOS VOLTAR A UTILIZAR HOME CARE, RETIRAR O PRODUTO COM 6- 8 HORAS
RETORNO 15 DIAS 



26/06
APRESENTA EXAMESPROGESTERONA E ESTRADIOL BAIXO
ALEGA QUE FAZ USO DE PROGESTERONA 100 MG E SYSTEM 50MCG ADESIVO TROCA A CADA 3 DIAS, PAROU E INICIOU SANDRENA GEL ( +/- 1 SEMANA) 

CONDUTA: PROGESTERONA 200 MG , SANDRENA GEL 1 PUMP DURANTE 30 DIAS E REFAZER OS EXAMES 
TESTOSTERONA BASE 3 MG/ML
BASE TRANSDERMICA PENTRAVAN
1 PUMP AO DIA - REGIAO DE ANTEBRACO AO DEITAR, QSP 30G 

PEELING EM CAPSULAS – MANIPULAR -

1.	OLI OLA  300 MG 
ACIDO TRANEXAMICO 200 MG
PICNOGENOL 100 MG 
TRANSVERATROL 50 MG 
TOMAR 01 CAPSULA PELA MANHÃ


2.	POLIPODIUM LEUCOTOMIS 250 MG 
EXYNUTIENT 100 MG 

TOMAR 01 CAPSULA APÓS O JANTAR 


OBS.: CAPSULAS DEVEM SER TRANSPARENTES 
QUANTIDADE PARA 30 DIAS 

LASER ACROMA  AGENDAR 

28/06/2025

Paciente vem para realizar clareamento intimo com acroma 
Entrego termo de consentimento livre e esclarecido 

acroma ponteira 7
indico com 900 ( paciente relata sensibilidade), troco por 600, ato sem intercorrência 
filmo o procedimento - paciente visualiza pontos de clareamento 
registro foto
conduta: 15 dias retornar para peeling intimo
acordou : lavar com sabonete de espuma, passar serum de vitamina C , esperar secar e usar bepantol
noite clareador 
2 vezes esfoliado

  ------------------------------------------------------------
11/07 
PACIENTE REALIZOU O SEGUNDO PEELING COM A DONA NEIVA.

--------------------------- // ----------------------------------

retrono

exames : colesterol 203, vitamina b 12

paciente realizou ontem b 12 IM, 01 ampola de noripurum, devido fraqueza, queda capilar 

conduta
manter mais 2 ampolas de noripurum, dozemast, realizar 01 ampola de b 12 a cada 15 dias 
mantenho progesterona de 200, bariat  XR 
Manipular

1.	Testosterona 5 mg _____________________________
Gel transdérmico base hormonal QSP 60 g
Aplicar 1g de gel sobre a pele seca e limpa em região sem pêlos, uma vez por semana.

2.	Gestrinona 2,5 mg/ml gel vaginal 
Manipular 30 doses
Aplicar 1 ml ao deitar segunda, quarta e sexta- feira. 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59024505, '208', 'Eliane Costa De Olivera', 2, 2, '05038914284', NULL, NULL, '1981-07-13', 3, 'Alega  irritabilidade, fogacho, irregularidade mesntrual.
Q.P: dor pelvica, mesnstruação com odor.
Paciente refere perda de urina em pequenos esforços.
Conduta: exames lab, usgtv, preventivo, estudo urodinamico', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59587116, '526', 'Eliane maria vaz', 2, 0, NULL, NULL, '(69) 9281-7554', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59030130, '213', 'Elis Santana de prado', 2, 3, '05038914284', NULL, NULL, '1988-04-20', 3, 'Irregularidade mesntrual.
Apresenta 25/09/23 hb 13,20, ht 38,60, snr, glicose 97,50, col 175, vitd 15,80.
Conduta: vitd', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59032768, '215', 'Elisa Dos Santos Pereira', 2, 2, '05038914284', NULL, NULL, '1989-02-13', 3, 'Q.P: deseja engravidar
Conduta: se engravidar será gestação de risco, solicito usgtv e exames lab.

Retorno 20/04/23
em uso de contracep, paciente sem queixa.
eas so piocitos  
usgtv 05/04/23
conduta: solicito urocultura.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62109140, '978', 'Elisangela Aparecida Teixeira Casara', 2, 0, '83118039272', NULL, '(69) 98434-5743', '1983-01-08', 1, 'Paciente ira fazer
 Avaliação para o Laser Intimo Valor de R$ 300,00
 Preventivo Convencional no Valor de R$ 120,00 Sem Vídeo sem ser o Meio Líquido 

IDADE: 43 ANOS
G3 P ( 2N 1C) A0
LT
UPCCU: 2024
DUM: 19/08
ALERGIA: COMORBIDADES: NEGA 
PROCEDENTE DE G MIRIM
PLANO DE SAUDE : NEGA 
CIRURGIA: CESAREA, APENDICIDE E COLELITIASE
MMG NUNCA REALIZOU

QP:  PACIENTE REFERE FLACIDEZ VAGINAL, NEGA RESSEMANTO VAGINAL, ALEGA PLICOMA, REFERE ESCURECIMENTO NA REGIAO INTIMA 
NEGA SECRECAO VAGINAL, NEGA DISURIA, 

AO EXAME:
COLO CENTRALIZADO, SECRECAO ESBRANQUICADA FLUIDA, SEM ODOR 

CONDUTA: ORIENTACOES 
EXAMES LAB
COLETADO PREVENTIVO MEIO CONVENCIONAL
SOLICITO USG TV, USG DE MAMAS E MMG 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020705, '200', 'Elisangela Colare Olivera Mendes', 2, 2, '05038914284', NULL, NULL, '1986-04-27', 3, 'Mamografia 27/001/23 bi-rads 1
Usg mamas bi-rads 4 mama esquerda, mama direita bi-rads 3 27/01
Conduta: encaminho ao mastologista.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020658, '199', 'Elisangela Da S M Olivera', 2, 2, '05038914284', NULL, NULL, '1979-05-12', 3, 'Preventivo 07/11/22 negativo para neoplasia.
Usgvt 07/11/22 Utero 136,11, ridrossalpinge a esquerda.
Conduta: ceftriaxona, metronidazol, gynotran, triplo a, retorno 7 dias.

Dum 19/11/22
Alega que precisou interromper o uso do gynotran devido a mesntruação, mas alega melhora do quadro clinico.
Conduta: Triplo A por 5 dias, gynotran terminar o tratamento, retorno, repetir usgtv fev 2022.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60609664, '688', 'Elisangela Gahu De Araujo', 2, 0, '67959792291', NULL, '(97) 8118-8668', '1999-11-19', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020429, '195', 'Elisangela Gil Batista', 2, 2, '05038914284', NULL, NULL, '1986-01-07', 3, 'Paciente refere irregularidade menstrual, alega aborto em abril, fez uso acj trimestral 2 doses( abril/agosto), desde então está em aminorreia, fez teste de beta hcg 25/12/24 negativo.
Conduta: exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59029121, '210', 'Elisangela Lopes Carvalho Da Silva', 2, 2, '05038914284', NULL, NULL, '1978-12-04', 3, 'Paciente em uso de natifa, porém alega dor de mmii, parestesi em mmss, insonia.
Preventivo 14/02/23 negaativo para neoplasia.
14/02/23 estradiol inferior a 15, fsh 69.
mmg: bi-rads 1
usgtv: midrossalpinge a direita.
conduta: exames lab, fluoxetina
31/10/23
paciente anisedade, quadro depressivo, irritabilidade, isonia,fogacho, não realizou exames anteriores, alega dor em flanco.
Conduta: exames lab, usg de rins e vias urinarias.
07/11/23
dum:31/10/23
usg de abdome total 07/11/23 esteatose hepatica grau 2
exame:06/11
trig 198, col 260, vit d 26,90, hb 11,90, ht 34,80, eas normal.
Conduta: vitD.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59470303, '490', 'Elisangela Lopes Carvalho Da Silva', 2, 0, '75424215220', NULL, '(69) 99249-6344', '1978-12-04', 3, '

Paciente em uso de natifa, porém alega dor de mmii, parestesi em mmss, insonia.
Preventivo 14/02/23 negaativo para neoplasia.
14/02/23 estradiol inferior a 15, fsh 69.
mmg: bi-rads 1
usgtv: midrossalpinge a direita.
conduta: exames lab, fluoxetina
31/10/23
paciente anisedade, quadro depressivo, irritabilidade, isonia,fogacho, não realizou exames anteriores, alega dor em flanco.
Conduta: exames lab, usg de rins e vias urinarias.
07/11/23
dum:31/10/23
usg de abdome total 07/11/23 esteatose hepatica grau 2
exame:06/11
trig 198, col 260, vit d 26,90, hb 11,90, ht 34,80, eas normal.
Conduta: vitD.




IDADE: 46 ANOS
G1 PN 
MC: NAO PREVINE 
CASADA 
COMORBIDADE: MIOMATOSE UTERINA / MENOPAUSA / VAGINOSE DE REPETICAO / ITU DE REPETICAO  
ALERGIA: NEGA 
UPCCU: HÁ 6 MESES 

QP: PACIENTE REFERE PERDA DE URINA AOS PEQUENOS ESFORCO, ALEGA DOR INTENSA EM BAIXO VENTRE, ALEGA QUE ESTA FAZENDO URINA NA CAMA, 
APRESENTA EXAMES: 
USG TV: 08/02/2025: UTERO 108/ INTRAMURAL 1,1CM / SUBMUCOSO /SUBSEROSO / OD 4,7 / OE OOFORECTOMIA = MIOMATOSE UTERINA 
Exames laboratoriais do dia 3/02/2025 de paz sanguínea ó positivo hemoglobina 12 hematócrito 35,7 leucócito 7100 plaqueta 369000 glicose 101 hemoglobina glicada 5,7 TTPA 30,6 TAP 10,7 RN 1,04 exames de urina infeccioso exame de urina do dia 3 de março 16 a 20 pior sitos sorologia não reagente exame de urina do dia 27 de março infeccioso 35 a 37 pioCITOS

AO EXAME: DOR A MOBILIZACAO DO COLO DE UTERO
GIORDANO POSITIVO A DIREITA 
DIP

CONDUTA: 
MMG, USG DE RINS E VIAS URINARIA 
CEFTRIAXONA, GYNOTRAN, AZITROMICINA 
SOLICITO R=EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59241785, '439', 'Elisanjela boone', 2, 0, '84445467200', NULL, '(69) 8442-1148', '1983-09-03', 1, 'DUM: 03/2025
MC: ACO SEM PAUSA
G:2 P:2 A:0
COMORBIDADES: NEGA
ALERGIA: NEGA
DN: 03/09/1983
VISTA ALEGRE DO ABUNÃ

Laser: 1800,00 reais

Protocolo de clareamento: 400,00 reais

Ninfoplastia : 7500,00 reais, 8300,00 6x, 8500,00 10

preenchimento / cada ampola fica 1500,00 reais.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61507565, '857', 'Elissandra Sarges Azevedo', 2, 2, '56338830206', NULL, '(69) 9203-4414', '1976-01-25', 1, '50 anos
DUM: 07 E 21 ABRIL DE 2026
G 2 P2C A0
MC: VASECTOMIA 
UPCCU: 2024
MASTOPEXIA E ABDOMINOPLASTIA 3 MESES 
EXERCICO FISICO: MODERADO - CAMINHDA, MUSCULACAO SEM PESO
SONO: PRESERVADO
INTESTINO REGULAR 
UMMG: 2024
HAC
USG DE MAMAS 26/12/2025 BI RADS 2 
USG DE ABDOME TOTAL 26/12/2025: ESTEATOSE HEPATICA GRAU II, NEFROLITIASE NAO OBSTRUTIVA BILATERAL 

OMEGA 3, COENZIMA Q 10, MULTIVITAMINICO 
QP: PACIENTE REFERE QUEDA CAPILAR, HÁ 3 MESES DE POS OPERATORIO 

Exames de urina do dia 8/05/2026 eu gosto do 18 a 22 por campo e Márcia 10 a 12 por Campos flora bacteriana moderada exames laboratoriais do dia 26/12/2025 glicose 95 creatinina um sorologia não reagente com a Globo grama normal hemoglobina 15,3 hematócrito 43 leuco 7400 plaqueta 293000 tsh 4,58 beta hcg negativo

AO EXAMES
DISCRETA SECRECAO ESBRANQUI=CADA COM GRUMOS EM PAREDE 
PRESENCA DE FLACIDEZ EM CACAL VAGINAL, PRINCIPALMENTE EM PAREDE VAGINAL ESQUERDA 
PRESENCA DE CISTOLECE GRAU 1 - SEM PERDA DE URINA A VALSALVA 

CONDUTA:
PREVENTIVO - COLETADO EM MEIO LIQUIDO
USG TV
EXAMES LAB  FSH/ LH/ ESTRADIOL/ - PACIENTE TRARA RESULTADO DE VITAMINAS 
CIPROFLOXACINA E PIRIDYUM / SECNIDAZOL/ CREVAGIN
INDICO LASER INTIMO 
-------------------------------------------------------------
18/05/2026
PACIENTE VEM PARA O LASER INTIMO  E CAPILAR 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59577870, '520', 'Elizabeth do Carmo Gonçalves', 2, 0, NULL, NULL, '(97) 8126-6171', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61143506, '781', 'Elizabeth Moura da Silva', 2, 2, '00092121241', NULL, '(69) 9317-5149', '1990-03-01', 1, 'CONSULTA PARA AVALIAR CALAREAMENTO INTIMO

IDADE: 36 ANOS 
DUM: 08/02/2026
G 1 P C A
MC: DIU DE COBRE - INSERIR EM 123/05/ 2020
UPCCU: DEZ DE 2025
COMORBIDADES": NEGA 
MEDICACAO: NEGA 
EXERCICIO FISICO: TREINO DE VOLEI 

QP: CLAREAMENTO INTIMO 
PACEINTE REFERE ESCURECIMENTO INTIMO POS PARTO 
DEPILACAO A LASER, POREM ATUALMENTE GILETTE 

AO EXAE: PRESENCA DE HIPERTROFIA E ASSIMENTRIA DE LABIO DIREITO 
HIPECROMIA EM REGIAO INTIMA 

ORCAMENTO Paciente: Elizabeth Moura da Silva
Procedimentos: Labioplastia e clareamento íntimo 

Prezada Elizabeth,
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia.
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
Esses procedimentos, quando realizados em conjunto, proporcionam melhoria estética, conforto íntimo, aumento da autoestima e bem-estar funcional da paciente.
Benefícios do Clareamento Íntimo: Clareamento progressivo da região íntima, usando laser e peeling íntimo. Uniformização do tom da pele, Estímulo de colágeno, Melhora da textura e qualidade da pele, Procedimento minimamente invasivo, Recuperação rápida, Aumento da autoestima e segurança.

Valores dos procedimentos:
•	Labioplastia: R$ 7.650,00
•	Clareamento íntimo 400,00 a sessão



 
Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação de pós-operatório (imediato e dia anterior ao procedimento) 
•	O orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou do início do parcelamento.

Atenciosamente,

Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima
---------------------
14/04
AO EXAME: COLO CENTRALIZADO, PRESENCA DE SECRECAO AMARELADA FLUIDA COM DISCRETO ODOR 

CONDUTA: GYNOTRAN, SECNIDAZOL, 
-------------------
15/04PRIMEIRA SESSAO ACROMA 600 (350 DISPAROS) PARA CLAREAMENTO INTIMO
ASSEPSIA
ACROM
GEEL PEEL 
CONDUTA: HOME CARE, RETORNO 15 DIAS, PARA O PEELING 




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60490125, '643', 'Elizabeth Viana Galvão', 2, 2, '01998995259', NULL, '(97) 8427-2626', '1996-03-15', 1, 'IDADE: 29 ANOS
DUM: 24 /09/2025
MC: -----
UPCCU: JULHO 2025

QP: PACIENTE DESEJA ENGRAVIDAR E DESEJA NINFOPLASTIA 

HIPERTROFIA DE PEQUENOS LABIOS ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61188596, '785', 'Elizete Moreira de Souza', 2, 0, NULL, NULL, '(97) 8404-7721', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60013360, '563', 'Elizete Oliveira Mendonça Marceau', 2, 2, '31227309287', NULL, '(69) 9982-4367', '1970-03-13', 1, 'IDADE: 55 ANOS 
G2 P2 A0

COMORBIDADES: NODULO DE TIREOIDE/. OSTEOPOROSE/ DISLIPIDEMIA/
DUM: MENOPAUSA AOS 47 ANOS - TRH ESTRADIOL E PROGESTERONA 
UPCCU: JULHO DE 2025 - COLETADO POR LABORATORIO
UMMG: JULHO DE 2025 - NEGA CA DE MAMA NA FAMILIA 
CONOLOSCOPIA 2024
PLANO DE SAUDE: UNIMED 
EXERCICIO FISICO REGULAR
SONO: PRESERVADO

PACIENTE REFERE FLACIDEZ VAGINAL E IUE, PUM VAGINAL, SENSACAO DE ALARGAMEWNTO VAGINAL,   2017 MESMA QUEIXA ONDE REALIZOU FISIOTERAPIA PELVICA, E A MESMA QUEIXA PERSISTIU ANO PASSADO.
PACIENTE REFERE RESSECAMENTO DO CANAL VAGINAL, NEGA SECRECAO VAGINAL,  NEGA DISURIA.

AO EXAME
; PRESENCA DE FLACIDEZ VAGINAL, COLO PUNTIFORME, PRESENCA DE CISTO DE NABOTH AS 11 H 
CONDUTA: COLETADO PREVENTIVO EM MEIO LIQUIDO, EXAMES LAB, 


--------------------- 27/01
preventivo 18/12/2025: negativo para neoplasia 

Exames laboratoriais do dia 28/01/2026 
hemoglobina glicada 5,5% ferritina 287 isso Lina 10,8 cortisol 9,8 estradiol 50 progesterona 3,6 fsh 10,2 LH 9 
tsh 1,11 t 4 livre 0,96 HIV não reagente hepatite b não reagente urocultura negativo omo cisteína 9,17 
vitamina 0,64 Vitamina C 1,09 Vitamina D 54,1 Vitamina B12 535 testosterona 8 
SHBG 36 e partidos e não reagente não tinha cabeça reagente hemoglobina 13,7 hematócrito 39,9 leuco 7530 plaqueta 277000 26,3 
creatinina 0,6 tgo 46 tgp 84 ferro sérico 97 glicose 96 colesterol 121 para mim ser índio 184 magnésio 1,9 
gama GT 28 ácido de 4,2 PCR negativo vdrl soro não reagente eAS não infeccioso

paciente refere prurido vulvar, intenso, esporádico, alega que esquecia algumas vezes de usar o oestrogel, e refere escape ( precisa usar protetor diário) 
ao exame

conduta: 
orientações 
aumentar para 2 pump de estrogen
solicito usg tv 
------------------

09/02/2026

DUM 2018
PACIENTE REFERE FLACIDEZ VAGINAL E IUE, PUM VAGINAL, SENSACAO DE ALARGAMEWNTO VAGINAL,

REALIZO 
ASSEPSIA COM  HIGICALM 
SECO 
REALIZO: 
LASER INTIMO COM 
- LONG PULSE EXTERNO E FOTOBIOMODULACAO
INTERNO ATHERA 

APLICO BELAMY INTRAVAGINAL

CONDUTA: ORIENTACOES 
BELAMY 

----------
30/03/26

paciente vem para o laser intimo 
apresenta 


Ultrassonografia transvaginal do dia 23/10/2024 útero com volume de 19,3 endométrio 0,3 cm ovário direito de 0,4 cm ovário esquerdo de 1 cm o trio várias dimensões reduzidas usuais da faixa etária
Ultrassonografia transvaginal do dia 12/02/2026 o útero volume de 74,6 presença de nódulo miometriais um segmento corporal de 0,7 cm aspecto intramural segundo nódulo na parede corporal posterior 1,1 cm sub seroso endométrio de 4,5 mm ovário direito não caracterizado a trophy ovário esquerdo 0,8 nódulos uterinos comumente relacionada a leiomioma e desprovido de significado clínico cisto simples para ovariano anexial à esquerda medindo 0,8 cm

paciente refere sangramento vaginal, diminuindo o estradiol para 1 pump, alega que esta colocando despertado para usar as medicações no mesmo horário 
no momento nega sangramento vaginal 

conduta: 
repetir usg tv com 3 meses 
progesterona 200 mg
estradiol 1 pump 

Manipular

1. Testosterona 5 mg _____________________________
Gel transdérmico base hormonal QSP 60 g
Aplicar 1g de gel sobre a pele seca e limpa em região sem pêlos, uma vez por semana.

2. Arginina HCI 100 mg
Ginseng Siberiano 100 mg
Maca peruana 150 mg
Mucuna 150 mg
Vitex Agnus Castus 200 mg
Ashawganda 100 mg
Tomar 01 dose (02 cápsulas) ao dia.
----------------------------------------
15/04/2026
conduta:
solicito usg TV
laser intimo 
------------------------------
18/05/2026
Ultrassom transvaginal do dia 6/05/2026 útero volume 58,5 o var direito 0,9 cm ovário esquerdo 2,4 cm³ apresentando no seu interior imagem cística de parede fina regular conteúdo anecóico homogêneo medindo 1 cm que pode diagnóstico pequeno nódulo uterino sugestivo de miomaSUBSEROSO  isso simples esquerda
-----------------------
conduta: 
realizado laser intimo e laser no rosto 

nao observo saida de secreção para - uretral 
perineoplastia posterior 6280,00
á vista 5 mil



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60994634, '735', 'Elizete Zilske', 2, 3, '81545452253', NULL, '(69) 9230-1154', '1986-04-27', 1, 'IDADE: 39 ANOS 
G1 P1 N A0
DUM: 21/01/2026
MC: VASECTOMIA
UPCCU: 2024

QP: PACIENTE REFERE LABIO DIREITO ASSIMENTRIA

EXAMES LAB 19/01/2026: NDD

AO EXAME
PRESENCA DE HIPERTROFIA E ASSIMETRIA DEPEQUENO LABIO ESQUERDO COM PRESENCA DE FISSURA 

CONDUTA: 
ORIENTACOES 
SOLICITO EXAMES LAB HOMONAL E VITAMINAS
USG DE MAMAS 
PROGRAMAR PREVENTIVO 
5200,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59370971, '462', 'Eloiza Matos Cândido da Silva Gomes', 2, 0, NULL, NULL, '(69) 9327-8953', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61950158, '959', 'Elza Humeniuk', 2, 2, '00413913228', NULL, '(69) 98423-6362', '1990-09-27', 3, '
IDADE; 35 ANOS 
DUM: IRREGULAR 
MC: MDP
CIRURGIAS: NEGA 
G4 P3 N A1
UPCCU: HA 2 ANOS 
QP: PACIENTE REFERE MIOMA, FAZ USO DE MDP COM ESCAPE , EM AMAMENTACAO, ALEGA SENSACAO DE BEXIGA BAIXA

CONDUTA; ORIENTACOES 
EXAMES LAB
USG TV 
PREVENTIVO 

NOME: Elza Humeniuk

SOLICITO

HEMOGRAMA  
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
EAS


10 / 08 /2026




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59576819, '518', 'Elzimar Gomes Pessoa', 2, 0, '21565767268', NULL, '(97) 8107-2320', '1967-05-06', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60074096, '594', 'Emanuele Moreira Carvalho Marcos', 2, 0, '95944621249', NULL, '(69) 8426-6743', '1989-02-18', 3, 'adenomiose e miomatose uterina
refere dismenorreia 
vem para rotina ginecologica
usg , exames e preventivo
EXAMES DE SANGUE 
599,04 A VISTA E 660,00 CREDITO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59170109, '406', 'Emanuelly Vitoria Correa Ramos', 2, 0, '10228053200', NULL, '(69) 99204-7446', '2009-06-17', 3, 'IDADE: 15 ANOS
DUM: 18/03
MENARCA: 11 ANOS
SEXARCA - NEGA 

PACIENTE ACOMPANHADA DA MÃE, ALEGA QUE VEM DEVIDO A DOR INTENSA EM BAIXO VENTRE, TENDO QUE PROUCURA SERVICO DE SAÚDE COM DOR INCAPACITANTE E AUMENTO DA PRESSÃO ARTERIAL, 
APRESENTA EXAMES LAB 20/03 UREIA 16, CREATININA 1,08, TGO 12, PCR 107, EAS 22 A 24 HM, PIOCITOS 6-8 POR CAMPO, HB 12,3, HT 37,8, LEUCO 14100, PLQ 202200, 
USG DE RINS E VIAS URINARIAS DO DIA 18/03 PRESENCA DE LITIASE RENAL 5 MM EM RIM DIREITO E 6 MM EM RIM ESQUERDO, PRESENCA DE CISTO UNILOCULAR NA REGIAO PELVICA  73 X 65 MM
PACIENTE REFERE IRREGULARIDADE MENSTRUAL, AUMENTO DO FLUXO ( NECESSITA DE ABSORVENTE NOTURNO), NEGA DISMENORREIA.
HD: # LITIASE RENAL, 
# CISTO UNILOCULAR
#SOP
 
CONDUTA: ENCAMINAHA PARA URETOLITOTRIPSIA,
SOLICITO USG PELVICA
EXAME LAB 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58915847, '9', 'Emily Camilla Silva', 2, 0, NULL, NULL, '(69) 9928-2620', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59015619, '187', 'Emily Kelly Xavier Da Silva', 2, 0, '03714058230', NULL, '(69) 9307-1943', '1998-04-15', 3, 'IDADE: 26 ANOS
DN 15/04/1898
G0 P0
DUM: 14/02
PROFISSAO VENDEDORA
MC: SELENE 
UPCCU: + 2 ANOS 
COMORBIDADES: NEGA 
QP: PACIENTE REFERE SECRECAO VAGINAL COM ÓDOR, COM PRURIDO, 
REFERE RELACAO SEXUAL SE PRESERVATIVO 
CONDUTA: SECNIDAZOL, GYNOTRAN POR 7 DIAS 
RETORNO PARA COLETA DE PREVENTIVO 180,00

_________________ /// ____________
11/03/25
paciente vem para coletar preventivo 
CONDUTA: ORIENTACOES
ATESTADO MEDICO DE 1 HUM DIA 


---------  // -------

PACIENTE VEM PARA RESULTADO DE PREVENTIVO
13/03/25
ATIPIAS DE CELULAS ESCAMOSAS, NAO PODENDO AFASTAR LESAO DE ALTO GRAU.

REALIZOU VIDEOCOLPOSCOPIA COM COLETA PARA BIOPSIA NO DIA 27/03/25
VALOR: 600,00 REAIS/ 300 CREDITO 2X, 300 DINHEIRO.

09/04/2025

PACIENTE RETORNA COM RESULTADO DA BIOPSIA 28/03/25: CERVICITE CRONICA COM METAPLASIA ESCAMOSA ENDOCERVICAL 

RETORNO EM JUNHO PARA COLETA DE PREVENTIVO, CHA DE BARBATIMAO 
AVALIAR NA PROXIMA COLETA DE PREVENTIVO O USO DE ALBOCRESIL


PACIENTE REFERE QUE PAROU USO DE SELENE HÁ 2 MESES ( PAROU POR CONTA PROPRIA), E DESEJA ORIENTACOES, ESTÁ EM USO DE PREVERVATIVO
DUM: 29/09/25

AO COLO HIPEREMIADO COM ABUNDANTE SECRECAO ESVRERDEADA, COM GRUMO EM PAREDE ( FOTO) 

CONDUTA: SECNIDAZOL, METRONIDAZOL, FLUCONAZOLUso oral


1.	Secnidazol 1 g______________________04 comprimidos 
Tomar 02 comprimidos via oral dose única para o casal.
2.	FLUCONAZOL 150 MG ___________06 COMPRIMIDOS 
     Tomar 01 comprimido via oral hoje, repetir com 3 dias, após 1 vez por semana durante 1 mês.


Uso vaginal

1.	TERICIN AT _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.
06/11/2025
PACIENTE RETORNA PARA RESULTADO DE PREVENTIVO
NEG PARA NEOPLASIA E CANDIDIASE
NO MOMENTO AINDA ESTA EM USO DA MEDICAACAO
CONDUTA: REPETIR PREVENTIVO EVIDEOCOLPOSCOPIA  COM 6 MESES E TERMINAR A MEDICACAO PARA VAGINOSE E FUNGOS 
RETORNAR SE INTERCORRENCIA
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58952495, '105', 'Emily Lira Simões', 2, 0, NULL, NULL, '(97) 8404-5016', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60595624, '671', 'Emyli Mailysteffane rocha machado', 2, 0, '05245878259', NULL, '(69) 99361-6503', '2007-05-14', 3, 'idade; 18 anos 
DUM: 05/10
MC: DIU DE COBRE 09/ 12/2023

QP: PACIENTE VEM PARA CONTROLE DE DIU 
CD: USG TV E PREVENTIVO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020759, '202', 'Emyli Malysteffane Rocha Machado', 2, 1, '05038914284', NULL, NULL, '2007-05-14', 3, '1 usg 29/06/23 11 sem e 5 dias
2 usg 15/07/23 13 sem e 5 dias
Ig:15 sem e 2 dias ( 11 sem e 5 dias)
Pa: 100x60 mmhg
Bcf=+ 
eas: 10 piocitos por campo.
Conduta: feminis, cefalexina, retorno,usg 1 trim( não realizou), urocultura.

11/08/23
Paciente refere que não fez o uso de feminis, alega complexo tto p/ j.i.u., no momento sem queixa, não realizou morfologica1 trim.
Vacina covid 2 doses.
Ig:17 sem e 6 dias, pa 100x60, bcf 157, au 18 cm.
Conduta: sulfeto ferrosso, eas urocultura, usg morofologica 2 trim.

22/09/23
ig;23 sem e 6 dias
Foi ontem no pré-natal do posto de saúde, sem queixas no momento da consulta, refere boa movimentação fetal, em uso de cefalexina deviado eas infeccioso e sulfato ferroso.
pa 100x60, bcf150bpm.
Conduta: eas e orucultura após termino do atb, sulfato ferroso.

20/06/24
6 meses pós- parto cesareo, com inserção de diu.
dum:07/06/24
conduta: solicito usgtv para avaliar diu.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59166291, '401', 'Erenilza Santana brito', 2, 0, '53936655200', NULL, '(97) 8431-1409', '1990-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59030023, '211', 'Erica Souza Silva', 2, 2, '05038914284', NULL, NULL, '1985-10-03', 3, 'Q.P: rotina ginecologica
Conduta: exames lab, usgtv e mamas.
 
Retorno:17/01/23
usgtv 29/12/22 histerectomia total
usg de mamas bi-rads 3  immplantes
mamario, nodulo 0,5x0,4 cm
exames lab 29/12 eas normal, hb 12, ht 37,5, leuc 6,800, pq 365,000, glicose 44, trig 116, coles 166.
Conduta: usg de mamas com 6 meses 06/2023
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59363004, '460', 'Erica Souza Silva Viana', 2, 0, '85721980249', NULL, '(69) 99346-7060', '1985-10-03', 3, 'IDADE: 39 ANOS
G 1 P N
DUM: HISTERECTOMIA - 7 ANOS 
UPCCU: + 2 ANOS 

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA NODULO NA MAMA

ao exame: mamas com protese, presença de nódulo em região aureolas de mama direita 

solicito USG de mamas e axilares 

PREVENTIVO 180,00 PIX/ PREVENTIVO 250,00 CREDITO OU DEBITO.
-----------------------------------------------------------
30/05
paciente não realizou coleta de preventivo.
Exames laboratoriais do dia 14/05/2025 hemoglobina 12,5 hematócrito 37,7 leucócitos 5360 plaquetas 345000 glicose 87 uréia 22,9 creatinina 0.7 colesterol total 190 triglicerídeos 76 fer Tina 133 desde o 29,8 tgp 23 ferro sérico 105 anti h bs 19,9 sorologia não reagente e vitamina B12 386 vitamina D 26.3 estradiol 90,9 progesterona inferior a 0,05 t 4 livre 1.4 TSI h 2,17 LH 6.5 fsh 6.5 
ultrassonografia transvaginal do dia 19 de maio o ter o histerectomizada ovário direito 9,7 ovário esquerdo 6,8 presença de uma imagem cística de 9,1 em ovário esquerdo 
ultrassonografia de mama a presença de um nódulo sólido em mama direita às 6:00 a 0,5 cm do mamilo med 07 por 03 por 07 resultado nódulo sólido e mama direita bi rads  3
conduta: orientações, repetir uso de mamas em 5-6 meses ou antes se intercorrências, reposição de vitamina b e d 460,00 a vista 
-------------------------------------------------------------------------
12/01/2026
exame fisico
PRESENCA DE NODULO DE MAIS OU MENOS 0,5 CM EM MAMA DIREITA 

CONDUTA: 
USG DE MAMAS E AXILARES - Nódulo sólido em mama direita às 6H 
MAMOGRAFIA. 
ATESTADO DE 1 DIA 
-------------------------------------------------
04/02/2026
idade de 40 anos 
G 1 P N
amamentação por 1 ano 
DUM: HISTERECTOMIA - 7 ANOS 
UPCCU: + 2 ANOS 
MMG 19/01/26: BI RADS 2
USG 28/01/2026: BI RADS 3 
MEDICACAO EM USO - VITAMINA DE A-Z

QP: PACIENTE SEM QUEIXAS NO MOMENTO DA CONSULTA, NEGA ALGIA, VEM PARA apresentar resultado de exames
- USG de mamas do DIA  28/01/2026: mama direita apresentando nodulo de 0,5 cm do  mamilo que mede 0,7  x 0,4 x 0,5 , presença de implantes mamários bilateral 
bi rads 3 
- MMG do dia 19/01/2026 mamas densas que pode ocultar pequeno nódulos  - Bi rads 2 
- ultrassonografia transvaginal do dia 19/ 05 / 2025:  histerectomizada,  ovário direito 9,7 ovário esquerdo 6,8,  presença de uma imagem cística de 9,1 em ovário esquerdo 

conduta: 
controle de UG de mamas a cada 6 meses 
aguardo preventivo 
exames lab para término de rotina anual ( avaliar vitaminas) 
usg tv para controle de cisto em OE
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59023182, '203', 'Erika Ronielly Meira Da Silva', 2, 2, '05038914284', NULL, NULL, '2005-10-15', 3, 'Menstruação irregular, historico de abcesso em axila.
Conduta: usg de mama e axilas.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020478, '196', 'Estefani Fonseca Nascimento', 2, 1, '05038914284', NULL, NULL, '1999-11-19', 3, 'Paciente com queixa de secreção vaginal de repetição, alega que já fez varios tipos de  exames.
Apresenta bactericospia 01/06/23
Gram positivo.
Atualmente secreção amarelada, sem odor com purido, piora após relação, alega que inicio o quadro com 10 anos, desde então sem melhora, alega que após os 27 anos iniciou tratamento sem melhora, já foi em varios medicos, alega que fez tratamento recente com metronidazol de forma errada.
Conduta: bacteriscopia, ao retorno analisar qual patogeno está causando o quadro, qual resistencia apresenta.
23/05/24
´Preventivo 22/03/23 negativo para neoplasia, cultura para fungos negativo.
Conduta: gynotra, secnidazol, itraconazol, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59032803, '216', 'Estelita Aguiar Pereira', 2, 1, '05038914284', NULL, NULL, '1993-03-24', 3, 'Paciente refere  purido vaginal, secreção vaginal esbranquiçada, fez uso de miconazol sem melhora, tinea corporea.
Conduta: retirada de implanon, flucunazol, gynotran, exames lab, programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59669030, '537', 'Ester Alves Da Silva Gomes', 2, 0, '63912503249', NULL, '(69) 98170-2594', '1974-05-02', 3, 'IDADE: 51 ANOS
COMORBIDADE: DM - INSULINA / ENALAPRIL HAC/ AVCI  EM 23/11/25
MENOPAUSA - HISTERECTOMIA NOV 2024 - BIOPSIA MIOMATOSE , ADENOMIOSE, POLIPO ENDOMETRIAL, HIDROSSALPINGE A DIREITA
PACIENTE ACOMPANHADA DO ESPOSIO REFERE QUE APOS 2 MESES DA HISTERECTOMIA APRESENTA FOGACHO, INSONIA  
EXAMES LAB COLESTEROL 221/ TRG 118/ 

CONDUTA: LIBIAM 

PACIENTE REFERE QUE ESTA FAZENDO USO DE LIBIAM 2,5 ALEGA MELHORA PARCIAL DO FOGACHO
CONDUTA: MANTER LIBIAM  
entreguei receita de natifa
----------------------
paciente refere que matem fogacho mesmo com uso de libian 

SOLICITO

HEMOGRAMA      
LIPIDOGRAMA                       
FERRO
FERRITINA 
GLICOSE
VITAMINA D3
VITAMINA B12
ESTRADIOL
PROGESTERONA
FSH
LH
TSH
T4 LIVRE 

conduta: solicito exames lab para posterior troca de medicação

-----------
18/04
paciente refere fogacho, mesmo com uso de libian 
paciente com diabetes fazia uso de insulina e parou [por conta própria 
paciente acompanhado do esposo, refere que vai ter obter a medicação pela gerencia de medicamentos 
conduta:
orientações
usg de mamas
omg
vitamina d e b 12 via oral

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59023363, '204', 'Ester Silva Lima', 2, 0, '05038914284', NULL, NULL, '2011-10-10', 3, 'Paciente acompanhada da mãe Regina, vem devido alteração na usg, refere disminorreia.
utero 34,1, od 9,6, oe 12,3, ovarios policisticos.
sop mtor.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59529279, '505', 'Ester Silva Lima', 2, 0, '07506018250', NULL, '(69) 99399-7085', '2011-10-10', 3, 'IDADE; 13 ANOS 
MENARCA: 11 ANOS 
SEXARCA : NEGA 
DUM: 20/05/25
COMORBIDADES: FIBROMIAGIAL ( PREGABALINA, AMTRIPTILINA, TRAMAL, DULOXETINA)
PACIENTE APRESENTA ACNE NO ROSTO, COSTA, DIFICULDADE DE PERDER PESO, PACIENTE REFERE SAIDA DE LIQUIDO EM AMBAS MAMAS

CONDUTA
; SOLICITO USG DE MAMAS 

EXAMES VALOR TOTAL DE 422,40, FICARAM POR 352,40 A VISTA


23/06/25

exames lab  12/06/25
hb 11,8 / vit b 12 367/ vit d 35,3/ glicose 86/ glicose 108, hbglicada 5,4/ colesterol 147/ cdl 42/ ldl 105/ tão 18/ TGP 10/ TSH 2,54/ T4 LIVRE 1.05/ PROLACTINA 21,2 
USG DE MAMAS - 17/06: BI RADS 1 ( dr Eudes orientou acompanhamento- NDN)
PACIENTE ALEGA CISTO NA USG PELVICA - VAI MANDAR O RESULTADO VIA WHATTS APP

CONDUTA:  ORIENTACOES
VITAMINA B 12 E VITAMINA B12 500,00 3x o cartão 

prescrevo:
Uso sublingual 

1.	Dozemast 1000mcg____________________01 caixa
     01 comprimido SL até total absorção, 1 vez ao dia, por 60 dias. 


Uso Tópico

2.	TROK ___________________________01 tubo 
Aplicar 3 vezes ao dia, por 7 dias 

Uso oral
3.	Triplo A ________________________01 caixa
Tomar 01 comprimido via oral, 12/12 horas, por 3 dias 

4.	Hemolip ________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia 

-----------------------------------------------------------
11/05
idade: 14 anos 
dum: 05//05
Exames laboratoriais do dia 11/03/2026 hemoglobina 2,4 hematócrito 36 lei 8650 plaquetas 196000 colesterol total 164 triglicerídeos 116 como cisteína 7,68 uréia 19 ******* 0,8 desde ô 18 tgp 2 beta hcg negativo estradiol 53 FSH 4 LH 19 progesterona 0111 SHBG 22 testosterona 41 glicose 74 ferritina 83 magnésio 2 Hemoglobina glicada 5,76 ferro 109 ter tsh 1,23 t 4 livre 1,19 vitamina B12 537 sorologias não reagentes vitamina D32,7


CONDUTA: USG PELVICA
-------------------------------

IDADE; 14 ANOS 
MENARCA: 11 ANOS 
SEXARCA : NEGA 
DUM: 22/08/2026
COMORBIDADES: FIBROMIAGIAL ( PREGABALINA, AMTRIPTILINA, TRAMAL, DULOXETINA)

VEM PARA APRESENTAR RESULTADO DE USG 

Ultrassonografia elmica do dia 28/06/2024 o útero ante verso fletido volume 34 cm³ ovário direito 9,6 ovário esquerdo 12,3 líquido no fundo da cavidade uterina provavelmente sangue paciente no quarto dia do ciclo menstrual padrão ecográfico de ovários policísticos 

ultrassonografia pélvica do dia 5/09/2026 útero antiverso fletido volume 65 cm³ endometro 5 mm ovário direito 28 ovário esquerdo 32 ecografia sem alteração 

exames laboratoriais do dia 4/09/2026 hemoglobina 12 hemato 38 leu 8980 plaqueta 219000 hemoglobina glicada 5,3 glicemia 76 sorologias não reagente tsh 2,2 t 4 livre 1,16 Vitamina B12 456 vitamina D26 ferritina 77 creatinina 0,9 tech o 24 tgp 19 triglicerídeos 126 ureia 21 colesterol 185


QP: PACIENTE ACOMPNAHDA DA MAE, REFERE DISMENORREIA 

CONDUTA: 
ORIENTACOES
PONSTAN 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59023891, '206', 'Ester Sousa Pinto', 2, 0, '05038914284', NULL, NULL, '2012-12-27', 3, 'Paciente acompanhada da mãe , alega irregularidade menstrual, disminorreia.
Conduta: usg pelvica, ibuprofeno, atestado 1 dia.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59024021, '207', 'Esther Kadisha Nogueira Dos Reis', 2, 1, '05038914284', NULL, NULL, '2004-04-23', 3, 'Q.P: disminorreia, usg anteriores.
Conduta: rnm pelvica, com resultados das usg.

11/06/24
Bacterioscopia 03/05/24 neg para fungo, trichomones, flora bact moderada.
rnm 10/05/24
alt fibrocicatricias nos canais inguinais, od policistico, cisto oe corpo luteo, não foi observado endometriose.
exames lab 30/03/24 vit d 24,9
hb 13, ht 39,4.
usg de abdome inferior 02/04/24 normal, usg de mamas 02/04/24 normal, mamografia 02/04 bi- rads 2

paciente  refere que para tratamento de disminorreia, fez uso de paracetamol e buscopan simples, mãe refere que fez uso de secnidazol e não apresentou reação alergica.
Conduta: secnidazol 2cp 1g, retorno com 30 dias', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61638903, '884', 'Eugini Lidia da Silva', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, 'iade 49 anos 
DUM: 10/05/2026
MC: LT
G3 P3 A0 
COMORBIDADES PRE DIABETICO
UPCCU: 2025

QP: PACIENTE REFERE PRESENCA DE BOLINHA DE AGUA NOS GRANDES LABIOS (=/- 15 DIAS) NO MOMENTO SEM QUEIXAS 

CONDUTA: ORIENTACOES 
SOLICITO SOROLOGIAS 
PREVENTIVO
USG DE MAMAAS E USG TV
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60701337, '700', 'EUSÂGELA RODRIGUES LAGO PORTO', 2, 0, '64435016249', NULL, '(69) 99287-8591', '1975-01-14', 3, 'IDADE 50 ANOS 
DUM: 43 anos 
g2p2 

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA TRH ATE O ANO DE 2024 CECCI

CONDUTA: EXAMES LAB, USG TV, USG DE MAMAS, MMG ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59030096, '212', 'Eusimari Futado Da França', 2, 2, '05038914284', NULL, NULL, '1978-12-10', 3, 'Q.P: paciente refere  purido vaginal após menstruação, corrimento esbranquiçado.
Conduta: coleta de preventivo e exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59193933, '425', 'Euzabete Marinho de Andrade', 2, 0, NULL, NULL, '(69) 8125-1907', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020633, '198', 'Evanilce Garcia De Souza', 2, 3, '05038914284', NULL, NULL, '1978-06-04', 3, 'Apresenta exame 29/11/22
hb 11,3, col 223, glicos 105,3, fsh 53,80, trigl 270.
Conduta: exercico fisico, retorno 3 meses avaliar reposição hormonal.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59347134, '453', 'Evanilda dos Santos Oliveira', 2, 0, NULL, NULL, '(65) 9611-2935', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60594318, '668', 'Eveline Sales de Figueiredo', 2, 1, '00423155229', NULL, '(69) 9270-3171', '1996-01-10', 1, 'IDADE: 29 ANOS
PLANO DE SAUDE 
G 3 P2 A1 ( 1 FILHO VIVO) PE E PREMATURIDADE
MC: DIU DE COBRE - 2023 APRESENTA ESCAPE, ALEGA FACOLIDADDE PRA ENGORDAR  
COMORBIDADE: NEGA
ALERGIA NEGA
PCCU: ABRIL DE 2025
CANDIDIASE DE REPETICA, DESDE A GRAVIDEZ EM 2023, JA FEZ USO DE VARIAS MEDICACOES VIA ORAL E TOPICAS SEM MELHORAS, USO DE CHA 
ao exame: colo centralizado, presença de secreção grumosa em parede e presença de sangramento ( escape)

conduta: solicito exames lab
sugiro fotobomodulacao
vacina de candidíase

NOME: Eveline Sales de Figueiredo



USO ORAL


1.	Fluconazol 150 mg  ______________________________________06comprimidos 
Tomar 01 comprimido via oral hoje, repetir com 3 dias e após 1 vez por semana, durante 1 mês.

2.	Ginobiotta _____________________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses.


USO VAGINAL 

1.	Gynotran  _____________________________ 1 caixa
Aplicar 01 óvulo via vaginal, por 7 dias

---------------   // ------------------
06/11
paciente alega que ainda nao saiso resultado dos exames, alega melhora do quadro, alega estresse pelo fator maternidade 

ao exame
presença de secreção fluida esbranquiçada, discretos grumos em parede 

conduta: realizo vacina
Uso ORAL

1.	PASALIX PI 1.000MG ___________01 caixa
Tomar 01 comprimido via oral, uma vez ao dia 
Uso vaginal 
1.	Gynotran ___________________________02  caixas 
Aplicar 01 óvulo via vaginal, à noite, por 7 dias, após usar uma vez na semana.

retornar com resultado does exames 
avaliar necessidade de reposição de vitaminas
vacina para candidíase com 1 mês 
-------------- // ----------------------
Exames do dia 7/11/2025 
hemoglobina 14 hematócrito 41,7 leu 8060 plaqueta 333000 hemoglobina glicada 5,1 
tsh 1,85 t 4 livre 1,14 fsh 2,25 LH 9, 73 testosterona total 32 
sorologia não reagente anti h bs não reagente
 insulina 7,7 cortisol 15,8 HOMOSScisteína 10,99 Vitamina A zero ponto 43 Vitamina D 30,6 Vitamina B12 596 
estradiol 141 progesterona 6,1 ácido úrico 4,2 TGU 11 tgp 9 gama GT 19 glicose 89 triglicerídeos 76 colesterol 150 puré 25 creatinina zero ponto 50 ferro 44 
magnésio 1,7 proteína 1,3 urocultura não houve crescimento é a esse não infeccioso 
Vitamina C 1,2
Ultrassom transvaginal do dia 12/11/2025 o tiro anti verso fletido correspondendo a 1 o volume de 133,3 cm³ eco endometrial de 11,5 mm com de o normal posicionado ovário direito com volume de 15,7 pequeno nódulo ecogênico ovariano à direita aventar cisto hemorrágico em resolução não se podendo excluir outras etiologias tais como TERATOMA O RADS 3  varizes pélvicas bilaterais pequena quantidade de líquido no fundo de saco posterior achado habitual em mulheres em idade fértil devendo ser valorizado apenas mediante correlação clínico laboratorial ultrassonografia de mamas e regiões axilares linfonodo intra mamário à esquerda implante mamário de aspecto habitualBIRADS 2

CONDUTA
SOLICITO RNM PELVICA
NOME: Eveline Sales de Figueiredo
Uso oral

1.	VITERGAN COG  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, durante 30 dias. 

2.	Caldê max __________________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia.

3.	E MAMA ____________________________01 Caixa 
Tomar 01 comprimido via oral 1 vez ao dia.

Uso oral

4.	Dozemast 1000 mcg ______________________01 caixa 
 01 comprimido via sublingual 1 vez ao dia, após o café 


02/11 /2025

REPOSICAO DE VITAMINA D E C
VACINA PARA CANDIDIASE

1.	Gynotran  _____________________________ 1 caixa
Aplicar 01 óvulo via vaginal, 1 vez por semana 


16/12
rnm 06/12: diu normoposicionado, nao foram evidenciados sinais de endometriose, pequeno cisto ovariano de aspecto folicular, nao foram evidenciados nodulacoes 
conduta; acompanhamento de usg TV 
-------
27/01
paciente refere luto pela avo do marido ( considerada mãe do esposo) , após isso apresentou crise de ccandidiase
ao exame: presença de secreção esbranquiçada fluida
conduta: 
trivagel ( entrego 01 caixa de amostra grátis ) 
NOME: Eveline Sales de Figueiredo

1.	Itraconazol 100mg __________________10 comprimidos 
Tomar 01 comprimido via oral 12/12 horas, por 5 dias 
fluconazol para parceiro dose unica 
banho de assento com flogorosa 

retorno para vacina

----------------------  /// ---------------
06/03
paciente vem para segunda dose de vacina para candida 

conduta:
orientações
laser intimo 
----------------06/04
paciente com queixas de candidíase, com desejo de retirar diu 

screcao esbranquiçada, com grumos 
visualizo fio do diu

assepsia
retirada do diu- paciente visualiza o diu 
ginotran, ginobiotta, por 3 meses, zelix, acido borico, nestella como metodo contraceptivo 

---------------------  // -----------------------

14/07

inserção de diu de morena e vacina de candidíase 

Realizada inserção de DIU hormonal (Mirena®) sob técnica asséptica. Paciente em posição ginecológica. Realizado exame especular, antissepsia do colo uterino e da vagina com solução antisséptica. Colo uterino pinçado com pinça de Pozzi. 
guiada por ultrasom   inserido conforme técnica recomendada pelo fabricante, com posicionamento adequado em fundo uterino. Fios seccionados,
permanecendo aproximadamente 2–3 cm exteriorizados pelo orifício cervical externo. 
Procedimento transcorrido sem intercorrências. visualizado pelo ultrasom - diu normoposicionado 
Paciente orientada quanto aos possíveis efeitos adversos, sinais de alerta e retorno para reavaliação conforme necessidade.

conduta: 
orientações
triplo a 
vacina de candida 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59136223, '386', 'F Sadla Damesceno', 2, 2, '05038914284', NULL, NULL, '1978-12-16', 3, 'Q.P: paciente vem devido ausência da menstruação, alega testa bhcg negativo, refere cefaleia, perda de cabelo, dor muscular, diminuição da libido, perda de urina em pequenos esforços.
usgtv 02/12/24 adenomiose ovarios sem alt.
Especular: colo anterior em fenda, muco hialino.
Tv: dor em mobilização ao colo.
Conduta: exames lab, usgtv, orientações.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61027269, '747', 'FABIANA MOREIRA DE SOUSA SILVA', 2, 0, '02983810283', NULL, '(69) 9927-2061 1', '1996-03-11', 3, '29 ANOS 
G3 P3N A0
MC: ACI TRIMESTRAL 
UPCCU: JUNHO DE 2025

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA 
FEZ USO DE DIU, POREM APRESENTOU QUADRO DE SUA 

CONDUTA: ORIENTACOES
EXAMES LAB 
USG TV 
USG DE MAMAS 
----------------------
31/03/2026
PREVENTIVO 23/03/26: NEG PARA NEOPLASIA  + INFLAMACAO BACTERIANA 
USG TV 18/03/26: UTERO 110, END 3 MM OD 9,1 OE 9,3 EXAME NORMAL
EXAMES LAB 
16/03/26: Exames laboratoriais do dia 16/03/2026 irmão hemoglobina de 13,3 hematócrito de 39 leu com 9270 plaqueta 243000 exame de urina leucócitos 2 cruzes 19 pior sitos por campo tsh 2,56 LH 4,43 Vitamina B12 404 fsh 3,02 vitamina D 37,7 creatinina zero ponto 60 ferro 101 glicose 107 tgo 22 tgp 9 UREIA  39

CONDUTA: ORIENTACOES
CIPROFLOXACINA
CREVAGIN', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61656968, '890', 'FABIANA MOREIRA DE SOUZA SILVA', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59133455, '383', 'fabiana olivera mendes botelho', 2, 0, '05038914284', NULL, NULL, '1979-07-07', 3, 'Apresenta preventivo 02/08/23 negativo para neoplasia, paciente sem queixas.
Conduta: mmg, quelatus mulher, rotina anual.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60609070, '687', 'Fabiane  Neves de Oliveira', 2, 0, '05038914284', NULL, '(97) 8408-0379', '1999-11-19', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61218423, '797', 'Fabiane Basílio', 2, 0, '77854977291', NULL, '(69) 8461-4906', '1985-09-25', 1, 'idade 41 anos 
SEM PLANO DE SAUDE 
G 3 P3C A0
GESTRINONA  ( 3 TROCAS - 1 ANO- 1 ANO- 6 MESES) INABISORVIVEL  
DUM: 2 ANOS 
EXERCCICO REGULARMENTE
SONO PRESERVADO
INTESTINO REGULAR
UPCCU: + 2 ANOS 
USG TV 2 ANOS 
USG DE MAMAS E MMG 6 MESES  ( PARA TROCA DE PROTESE MAMARIA ) BI RADS 2 
MINOXIDIL VIA ORAL - ALTERANDO TGO

QP: PACIENTE ALEGA INSERCAO DE IMPLANTES (TEST 100MG, NADH 200 MG, GESTRINONA, EM 09/12/2025), FAZ USO DE SISTEN 50 MG COM TROCA SEMANAL 
ME
REFERE DIMINUICAO DA LIBIDO, POREM REFERE QUE CONSEGUE CHEGAR NO ORGASMO, ALEGA DIMINUIÇÃO DA LUBRIFICAÇÃO APOS USO DE GESTRINONA  

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60729735, '703', 'Fabielly Forcelini', 2, 0, '96418311272', NULL, '(97) 8406-6204', '1992-09-06', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61941144, '952', 'Fabiely dos santos Nunes Guirelli', 2, 0, '02377767230', 'fabielynunes15@gmail.com', '(97) 98411-0559', '2001-07-05', 1, 'Paciente Ganhou uma Hidratação Íntima + a Consulta.
Dada e Pedido pela Dra. 
Paciente irá realizar USG de Mamas e USG Transvaginal 
E vai realizar  o Implanon quando Retornar da Viagem. 





---------------
12/08 sem energia - 
---------------
13/08

paciente retornar para realizar usg tv e usg de mamas, hidratação intima com foto 

ULTRASSONOGRAFIA MAMÁRIA.  

TÉCNICA:
Realizado estudo ecográfico das mamas com transdutor setorial multifrequencial (5,0 a 10,0 Mhz).
 
INDICAÇÃO: 
Rastreio. 
DESCRIÇÃO DO EXAME:
Pele e tecido adiposo subcutâneo com espessura e ecogenicidade normais.
Fáscia e planos musculares retromamários anatômicos.
Ductos lactíferos retroareolares de trajeto e calibre normais.
Parênquima mamário com ecotextura fibroglandular usual e adequada lipossubstituição.
Não se evidenciam formações nodulares sólidas ou císticas patológicas.
Prolongamentos axilares anatômicos.

 
ANÁLISE COMPARATIVA: 
AVALIAÇÃO:
Achados ecográficos negativos para malignidade.
BI-RADS® US 1.
 



Laudo padronizado conforme o método BI-RADS® 5ª edição do American College of Radiology (ACR) para imagem da mama.

OBSERVAÇÕES:
1. A ultrassonografia como método isolado não é indicada para rastreamento de neoplasia mamária. É necessária correlação com mamografia atual.
2. Através de normativa do Colégio Brasileiro de Radiologia, a ultrassonografia axilar não engloba avaliação mamária, sendo necessário seu pedido, para sua devida avaliação.
  







___________________________________
DRA CHRISTIANE ALVES CALIXTO 
CRM 3316/RO

conduta: 
1. orientações 
2. realizado usg de mamas e entregue laudo para paciente 
3. realizado hidratação intima com fot
4. entrego receitas e amostra grátis 
doss zinco - amostra e receita 
dozemast amostra e receita 
feminis amostra 2 caixas sem receita, usar somente as amostras
Genova receita 2 caixas 
secnidazol 2 comprimidos para o parceiro, paciente em amamentação 
gynotran 7 dias 
5. entrego amostra de basic 4u - caso paciente gostar vender no retorno
6. usg tv realizado observado mioma ou gravidez - solicito beta hcg 
7.  vai repetir dia 18 usg tv para avaliar melhor essa imagem 

---------------------------------

18/08/2026


NOME: Fabiely dos Santos Nunes Guirelli
25 anos 
Dum: 


DATA: 18/08/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em retoversoflexão, centralizado medindo 4,97 x 8,57 x 2,69 cm (volume: 59,58 cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.

Endométrio: centrado, ecogênico e com espessura de 8 mm de basal a basal.

Ovário direito: tópico, volume de 8,4 cm³, de forma habitual, contorno preservado e textura normal. Presença de folículo dominante no ovário direito.

Ovário esquerdo tópico: volume de 8,1 cm³, de forma habitual, contorno preservado e textura normal.

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Exame sem anormalidade detectável pelo método. 
Folículo dominante no ovário direito, compatível com fase periovulatória


OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.



___________________________________
DRA CHRISTIANE ALVES CALIXTO 
CRM 3316/RO

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59069049, '299', 'Fabiola Maria Mendes picanco', 2, 0, NULL, NULL, '(69) 9226-4782', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61532997, '867', 'Fatima Sezario da Silva', 2, 0, '90620504099', NULL, '(69) 9397-8600', '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59392657, '464', 'Fernanda Almeida', 2, 0, NULL, NULL, '(69) 99248-5003', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62205993, '999', 'Fernanda Amaro de Souza', 2, 0, '09183049975', 'fer.helena956@gmail.com', '(97) 98426-2544', '1997-05-04', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60063495, '590', 'Fernanda Ferreira Alves', 2, 0, NULL, NULL, '(69) 99287-4841', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60063500, '591', 'Fernanda Ferreira Alves', 2, 0, '01774853299', NULL, '(69) 99287-4841', '1998-08-24', 3, 'EXAMES DE SANGUE 
419,92 A VISTA E 461,00 CREDITO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59095598, '338', 'Fernanda Ferreira De Olivera Silva', 2, 0, '83670939253', NULL, NULL, '1886-04-21', 1, 'PACIENTE COM CRISE DE CANDIDIASE DE REPETICAO 
PACIENTE REFERE IRRITABILIDADDE, ANSIEDADE

AO EXAME: COLO CINDRICO, PRESENCA DE SECRECAO ESBRANQUICADA COM GRANDE QUANTIDADDE DE GRUMOS EM PAREDE
TRIVAGEL, FLUCONAZOL
VACNA 
-------------------------------------------------------------------------
15/04/2025
Vacina Candida: 480,00 reais 
Loção Calmate: 160,00 reais.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60024845, '567', 'Fernanda Gomes estevo', 2, 2, '01586839276', NULL, '(69) 9914-4137', '1992-08-26', 1, 'IDADE; 32 ANOS
DUM: 17/07/2025
G1 P1 A0
MC: ACO COM PAUSA
UPCCU: 2024
COMORBIDADES: NEGA
ALERGIA: NEGA

QP: FLACIDEZ VAGINAL, PUM VAGINAL
NEGA DISPAREUNIA
NEGA DISMENORREIA

CONDUTA: EXAMES LAB, PREVENTIVO, USG TV
1 SESAO DE LASER INTIMO E COLETA DE PREVENTIVO


09/08/2025

Exame do dia 7/08/2025 
hemoglobina 13,4 hematócrito 41,5 leu 4720 plaquetas 187000 ferro 100 ferritina 86 Vitamina B12 609 uréia 42 creatina 0,95 Vitamina D 60.7 
ácido úrico 4 tgo 14 tgp 12 gama GT 12 tsh 0,66 t 4 livre um ponto 39 sorologia não reagente anti h bs reagente Vitamina C 1,2 cortisol 19,6
insulina 15,2 abaixo de 7 
homocisteína 10,7 ( <8)
magnésio 1,9

2 º sesao de laser 
PACIENTE REALIZOU PEELING 400,00  , LASER PARA CLAREMANETO 400, REPOSIÇÃO DE VITAMINAS NO SORO 530', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61580010, '873', 'Fernanda Marques Cordeiro Fernandes', 2, 0, '01586680226', NULL, '(69) 99601-3586', '1992-05-19', 1, 'FERNANDA MARQUES CORDEIRO FERNANDES 
34 ANOS 
G2 P2N
MC: VASECTOMIA
MEDICACAO : NEGA
DUM: 10/06/2026
ALERGIA NEGA 
UPCCU: 2020

QP: PACIENTE REFER ESCAPE DE URINA DURANTE O TREINO, APRESENTANDO CONSTRANGIMENTO

COLO CENTRALIZADO, PRESENCA DE ECTOPIA 
FLACIDEZ EM CANAL VAGINAL 

CONDUTA: 
ORIENTACOES 
INDICO LASER INTIMO 3 /4 SESSÕES 
COLETADO PREVENTIVO MEIO LIQUIDO 
INICIAR EM AGOSTO 17/08 AS 17H 
--------------------------------------

PACIENTE VEM PARA PRIMEIRA SESSAO DE LASER

PREVENTIVO NEG PARA NEOPLASIA + INFLAMACAO BACTERIANA 

CONDUTA SOLICITO EXAMES LAB 
NOME: Fernanda Marques Cordeiro Fernandes

SOLICITO

HEMOGRAMA  
HIV I E II
VDRL
HBSAG
ANTI HCV
HERPES I E II 
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
ESTRADIOL
PROGESTERONA
FSH
LH


17/08/2026


CREME VAGINAL METRONIDAZOL GEL 

NOME: Fernanda Marques Cordeiro Fernandes


Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos via oral dose única para o casal.

Uso tópico
1.	Higi Calm ______________________01 tubo
 Higienizar 2 vezes ao dia, ou sempre que necessário.

Uso vaginal 

2.	Gynotran ___________________________01 caixa
Aplicar 01 óvulo via vaginal, à noite, por 7 dias. 


PROTOCOLO INDICADO: ATIVADOR METABOLICO E PERFORMACE ESPORTIVA 960,00 4 PROTOCOLOS - GANHA MIMO HIDRATACAO INTIMA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59619579, '530', 'Fernanda Marques Silva Lobato', 2, 0, '02655917243', NULL, '(69) 9368-9000', '1997-04-18', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61799252, '912', 'Fernanda Santana Lopes', 2, 0, '00128703237', NULL, '(69) 99277-1450', '1988-05-03', 3, 'Fernanda Cortesia primeira consulta
MC: IMPLANON - 02/12/25
PREVENTIVO: 20/08/2025 NEG PARA NEOPLASIA 

Idade 38 anos sim gesta 4 parto normal aborto um menarca aos 13 anos comorbidade nega medicação e uso nega cirurgias prévias nega queixa principal dor pélvica sinais vitais PA 122 por 73 mm por Mercúrio peso 74 kg exames laboratoriais decem entregue no momento da consulta exames realizados no dia 19/06/2026 ace do úrico 5,1 glicose 87 triglicerídeos 62 ureia 26 ******* 0,7 colesterol 160 cálcio 93 ferritina 150 hemoglobina glicada 5,3 tgo 31 tgp 19 ferro 67 vitamina B12 338 estradiol 64 FSH 5,1 LH 5,8 dosagem de insulina 9,7 34 livre 1,15 progesterona 0,09 prolactina 5,88 tsh 2,78 vitamina D 24,9 hemoglobina 12 hemato 36 leu 6470 plaqueta 279000
 conduta 
orientações 
solicita ultrassom transvaginal 
reposição de vitamina D E VIT B 12', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59136182, '385', 'Fernanda Viana', 2, 0, '05038914284', NULL, NULL, '1991-10-25', 3, 'Q..P: rotina ginecologica, paciente assitomatica.
Conduta: exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59133464, '384', 'Flavaine De Sousa Melo', 2, 0, '05038914284', NULL, NULL, '1984-05-20', 3, '24/09/22 ugtv imagem anecoico cav, end ale, peq, quantidade  liquido fundo de saco de douglas.
conduta: tropinal, cetoprofeno 1x1 dia.
------------------------------------------------------------------------------------------------------
retorno 24/10/22
usgtv 10/10/22 normal
urocultura, não houve cresc bact.
alega cafaleia, enxaqueca, antes da menstruação, disuria.
conduta: miconazol, maxalt.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60872068, '723', 'FRANCIELE DA SILVA DOS SANTOS', 2, 0, '00340798238', NULL, '(69) 99386-2392', '1990-01-23', 1, 'idade: 35 anos 
G3 P3C A 
MC: LT
DUM; JULHO DE 2024
UPCCU: 31/10/2025; ASC - US 
VACINA HPV: 1 DOSE EM DEZEMBRO DE 2025 

PACIENTE ENCAMINHADA PARA CAF 
APRESENTA PCCU: 31  / 10 COM ALTERACAO ASC-US, REALIZADO BIOPSIA 20/11: NIC 1 ( 4 FRAGMENTOS 0,8X 0,2 CM  ( AUSENCAI DE CRITERIO MORFOLOGICO PARA LESAO DE ALTO GRAU)
PACIENTE NEGA SECRECAO VAGINAL, ALEGA DESCONFORTO DURANTE O ATO SEXUAL, REFERE QUE FAZIA USO DE ACI TRIMESTRAL E PAROU EM MAIO DE 2025, REFERE ESCAPE EM AGOSTO DE 2025 
USG DE TIREOIDE 26/11/25: CISTO COLOIDE A DIREITA 
USG DE MAMAS 26/11: BI RADS 3 NODULO AS 3 H EM MAMA ESQUERDA 
USG TV 26/11/2025: UTERO RETROVERTIDO 82 CM, ENDOMETRIO 3 MM, PRESENCA DE MIOMA INTRAMURAL 1 X 0,6 C 0,8 CM , OD 5,9 OE 5,5, OVARIO DIREITO COM ASPECTO POLICISTICO
ao exame: colo anterior, puntiforme, presença de região acetobranaca em labio posterior, onde foi realizado caf
conduta: 
realizado caf ( fotos em anexo)
retorno com 30 dias 
propendi, dipirona, zirvit plus 
e mama
ORIENTAÇÕES PÓS-CAF
Após a realização do procedimento de CAF (Cirurgia de Alta Frequência), é importante seguir corretamente as orientações abaixo para garantir uma boa cicatrização e evitar complicações:
🔹 Repouso e cuidados gerais
•	Repouso relativo no dia do procedimento
•	Evitar esforços físicos intensos por 7 a 10 dias
•	Manter higiene íntima apenas com água e sabonete neutro
•	Não utilizar duchas vaginais
🔹 Sangramento e corrimento
•	É normal apresentar pequeno sangramento ou corrimento escuro/acastanhado por até 20 dias
•	Pode ocorrer eliminação de um material escuro (restos de coagulação), o que é esperado
•	Caso o sangramento seja intenso, com necessidade de trocar absorvente a cada hora, procure atendimento médico
🔹 Restrições
•	❌ Não ter relações sexuais por 30 dias
•	❌ Não usar absorvente interno, coletor menstrual ou tampão
•	❌ Não realizar banho de imersão (banheira, piscina ou mar) por 30 dias
🚨 Procurar atendimento médico se apresentar:
•	Sangramento intenso ou persistente
•	Febre acima de 38 °C
•	Dor pélvica forte
•	Corrimento com odor forte ou aspecto purulento
-------------------- // ---------------

MC: LT
DUM; JULHO DE 2024
UPCCU: 31/10/2025; ASC - US 
VACINA HPV: 1 DOSE EM DEZEMBRO DE 2025 

PACIENTE REFERE QUE FEZ USO DE ACI TRIMESTRAL, E DESDE ENTAO ENTROU EM AMENORREIA 
NO MOMENTO SE QUEIXAS 

AO EXAME
COLO CENTRALIZADO, EM FASE DE CICATRIZACAO DA CALTERIZACAO

CONDUTA: 
ORIENTACOES
COLPOSCOPIA COM COLETA DE PREVENTIVO EM MEIO LIQUIDO EM ABRIL 
-------------------------------------------------------------------------------
02/07/2026
DUM: 18/06/2026
MC: ACI TRIMESTRAL - 26/06/2026 ( DEVIDO SANGRMANTO VAGINAL INTENSO NO DIA 18/06) 

PACIENTE VEM PARA COLPOSCOPIA E REALIZACAO DE PREVENTIVO EM MEIO LIQUIDO, PACIENTE REFERE SANGRAMENTO VAGINAL IN TENSO NO MES DE JUNHO OPATANDO POR ACI TRIMESTRAL, ALEGA TAMBEM ODOR FORTE NA MENSTRUAÇÃO.  
USG DE MAMAS 25/06/2026
BI RADS 2 - NAO ENCONTRADO NODULO EM MAMA ESQUERDA
conduta:
realizado protocolo capilar, e unha 

_________________________________________________
04/08/2026

3 DOSE DE VACINA HPV
RESULTADO DE PREVENTIVO: NEGATIVO PARA NEOPLASIA 
MC; ACI TRIMESTRAL

QP: PACIENTE ACOMPANHADA DO ESPOSO, REFERE MELHORA NA QUADA CA[PILAR, SERECAO VAGINAL, NAO TEM MAIS ODOR 

AO EXAME:
COLO ANTERIO, PUNTIFORME, DISCRETA SECRECAO ESBRANQUICADA, SEM ODOR 
REALIZADO PROTOCOLO CABELO E UNHA COM DIFICIL ACESSO VENOSO, 

CONDUTA: 
ORIENATCOES 
HIRUDOIDE OU REPARAIL 
SOLICITO EXAMES LAB
REALIZACAO DE 2º DOSE DE PROTOCOLO

-----------------------------------------------
20/08 programação do acompanhamento clinico

NOME: FRANCIELE DA SILVA DOS SANTOS 

Protocolo antioxidante

Benefícios: antioxidante “dexintoxicar”, aumento da  energia e disposição,  melhora do metabolismo, função muscular e nervosa. Participação na formação de colágeno. 

Administração: IM

4 doses com intervalo de 1 semana entre as doses.

valor 960,00 á vista 

avaliar exames lab e observar melhora da imunidade com suplementação injetais 

-----------------------------------------------------
Dum :28/8/2026 durão de 15 dias com dismenorreia, em uso de ACI TRIMESTRAL 
AO EXAMES: COLO CENTRALIZADO, SECRECAO FLUIDA COM ODOR 

CONDUTA: 
TERICIN 10 DIAS 
SECNIDAZOL 
VITAMINA D 14 000UI POR SEMANA 
PROTOCOLO DE ANTIOXIDACAO 


 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59119886, '354', 'Francileide Correia De Lima', 2, 0, '67639640210', NULL, NULL, '1977-02-05', 3, '48 ANOS
DUM: 2019
G5 P4N 1 C
LT
TABAGISTA
COMORBIDADES: NEGA
UPCCU: + 3 ANOS 

QP: PACIENTE REFERE DOR EM BAIXO VENTRE, NEGA DISPAREUNIA, ALEGA CANSACO NAS PERNAS 
AO EXAME COLO ANTERIOR, SECRECAO AMARELADA, COM ODOR 
SOLICTO USG TV, COLETADO PREVENTIVO 
SECNIDAZOL E GYNOTRAN

conduta: preventivo 24/03: negativo para neoplasia 
exames glicose 03/04: glicose 126/ trig 205/  hbglicosilada 6,87/ top 53/ vit b12 514 / vit d 31

conduta: orientações, retorno com 6 meses ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60587546, '667', 'Francimeire de Sousa Araújo', 2, 2, '53087070220', NULL, NULL, '1980-08-20', 1, '45 anos
G 1P1N
DUM: 31/10/2025
MC: PRESERVATIVO
UPCCU: JULHO
ANA LUCIA ROCHA - GINECO
PACIENTE REFERE QUE EM 27/07 ESTA SENTIDO DOR EM REGIAO RETAL, DEVIDO ENFRAQUECIMENTO DA PELVE, ATRAVES DA DEFECORESSONANCIA 
PACIENTE REFERE PERDA DE URINA AOS PEQUENOS ESFORCOS , FLACIDEZ CANAL VAGINAL, ALEGA PUM VAGINAL, 
conduta: 1 sessao laser 
ginobiottafluconazol
mimo hidratação intima
próxima sessao cobrar 1500,00 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61656984, '893', 'FRANCISCA ATRIZ TEIXEIRA DA SILVA', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, 'Idade 39 anos 
RELACIONAMENTO COM MULHER
data da última menstruação 10/06/2026 
método contraceptivo não utiliza 
gesta zero 
menarca 12 anos 
Comorbidades nega 
medicação em uso nega 
cirurgias prévias nega 
último preventivo em maio de 2026 última 
mamografia não 
ealizada atividade física não realiza 

queixa principal paciente vem ao consultório devido às queixas do climatério apresenta exames :
laboratoriais no dia 10/03/2026 estradiol 15 fsh 96 LH 7 progesterona zero ponto 32 prolactina 11 ácido úrico 49 glicose 86 triglicerídeos 130 ureia 28 creatinina 0,7 colesterol total 161 hemoglobina glicada 5.6 tgo 20 tgp 18 vitamina B12 480 t 4 livre 1,17 tsh 4,69 hemoglobina 12,7 hematócrito 37,5 leucócito 5330 plaqueta 306 vitamina D 28,20
Preventivo: 20/03/2026: negativo para neoplasia 
EAS NÃO INFECCIOSO 

PESO 74,600G
PA 102 X 74 MMHG

CONDUTA: 
ORIENTACOES REPOSICAO DE VITAMINAS B 12, D E VITERGAN MASTER, POR 3 MESES E REPETIR EXAMES LAB 

NOME: FRANCISCA ATRIZ TEIXEIRA DA SILVA

Uso oral
1.	ALTA D 50.000UI  ____________________01 caixa
Tomar 01 comprimido via oral por SEMANA, durante 30 dias. 
2.	ALTA D 7000 UI ____________________02 Caixas
Tomar 01 comprimido via oral por SEMANA

Uso sublingual

3.	Dozemast 1000mcg ____________________03 caixas
Colocar 01 cp SL 1 vez ao dia, por 3 meses 




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61341790, '813', 'FRANCISCA DAS CHAGAS FERREIRA LIBERATO', 2, 0, '66315875220', NULL, '(69) 99219-8194', '1970-05-10', 3, '55 anos 
menopausa 50 anos  em uso de tibolona 
comorbidades: tireodeopatia, depressão, 

paciente em acompanhamento com. endocrinologista devido nódulo tireoideano, vem para apresentar preventivo 06/03/2026: negativo para neoplasia 
paciente refere que as vezes apresenta fogacho, deseja trocar tibolona 

conduta:
orientações
solicito exames lab 

----------------------------
Exames laboratoriais do dia 25/6/ 2026
 tsh 4,7 
T4 livre 1,45
ferro 153 
triglicerídeos 148 
colesterol 227 
glicemia 92 
hemoglobina 12
 hematocto 48 
leu 7210 
plaqueta 263000 
vitamina D 29,4 
estradiol 20,5 
ferritina 112 
FSH 66 
LH 35 
progesterona 0,39 

CONDUTA: ORIENTACOES 
REPOSICCAO DE VIT D E B12 

NOME: FRANCISCA DAS CHAGAS FERREIRA LIBERATO

Uso oral
1.	VITERGAN master N  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, após café da manhã.
2.	Alta d 50 000 ui ________________________01 Caixa 
Tomar 01 comprimido via oral 1 vez por semana. 
3.	Coenzima Q 10 200 mg ( vitafor) ____________01 caixa 
Tomar 01 comprimido via oral 1 vez ao dia.
4.	Omega 3  (EPA) - 990mg e (DHA) - 660mg ( vitafor)__30 cp 
Tomar 01 comprimido via oral 1 vez ao dia, almoço.
          5.NATIFA _________________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, sem pausa
          6.   Dozemast 1000 mcg _____________________01 caixa
01 comprimido Sl 1 vez ao dia, após almoço 

conduta: retorno com 1 mes 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60198709, '606', 'Francisca Dilaiza Pereira Costa', 2, 0, '05045198246', NULL, '(69) 99369-4133', '2005-10-16', 3, 'IDADE: 20 ANOS
DUM: 18/08/2025
G0 P0
MC: ACO
UPCCU: JANEIRO DE 2025- NAO APRESENTOU

QP: 
EXAME DE JANEIRO DE 2025: VITAMINA 12 BAIXA, SNR, 
USG TV 29/01 UTERO: 51,5, END CO PRESENCA DE POLIPO, OD 4,7 OE 3 
PACIENTE REFERE DOR EM BAIXO VENTRE,ALEGA DIMINUICAO DA LIBIDO, DISPAREUNIA , ALEGA TAMBEM CANDIDIASE DE REPETICAO, CONVERSO SOBRE POSSIBILIDADDE DE TROCA DE METODO CONTRACEPTIVO 

CONDUTA: HISTEROSCOPIA 
EXAMES LAB 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59320916, '446', 'Francisca Erika Girão do Nascimento.', 2, 2, '02163460290', NULL, NULL, '1993-10-03', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61335743, '810', 'FRANCISCA JACILENE OLIVERIA', 2, 0, '64705382234', NULL, '(69) 99272-4158', '1975-10-17', 3, '
Exames laboratoriais do dia 30/01/2026 t 4 livre 1.1 tsh 2,9 ácido úrico 3 ponto 82 ferro sérico 46,6 cálcio 9.9 triglicerídeos 217 glicose 103 uréia 24 desde os 67 desde p 139 colesterol total 223 creatinina 0.5 hemoglobina 13,3 hematócrito 40,3 leu os 6500 plaqueta 282000 globina de cada 5.7 magnésio 2 potássio 4 vitamina B12 552 vitamina D26 conduta orientações reposição de vitamina D Vitamina B12 of of high e rosa

NOME: FRANCISCA JACILENE OLIVERIA

solicit
1.	ALTA D 50.000UI  ____________________01 caixa
Tomar 01 comprimido via oral por SEMANA, durante 30 dias. 

2.	For fig  _________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses

3.	Rosuvastatina 20mg _______________01 caixa
Tomar 01 comprimido via oral

Uso sublingual 

1.	Dozemast 1000mcg _________________________01 caixa
01 comprimido SL 1 vez ao dia, por 30 dias 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61773335, '910', 'Francisca Lima Santiago Cruz', 2, 0, '01740996224', NULL, '(92) 9969-1190', '1992-02-01', 1, 'Paciente: Francisca Lima Santiago Cruz.   Idade: 34 Anos
PCCU: 25
Dum: 02/04/2026
ACO: Q Laira
Data 12/09 Solicito: Citologia Oncótica ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61949882, '936', 'Francisca Marcia Rodrigues de Oliveira', 2, 2, '59966904204', 'marcianeves0207@gmail.com', '(69) 99300-9414', '1975-07-02', 3, 'idade: 51 ANOS 
DUM: 09/08/26 - IRREGULAR
G 2 P2 A0
MC: LT
MENARCA 14 ANOS 
COMORBIDADES: NAO
PA 120 X 80 MMHG 

QP: PACIENTE VEM PARA MOSTRAR RESULTADO DE EXAMES, DEVIDO ESTEATOSE EHEPATICA E LITIASE RENAL 

Resumo de Exames
1. Ultrassonografia de Abdome Total — 17/07/2026
Achados:
Sinais de infiltração gordurosa hepática, correspondendo a esteatose hepática grau II.
Nefrolitíase não obstrutiva bilateral:
Rim direito: cálculo medindo aproximadamente 0,45 cm.
Rim esquerdo: cálculo medindo aproximadamente 0,43 cm.
2. Exames Laboratoriais — 21/07/2026
Hemograma
Hemoglobina: 12,1 g/dL
Hematócrito: 36,1%
Leucócitos: 6.600/mm³
Plaquetas: 301.000/mm³
Glicemia e metabolismo
Glicemia: 69 mg/dL
Hemoglobina glicada (HbA1c): 5,0%
Insulina: 7
Homocisteína: 8
Proteínas totais: 6,7 g/dL
Função tireoidiana
TSH: 2,32
T4 livre: 1,05
Vitaminas e nutrientes
Vitamina D: 19,4
Vitamina B12: 366
Ácido fólico: 9,39
Vitamina C: 5
Ferritina: 82
Ferro sérico: 136
Função renal e eletrólitos
Creatinina: 0,8
Ureia: 39
Sódio: 137
Potássio: 4,1
Cloro: 102
Cálcio: 8,8
Enzimas hepáticas e pancreáticas
TGO/AST: 5
TGP/ALT: 5
Gama-GT: 51
Fosfatase alcalina: 67
Amilase: 46
Lipase: 37
Perfil lipídico
Colesterol total: 188
Triglicerídeos: 107
Exames urinários
Urocultura: não houve desenvolvimento.
Exame de urina: sem sinais de infecção.
Exames gastrointestinais
Sangue oculto nas fezes: negativo
Exame de fezes: negativo
Pesquisa relacionada à disbiose: presença de traços — descrição a confirmar.
Outros exames
PCR: reagente até 6 — valor/descrição a conferir no laudo original.
Teste genético para intolerância à glicose: resultado informado, porém sem descrição do genótipo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61857765, '933', 'Francisca Maria torres de Araújo', 2, 0, '22005919268', NULL, '(69) 99972-1464', '1958-04-22', 1, 'evolução realizada, mas nao foi registrada no sistema 
09/09consulta on line 
conduta: 
dozemast 
ciprofloxacina 
rosuvastatin ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61638908, '887', 'Francisca Marta Brito', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, 'MARTINHA 
Francisca marca 47 anos data da última menstruação há 15 dias foi adiantar método contraceptivo nenhum gesto a 3 parco 2 abortos zero comorbidades pressão alta medicação propranolol preventiva 2 anos queixa principal o paciente vem por conta de insônia conduta exames laboratoriais ultrassom transvaginal ultrassom de mamas', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60063552, '592', 'Francisca Sadla Xavier Damasceno', 2, 0, '63198959268', NULL, '(69) 99221-1981', '1978-12-16', 3, '05/08/2025
46 anos
DUM: JUNHO 
MC: PRESERVATIVO

QP: PACIENTE COM QUEIXAS DE CLIMATERIO
APRESENTA RESULTADO DE EXAMES 

Ultrassonografia transvaginal do dia 2/12/2024 útero de 82,7 endométrio de 6,6 mm ovário direito de 4,26 ovário esquerdo de 3,56 hipótese diagnóstica adenomiose ovários SEM ALTERCAOES

Ultrassonografia do dia 4/07/2025 útero 65,9 presenças de imagem no do lar em parede posterior intramural 1,5 centímetros ovário direito 6,4 vário esquerdo 4,6 hipótese diagnóstico nódulo uterino provável mioma ovário sem alterações 

mamografia do dia 23 de 11 de 2023 bi RADS   2

CONDUTA: isoflavona e amora


10/09/2025

DUM:25/08
PACIENTE REFERE QUE ESTA FAZENDO USO DE ISOFLAVONA E AMORA, ALEGA QUE ESTA COM SENSACAO DE INCHACO E ESTUFAMENTO ABDOMINAL 
CONDUTA: isoflavona e amora 2 CP AO DIA
Uso oral


1.	Vitergan cog ____________________________01 caixa
Tomar 2 comprimido via oral, 1 vez ao dia 

2.	CALDÊ ______________________________01 caixa
Mastigar 01 comprimido via oral 1 vez ao dia 




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62111564, '979', 'Francisco de Souza Lunguinho Junior', 1, 0, '35022388200', 'flunguinho73@gmail.com', '(69) 99941-6314', '1973-07-17', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60979296, '733', 'Gabriela Burton Matsuno de Almeida', 2, 1, '03027131230', NULL, '(69) 9389-3211', '1996-08-13', 1, 'Idade 29 anos 
gesta zero p zero a zero
 data da última menstruação amenorréia
último preventivo mais de 2 anos 
comorbidades nega 
alergia nega 
 método contraceptivo DIU de mirena 
sono preservado
exercícios físicos irregular 
nega a história de câncer de mama e ovário na família 
queixa principal paciente vem com desejo de retirar de o de Milena pois desejo engravidar vem para rotina ginecológica nega disúria nega dismenorreia nega nódulos mamários é refere discreta cólica menstrual alega secura vaginal alega flato vaginal durante a relação sexual

AO EXAME
HIPERTROFIA DO PEQUENOS LABIOS 
COLO POSTERIOR, PUNTIFORME, PRESENCA DE SECRECA ESVERDEADA, FLUIDA, COM ODOR, PRESENCA DE ECTOPIA
NAO VISUALIZO FIO DO DIU

CONDUTA: 
ORIENTACOES
RETIRADA DE DIU DE MIRENA, PACIENTE VISUALIZA O DISPOSITIVO
GYNOTRAN , SECNIDAZOL
LASER INTIMO
LAB
USG TV, USG DE MAMAS
REALIZO ORCAMENTO PARA NINFOPLASTIA 
---------------------// --------------------
26/01/2026
1 sessao de laser intimo
nao usou belamy, pois estava em uso de gynotran 

----------- /// -------------------

Exames laboratoriais do dia 7/03/2026 hemoglobina 14,8 hematócrito 40,7 leuco 7450 plaquetas 360000 Puré 41 creatinina 0,8 desde o 19 tgp 11 ferro sérico 89 vicosa 87 hemoglobina glicada 5,6 colesterol 155 triglicerídeos 60 magnésio 2 Gamma GT 15 ácido úrico 5 PCR não reagente ferritina 167 insulina cede do cortisol 12 tsh 1,6 t 4 livre 1,53 urina não infeccioso urocultura negativa omo cisteína 15,3 Vitamina A 0,69 Vitamina C 0,7 Vitamina D 36,3 Vitamina B12 307 67 vitamina E 8 ponto 48 zinco 93 cobre 95,4 pesquisa de disbiose na urina positivo selênio 85,1

Ultrassonografia de mamas e axilares do dia 22/01/2026 bi rads 2 ( nódulo 7 h na mama direita 0,6 cm )
ultrassonografia transvaginal útero ante verso fletido volume de 60 cm³ endométrio 3,3 mm ovário direito 4,1 ovário esquerdo 6,7 exame dentro do padrão da normalidade
preventivo 26/01: negativo para neoplasia 

conduta: 
2 sessao de laser intimo
reposição de vit b12, d e protocolo para disbiose (870,00) 
indico vacina para candidiase

explico que a  disbiose intestinal acontece quando as bactérias boas do intestino ficam em desequilíbrio com as bactérias ruins. Quando isso ocorre, o intestino não funciona bem e podem aparecer sintomas como inchaço abdominal, gases, prisão de ventre ou diarreia, cansaço, baixa imunidade e até alterações na pele ou no humor.
Esse desequilíbrio pode acontecer por alimentação rica em alimentos ultraprocessados, uso frequente de antibióticos, estresse ou pouca ingestão de fibras. 
Disbiose é quando há um desequilíbrio das bactérias do intestino, prejudicando a digestão, a imunidade e o funcionamento do organismo.

vem fazer depois:
vitamina d +k3mk7 + vacina (490, 00 + 240) =730,00 a vista
-------------------
15/04/26
laser 
conduta: belamy

NOME: Gabriela Burton Matsuno de Almeida

Uso oral

1.	Zelix 150 mg __________________02 comprimidos 
Tomar 01 comprimido via oral e repetir com 7 dias.

Uso vaginal 

1.	Unyca  ______________________01 ampola 
Aplicar 01 via vaginal, dose única.


Uso tópico

2.	Higi calm ______________________01 tubo
Higienizar 2 vezes ao dia, ou sempre que necessário.

indico vacina para candida

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58960850, '108', 'Gabriela Mendes Silva Pinheiro', 2, 2, '05038914284', NULL, NULL, '1996-12-16', 3, '11 semanas e 2 dias.
Conduta: 120x70 mg.
Orientações: vacina covid einflueza regeneses.
31/01/2023 21 semanas e 3 dias.
bcf:156 bpm, mf+, du o.
Em tto, p/ iiu cefalexina 10 dias.
Conduta: usg morfologica 2 trimestre e totg regenis.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58946548, '102', 'Gabriela Souza Braga', 2, 1, '04355098290', NULL, NULL, '2000-07-22', 3, 'Paciente parou contraceptivo e deseja menstruar.
Não deseja engravidar.
Conduta: ciclo 21.
26/10/2023
Paciente apresenta usg obstetrica 25/09 6 sem e 6 dias, com deslocamento ovular, ig: 11 sem e 2 dias, no momento não faz uso da medicação,não estar trabalhando.
Conduta: utrogestan, din fol, alta D 200 ui, omega 3, exames lab.
14/11/23 ig 14 sem e 2 dias
usg morfologica 13/11/23 14 sem e 1 dia.
Conduta: feminis


-----------------

27/01
parto normal 02/05/24
DUM: AMENORREIA 
PACIENTE REFERE DOR NO CANAL VAGINAL 

CONDUTA: 
PROGRAMAR COLETA DE PREVENTIVO
SOLICITO EXAMES LAB
USG TV 
tericin, fluconazole, secnidazol ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59191709, '422', 'Geani Rebouças Gomes', 2, 0, '69384363200', NULL, '(69) 99251-1671', '1981-12-11', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58945955, '96', 'Gecilene Tavares Da S Sousa', 2, 2, '42046165268', NULL, NULL, '1975-02-21', 3, '2055: DEU entrada no sus PARA REALIZAR perineo, dor me mmii porém fez acompanhamento com o vascular e doppler e estar normal.
Conduta: usgtv, exames lab, programar preventivo.

---------------
27/01
idade 50 anos 
DUM: 27/12
G 6 P5 A1 
LT
PREVENTIVO. 15/12/2025: NEG PAR NEOPLASIA

QP: PACIENTE AGUARDANDO CIRURGIA DE PERINEO NO SUS, VEM PARA REALIZAR VIDEOCOLOSCOPIO, POIS EM MAIO DE 2024 REALIZOU CALTERIZACAO DO COLO UTERO 

CONDUTA:
 ORIENTACOES  GERAIS 
AGENDAR VIDEOCOLPOSCOPIO 
APOS CIRURGIA RETORNAR PARA SOLICITAR EXAMES HORMONAIS

--------------------
06/02/26
DUM: 29/01/2026 

PACIENTE VEM PARA COLETA DE PREVENTIVO E AVALIACAO DO COLO

AO EXAME
COLO ATROFICO, PRESENCA DE CISTO DE NABOTH AS 4 E 11 HORAS, SANGRATE A COLETA, COM ODOR E PRESENCA DE HIPEREMIA

CONDUTA: 
ORIENTACOES
COLETADO PREVENTIVO CONVENCIONAL COM VIDEOCOLPOSCOPIO
SECNIDAZOL, TRIPLO A  E TRIVAGEL 

-------- /// -----
05/03
PREVENTIVO 09/02/2026 NEG PARA NEOPLASIA 
USG DE MAMAS: 07/02: BI RADS 1 MAMA E E BI RADS 3 EM MAMA DIREITA  ( CISTO MAMARIOS  AS 12H 0,6 X 0,4 X 0,75  - NÓDULO AS 8 H  0,86 X 0,86 X 0,57 CM ) 

CONDUTA: 
ORIENTACOES
E MMAMA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60011031, '562', 'Genes Mejias', 2, 2, '28986482215', NULL, '(69) 9912-1313', '1968-09-19', 1, 'IDADE: 56 ANOS
DUM: 50 ANOS 
G 3 P 2 A1
COMORBIDADES: NEGA
MEDICACAO: NEGA 
UPCCU: + 2 ANOS 

QP: PACIENTE REFERE IUE, AO PEQUENOS ESFORCO, ALEGA RESSECAMENTO VAGINAL, FLACIDEZ  VAGINAL, 

CONDUTA: SOLICITO EXAMES LAB, FLUCONAZOL, CREVAGINA, TROK, BEPANTOL DERMA , USG TV, UGS DE MAMAS, MMG, DENSITOMETRIA OSSEA
REALIZAO COLET DE PREVENTIVO
REALIZO SESSAO DE LASER
PROXIMA SESSAO EM SETEMBRO
PACIENTE PAGOU 1500,00 LASER INTIMO E 180,00 PREVENTIVO DINHEIRO

16/10/2025


PACIENTE ACOMPANHADA DO ESPOSO, VEM PARA MOSTRAR RESULTADOMDE EXAMES 
ALEGA DOR EM FOSSA ILIACA DIREITA 

SOLICITO RESSONÂNCIA MAGNÉTICA DA PELVE, DEVIDO CISTO COMPLEXO EM OVÁRIO DIREITO APRESENTADO NO USG TV 
SOLICITO MARCADORES TUMORAIS 
paciente refere que após a sessao de laser apresentou sintomas de covid, e durante esse período observou melhora do quadro clinico, 

Exames laboratoriais do dia 6 setembro de 2025 Vitamina C zero ponto 35 estradiol 35,9 progesterona zero ponto 51 hemoglobina 13.1 hematócrito 39.4 leuco 5600 plaqueta 287000 glicemia de jejum 212 ácido úrico 3,49 creatina zero ponto 68 ferro 119 gama GT 54 triglicerídeos 165 colesterol 140 magnésio um ponto 93 TGP 25 desde o 24 uréia 34 estradiol 35,9 progesterona zero ponto 51
Exames laboratoriais do dia 19/09/2025 ferritina 531 Vitamina B12 833 como cisteína 3,4 vitamina D41 glicose 189 sendo hemoglobina glicada 8,2% insulina 66 tsh 1,93 ter 4 livre 1,31 FCH 39,2 LH 19,8 Vitamina A 0.2 cortisol 8 ponto 48 exames de imagem eu sonância magnética da pelve do dia 2 de outubro de 2025 formação multi cística heterogêneo, com componentes sólidos em seu interior com componentes hemático barra hiper proteico em um dos desses cistos medindo 8,9 x 15 x 7,3 cm, localizada na região anexial direita com aspecto indeterminado, porém suspeito( o- rads 3)

Ultrassonografia transvaginal do dia 6/09/2025 útero 45,4 endométrio 6 mm ovário direito 241,8 cm³ nota se componente sólido parietal projetando no interior ao mapeamento do doppler colorido apresentou captação do fluxo vascular ovário esquerdo normal impressão diagnóstica especialmente endometrial de teologia a esclarecer se isso complexo em ovário direito

USG DE MAMAS E AXILARES DO DIA 06/09/2025: BI RADS 2 CISTO SIMPLES BILATERAIS 

PREVENTIVO 30/07: Negativo para lesão intra-epitelial e malignidade
CONDUTA: ENCAMINHO PARA CIRUGIA DE OOFORECTOMIA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59259584, '442', 'Geórgia Rodrigues do Nascimento Trajano', 2, 2, '90353633291', NULL, '(69) 9947-0339', '1986-07-12', 1, '03/06/25: bacterioscopia e cultura de secreção vaginal 

alergia a clorexidina, cipro, levofloxacin 
DUM: O6/04/2026
MC: 
ENDOMETRIOSE, EM 2019 VIDEOLAPAROSCOPPIA PARA RETIRADA DE FOCO, POREM DESDE ENTAO FICA COM DOR NO LOCAL QUE IRRADIA PARA OS MMII
G 0 P0 
UPCCU: JAN 2025
QP: ROTINA, ASSINTOMÁTICA 



-------------------------

19/05/2026
preventivo 15/04: Negativo para Lesão Intraepitelial e Malignidade
exames lab 
Exames laboratoriais no dia 16/05/2026 
tsh 0.4 
PCR não reagente 
t 4 livre 1,14 
SHBG 107 
vitamina D 51 
zinco 86 
cobre 102 
ácido fólico 6,3 
homo cisteína 8,6 
b 12 547 
anti tpo 0,10 
ácido úrico 3,8  
creatinina 0.5 
 cálcio 4,51 
ferritina 308 
ferro 84 
magnésio 1,8 
hemoglobina 11,7 
hematócrito 34,3
 leu 4320 
plaqueta 310000 
beta hcg não reagente

usg TV COM PREPARO INTSTINAL 
FOLICULO DOMINANTE E E DIREITO
Tuba uterina direita espessada achar que no específico que pode estar relacionado ao processo inflamatório de etiologia infecciosa ou secundária endometriose intrínseca várias espécies que A esquerda o achado descrito na região Retro cervical segmento proximal do ligamento útero sacro e reto sigmóide são compatíveis com endometriose profunda sub peritoneal sugere controle anual de ultrassom transvaginal com preparo intestinal

CONDUTA: SOLICITO USG TV RESERVA OVARIANA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58963926, '119', 'Geovana Lins Martinez', 2, 0, NULL, NULL, '(69) 9383-3050', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61932730, '949', 'GEOVANA VITORYA TORRES DE MATOS', 2, 1, '05661011229', '2giovana20@gmail.com', '(69) 99391-5280', '2009-12-04', 3, 'IDADE: 16 ANOS 
DUM: 2807/2026
MENARCA: 10 ANOS 
SEXARCA: NEGA 
COMORBIDADES/ MEDICACAO EM USO: NEGA 
ALERGIA A MEDICACAO: NEGA 

QP: PACIENTE ACOMPANHADA PELA MAE, ALEGA METRORRAGIA
ACNE HISURTISMO 


APRESENTA:
USG PELVICA: 08/04/2026

UTERO AVF 52 CC, END 6 MM, OD 11 OE 10 = EXAME NORMAL 

EXAMES LAB 06/04/26
Exame laboratorial do dia 6/04/2026 glicose 87 triglicerídeos 150 ureia 21 creatinina 0,6 colesterol total 141 ferritina 49 hemoglobina glicada 5,3 tgo 29 tgp 63 ferro Sérico 33 Vitamina B12 510 TSH 3,25 t 4 livre 1,14 vitamina D32 hemoglobina 12,3 hematócto 36,5 leuco 8630 plaqueta 403 000

CONDUTA:
ORIENTACOES 
EXAMES LAB 
NUTRICIONISTA 
EXEXRCICIO FISICO
NOME:  Geovana Vitoria Torres de Mato

SOLICITO

HEMOGRAMA   
UREIA                                           
CREATININA                               
TGO                                                
TGP    
GAMA GT
FOSFATASE ALCALINA                                             
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE
ANTI TPO
EAS
UROCULTURA 


SUGIRO PROTOCOLO PARA SOP
ESPIROLACTONA PARA ACNE


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61479291, '848', 'GERLANE DA CONCEIÇÃO ARAUJO', 2, 0, '01074194241', NULL, '(69) 99228-6236', '1989-11-12', 3, 'idade 37 anos 
G6 P4 A2
LT
DUM: 19/04
UPCCU: ABRIL
QP: PACIENTE VEM DEVIDO NODULO NA REGIAO PELVICA
USG 28/04/26: NÓDULO NA REGIAO PELVICA ESQUERDA DE 10 X 6 MM DISTANDO DA PELE 7 MM

AO EXAME: 
PRESENCA DE NODULO PALAPVEL, DOLORIDO , QUE PREDOMINA, EM POSICAO ORTOSTATICA 
CONDUTA: EXERESE DE LESAO 
SEXTA DIA 08/05/26 AS 9HORAS 2987, 00  (EM 3 VEZES 995,60)', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60289775, '621', 'Gerli Nunes De Sousa Do Nascimento', 2, 0, '93248989220', NULL, '(69) 99293-7299', '1985-07-30', 3, 'IDADE: 40 ANOS 
UPCCU: 2 ANOS 
COMORBIDADES:"NEGA 
MC: PRESERVATIVO
DUM: 04/09/2025
PACIENTE REFERE SINTOMAS DO CLIMATERIO, EM AMAMENTACAO 
CONDUTA: SOLICITO EXAMES LAB - DOSAGEM HORMONAL ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60289760, '620', 'Gerliane Nunes De Souza', 2, 0, '00376677260', NULL, '(69) 99398-6819', '1988-09-03', 3, 'IDADE: 37 ANOS 
DUM: 29/07
MC: LT
UPCCU: SET 2024
COMORBIDADES: NEGA 

PACIENTE REFERE SUA INICIO NO MES DE JULHO, REFERE QUE ESTA FAZENDO USO DE TRANSAMIN, COMO MELHORA  ALEGA FLUXO DE POUCO  
USG TV 29/08/2025: VARIZES PÉLVICAS - UTERO 78,2/ END 13MM/ OD 5,1 /OE 5,5 

CONDUTA: EXAMES LAB, VIDEO COLPOSCOPIO, MANTEM O TRANSAMIM, 2 CP DE 8/8 H', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58946484, '99', 'Gessica Araujo Guimaraes', 2, 3, '05038914284', NULL, NULL, '1987-08-10', 3, 'Q,P: secreção vaginal amarelada com odor, iniciou +- 45 dias.
Conduta:encaminhamento para cim, gynotran e seenidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60606847, '682', 'GESSICLEIA SERVALHE', 2, 0, '00273652206', NULL, NULL, '1986-08-09', 3, '39 anos 
g3 p3
DUM: 21/10/2025
LT
UPCCU: 2024

QP: PACIENTE REFERE HISTORICO DE HPV, NO MOMENTO REFERE IRRITABILIDADE, NO MOMENTO NAO ESTA TENDO RELACAO SEXUAL 
SOLICITO USG TV, EXAMES LAB E PREVENTIVO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60198642, '605', 'Gigliane Vieira De Souza', 2, 2, '57864772234', NULL, '(69) 99921-6334', '1975-06-02', 3, 'IDADE 50 ANOS
PREVENTIVO 28/7/2025; NEGATIVO PARA NEOPLASIA + GARDNERELLA 

CONDUTA: ORIENTACOES
SECNIDAZOL E GYNOTRAN ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61528881, '866', 'Gilmara do Carmo Trindade', 2, 0, '91665013001', NULL, '(92) 8631-2014', '2000-12-15', 1, 'Gilmara do Carmo Trindade

IDADE 38 ANOS 
G 1 P1N
DUM: 26 /04/26
MCPRESERVATIVO - SEPARADA - SEM ATV SEXUAL 
UPCCU; 2023

PACIENTE REFERE NODLO EM ABDOME EM FOSSO ILIACA ESQUERDA HÁ MAIS OU MENOS 3- 4  MESES

AO EXAME
ABDOME PLANO, PRESENCA DE MASSA EM FOSSO ILIACA ESQUERDA, MOVEL, SEM DOR A PALPACAO PROFUNDA 
COLO SANGRANTE A COLETA, PRESENCA DE SECRECAO ESBRANQICADA GRUMOSA EM PAREDE COM INICIO DE SECRECAO AMARELDA
TV; SEM DOR A MOBILIZACAO DO COLO

CONDUTA: 
ORIENTACOES
COLETADO PREVENTIVO EM MEIO LIQUIDO
USG TV  E USG DE ABDOME TOTAL 
OBSERVAR O RESULTADO DE PREVENTI, POIS OBSERVEI SECRECAO NO COLO E COLO SANGRANTE

------------------------------------------
11/06
APRESENTA 
USG DE ABDOME TOTAL 22/05/26: ESTRUTURAS VIZIBILIZADA SEM ALTERACOES, NOTA -SE EXPRESSIVA MIOMATOSE UTERINA COM VOL 950 CM DOIS AIORES NODULO 10 E 9 CM, PROJETANDO NA FOSSA ILIACA ESQUERDA 

CONDUTA:
ORIENTACOES
CREVAGIN
SOLICITO RNM PELVICA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59136301, '387', 'Gilmara Souza De Sousa', 2, 1, '05038914284', NULL, NULL, '1972-11-02', 3, 'Q.P: fogacho, dor em baixo do ventre, dor muscular e nas articulações.
05/10/24
hb 13,9, plq 285,000, glicose 97, trig 92, ureia 22, creat 0,70, col 184, ferretina 332, tgo 39, tgp 71, vitb12 501, eas 10 piocitos, vtd 22,50, estradiol 37,00, tsh  87, lh 40, t4 livre 129, tsh 1,01, prog 0,44.
Conduta: usgtv, usg de abdome total, reposição de vit d, retorno.
---------------------------------------------------------------------------------------------------------------------------
18/11/24
usgtv 13/11/24
utero 52,9, end 1mm, mioma submucoso parede anterior 23x22 mm, od 6,9, oe 5,0 cm.
usg abdome total 13/11/24 
esteatose hepatica leve.
Conduta: retorno em jan, solicitar novos exames para possivel t.h.r, aguardo mmg, densit ossea, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58968076, '122', 'Gilvanete Torres de Barros Nunes', 2, 2, '43075223468', NULL, '(69) 9203-8305', '1965-11-17', 1, ' 17/02/25
IDADE: 59 ANOS 
DN: 17/11/65
DUM: 56 ANOS
G 2 P2C A0 
FAZ REPOSICAO HORMONAL - GESTRINONA, TESTOSTERONA, ESTRADIOL, 
UPCCU: 2024
UMMG  NUNCA REALIZOU
MASTOPEXIA 2022
APRESENTA RESULTADO DE EXAMES DO DIA 15/01/25
HB 13,9 / HT 40,2/ LEUCO 7410/ PLQ 302. 000 /TSH 2,29 / PROGESTERONA 0,15 / DHT INFERIOR 17 VITAMINA B 12 439 / ESTRADIOL 61,2 / FSH 0,75 / LH 00,7 / PROLACTINA 7,4 / VITAMINA D 44,8 /  TESTOSTERONA INFERIRO 2,5 , TGO 26,9 / TGP 27,89 / GLICEMIA 126 / COESTEROL 220 / TRIG 92 / 
AO EXAME: COLO CENTRALIZADO, PUNTIFORME, MUCO HIALINO

CONDUTA: SOLICITO  USG TV, USG DE MAMAS E AXILARES ( PROTESE MAMARIA) , COLETO PREVENTIVO. ORIENTACOES

EXAME DE MAMA PACIENTE TROUXE NA CLINICA E DRA VIU E RESPONDEU NO WHATS DA THALIA

----------------------------------------------
04/08/2026
idade: 61 anos 
DUM: 56 ANOS
G 2 P2C A0 
FAZ REPOSICAO HORMONAL - GESTRINONA, TESTOSTERONA, ESTRADIOL - implante 
upccu: 2025

QP; PACIENTE REFERE SECRECAO VAGINAL ESBRANQUICADA, SEM PRURIDO, SEM ODOR 
NEGA DISPAREUNIA, 
NEGA NODULO MAMARIO 

ao exame: colo centralizado, presença de secreção amarelada com grumos, sem odor

presença de hipertrofia de pequenos labio, prega acessória , e excesso de pele e flacidez em perineo posterior 


conduta: terincin at
enviar resultado de exames lab

ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: Gilvanete Torres de Barros Nunes
Procedimentos:
•	Labioplastia
•	Prega acessória 
•	Períneo posterior 
 
Prezada Gilvanete Torres de Barros Nunes
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia  e capuzplastia
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
Períneo posterior procedimento indicado para restaurar a anatomia e proporcionar melhor sustentação dos tecidos da região perineal
A associação com a correção de prega acessória e ninfoplastia permite um resultado mais completo, proporcionando melhora estética, maior conforto íntimo, aumento da autoestima e bem-estar funcional.
 
Valor dos Procedimentos:
R$ 18.688,00 parcelado em 6 vezes no cartão de crédito 
 





Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação do pós-operatório (uma no pré-operatório imediato e outra no dia posterior ao procedimento).
•	Este orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou início do parcelamento.


Atenciosamente,



Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60295245, '624', 'Giovana martines julkovski', 2, 0, NULL, NULL, '(97) 8415-6193', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61055725, '755', 'GIOVANIA SILVA LIMA', 2, 0, '06335181231', NULL, '(69) 99386-2378', '2004-06-17', 3, 'idade: 21 anos
DUM: 16/01/26 4 DIAS, FLUXO NORMA / NEG DISMENORREIA 
MC: ACI MENSAL
UPCCU: ----- 
COMORBIDADES: NEGA
MEDICACAO: NEGA 

QP: PACIENTE ACOMPANHADA DO ESPOSO, ALEGA QUE PAROU O MC DIA 26/01, POR CONTA PROPRIA DEEVISO MENORRAGIA, 

CONDUTA: 
ORIENTACOES
USG TV 
EXAMES LAB 
PACIENTE DESEJA INSERCAO DO DIU DE COBRE NO SUS 
AGUARDO RETORNO PARA AVALIACAO ( EXAMES LAB, USG TV, PREVENTIVO ) ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61075628, '766', 'GIOVANNA FERREIRA LIMA', 2, 0, '06513763274', NULL, '(69) 99316-2076', '2013-07-02', 3, '12 ANOS
MENARCA ------

PACIENTE ACOMPANHADA DA MAE ALEGA SECRECAO VAGINAL, SEM ODOR, SEM PRURIDO, ACOMPANHADA DE DISURIA 
AO EXAME
PRESENCA DE ESMAGMA EM PEQUENOS LABIO, PRESENCA DE HIPEREMIA NO INTROITO VAGINLA

CONDUTA;
ORIENTACOES
HIGIENIZACAO HITIMA
SABONETE GRANADO
FLOGO ROSA E TROK
APOS REALIZAR EXAMES DE EAS 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61342735, '818', 'GIOVANNA GANRILLI SILVA NASCIMENTO', 2, 0, '07772976208', NULL, '(69) 99260-7888', '2011-06-13', 3, 'idade 14 anos 
menarca: 9 anos 
DUM: 27/03/26

QP: PACIENTE ACOMPANHADA DO PAI, REFERE DISMENORREIA 

CONDUTA: ORIENTACOES
USG PELVICA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58946608, '104', 'Giovanna Silva', 2, 1, '05038914284', NULL, NULL, '2006-02-12', 3, 'Algia vaginal durante coito, disuria +- 3 semanas, nega secreção, nega odor.
Hipertrofia  dos pequenos labios.
Especular: colo centralizado, secreção esbranquiçada com odor, presença de lescio em periuretral.
Conduta: exames lab, ibuprofeno, secnidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60867491, '722', 'Girlane del Castilho Mendes', 2, 0, NULL, NULL, '(97) 8116-7559', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58943337, '93', 'Gisele Cunha De Araujo', 2, 2, '05038914284', NULL, '(69) 99289-0791', '1974-03-30', 3, 'Q.P: paciente refere disuria, alega dor em baixo do ventr, fazendo uso de cipofloxacina e piriduim.
Conduta: ciprofloxcina, piriduim, retorno para realizar urocultura.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61023603, '744', 'Gislane da silva lessa', 2, 0, '04703524260', NULL, '(97) 8448-2214', '1999-04-10', 1, 'RETORNO ONLINE ATENDIDO, DOUTORA PRESCREVEU A MEDICAÇÃO.
PACIENTE DESEJA ENGRAVIDAR', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58908377, '5', 'Glauce Souza de Abreu', 2, 3, '03083528744', NULL, '(69) 9239-3364', '1973-07-30', 1, 'DUM: 05/03/ 2024 
PACIENTE REFERE QUE NA PRIMEIRA SESSAO O PRCEIRO SENTIU MUITA DEFERENCA , ALEGA QUE MELHOROU A LUBRIFICACAO, MELHORA SIGNIFICATIVA NA PERDE DE URINA 
CONDUTA:
 2 º SESSAO DE LASER INTIMO
SOLICITO EXAMES LAB 
22/04/2025
3º sessao de laser intimo com melhora significativa da IUE, melhora da lubrificação e flacidez vaginal
apresenta resultado de exames do dia 17/04/25
ferritina 101 / vitamina b 12 483 / estradiol < 24 / progesterona 0,10/ FSH  > 150 / LH 75/ TSH 4,85 / T4 LIVRE 0,81 / VITAMINA D 56,3  / HB 14/ HT 43/ LEUCO 5870/ PLQ 243000 / COLESTEROL 132 / TRIG 119 / / GLICO 86 / FERRO 94/ TRIG 119 / 
CONDUTA: ESTRADIOL, PROGESTERONA, DOZEMAST , fisioterapia pelvica, retorno com 2 meses para avaliar adaptação da medicação e avaliar hormônios

31/07/2025
paciente refere que retornou de viagem e  ganhou  peso, esta fazendo uso das medicações, oestrogel e progesterona via oral 
solicito exames lab, entrego solicitação de fisioterapia pélvica 
mantenho medicação


20/08
PACIENTE AINDA NAO INICIOU FISIOTERAPIA PELVICA, 
ESTRADIOL < 10, PROGESTERONA 6,90
FSH 127/ LH 62
TSH 4,8/ T4 LIVRE 0,87
VIT D 38,9 / VIT B 12 883 

CONDUTA: 
ESTRADIOL 2 PUMPS
TESTO E MANIPULADO PARA LIBIDO
RETORNO EM 1 MES E AVALAIR 
CONVERSO SOBRE IMPLANTE CASO DOSE DE STRADIOL NAO ELEVAR 

29/12/2025
DUM: 05/03/ 2024 
preventivo: 2024
acompanhamento nutricional mensal
medicação em uso vitamina D 5 mil diário 
exames lab 04/11/2025
hb 13,2
ht 38,9
leuco 5960
plq 213 mil
estradiol 21 
progesterona 9,10 
vit B 12 613
vit D 36

conduta: orientações
manter estradiol 2 pump, progesterona 100 mg 
retornar em janeiro para coleta de preventivo ( teve relação sexual ontem)
solicitar exames de vit d ( em uso de 5 mil ui/ dia)
trazer resultado de MMG, USG de mamas
solicito USG TV 

07/01/2026
DUM: 05/03/ 2024 
preventivo: 2024
G2 P2 A0
MEDICACAO: TRH, REMERON 
AO EXAME:
COLO ANTERIOR, PRESENCA DE SECRECAO AMARELADA BOLHOSA EM DISCRETA QUANTIDADE EM FUNDO DE SACO, SEM ODOR 
AUSENCIA DE DOR A MOBILIZACAO DO COLO 

CONDUTA: COLETADO PREVENTIVO EM MEIO LIQUIDO, PACIENTE ENTREGA NA PORTO, TEM PLANO DE SAUDE 

_____________________
27/01/2026
UPCC:  07/01/26: Negativo para células neoplásicas;
MMG  ACR BI-RADS : 2
USG TV 22/01/2026; UTERO 32 PRESENCA DE MIOMAS SUBSEROSO OD 2 OE 2,4 

CONDUTA: MANTIDA 
REPETIR FUNCAO TIREOIDEANA 
RETORNO EM FEVEREIRO COM DENSITOMETRIA OSSEA 
Uso oral

1.	Pasalix PI 1000_________________________________01 caixa
Tomar 01 comprimido ás 20 horas 

Uso sublingual 
2.	Melatonina fast __________________________01 caixa
01 comprimido SL até total absorção, 1 vez ao dia, ás 20h 
ESTRADIOL 2 PUMPS
TESTO E MANIPULADO PARA LIBIDO


------------------
27/03

Paciente refere que há mais ou menos 3 dias apresentou um desanimo ( 1 episódio), porem no momento nega queixas,  
paciente fazendo pilates regularmente 
 
Exames laboratoriais do dia 16/02/2026
Tsh 4,9 t 4 livre 1,05 anti tpo 6,6
densitometria osse 31/01/2026: normal 

conduta:
retorno em junho 
repetir exames lab  vit b em Junho 
solicitar também usg de abdome total e rins e vias urinaria ( pai IRC) / usg TV 
manter oestrogel 2 pump e progesterona 100 mg a noite
dozemast, vit D3 5000 ui/ diaria 
prescrevo omega 3 e coenzima q 10, vitergan master N após cafe da manhÃ 
1.	VITERGAN master N  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, após café da manhã.
2.	Colaten Force ___________________________01 Caixa 
Tomar 01 comprimido via oral 1 vez ao dia.
3.	Coenzima Q 10 200 mg( vita for) ____________01 caixa 
Tomar 01 comprimido via oral 1 vez ao dia.
4.	Omega 3 vita for ácido eicosapentaenoico (EPA) - 990mg e ácido docosahexaenoico (DHA) - 660mg ( vitafor)
Tomar 01 comprimido via oral 1 vez ao dia, almoço.
-------------------- // -----------------------------------
30/03

paciente vem para o laser intimo , manutenção, sem queixas.

----------------------------------
07/08

Evolução – Consulta Ginecológica

Paciente comparece para consulta ginecológica de acompanhamento.

Exames apresentados:
-Citopatológico cervical (07/01/2026): Negativo para células neoplásicas.
-Mamografia: BI-RADS® 2.
-Ultrassonografia transvaginal (22/01/2026): Útero com volume de 32 cm³. Presença de miomas subserosos, medindo aproximadamente 2,0 cm à direita e 2,4 cm à esquerda.
-Densitometria óssea (31/01/2026): Exame dentro dos padrões de normalidade.

Procedimentos realizados:
-Realizada 3ª sessão de laser íntimo, com relato de melhora significativa da incontinência urinária de esforço (IUE), melhora da lubrificação e da flacidez vaginal.
Programada sessão de manutenção para 30/03/2026.

Medicações em uso:
-Colaten Force®: tomar 1 comprimido por via oral, 1 vez ao dia.
-Coenzima Q10 200 mg (Vitafor®): tomar 1 comprimido por via oral, 1 vez ao dia.
-Ômega-3 (Vitafor® – EPA 990 mg + DHA 660 mg): tomar 1 cápsula por via oral, 1 vez ao dia, durante o almoço.
-ESTRADIOL 2 PUMPS
TESTO transdérmico

Conduta:
- Solicitar ultrassonografia de abdome total.
- Solicitar ultrassonografia de rins e vias urinárias, considerando antecedente familiar de insuficiência renal crônica (pai com IRC).
- Solicitar exames laboratoriais, incluindo:
Apolipoproteína B (ApoB).
Proteína C-reativa ultrassensível (PCR-us).
USO ORAL

1.	BIFILAC SII__________________________01 caixa 
         Tomar 01 capsula 1 vez ao dia. 

2.	Radiant maturity ______________________01 caixa 
Tomar 01 dose pela manha e outra á noite conforme cartela 


Plano:
Manter medicações em uso, realizar os exames solicitados e retornar em consulta com os resultados para reavaliação e definição da conduta.

NOME: Glauce Souza de Abreu
Idade: 53 anos 
Data: 07/08/2026
HD: Z00.0 para check-up geral/ rastreio metabólico e cardiológico ( fator familiar)
SOLICITO
HEMOGRAMA /   FERRO   /    FERRITINA 
PCR                            
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
APOLIPOPROTEÍNA B (ApoB).
PROTEÍNA C-REATIVA ULTRASSENSÍVEL (PCR-us).
INSULINA                                         
GLICOSE /   HEMOGLOBINAGLICADA.            
LIPIDOGRAMA                                 
GAMAGT
ÁCIDO ÚRICO
PCR US
VITAMINA D3
VITAMINA B12
CORTISOL
ESTRADIOL
PROGESTERONA
TESTOSTERONA TOTAL E LIVRE 
FSH
LH
TSH /   ANTI TPO    / T4 LIVRE 
EAS 
---------------------------------

20/08/2026

programação de acompanhamento clinico
NOME: Glauce Souza de Abreu

Protocolo redução da gordura corporal 

Benefícios: auxilia no metabolismo energético, favorece a utilização de gordura e dar suporte antioxidante/ metabólico. 

Administração: IM 

2 doses com intervalo de 1 semana entre as doses. 

Protocolo ativador metabólico e melhora da performace esportiva 

Benefícios: aumenta disposição e energia para atividade física, apoia o metabolismo energético, melhora desempenho nos treinos , auxilia na recuperação e manutenção da massa muscular, além de ajudar na perda de gordura. 

Administração: IM 

2 doses com intervalo de 1 semana entre as doses. 


1. Resumo dos principais achados
Exame	Resultado	Avaliação geral
Hemoglobina glicada (HbA1c)	5,9%	Acima do ideal / faixa de pré-diabetes
Glicose	89 mg/dL	Normal
Glicose média estimada	123 mg/dL	Compatível com HbA1c de 5,9%
Insulina	33,5	Elevada, se em jejum
Colesterol total	259 mg/dL	Alto
LDL	189 mg/dL	Muito alto
HDL	34 mg/dL	Baixo
Triglicerídeos	176 mg/dL	Elevados
PCR-us	16	Elevada
TSH	4,8	Elevado/limítrofe
Anti-TPO	66	Elevado em muitos laboratórios
T4 livre	1,11	Normal
Vitamina D	36,8	Adequada
B12	699	Adequada
Ferritina	114	Sem alteração evidente
Ferro	80	Sem alteração evidente
Hemoglobina	13*	Sem anemia aparente
Hematócrito	38%	Dentro do esperado
Leucócitos	8.800	Normal
Plaquetas	320.000	Normal
Creatinina	1,0	Em geral normal
TGO/AST	23	Normal
TGP/ALT	28	Normal
Gama-GT	26	Normal
Ácido úrico	7	Limítrofe/elevado, dependendo do sexo e laboratório
Urina	Nitrito positivo + alterações de flora	Sugere infecção urinária, dependendo dos sintomas
Ultrassom	Esteatose hepática grau II	Alteração relevante
FSH	137	Muito elevado
LH	78	Elevado
Estradiol	48,9	Depende muito do contexto hormonal
Progesterona	15,47	Depende da fase hormonal
Testosterona	28	Depende das unidades/referência
Testosterona livre	46	Preciso das unidades e referência do laboratório
Cortisol	11,2	Depende do horário da coleta


conduta:
solicito urocultura 
protocolo para redução de gordura visceral 





', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58946592, '103', 'Gleciane Pereira De Souza', 2, 1, '05038914284', NULL, NULL, '1987-10-18', 3, 'Paciente refere que fazia uso por 3 meses gestodno mas parou por conta propria e inicou primolat, alegou melhora, porem alega nausea e acne.
Apresenta usg 25/10/22, utero 83,70, mioma parede posterior subeseroso 1,3, od 6,87, oe 4,69.
Conduta:tamisa sem parar, exames lab, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924514, '49', 'Gleice Cristina Melo Dos Santos', 2, 1, '05038914284', NULL, NULL, '1982-08-05', 3, 'DESEJA ENGRAVIDAR, ROTINA GINECOLOGICA, ALEGA SER CICLISTA, PACIENTE TEVE RELAÇÃO SEXUAL.
CONDUTA:EXAMES LAB, USGTV,
RETORNO:31/10/2023 PACIENTE REFERE CURETAGEM UTERIANA DIA 24/10/2023 DEVIDO AO ABORTO RETIDO, USGTV 23/10/2023, NÃO FEZ CONTRACEPTIVOS.
CONDUTA:ORIENTAÇÕES EXAMES LAB DE RASTREIO DE ABORTO REPETIÇÃO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61638909, '888', 'Gleice Cristina Melo dos Santos Moreira', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, '42 ANOS 
DUM: 23/05/2026
MC: ------
G8 P2 A6
UPCCU: 2024
COMORBIDADES: HIPERTENSA - NIFEDIPINO 

QP: PACIENTE COM DESEJO DE INSERCAO IMPLANON

CONDUTA: ORIENTACOES, EXAMES LAB, USG TV ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58982872, '146', 'Gleiciane Dos Santos', 2, 0, '03902537230', NULL, '(69) 99203-9529', '2002-11-03', 3, 'idade 22 anos
DUM: 08/02/25
MC: PRESERVATIVO
UPCCU: 2020
G1 PN A 0 ( 2 ANOS )
PROFISSAO ATENDENTE 
NUMERO DE PARCEIROS (4)

PACIENTE REFERE IRREGULARIDADE MENSTRUAL, DISMENORREIA, NEGA SECRECAO VAGINAL, 
COLO EM FENDA, PRESENCA DE SECRECAO AMARELADA COM ODOR
SOLICITO USG TV, CREVAGIN, SOLICITA LAB NA PROXIMA CONSULTA 
---------------------------------------------------------------------------------------------------
RETORNO 13/05/2025

USGTV 10/05/2025
UTERO 50,9, END 1MM, OD 10,4, OE 8,9 EXAME NORMAL
PREVENTIVO 22/05/2025 NEGATIVO PARA NEOPLASIA + GRADNERELLA ( JÁ TRATOU)
CONDUTA: ORIENTAÇÕES , RETORNO 3 MESES OU ANTES SE INTECORRENCIAS, AMORA (AVALIAR ADAPTÇÃO DO ACO)

12/01/2026
g1 P0 A1 
MC: ACI TRIMESTRAL 
ABORTO 21/10/2025 COM CURETAGEM UTERINA 

CONDUTA: 
SOLICITO USG TV 
EXAMES LAB 
 ---------------------
06/02/26
Ultrassom transvaginal do dia 22/01/2026 útero avf com volume de 30,9 cm³ endométrio 5,9 mm ovário direito 3,3 cm cube ovário esquerdo 9,4 cm cube com presença de cistos simples em ovário esquerdo
exames laboratoriais do dia 22/01/2026 Vitamina B12 290 ferritina 83 hemoglobina glicada 5,5% Vitamina D 34,9 tsh 2,14 t 4 livre 1,18

CONDUTA: ORIENTACOES 
VITAMINA D 
VITMINA B12 

PACIENTE REALIZOU A VITAMINA D NO DIA 06/02 E B12 E NORIOURUM NO DIA 07/02', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58946460, '98', 'Gleide Nogueira Reis', 2, 2, '86194003200', NULL, '(69) 99252-9893', '1984-11-10', 3, 'Dor pelvica, apresenta escape menstrual durante o ciclo +- 3 meses,
Preventivo:23/11/23 negativo
21/06/23  negativo proc, inflamação leve.
Conduta: usgtv.

--------- //--------
30/03/2026

41 ANOS 
MC TAMISA 30  - ESCAPE 
PREVENTIVO 06/12/2025: NEG PARA NEOPLASIA 
USG DE MAMAS 2023: BI RAS 2 

paciente encaminhada pelo clinico devido prolactina alterada, alega secreção vaginal esbranquiçada se, odor, alega que ja fez uso de vários Cree vaginal sem melhora 

EXAMES LAB 12/02/2026 PROLACTINA 38,5 
MAMS: EXPRESSAO NEGATIVA 

CONDUTA: 

Repetir prolactina:
Em jejum
Pela manhã (idealmente até 9h)
Evitar estresse, relação sexual e estímulo mamilar antes da coleta
2. Avaliar necessidade de suspender o anticoncepcional
Se clinicamente possível:
Suspender o Tamisa 30 por 30 dias
Repetir prolactina após suspensão
 Isso ajuda a confirmar causa medicamentosa
USAR PRESERVATIVO NO PERIODO QUE ESTIVER SUSPENSO O TAMISA 30, RISCO DE GRAVIDEZ 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58961015, '109', 'Gleyciane Da Silva Souza Dantas', 2, 2, '05038914284', NULL, NULL, '1982-03-15', 3, 'Q.P: paciente refere enxaqueca e dor lombar, paciente fazia acompanhamento no caps por depressão, fluoxetina, parou por conta propria.
Conduta: maxcult.
Retorno 09/05/23
Paciente refere que já inicou tto no caps  com psiquiatra alega melhora da cefaleia após uso de max cult.
Apresta exames 27/04/23.
Hb=13,4, ht=38,4, leuco 7-800, plq 25500, t4 1,22, colest 160, snr, tsh 2,13 toximune, trif 132.
Conduta: programar preventivo, usgtv.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58946533, '101', 'Gloria Aparecida De Souza Basto Medeiro', 2, 1, '02901391206', NULL, '(69) 99371-7861', '1998-09-14', 3, 'Paciente refere secura vaginal, alega fissuras na vaginal, alega secreção esverdeada, nega odor, faz uso de crevigim sem melhoras.
Conduta: solicito bacteriocopia, devido impossibilidade de examinar, preventivo, usgtv, exames lab, usg mamas.
11/10/2022
Secreção vaginal amarelada com odor, purido.
Conduta:Exames lab( sorologias), preventivo, netronidazol.

30/06/2025
DUM: 07/06
MC: PRESERVATIVO
UPCCU: 2025 - AGUARDANDO RESULTADO 

PACIENTE REFERE QUE RETIROU DIU DE COBRE NO MES DE ABRIL E NO MOMENTO FAZ USO DE PRESERVATIVO, PACIENET REFERE SECRECAO VAGIANAL, ESBRANQUICADA COM ARDENCIA, COM ODOR, FEZ USO DE VARIOS CREMES VAGIANL SEM MELHORA , FEZ USO DE GYNOTRAN A PAROU A MAIS OU MENOS 3 SEMANAS E SECNIDAZOL 2 COMPRIMIDOS DOSE UNICA, ALEGA TAMBEM DOR EM BAIXO VENTRE
AO EXMAE: SECRECAO ESBRANQOCADA, COM GRUMOS EM PAREDE, HIPEREMIA E RESSECAMENTO VAGNAL


CONDUTA: INTRODUZO 01 OVULO DE GYNOTRAN, PRESCREVO CREVAGIN 7 DIAS , E ENTREGO UMA CAIXA DE CREVAGIN POR MAIS 4 DIAS 
FLUCONAZOL 1, 48 HORAS E 7 DIAS 

18/11/2025
PACIENTE REFERE SECRECAO VAGINAL COM ODOR E PRURIDO 
FLUCONAZOL 1, 48 HORAS E 7 DIAS, SECNIDAZOL, TERICIN AT, GYNOTRAN ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58946515, '100', 'Graça De Fatima A Reis', 2, 5, '05038914284', NULL, NULL, '1963-12-22', 3, 'Paciente refere quadro de J.T.U, realizou porém não sabe o nome do medico.
Apresenta exame 08/02/24.
EAS: 8 a 10 p/ campo.
Urocultura:08/02 sensivel amox+ clav 875/125 por 7 dias.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62171978, '990', 'GRACIELE CRISTIANE RODRIGUES DOS SANTOS', 2, 0, '68062559220', NULL, '(69) 99247-9622', '1980-09-27', 3, '### ANAMNESE GINECOLÓGICA

**Paciente:** Graciele Cristiane Rodrigues dos Santos
**Idade:** 45 anos.

**Queixa principal:**
Consulta ginecológica de rotina, sem queixas no momento.

**História da doença atual:**
Paciente de 45 anos, G4 P4, comparece à consulta para avaliação ginecológica de rotina. Encontra-se **assintomática no momento da consulta**, sem queixas ginecológicas atuais.

**Antecedentes pessoais:**

* Asma brônquica.
* Herpes labial.
* Outras comorbidades: não informadas.

**Antecedentes cirúrgicos:**

* Quatro cesarianas.
* Laqueadura tubária bilateral.

**Antecedentes ginecológicos:**

* Menarca aos 14 anos.
* Último exame citopatológico do colo uterino (preventivo): realizado há aproximadamente 2 anos.
* Mamografia: não realizada.

**Antecedentes obstétricos:**

* G4 P4 A0.
* Quatro partos cesáreos.

**Método contraceptivo:**

* Laqueadura tubária bilateral.

**Hábitos de vida:**

* Pratica atividade física regularmente, com realização de academia.

**Dados antropométricos e sinais vitais:**

* Peso: 94 kg.
* PA: 120 × 80 mmHg.

**Impressão clínica:**
Paciente de 45 anos, G4P4, com antecedente de quatro cesarianas e laqueadura tubária bilateral, portadora de asma brônquica e herpes labial, comparecendo para consulta ginecológica de rotina, atualmente assintomática.

### CONDUTA

* Solicitados exames laboratoriais de rotina, conforme avaliação clínica.
* Solicitada **ultrassonografia pélvica transvaginal**.
* Solicitada **ultrassonografia das mamas**, conforme indicação clínica.
* Programado **exame citopatológico do colo uterino em meio líquido**, considerando que o último preventivo foi realizado há aproximadamente 2 anos.
* Orientada quanto à importância do acompanhamento ginecológico periódico e rastreamento adequado para sua faixa etária.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61502655, '854', 'Greicy Marques', 2, 0, NULL, NULL, '(92) 8424-8928', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58943514, '94', 'Guiomar Barbara A Pereira', 2, 1, '05038914284', NULL, NULL, '2006-02-17', 3, 'Irregularidade menstrual, secreção vaginal.
Conduta: retorno passar usg pelvica.
Retorno 16/08/24
utero 50,03, end 7,2, oe 51, od 4,6, exame normal.
Conduta:solicito exames lab, devido irregularidade menstrual.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59133218, '382', 'Helane De Souza Batista', 2, 2, '05038914284', NULL, NULL, '1986-11-17', 3, 'Q,P: rotina ginecologica, i.u.e com urgencia urinaria, alega diminuição da libido.
paciente em bom estado geral, afebril, deambulanda, manchas hipercromica em mãos.
conduta: usgtv, programado preventivo, encaminho ao demarto, estudo urodinamico.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132988, '380', 'Heldia Fabricia Souz Dos Santos', 2, 0, '05038914284', NULL, NULL, '1994-10-23', 3, 'Q.P: odor intenso na urina, principalmente pela manhã, nega secreção vaginal.
Historia patologica alega vaginose: secnidazol, metronidazol.
Conduta: ingesta hidrica, exames lab.
----------------------------------------------------------------------------------
Retorno 27/04/23
eas piocitos incontaveis 19/04, snr hb 12,9, leuco 7,400, plq 301,00, glicemia 82.
urocultura: fosfomicina sensivel.
conduta: momuril, ingesta hidrica, retorno 1 mes.
-----------------------------------------------------------------------------------
07/11/23
paciente refere lombalgia, disuria no final da micção, odor vaginal que piora após relação sexual e mestruação, alega também crise de ansiedade, crise de panico e taquicardia.
Conduta: exames lab, urocultura, ciprofeoxacina, gynotran.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59169378, '403', 'Heldia Fabricia Souza Dos Santos', 2, 0, '00212239201', NULL, '(69) 99371-1065', '1994-10-23', 3, 'IDADE: 30 ANOS 
DUM: 16/03/25
MC: VASECTOMIA 
UPCCU: 03/11/24: NEGATIVO PARA NEOPLASIA 

QP: PACIENTE REFERE DOR EM BAIXO VENTRE, RELATA SECRECAO VAGINAL AMARELADA COM ÓDOR E PRURIDO, PIORA APOS COITO E MENSTRUACAO 
USG TV 27/03/25: UTERO 47,94, END6 MM, OD 4,59, OE 9,43 
crise de ansiedade

CONDUTA: ORIENTACOES
CEFTRIAXON, AZITROMICINA, METRONIDAZOL POR 10 DIAS, FLUCONAZOL, IBUPROFENO 
encaminho para psicologo 
retorno com 30 dias 
exames Lab 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59513699, '499', 'Helena Morais de Carvalho', 2, 2, '01914229240', NULL, NULL, '1992-06-29', 1, 'dum: 03/06/25
MC: LT
G8 P3 A5:
COMORBIDADES: NEGA
ALERGIA NEGA
UPCCU: 22/05/25: NEGATIVO PARA NEOPLASIA 
USG TV: 28/05/25: UTERO 140, END 8MM, OD 5,4 OE 4,6, EXAME NORMAL

PACIENTE VEM PARA COLPOSCOPIA, DEVIDO PREVENTIVO DE NOVEMBRO DE 2024 ALTERADO, PACIENTE REFERE SECRECAO ESBRANQUICADA, COM SAIDA APOS RELACAO SEXUAL , AS VEZES APRESENTA DISMENORREIA 
AO EXAME: COLO LATERALIZADO A ESQUERDA, PRESENCA DE CISTO DE NABOTH EM LABIO ANTERIOR AS 12 E LABIOS POSTERIOS 4 E 7 HORAS, PRESENCA DE SECRECAO FLUIDA BOLHOSA, ESBRANQUICADA COM GRUMOS EM PAREDE

CONDUTA: SECNIDAZOL TRIPLOA , TRIVAGEL N
SOLICITO EXAMES LAB 

EXAMES DE SANGUE DEU 279,00 REAIS.
DESCONTO DONA NEIVA 250,00 A VISTA
05/09/2025
DONA NEIVA ENTROU EM CONTATO COM A PACIENTE PARA REPETIR O EXAME E ELA REPONDEU A SEGUINTE MENSAGEM:
BOA TARDE NÃO PRECISA MAIS EU JÁ FIZ EM OUTRO LUGAR EU ESTAVA PRECISANDO FAZER O EXAME DE NOVO COMO EU FALEI PARA SENHORA ESTAVA DAQUELE MESMO JEITO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61291953, '806', 'Helixiane da Silva Nobre', 2, 2, '03449690299', NULL, '(69) 8487-9747', '1997-09-03', 1, 'idade; 28 anos 
SEM PLANO DE SAUDE 
DUM: ------ OOFORECTOMIA 5 ANOS DEVIDO CISTO OVARIANO - 
COMORBIDADE: TIREODEOPATIA - HIPO FAZ USO DE PURAN 100 MG/ DIA 
EXAMES LAB REALIZADOS 2025
USG TV 2025
UPCCU: 2025 

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA,  ALEGA ALGIA MAMARIA Á DIREITA FREQUENTE, 
PACIENTE REFERE QEU FEZ TRH COM DRA AUREA RODRIGUES ENDOCRINO,  ( FAZIA USO DE ESTROGENIO - ESTROGENIOS CONJUGADOS/ ADOLESS) PAROU POR CONTA PROPRIA 

CONDUTA: 
ORIENTACOES 
PREVENTIVO MEIO LIQUIDO 
USG TV
USG DE MAMAS 

NOME: Helixiane da Silva Nobre
DATA: 06/04/2026


ULTRASSONOGRAFIA MAMÁRIA

TÉCNICA:
Realizado estudo ecográfico das mamas com transdutor setorial multifrequencial (5,0 a 10,0 Mhz).
 
INDICAÇÃO: 
Mastalgia à direita há XX dias/meses.
 
DESCRIÇÃO DO EXAME:
Pele e tecido adiposo subcutâneo com espessura e ecogenicidade normais.
Fáscia e planos musculares retromamários anatômicos.
Ductos lactíferos retroareolares de trajeto e calibre normais.
Parênquima mamário com ecotextura fibroglandular usual e adequada lipossubstituição.
Não se evidenciam formações nodulares sólidas ou císticas patológicas.
Prolongamentos axilares anatômicos.

 
ANÁLISE COMPARATIVA:
Não disponho de exames prévios para comparação.
 
AVALIAÇÃO:
Achados ecográficos negativos para malignidade.
BI-RADS® US 1.
 
RECOMENDAÇÃO:
Manter seguimento conforme indicação clínica.


Laudo padronizado conforme o método BI-RADS® 5ª edição do American College of Radiology (ACR) para imagem da mama.

OBSERVAÇÕES:
1. A ultrassonografia como método isolado não é indicada para rastreamento de neoplasia mamária. É necessária correlação com mamografia atual.
2. Através de normativa do Colégio Brasileiro de Radiologia, a ultrassonografia axilar não engloba avaliação mamária, sendo necessário seu pedido, para sua devida avaliação.
  
-----------




ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 5,05 x 2,87 x 1,57 cm (volume: 50 cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.

Endométrio: centrado, ecogênico e com espessura de 1,1 mm de basal a basal.

Ovário direito: não visualizado 
Ovário esquerdo tópico: não visualizado

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Útero de aspecto ultrassonográfico habitual.
Endométrio fino.
Ovários não visualizados ao exame, sem evidências de massas anexiais.
Exame dentro dos limites da normalidade.
CONDUTA:
atestado de 2 dias PARA O CASAL
COLETADO PREVENTIVO MEIO LIQUIDO 
VITAE CICLOS POR 3 MESES 
RETORNO 3 MESES 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60307849, '631', 'Heloanna dos Santos Pontes', 2, 1, '03733869230', NULL, '(97) 8414-7411', '2003-12-27', 1, 'HELOANA

IDADE: 21 ANOS
MENARCA: 12 ANOS 
SEXARCA: 20 ANOS
DUM:  11/09/2025
MC: AMORA- INIICOU EM MARÇO DE 2025 
UPCCU: NUNCA REALIZOU
PLANO DE SAÚDE: VIVA BEM
PSICOLOGA 6 PERIODO NA UNIR 

PACIENTE REFERE QUE DESDE MENARCA APRESENTAVA HIPERMENORREIA, DISMENORREI, JÁ APRESENTOU SINCOPE E ALGUNS EPISODIOS DE DIARREIA, JÁ REALIZOU PESQUISA DE ENDOMETRIOSE, PORÉM NAO ACHOU FOCO. EM MARÇO DE 2025 FEZ USO DE ACO ORAL AMORA E MELHOROU O QUADRO - ALEGA COLICA SOMENTE NO PRIMEIRO DIA DA MENSTRUAÇÃO, 

ao exame: colo cilíndrico, puntiforme, presença de estopai, secreção esbranquiçada com grumos 

CONDUTA: 
ORIENTACOES
SUPLEMENTACAO DE VITAMINA B, D E C 
COLETADO PREVENTIVO 
crevagin, trok, fluconazol
aplicar b 12 no retorno 


23/10
PAACIENTE REFERE MELHORA APOS USO DE PONSTAN 
COLETEROL, HBGLICADA AUMENTADA
USG TV EXAME NAO HA SINAIS DE ENDOMETRIOSE 

CONDUTA: NUTRICIONISTA 
plico b 12 gluteo esquerdo 
gluteo direito com hiperemia ( foto)
cefalexina
FLUOXETINA
AC MEFENAMICO 
FLUCONAZOL
reparil
loratadina
retorno 5 dias 


RETORNO 
FOTO DO GLUTEO, EM USO DAS MEDICACOES PRESCRITA, ALEGA DISMENORREIA DISCRETA 
PRESCREVO TRIPLO A 2 DIAS
MANTENHO AMORA
NOVA CONSULTA EM  INICIO DE DEZEMBRO

-----------
06/04/2026
22 ANOS 
DUM: 25/03/26 
MC: AMORA  

PACIENTE REFERE DISMENORREIA NO PRIMEIRO DIA DO CICLO, COM MELHORA COM O PONSTAN.
ALEGA ACOMPANHAMENTO COM PSIQUIATRA DEVIDO DIAGNOSTICO DE ALTISMO NIVEL 1 DE SUPORTE 
MEDICACAO EM USO 
- VITEX AGNUS CASTUS 20 MG 1 AO DIA ( FAZENDO USO SOMENTE NA PAUSA) DISFORIA MENSTRUAL
- CLORIDRATO DE TRAZODONA 
- LARIPITRAZOL 
VITAM,INA B 12 439 pg/mL
CONDUTA: 
ORIENTACOES 
GENOVA CABELO E UNHA 
SUPLEMENTAR VITAMINA B 12 - IRAR PROGRAMAR A APLICACAO 
VALOR 240, 00 FAZER DESCONTO 190,00 A VISTA OU 220 NO CREDITO 
1.	Genova cabelos e unhas ______________03 caixas
Tomar 02 comprimidos via oral 1 vez ao dia, durante 3 meses. 
2.	Pantogar resist ______________________01 caixa
Diluir 01 envelope em meio copo de água e tomar 1 vez ao dia.



  
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59133147, '381', 'Hildente Da Silva Rodrigues', 2, 0, '05038914284', NULL, NULL, '1970-07-04', 3, 'paciente assitomatica.
preventiv 19/10/23 neg para neoplasia.
conduta: usgtv, mmg, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033172, '219', 'Iane Fernanda Nunes Dos Santos', 2, 0, '05038914284', NULL, NULL, '1964-12-07', 1, 'Paciente refere aminorreia +- 10 meses, alega dum 02/04/23, apresenta acne, hirustismo.
Apresenta usgtv 05/04/23
utero 78,08, od 16,44, oe 13,93, ovarios micropolicisticos.
Conduta: selene + exercico fisico . dieta, exames lab, programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59225326, '434', 'Iara Kiss da Silva Lima', 2, 2, '99598590291', NULL, '(68) 9925-3828', '1990-02-28', 1, 'IDADE: 35 ANOS
G3 P3N A0
MC: ACO
DUM: 19/04/2025
UPCCU: 2023 - 29/06/2023: negativo para neoplasia 
PATOLOGIA MOLECULAR DE SOSROTIPOS DE HPV - NEGATIVO PARA 16, 18, 45
COMORBIDADES: HPV - CALTERIZACAO DO COLO DE UTERO (2021)
MEDICACAO EM USO NEGA 
HISTORIA DE CANCER DE MAMA NA FAMILIA: MÃE (43 ANOS- QUIMIOTERAPIA) E AVO (70 ANOS )
ULTIMA MMG E USG DE MAMAS EM 2023

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA,  NEGA SECRECAO VAGINAL, NEGA DISURIA, NEGA NODULO NA MAMA

AO EXAME: COLO ANTERIOS, EM FENDA, OBSERVO LOCAL DE CICATRIZACAO DE CALTERIZACAO EM ORIFICIO DE COLO 

CONDUTA: ORIENTACOES, COLETO PREVENTIVO, SOLICITO EXAMES LAB, USG DE MAMAS, MMG, 
--------------------------------------------------------------------------------------------------------
12/05/2025
REPOSIÇÃO DE VITAMINA NO CREDITO2X 503,00 REAIS
A VISTA 460,00 REAIS 
IARA RETRONO 3 MESES', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61421890, '842', 'IASMINE RIVELLI BARROS LIMA', 2, 0, '02700385233', NULL, '(69) 99212-2539', '2002-07-07', 3, 'IDADE 23 ANOS 
08/04
MC: ------
G0 P0
UPCCU: + 2 ANOS 

QP: PACIENTE REFERE QUE FEZ USO DA PIPLULA DO DIA SEGUINTE , POREM NESSE MES REFERE METRORRAGIA E ALEGA DOR EM BAIXO VENTRE

CONDUTA;
ORIENTACOES
PREVENTIVO
USG TV ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61638907, '886', 'IASMINE RIVELLI BARROS LIMA', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, 'Idade 23 anos data da última menstruação 16/05/2026 
métodos contraceptivo nenhum 
gesta zero parto zero aborto zero 
comobidade nega 
medicação em uso 
nega último preventivo:Preventivo do dia 24/04/2026 negativo para neoplasia microorganismo gardnerella vaginalis
Exames laboratoriais do dia 15/05/2026 EAS não infeccioso exames laboratoriais do dia 27/05/2026 hemoglobina 14 hematócrito 42 leuco 11900 plaqueta 230000 sorologia não reagente exceto vdr ativo 1/ 2 glicemia 107 ácido úrico 5.1 triglicerídeos 136 magnésio 2,1 cálcio 9,4 ferro 64 t jovem 6 tgp 26 creatinina 0,8 uréia 28 tsh 3,6 t 4 livre 1,49
Vitamina B12 297 vitamina D41 em uma bobina que ele cada 5,8 estradiol 42 progesterona 0,6 fsh 5,2 LH 18
Ultrassonografia transvaginal útero ante verso fletido volume 65 endométrio 7,3 ovário direito 4,0 ovário esquerdo 8,9 hipótese diagnóstica exame sem alteração


Queixa principal paciente vem para a decisão de método contraceptivo 
pressão 122 x 76 MmHg peso 95 e 800 g


conduta: orientações
gynotran secnidazol 

repetir VDRL COM 1 MES ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61393363, '835', 'ILANE DIAS PEREIRA', 2, 2, '02166077285', NULL, '(69) 99399-9498', '1995-11-12', 3, 'IDADE: 30 ANOS 
G 2 P2C A0
DUM: 05/04
MC: PRESERVATIVO
UPCCU: 2 ANOS 
ALERGIA DIPIRONA 

QP: PACIENTE REFERE HISTORIA DE SUA JANEIRO DE 2026, APOS RELATA DOR EM BAIXO VENTRE, ALEGA QUE NO MOMENTO DO CICLO APRESENTA DOR EM FOSSA ILICA DIREITA, FAZ USO DE PARACETAMOL COM MELHORA PARCIAL 

CONDUTA: ORIENTACOES 
SOLICITO USG TV
PREVENTIVO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60237018, '614', 'Inês FALCAO dos Santos', 2, 0, NULL, NULL, '(97) 8107-3984', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59470482, '491', 'Inês Quinto Mendonça', 2, 0, '00277448255', NULL, '(69) 99208-0698', '1988-08-01', 3, 'IDADE: 36 ANOS
G3 P3 A 0
PREVENTIVO 17/07/2023: LSIL
REALIZADO COLPOSCOPIA E BIOPSIA 
BIOPSIA DO COLO DE UTERO 23/11/23NIC I / DISPLASIA  LEVE / LSIL / CERVICITE CRONICA LEVE 
RESULTADO DE ANATOMOPATOLOGICO 19/03/2024: CERVICITE INESPECIFICA 
PREVENTIVO: 23/22/23: GARDNERELLANAO IDENTIFICADOS ATIPIAS CITOLOGICAS 
PREVENTIVO MAIS SAUDE 13/05/2025: NEGATIVO PARA NEOPLASIA 

EXAMES DE SANGUE FICOU DE 384,00 REAIS POR 320,00 A VISTA.





23/06/2025
EXAMES LAB 09/06: HB 12,6/ VCM 79,6, FERRITINA 10,5/ FERRO 51/ VITAMINA B 12 537/ VITMAINA D 35/ / GLICOSE 91/ / TRO=IG 107/ COLE 183/ TSH 1,99T4 LIVRE 1/ ESTRADIOL 230/ PROGESTERONA 8,74/ FSH 2,7/ LH 6,6/ 

NORIPURUM 180,00/ VIT D 250/ VIT B12 250 
PAGOU 340,00 PIX 
VAI PAGAR 340,00 PAGARÁ 20/07/2025
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033300, '220', 'Ines Quinto Mendonça', 2, 5, '05038914284', NULL, NULL, '1988-08-01', 3, 'apresenta exame lsil 17/07/23
eas 1 a 2 piocitos 
snr 22/08/23 lipidograma e glicose normal
conduta: colposcopia', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61965017, '966', 'INGRID BEATRIZ DA SILVA COSTA', 2, 1, '06582624245', NULL, '(69) 99342-7809', '2011-06-03', 3, 'Paciente: Ingrid Beatriz
Idade: 15 anos
Acompanhante: mãe, Gabriele Pereira da Silva
DUM: 10/08/2026
Menarca: 13 anos
PARCEIRO: 15 PARCEIROS 
Antecedentes:
Nega comorbidades. Refere alergia alimentar a camarão. 
Nega cirurgias prévias. 
Nega realização prévia de exame preventivo. 
Não pratica atividade física. 
Em uso de contraceptivo hormonal oral em esquema de 21 comprimidos.
Queixa principal/HDA:
Paciente acompanhada da mãe, refere irregularidade menstrual. Relata que, mesmo em uso do anticoncepcional oral em esquema de 21 comprimidos, apresenta sangramento durante a própria cartela, referindo ocorrência de sangramento em duas ocasiões no mesmo mês. Refere duração do sangramento menstrual de aproximadamente 7 dias. Relata presença de acne e hirsutismo. Nega alteração de peso.
Exame físico:
PA: 110 × 70 mmHg.

Hipóteses diagnósticas:
Sangramento uterino anormal/irregularidade menstrual na adolescência.
Sangramento uterino de escape associado ao uso de contraceptivo hormonal.
Hiperandrogenismo clínico, considerando presença de acne e hirsutismo.
Avaliar outras causas de irregularidade menstrual conforme história clínica, exame físico e resultados dos exames complementares.

Conduta:
Orientada paciente e responsável quanto ao acompanhamento do padrão menstrual, duração, intensidade e ocorrência dos sangramentos, com registro em calendário ou aplicativo.
Orientada quanto ao uso correto do contraceptivo, incluindo investigação de esquecimentos, atrasos na tomada ou uso inadequado.
Solicito exames laboratoriais para investigação de sangramento uterino irregular e hiperandrogenismo, conforme avaliação clínica.
Solicito ultrassonografia pélvica para avaliação ginecológica.
Orientada quanto à importância do retorno para avaliação dos resultados dos exames.
Retorno após realização dos exames para reavaliação clínica e definição de conduta.

NOME: INGRID BEATRIZ DA SILVA COSTA

SOLICITO

HEMOGRAMA  
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
BETA HCG 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033576, '223', 'Ingridy Isabelle Da Silva Bezerra', 2, 1, '05038914284', NULL, NULL, '2001-10-19', 3, 'Ovarios policisticos.
Conduta: usg pelvica, ponstan, exames lab.

Retorno: melhora de quadro, apresenta exames lab 07/10.
colesterol 212, tsh 5,51
Conduta: dieta, repetir tsh.
usg pelvica: utero 51,2 cm, ovarios policisticos.
Conduta: sopi por  3 meses.

15/09/23
retorno 04/09
vit d 18,3, hb 13, ht 38,8, leuc 6,080, tsh 6,19, t4 livre 0,89.
Conduta: turam t4, ibuprofeno, reposição de vit d, encaminhamento ao demarto.

09/04/24
m.c: repopil sem pausa
dum: fev 2024
paciente acompanhada da mãe edinalva, refere disminorreia com discreta melhora com medicação.
Conduta: solicito usg tv com preparo intestinal e exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033320, '221', 'Iracele  Fernandes Modista', 2, 1, '05038914284', NULL, NULL, '1969-06-15', 3, 'rotina, sem queixa.
solicito exames lab, usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61085815, '769', 'Iracema ferreira de Santana', 2, 0, '88879798200', NULL, '(97) 9192-8653', '1972-03-14', 1, 'PACIENTE DE HUMAITA, REALIZOU A REPOSIÇÃO DE VITAMINA D+K2MK7.
AGUARDO O RESULTADO MMG .', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033423, '222', 'Iranilde Rodrigues Fernades', 2, 1, '05038914284', NULL, NULL, '1973-04-05', 3, 'Q.P: lombalgia 
exames lab 02/08/22 hb 11,3, colesterol 211, tsh 6,3, t4 1,23, t3 3,2, eas 10 piocitos p/ campo ciprofloxacina.
conduta: encaminhamento ao endocrino, solicito exames lab, usgtv, urocultura,
Já está em uso ciprofloxacina, sulfato ferroso.

24/08/22 dum 22/08, utero 114,57cm, od 3,63, oe3,16, espessamento endometrial 11,1 mm, urocultura 12/08 sensivel a ciprofloxacina já tratada.
01/09/22 hb 11,80,  ht 37,70, plq 383,000.
Alega que foi ao endocrinologista devido tsa 6,30 porém acompanhante expectante, alega  que uso sulfato ferroso, sem melhora, nega mamografia, alega que está em uso de primositon.
Conduta: mantenho primositon, prescrevo hemolip 30 dias+ dieta rica em ferro. solicito usgtv para setembro final ou inicio de outubro.
para tto da anemia.
Solicito: mmg', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033072, '218', 'Irene Paiva De Souza', 2, 2, '05038914284', NULL, NULL, '1952-04-05', 3, 'Paciente acompanhada da filha, internada no cemetrom devido malaria, alega que durante  internação realizou usg e o medico encaminho ao g.o.
Alega  perda de urina, nega disuria, nega presença, secreção de bola na vagina.
Ao exame: ausencia de cistocele, mesmo após manobra de v
Conduta: usgtv, usg rins e vias urinarias, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60191261, '603', 'Irla Barbosa de Oliveira', 2, 3, '01601767277', NULL, '(69) 9967-3792', '1995-08-28', 1, 'ID: 30 ANOS 
DUM: 16/08/25
MC: SEM ATIVIDADE SEXUAL 
COMORBIDADE: NEGA
MEDICAÇÃO: NEGA 
EM AMAMENTAÇÃO
G:2 P:2 A:0

Q.P: ROTINA GINECOLOGICA, NEGA DISURIA REFERE DISPAREUNIA, ALEGA DOR EM BAIXO DO VENTRE, DISMINORREIA.
ALEGA HISTORIA DE LITISE RENAL 
CONDUTA: USGTV, EXAMES LAB, PREVET', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59090384, '337', 'Isabelly Gabrielly De Castro Gomes', 2, 0, '06588877269', NULL, '(69) 9209-1951', '2011-07-12', 3, 'MENARCA 11 ANOS 
EXAME S
USG PELVICA 

PACIENTE RETORNA COM A MAE, POREM NAO APRESENTA EXAMES E USG PELVICA 
AGUARDO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62093792, '974', 'Isadora de Araújo Farias', 2, 0, '02291480260', 'arq.isadorafarias@gmail.com', '(68) 99955-3223', '1998-05-29', 1, '28 anos 
CASADA
PROFISSAO: ARQUITETA 
G1 P0 A1 (12 SEM)
DUM:  12/08/2026
MC: TAMISA 30 
COMORBIDADE: DEPRESSAO ANSIEDADE - POS MUDANCA DE ESTADO 
MEDICAO EM USO:  NEGA ( FEZ USO DE ESCITALOPRAN E ATENTA, PAROU APOS USO DE 30 DIAS, E NAO TEVE RETORNO COM PSIQUIATRA - ATUALMENTE NEGA ALGUMA OUTRA CRISE -  FAZ TERAPIA ) 
EXERCICIO FISICO ESPORADICO
ALERGIA A MEDICACAO : BUSCOPAN COMPOSTO 
SONO: DIFICULDADE DE INICIAR E MANTER O SONO ( ACORDA VARIAS VEZES A NOITE) 
INTESTINO: REGULAR
UPCCU: MARCO DE 2026 - NEG SIC 
U USG TV: 2025

QP: IRREGULARIDADE MENSTRUAL, INICIOU QUADRO HÁ 2 MESES,  NEGA DISMENORREIA, NEGA SECRECAO VAGINAL, NEGA DISURIA, 

O ChatGPT disse:
Claro. Organizei os exames de 10/08/2026 em uma tabela, mantendo os valores exatamente como você informou. Alguns nomes parecem ter sido transcritos pelo reconhecimento de voz, então marquei os que podem precisar de confirmação.
Exame	Resultado
Hemoglobina	13,3
Hematócrito	39
Leucócitos	6.570
Plaquetas	337.000
Ácido úrico	4,0
[“catmandu 06”]	06
Glicose	90
Gama-GT	53
[“desde o 14”]	14
TGP (ALT)	24
Colesterol total	202
HDL	77
Triglicerídeos	75
LDL	110
PCR	21
Hemoglobina glicada (HbA1c)	5,5
Glicose média estimada	111
Ferritina	31
Cortisol	17
Estradiol	19
FSH	4
LH	3,85
Prolactina	11
Progesterona	0,29
T4 livre	1,39
TSH	1,91
Insulina	7,6
Ácido fólico	5,26
Homocisteína	9,6
SHBG	136
Testosterona livre	166
Vitamina B12	316
Vitamina D	32,6
Zinco	sem resultado informado

CONDUTA: 

USG COM PREPARO INTESTINAL 
USO ORAL 

1.	Endofer _______________________01 caixa

Tomar 01 comprimido via oral, 1 vez ao dia
------------------------------------------------
protocolo injetáveis 

02/09
reposição de vitamina b e d

08/09 antioxidante 
-------------------------------------------------

10/09/2026paciente com queixa de eritema em glúteo e incomodo 

conduta:
orientacoes
hirudoide
cefadroxila
triplo a 
retorno a qualquer momento se intercorrência 
contato celular disponível 24 horas 
encaminha foto a cada 48 horas 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58945510, '95', 'Isadora Gomes Maurício', 2, 0, '00819135240', NULL, '(69) 99290-3516', '1999-10-26', 1, 'IDADE 25 ANOS
PORTO VELHO / HUMAITA / CELIA -ALESSANDRA - ISABELE
69 99290 3516
DN: 26/10/1999
MENARCA 14 ANOS
SEXARCA 14 ANOS ( PARCEIROS MASCULINO + 10 ) PARCEIRA - 2022 ( NUMERO DE PARCEIRA 2) - PACIENTE REFERE DOR NA PENETRACAO, EVITA OBJETOS, POREM VIBRADOR E DEDO NAO TEM INCOMODO 
DUM: JANEIRO DE 2025
MC: ------
PREVENTIVO: NUNCA REALIZOU 
HISTORIA DE CANCER DE MAMA OU OVARIO NA FAMILIA
ALERGIA A CASTANHA DO PARA 
COMORBIDADES: NEGA / PAI DIABETICO / MAE HAC 

QP: PACIENTE REFERE SECRECAO VAGINAL COM ÓDOR, ANTES E APOS A MENSTRUACAO, FLUXO MENSTRUAL:  6 DIAS, VOLUMOSO, DISMENORREIA, FAZ USO DE IBUPROFENO COM MELHORA
NEGA NODULO NAS MAMAS, NEGA DISURIA


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59090372, '336', 'Ivone De Castro Belém', 2, 2, '92904386220', NULL, '(69) 99209-1950', '1979-12-31', 3, 'SINTOMAS DA MENOPAUSA VEM PARA ROTINA 
EXAMES LAB, MMG, USG TV

RETORNO 21/10
Exames laboratoriais do dia 15/08/2025 hemoglobina 9,5 hematócrito 28,9 leu os 6490 plaqueta 430000 creatina 0,6 puré 30 glicose 96,9 colesterol ldh 73 HDL 65 triglicerídeos 120 tegel 16 tgp 14 tsh 1,8 FCH 1,71 LH 0,9 ultrassonografia transvaginal do dia 29 do 9 útero 172 cm³ endométrio 2 mm ovário direito 9,6 por vário esquerdo 7,1 exame sem alteração

CONDUTA: NORIPURUM
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61499049, '851', 'JACKELINE MARQUES ARAUJO GURGEL', 2, 0, '75320444249', NULL, '(69) 9226-6260', '1982-09-04', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59036554, '237', 'Jamiles Ribeiro Mota', 2, 1, '05038914284', NULL, NULL, '1991-09-07', 3, 'Paciente refere dor em baixo do ventre, nega disuria, paciente refere p/ gastrite não tratou, no momento apresenta refluxo. colelitectomia aos 22 anos.
conduta: usg de abdome total, ead, usgtv, bacterioscopia, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59036507, '234', 'Janaina Esteves Texeira', 2, 2, '05038914284', NULL, NULL, '1999-10-17', 3, 'Paciente vem para consulta de rotina.
Conduta: exames lab, usgtv.
Retorno: exames lab+ medicação.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033809, '229', 'Jaqueline Chaves De Melo  Pereira', 2, 0, '05038914284', NULL, NULL, '2025-02-25', 3, 'paciente refere cesarea há 4 meses, alega que fez uso de contracp, apos o uso alega metrorragia e acne por conta propria suspendeu o uso do contracep.
paciente refere disuria, fez urocultura (ausencia de crescimento), alega dispareunia, alega que mesmo em uso de nactaly, apresenta spot.
conduta: usg tranvaginal, triplo a.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033747, '228', 'Jaqueline De Souza Martins', 2, 1, '05038914284', NULL, NULL, '1992-01-13', 3, 'paciente refere irregularidade mesntrual, apresenta usgtv 24/08/23 polipo 16x5mm no colo utetrino.
especular, presença secreção esbranquiçada, bolhosa, não vizualizo polipo.
tv: ausencia de dor a palpaçao.
conduta: secnidazol, metronidazol, usgtv, aguardo preventivo.

03/11/23 
em uso de ciclo 21
apresenta usgvtv 03/11/23
utero 89,74cm, endometrio regular, linear e fino 5mm, od 6,99, oe 6,24, exame normal.
bhcg 23/09 negativo
preventivo 12/09/23 negativo para neoplasia
conduta: rotina anual

21/02/23
apresenta exames sem queixas.
exames 08/02/24
eas normal, lipidograma col 213, trig 108, tshh 0,98, vitd 27, vit b12 262.
conduta: tamisa sem parar,  camisa por 7 dias  durante a troca de aco
bacterioscopia, cevagin e flucunazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60159372, '601', 'Jaqueline Peres Rocha Barroso', 2, 0, NULL, NULL, '(69) 9379-7508', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59563119, '514', 'Jaqueline Sobreira Da silva', 2, 0, '52993930249', NULL, '(69) 99203-5235', '1988-02-05', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59605543, '527', 'Jaqueline Vieira dos Santos', 2, 0, NULL, NULL, '(97) 9146-0166', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61914863, '943', 'Jasmira Pereira da Silva Oliveira', 2, 0, '66307910291', 'pereirajasmira50@gmail.com', '(69) 99245-9006', '1980-05-10', 3, '20/08 /2026

PROGRAMACAO DE ACOMPANHAMENTO CLINICO

PROTOCOLO DE IMUNIDADE 

VITAMINA D 3. IM SETEMBO
VITAMINA C   EV. SETEMBRO 
2 ANTIOXIDANTE AGOSTO 

NOME: Jasmira Pereira da Silva Oliveira

Protocolo imunidade e antioxidante

Benefícios: suporte a imunidadade e funcionamento das células imunológicas antioxidante “dexintoxicar”, aumento da energia e disposição,  melhora do metabolismo, função muscular, óssea e nervosa. Participação na formação de colágeno. 

Administração: IM e EV

3 doses com intervalo de 1 semana entre as doses. E a última dose EV.

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59136519, '388', 'Jecilene Ferreira Martins', 2, 2, '05038914284', NULL, NULL, '1973-10-05', 3, 'Paciente refere, irregularidade menstrual, alega também aminorreia, porém neste ultimo ciclo apresentou metrorragia, nega  algia, alega fogacho, irritabilidade, insonia.
hb 14,1, ht 40,6, leuc 5,400, plq 222,000.
conduta: usgtv, exames lab, gynotran, secnidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60289949, '622', 'Jecilene Ferreira Martins', 2, 0, '40884520200', NULL, '(69) 99388-0840', '1973-10-05', 3, 'paciente refere algia da mama esquerda,
 apresenta
omg 20/02/2024: bi rads 4  
usg de mamas 


ENCAMINHAMENTO 
MASTOLOGISTA 	


Encaminho a Sra. JECILENE FERREIRA MARTINS, 52 anos, G06P03A03 DUM: JULHO DE 2024. Paciente refere algia mamária á esquerda há mais ou menos 1 ano, alega que nos últimos tempo a dor está piorando e irradiando para os braços, alega algia mamaria aos pequenos esforços como pentear o cabelo, nega tabagismo. Refere que no mês de Agosto compareceu a Hospital do amor para repetir exames de imagem, porém até o momento não chamaram a paciente.
Nega história de câncer de mama na família.  
Apresenta:
USG MMG 20/02/2024: BI RADS 4
USG MAMAS 22/07/2025: BI RADS 3
Ao exame:
Mamas em número de 2, flácidas, pendulares, dolorosa a palpação superficial, expressão mamária negativa. oco axilar negativo 



GRATA 

ENCAMINHAMENTO 
MASTOLOGISTA 	


Encaminho a Sra. JECILENE FERREIRA MARTINS, 52 anos, G06P03A03 DUM: JULHO DE 2024. Paciente refere algia mamária á esquerda há mais ou menos 1 ano, alega que nos últimos tempo a dor está piorando e irradiando para os braços, alega algia mamaria aos pequenos esforços como pentear o cabelo, nega tabagismo. Refere que no mês de Agosto compareceu a Hospital do amor para repetir exames de imagem, porém até o momento não chamaram a paciente.
Nega história de câncer de mama na família.  
Apresenta:
USG MMG 20/02/2024: BI RADS 4
USG MAMAS 22/07/2025: BI RADS 3
Ao exame:
Mamas em número de 2, flácidas, pendulares, dolorosa a palpação superficial, expressão mamária negativa. oco axilar negativo 



GRATA 
ENCAMINHAMENTO 
MASTOLOGISTA 	


Encaminho a Sra. JECILENE FERREIRA MARTINS, 52 anos, G06P03A03 DUM: JULHO DE 2024. Paciente refere algia mamária á esquerda há mais ou menos 1 ano, alega que nos últimos tempo a dor está piorando e irradiando para os braços, alega algia mamaria aos pequenos esforços como pentear o cabelo, nega tabagismo. Refere que no mês de Agosto compareceu a Hospital do amor para repetir exames de imagem, porém até o momento não chamaram a paciente.
Nega história de câncer de mama na família.  
Apresenta:
USG MMG 20/02/2024: BI RADS 4
USG MAMAS 22/07/2025: BI RADS 3
Ao exame:
Mamas em número de 2, flácidas, pendulares, dolorosa a palpação superficial, expressão mamária negativa. oco axilar negativo 



GRATA 


ENCAMINHAMENTO 
MASTOLOGISTA 	


Encaminho a Sra. JECILENE FERREIRA MARTINS, 52 anos, G06P03A03 DUM: JULHO DE 2024. Paciente refere algia mamária á esquerda há mais ou menos 1 ano, alega que nos últimos tempo a dor está piorando e irradiando para os braços, alega algia mamaria aos pequenos esforços como pentear o cabelo, nega tabagismo. Refere que no mês de Agosto compareceu a Hospital do amor para repetir exames de imagem, porém até o momento não chamaram a paciente.
Nega história de câncer de mama na família.  
Apresenta:
USG MMG 20/02/2024: BI RADS 4
USG MAMAS 22/07/2025: BI RADS 3
Ao exame:
Mamas em número de 2, flácidas, pendulares, dolorosa a palpação superficial, expressão mamária negativa. oco axilar negativo 

GRATA 
Encaminho a Sra. JECILENE FERREIRA MARTINS, 52 anos, G06P03A03 DUM: JULHO DE 2024. Paciente refere algia mamária á esquerda há mais ou menos 1 ano, alega que nos últimos tempo a dor está piorando e irradiando para os braços, alega algia mamaria aos pequenos esforços como pentear o cabelo, nega tabagismo. Refere que no mês de Agosto compareceu a Hospital do amor para repetir exames de imagem, porém até o momento não chamaram a paciente.
Nega história de câncer de mama na família.  
Apresenta:
USG MMG 20/02/2024: BI RADS 4
USG MAMAS 22/07/2025: BI RADS 3
Ao exame:
Mamas em número de 2, flácidas, pendulares, dolorosa a palpação superficial, expressão mamária negativa. oco axilar neg
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59012293, '184', 'Jesciane Soares Da Silva Schulz', 2, 0, '05119123236', NULL, '(69) 9262-2016', '2001-06-04', 1, '23 ANOS
DN 04/06/2001
ORIGEM ROLIM DE MOURA 
QUEIXA -SE DE HIPERTROFIA DE PEQUENOS LABIOS, INCOMODO AO USA CCALCINHA, DOR NA RELACAO SEXUAL
NINFOPLASTIA  E CAPUZ PLASTIA 7000,00 
SOLICITO EXAMES LAB, PREVENTIVO 

28/02/25
paciente em posição de litotomia
assepsia
marcação do excesso de pele
realizado capuzplatia e sutura
realizado labioplxstia bilateral e sutura 
hemostasia 
realizado fotobiomodulacao
paciente visualiza resultado
paciente alega que resultado chegou na sua expectativa  
entrego receita, atestado

--------   /// ------------
12 horas pós operatório de ninfoplastia
região intima edemaciada, limpa e seca 
realizo assepsia, curativo, fotobiomodulacao e orientações
lenço umedecido 17,90 debito


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59072964, '307', 'Jessiane Caires de Souza', 2, 0, '70704465272', NULL, '(69) 9986-8707', '1983-11-19', 1, 'Primeira sessão de clareamento dia 20/03/2025
valor: 400 reais pix.

idade; 41 anos
dum: 12/03
g2 p2
pccu jan 2025
mc: preservativo ( nao deseja usar hormônio)

QP: PACIENTE REEFER ESCURECIMENTO EM REGIAO PERIANAL, APOS USO DE ABSRVENTE ASSOCIADO A CALCINHA COLETORA

AOEXAME: ESCURECIMENTO EM REGIAO PERIANAL E IGUINAL, 

CONDUTA; REALIZO PEELIMG COM LASER 
POTECIALIZAR O CLAREADOR COM 5 DIAS
USAR HOME CARE: CLAREADOR DIARIO A NOITE, ESFOLIANTE 2 X NA SEMANA, LOCAO CALMANTE PELA MANHA 
--------------------------------------------------------------------------------------------------------------
25/03/2025
Paciente realizou a segunda sessão do clareamento perianal 
Valor:400 reais / pix.
Proxima sessão 120,00 reais.
-----------------------------------------------------------------------------------------------------------------
28/03/25
PACIENTE REALIZOU MAIS UMA SESSÃO DO CLAREAMENTO
VALOR: 120,00 REAIS / PIX.
------------------------------------------------------------------------------------------------------------------
02/04/2025
Paciente realizou uma hidratação na região perianal.
foi um brinde que a Dra deu.
---------------------------------------------------------------------------------------------------------------------
22/04/25
Paciente realizou o laser na região perianal  
valor 400 reais/ credito.
----------------------------------------------------------------------------------------------------------------------
24/04/2025
Paciente realizou o potencializador do claremento 120,00 reais no credito.
-----------------------------------------------------------
14/05/2025
PACIENTE REALIZOU 1 DOSE VACINA DE HERPS.

25/06/2025
idade; 41 anos
DUM: 25/06 OLIGOMENORREIA 
mc: preservativo ( nao deseja usar hormônio)
pccu jan 2025
PACIENTE REFERE OLIGOMENORREIA (25-28 DIAS DE CICLO), REFERE UMA DIMINUICAO DA HIPERCROMIA 
VEM PARA 2º DOSE DE VACINA HERPES 

CONDUTA: SOLICITO EXAMES LAB, DENSITOMETRIA OSSEA, USGTV, MAMAS, MMG, PEELING EM CAPSULA 
---------------------------------------
agosto
3 DOSE DE VACIAN DE HERPES 
PACIENTE REFERE QUE AINDA NAO APRESENTOU QUADRO DE HERPES ATE O MOMENTO 
__________________________________________
05/09/2025
paciente refere encapsulamento de protese mamaria 
pccu jan 2025
paciente refere que nao quer fazer reposição de vitamina injetável, e oral tem dificuldade para tomar 
conduta: reposição de  magnesio, vit c e vit b 12 
refere que a vitamina b 12 apresenta acne 
----------------

14/10/2025
paciente referente que até o momento nao apresentou nenhum episódio de herpes ( exceto no mês agosto)
sem queixas no momento da consulta 
está em reposição de vitamina d injetável e nao faz b 12 devido acne
vem para vacina 
oriento para fazermos 
1º vacina  imunoestimulante da imunidade completa 

_____________________/// --------------------

02/12/2025
idade; 42 anos
dum: 05/11
G2P2
pccu jan 2025
mc: preservativo ( nao deseja usar hormônio)

vem para vacina de imunoestimulante
sem crise de herpes ate o momento 

CONDUTA: ORIENTACOES 
-------------------------------------------
24/01/26

DUM: 
PACIENTE ALEGA CRISE DE HERPES
PACIENTE NAO APRESENTOU DENSITOMETRIA OSSEA, USGTV, MAMAS, MMG,
AO EXAME
MAMAS COM PROTESE, MAMA ESQUERDA COM PROTESE ROMPIDA?
ESPECULAR ; COLO ANTERIOR, PUNTIFORME, DISCRETA SECRECAO ESBRANQUICADA 
CONDUTA: 
SOLICITO NOVAMENTE DENSITOMETRIA OSSEA, USGTV, MAMAS, 
BEPANTOLDERMA NA ASA DO NARIZ 
COLETADO  PREVENTIVO MEIO LIQUIDO 
PROGRAMAR IMUNOESTIMULADOR DE HERPES APOS 20 DIAS DA CRISE ( NO MOMENTO EM USO DE ACICLOVIR 


29/01
REALIZO APLAICAÇÃO DO IMUNOESTIMULANTE 


06/03
REALIZAÇÃO DA VACINA HERPS COM DONA NEIVA

----------------------------------------------------
06/07 vacina hesrpes ( paciente refere que apresentou sensibilidade no local da herpes, orem nao apareceu vesículas)
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033638, '224', 'Jessica Alburqueque ferreira santos', 2, 2, '05038914284', NULL, NULL, '1991-03-09', 3, 'vem mostrar exames 12/08, assitomatica.
hb 13,9, ht 43, leuco 9,800, plq 388,700,  tsh 2,57, t4 livre 1,10, ferritina 176, snr antin hbss não reagente, bhgc negativo, col 168, trigl 51, glicose 91.
Conduta: anita e preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60074659, '597', 'Jessica Carolina Araujo De souza', 2, 0, '02674193255', NULL, '(69) 9224-3462', '1995-12-26', 3, 'idade: 29 anos 
DUM: 01/07/25
MC: DIU DE COBRE
UPPCU:  + 5 ANOS 

QP: PACIENTE REFERE DISPREUNIA 

USG TV E PROGRAMAR PREVENTIVO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59036526, '235', 'Jessica Dos Santos Da Silva', 2, 2, '05038914284', NULL, NULL, '1996-01-19', 3, 'Q.P: rotina ginecologica, atraso menstrual, nega secreção vaginal, nega dispareunia.
Conduta: exames lab, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61798244, '911', 'Jessica Janaína Dias Trindade', 2, 0, '01032833238', NULL, '(97) 8100-7970', '1997-06-25', 1, 'Primeira consulta e em seguida realizara preventivo 
29 anos 
DUM: 20 /06/2026
MC: ----
COMORBIDADE: ANSIEDADE
MEDICACAO -----
ALERGIA -------
EXERCICIO FISICO ACADEMIA 5 X SEMANA 
UPCCU: JUNHO DE 2025 
USG TV JUNHO DE 2025 

QP: PACIENTE DESEJA ENGRAVIDAR,  
HISTORIA DE NIC I EM 2024 COM NECESSIDADE DE CAUTERIZAÇÃO 
NEGA DISPAREUNIA, NEGA DISURIA, 
JA REALIZOU PESQUISA DE ENDOMETRIOSE E RESULTADO NEGATIVO EM 2024 

AO EXAME: COLO CENTRALIZADO, ORIFICIO PUNTIFORME , MUCO HIALINO 
CONDUTA: 
ORIENTACOES 
OGESTAN PRE , POR 3 MES
COLETADO PREVENTIVO EM MEIO LIQUIDO E SOLICITADO E PESQUISA de hpv de alto e baixo risco 
SOLICITO EXAMES LAB 

05/08 retorno on line 
vit d baixa  240 fara em Humaitá 
herpes imune ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58909765, '8', 'Jéssica Karen Souza dos Santos', 2, 0, '02453281224', NULL, '(69) 99357-7013', '1995-09-02', 1, 'GESTANTE DE 20 SEM E 1 DIA
PRESENTA SNR, TS RH NEGATIVO, TOXOPLASMOSE IGG NR E IGM INCONCLUSIVO
OBESIDADE
AO EXAME
PA 110 X80 MMHG
BCF: 152 BPM. MF PRESENTE AU 20 CM
CONDUTA: REPETIR TOXOPLASMOSE 

---------  /// ---------
23 SEM E 1 DIA
SEM QUEIXAS
BCF: 147 / AU 23 CM / MF PRESENTE / DU AUSENTE
PA 120 X 70 MMMHG

CONDUTA: ORIENTACOES
SOLICITO USG MORFOLOGICA DO 2 TRIMESTRE


19/05/25
32 sem 4 dias 
paciente refere que há mais ou menos 15 dias , vem apresentando pico pressóricos de 140 x 80, ALEGA CONSTIPACAO E AZIA 

AO EXAME
PA 120 X 80 MMHG
BCF: 141
AU 32 CM

CONDUTA: 
ROTINA DE PE + TOXOPLASMOSE 
USG OBST COM DOPPLER COM URGENCIA 
MAPA 
ORIENTO QUANTO A SINAIS DE ALARME COMO CEFALEIA INTENSA, NAUSEAS, ZIA, VISAO TURVA, AUMENTO DA PE - PROUCURAR A MMME
PROCTYL, LACTULOSE, SIMECOPLUS 
RETORNO URGENTE APOS RESULTADO DOS EXAMES ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60757371, '707', 'Jessica Ketuly Clemente Barros', 2, 1, '02281814297', NULL, '(69) 9354-0879', '1995-09-17', 1, 'IDADE: 30 ANOS 
DUM: 11/12
G1 P1
MC: ---- SEM ATIVIDADE SEXAUL NO MOMENTO 
COMORBIDADE: ASMA / HPV COM CALTERIZACAO COM ATA 
MEDICACAO: LUGAN
ALIMENTACAO: IRREGULAR
EXERCICIO FISICO: IRREGULAR 

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, REFERE DOR EM BAIXO VENTRE, SECRECAO VAGINAL, NEGA PRURIDO E ODOR, NEGA DISURIA, NEGA NODULO MAMÁRIO 
REFERE DISPAREUNIA, RESSECAMENTO VAGINAL ( PRECISOU USAR LUBRIFICANTE)
NEGA DISMENORREIA, ALEGA COLICA ANAL NO PRIMEIRO DIA DO CICLO, FLUXO MODERADO, DURACAO DE 6-7 DIAS DO CICLO.

VULVA AS 1H CICATRIZ DE CONDILOMA?
COLO CILINDRICO, ANTERIOR, PRESENCA DE SECRECAO ESBRANQUICADA COM GRUMOS, COLO SANGRANTE A COLETA, PRESENCA DE MUCO HIALINO EM OCE

CONDUTA: ORIENTACOES
CREVAGIN
USG TV COM PREPARO INTESTINAL
EXAMES LAB 
USG DE MAMAS E AXILARES 
PREVENTIVO EM MEIO LIQUIDO COM GENOPITAGEM PARA HPV 

dum: 05/01', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61942064, '953', 'Jéssica Leal Palácio', 2, 2, '00057212295', 'jleal7555@gmail.com', '(69) 99343-3049', '1991-08-09', 1, 'Verificar a Possibilidade no Tratamento  ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59036590, '238', 'Jessica Leite Araujo De Souza', 2, 2, '05038914284', NULL, NULL, '1984-08-03', 3, 'rotina ginecologica, alega irregularidade mesntrual, nodulo de mama em usg.
Conduta: trazer usg de mamas já realizado, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59036480, '233', 'Jessica Moraes Dos Santos', 2, 2, '05038914284', NULL, NULL, '1992-06-27', 3, 'Deseja tirar o diu, pois quer engravidar.
Ao exame:
paciente em posição ginecoligica, inserido especulo, vizualizo fio do diu, presença de secreção amarelada com odor.
Conduta: retirada do diu, gynotran + secnidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61009078, '737', 'JESSICA MOTA SALES NOVAIS', 2, 0, '02127450264', NULL, '(69) 98453-0586', '1996-02-21', 1, 'IDADE 29 ANOS 
G0 P0
DUM: 15 DE JAN
MC: DIU DE COBRE INSERCAO VOV DE 2024 

QP: PACIENTE REFERE SUA, ACOMPANHANDA DE DISMENORREIA, REALIZOU EXAMES E APRESENTOU  ANEMIA 
FEZ INTERNACAO PARA SUA 
PACIENTE REFERE DESEJO DE RETIRAR O DIU 

USG TV 26/01
UTERO 57, END 15 MMM , OD 6,3
OE 9,0 DIU NORMOPOSICIONADO
PACIENTE DESEJA MANTER ACO QLARIA 

AO EXAMES
COLO CENTRALIZADO, VISUALIZO FIO DO DIU 

CONDUTA: 
ORIENTACOES 
RETIRADA DE DIU 

 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61398071, '839', 'JESSICA VANESSA', 2, 0, NULL, NULL, '(69) 9969-0110', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59928659, '550', 'Jhemily dorado Bezerra', 2, 1, '03219873227', NULL, '(69) 8446-8048', '1998-03-14', 1, 'IDADE 27 ANOS 
DUM: 31/07/24 ( FAZIA USO DE GESTRINONA, PAROU EM JAN. DE 2025 ), POR ESTEÉTICA 
G 0 P0
MC. PRESERVATIVO
MENARCA : 13 ANOS
UPCCU: 2025
COMORBIDADES: SOP,  NIVEL GLICEMICO ALTERADO HIPERGLICEMIA 
MEDICACAO EM USO: PEELINGI INTIMO / METFORMINA EM CREME/ 

QP: AVALIAÇÃO DA REGIAO , DEVIDO HIPERTROFIA DOS PEQUENOS LABIOS, ESCURECIMENTO DA REGIAO INTIMA, 
ALEGA TAMBEM QUE MAIS OU MENOS 6 MESES ESTA EM AMENOREIA, FEZ USO DE IMPLANTE DE GESTRINONA, NAO REALIZOU USG TV RECENTE 
APRESENTA RESULTADO DE EXAMES 26/05/25

AO EXAME: 

HIPERTROFIA E ASSIMENTRIA DOS PEQIENOS LABIOS, ESCURECIMENTO DA REGIÃO  INTIMA, RAIZ DA COXA, INTERGLUTEO, FLACIDEZ DOS GRANDES LABIOS

CONDUTA: USG TV 
gestrinona 75 mg     66 kg 
nadh 200 mg 
resveratrol 200 mg 

04/08/2025
usg TV 31/07/2025
utero 54,75 end 3,4 mm
od 10,7 e oe 9,14 ovarios policicisticos 

paciente médica, fará controle metabolico/hormonal
orientações 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60030043, '569', 'Jheneffer Arise Vieira Labajos', 2, 1, '01264870221', NULL, '(69) 99362-4326', '1993-12-22', 3, 'dum: 25/07/25
mc: PRESERVATIVO
G4 P3A1
UPCCU: +3 ANOS 

paciente refere lombalgia, secreção vaginal com odor 
usou creme vaginal que nao sabe o nome, com melhora parcial 

CONDUTA: 
TERICIN AT 
SECNIDAZOL', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61656965, '889', 'JHENIFER NATANA DOS SANTOS', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033846, '230', 'Joana DARC De A Magalhães', 2, 0, '05038914284', NULL, NULL, '1992-06-25', 3, 'paciente em uso de selene, pois elaine ciclo apresentou irritabilidade, ganho de peso.
peso 85kg
apresenta resultado de exame 14/11/23
hb 11,5, ht37,60, leuco 6,900, glicemia 102.
paciente refere dor pelvicaa cronica + 6 meses, não melhora com ponstan, melhora com buscofen.
condunta: ibuprofeno 600mg, dipirona 1g, hemmolip, selene.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61743694, '906', 'Joana Oitaiã da Silva', 2, 0, '28540700204', NULL, '(97) 98439-8996', '1967-12-27', 1, 'idade: 58 anos 
DUM: 54 ANOS 
G2P2A0
MC: VASECTOMIA
UPCCU: 2024
MMG 2024
USG TV 2024

QP: SEM QUEIXAS 

COLO CENTRALIZADO, PUNTIFORME, MUCO HIALINO
CISTOCELE GRAU III, PERDA DE URINA A MANOBRA DE VALSALVA 

CONDUTA: ORIENTACOES
USG TV
USG DE MAMAS
MMG
EXAMES 
COLETADO PREVENTIVO EM MEIO LIQUIDO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62171986, '991', 'JOCELMA COELHO DO NASCIMENTO', 2, 0, '92734278200', NULL, '(69) 99315-8575', '1988-06-25', 3, '### ANAMNESE GINECOLÓGICA

**Paciente:** Joselmo Coelho do Nascimento
**Idade:** 40 anos.

**Queixa principal:**
Consulta de rotina ginecológica, sem queixas no momento.

**História da doença atual:**
Paciente de 40 anos, comparece à consulta para avaliação ginecológica de rotina. Encontra-se **assintomática no momento da consulta**, sem queixas ginecológicas atuais.

**Antecedentes pessoais:**

* Comorbidades: nega.
* Alergias medicamentosas: nega.

**Antecedentes cirúrgicos:**

* Cesariana prévia.
* Nega outras cirurgias prévias.

**Antecedentes ginecológicos:**

* Menarca aos 10 anos.
* Último exame citopatológico do colo uterino (preventivo): realizado em 2025.
* Mamografia: não realizada.

**Antecedentes obstétricos:**

* G2 P2 A0.
* 01 parto normal.
* 01 parto cesáreo.

**Método contraceptivo:**

* Vasectomia do parceiro.

**Hábitos e atividade física:**

* Refere atividade física regular, incluindo treinamento funcional e jump.

**Revisão ginecológica:**
No momento, sem queixas ginecológicas relatadas.

**Impressão clínica:**
Paciente de 40 anos, assintomática, em consulta ginecológica de rotina, sem comorbidades ou alergias conhecidas, com antecedente obstétrico de dois partos e contracepção por vasectomia do parceiro.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61067464, '762', 'Jocimeire Portugal Rodrigues', 2, 0, NULL, NULL, '(69) 9391-9286', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60043998, '577', 'Joelen Oitaia Da Silva', 2, 0, '01657880206', NULL, '(97) 98439-8996', '1992-06-05', 1, 'IDADE 33 ANOS
DUM: 11/07/2025
MC: ACO 
G1 PC
UPCCU: 2022 ( COLETOU JULHO ESTA NO AGUARDO DO RESULTADO) 
COMORBIDADE: NEGA 
CANUTAMA

PACIENTE REFERE QUE QUANDO REALIZOU A COLETA DE PREVENTIVO APRESENTOU SANGRAMENTO NO COLO UTERINO
USG TV 30/07/2025
UTERO 77,7, ENDOMETRIO 6,5 MM / OD 3,9 / OE 2,9 = CISTO EM OD (2 CISTOS SIMPLES 1,5 E 1,1)

AVALIAÇÃO DO COLO UTERINO  
COLO ANTERIOR EM FENDA, CISTO DE NABOTH AS 2 HORAS, COLO SANGRANTE A COLETA 
TV: AUSENCIA DE DOR A MOBILIZACAO DO COLO

CONDUTA: ORIENTACOES, SECNIDAZOL, GYNOTRAN , TRIPLO A 
COLETADO PREVENTIVO


06/08/2025
PREVENTIVO  05/08/2025 - 08:40: NEGATIVO PARA NEOPLASIA 
PACIENTE REFERE QUE FEZ USO O GYNOTRAN COM MELHORA DO QUADRO
ORIENTCAOES
---------------------------  // ------------------------------------
03/07/2026
Canutama
idade 34 ANOS 
G1 PC
DUM:  ------
MC: IMPLANON
COMORBIDADE: NEGA 
ALERGIA A PLASIL 
PREVENTIVO  05/08/2025 - 08:40: NEGATIVO PARA NEOPLASIA 

QP: PACIENTE VEM PARA TINA GINECOLÓGICA, ALEGA QUE HÁ 2 SEMANAS APRESENTOU PRURIDO VAGINAL, ONDE FEZ USO DE GINOCALISTEN E MELHOROU, NO MOMENTO SEM QUEIXAS 

AO EXAME: COLO CENTRALIZADO, PRESENCA DE ECTOPIA,  DISCRETA SECRECAO ESBRANQUICADA COM GRUMOS EM PAREDE, PRESENCA DE CISTOS DE NABOTH AS 8/ 9/ 1H 

CONDUTA: 
ORIENTAÇÕES
TRIVAGEL POR 10 DIAS 
EXAMES LAB
COLETADO PREVENTIVO EM MEIO LIQUIDO 
-----------------------------------------------
retorno on line 06/08

PACIENTE REFERE MELHORA DO QUADRO CLINICO, NO MOMENTO AINDA ESTA FAZENDO USO DE ZAILA, PERGUNTA SE PODE INGERIR BEBIDAS ALCOLLICA, ORIENTO AGUARDAR OS 30 DIAS DE TRATAMENTO 

PREVENTIVO E USG TV DENTRO DA NORMALIDADE 

CONDUTA: RETORNO ANUAL, OU ANTES SE INTERCORRENCIAS 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61638902, '883', 'Joelma Oliveira Guimarães Lozano', 2, 0, '90620504099', NULL, NULL, '1983-05-02', 1, 'IDADE 43 ANOS 
G2 P2N A0
MC: ------
DUM: 2024
COMORBIDADE: NEGA 
MEDICACAO EM USO: SERTRALINA 
UPCCU: MARCO DE 2025
COMORBIDADES: CRISE DE ANSIEDADE
UMMG: 2025 

PA 131 X 79 MMHG 
PESO: 56700G 


QP: PACIENTE REFERE QUE PAROU MC EM DEZEMBRO E ATUALMENTE ESTA SEM USO DE METODO CONTRACEPTIVO, 

CONDUTA: ORIENTACOES 
EXAMES LAB 
USG TV
USG DE MAMAS 
CONVERSO SOBRE AS TECNICA DE ESPELHAMENTO, MUSICA PARA MUDANCA DE FREQUENCIA PPARA ANSIEDADE
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58983060, '148', 'Joice Araujo Dos Santos', 2, 0, '91167248287', NULL, '(69) 99262-2251', '1983-06-03', 3, 'paciente vem para mostrar resultado de uso tv 31/01/25
utero 118,63, presenca de mimosa intramural  1,3 x 1,1 
endometrio 7 mm // od 5,62 // oe 4,96 

paciente deseja gestar, marido com espermograma ok (sic)
pccu: ---

solicitar  exames Lab na próxima consulta ( ver Lab da intimavie )', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59576882, '519', 'Joisy Francinara Pereira Prates', 2, 0, NULL, NULL, '(69) 9304-9997', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59209848, '427', 'Jonora', 2, 0, '05038914284', NULL, NULL, '1999-11-19', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61063035, '761', 'JOSELIA SILVA DOS SANTOS', 2, 2, '82049300204', NULL, '(69) 98131-7661', '1974-07-30', 3, 'IDADE: 51 ANOS 
DUM: JANEIRO DE 2026
G2 P2 A0
MC: -------
UPCCU: AGUARDANDO RESULTADO 
UMMG 2023

QP: PACIENTE VEM PARA APRESENTAR RESULATDO DE EXAMES LAB
CONDUTA: ORIENTACOES 
AGUARDO RESULTADO DE PREVENTIVO
AGUARDO RESULTADO DE MMG 
SOLICITO UUSG DE MAMAS E USG TV 
Exames laboratoriais do dia 12/01/2026 colesterol total 238 LDH 150 HDL 55 Triglicerídeos 61 TGP 23 TGO 26 o ureia 23 glicemia de jejum 112 tsh 1,15 t 4 livre 1,12 ferro sérico 97 hemograma hemoglobina 14,4 hematócrito 41,6 leu 5700 plaqueta 339000 sorologia não reagente exame de urina não infeccioso exame de fezes negativo vitamina D32 Vitamina B12 341 ferritina 175 fsh 41 hemoglobina glicada 5,7 LH 14 progesterona zero ponto 21 prolactina 5,7 testosterona 11

CONDUTA:
ORIENTACOES
ENTREGO AMOSTRA GRATIS DE DOSS 15 000 UI 1 POR SEMANA
DOZEMAST 1 CP 1 VEZ AO DIA 
APLAUSE 1 CP 1 X DIA 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033676, '226', 'Josiely Holanda Meireles Alves', 2, 2, '05038914284', NULL, NULL, '1979-05-17', 3, 'paciente  refere que procurou atendimento medico em 02/05/2023 com climaterio e adenomiose, fez uso de natifa pro e   por 30 dias e parou por conta propria.
momografia 2023, luto do pai em 2023.
conduta:  exames lab, usgtv, preventivo, psicologo caps.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59428946, '480', 'Josiene Pereira Da Silva', 2, 2, '00264098285', NULL, '(69) 9274-5470', '1994-08-19', 1, 'paciente em uso de Engov 
apresenta USG TV  29/08/2025
UTERO 153,15, END DIU NORMOPOSICIONADO, OD 35,72 PRESENCA DE CISTO HEMORRAGICO / OE 5,58
PACIENTE REFERE DIMINUICAO DA LIBIDO 
O MARIDO NAO TEM DISPOSICAO SEXUAL 

retorno dia 13/10
paciente refere dificuldade para dormir por conta do bebe, refere amenorreia, em uso de sermaglutita
fazendo academia 

ao exame: colo centralizado, visualizo fio do dia , presença de secreção amarelada, sangraste a coleta 

conduta: crevagin
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61465501, '846', 'Josilene de Assis Gonçalves Silva', 2, 2, '32692927249', NULL, '(69) 9280-4381', '1969-06-18', 1, 'idade: 57 anos 
PLANO DE SAUDE NEGA 
G 2 P2 A0
DUM: 2011 - HISTERECTMIA POR MIOMATOSE UTERINA - SEM TRH
COMORBIDADES: NEGA 
HISTORIA DE LEUCEMIA PAI E FILHO 
EXERCICO FISICO 3 X SEMANA 
QP: PACIENTE REFERE NODULO NA TIREOIDE COM PUNCAO NEGATIVA, ALEGA ABANDONO DE TRH, ALEGA DESANIMO, DIMINUICAO DA LIBIDO, 
ALEGA ITU MAIS OU MENOS 40 DIAS 

CONDUTA:
ORIENTACOES
DENSITOMETRIA OSSEA
EXAMES LAB 


ORÇAMENTO – PROCEDIMENTO ESTÉTICO ÍNTIMO

Paciente: Josilene da Assis

Procedimento: Aplicação de ácido hialurônico na região do Ponto G

Descrição do procedimento:
A aplicação de ácido hialurônico no Ponto G é um procedimento minimamente invasivo que visa aumentar o volume e a sensibilidade da região, promovendo melhora na resposta sexual e no prazer feminino.

Indicações:
•	Diminuição da sensibilidade íntima
•	Dificuldade em atingir orgasmo
•	Busca por melhora da qualidade da vida sexual
•	Complemento em tratamentos de rejuvenescimento íntimo
Benefícios:
•	Aumento da sensibilidade local
•	Potencialização do prazer sexual
•	Procedimento rápido e minimamente invasivo
•	Resultados imediatos
•	Sem necessidade de cirurgia

Valor promocional:
R$ 2.100,00

Observações:
•	Procedimento realizado em ambiente adequado e por profissional habilitado
•	Podem ser necessários retoques conforme resposta individual, sendo cobrado uma taxa de 900,00



•	A aplicação de ácido hialurônico na região do Ponto G costuma ser simples, mas envolve uma área sensível. Logo após, é comum haver leve inchaço, sensibilidade ou desconforto. Ficar sentada por muito tempo (como em uma viagem de carro) pode aumentar o incômodo e até prolongar o edema.
•	Recomendação geral:
•	Evitar viagens longas nas primeiras 24 a 48 horas
•	Se for inevitável, fazer pausas frequentes para caminhar e aliviar a pressão local
•	Usar roupas confortáveis e evitar compressão na região
•	Seguir rigorosamente as orientações do profissional que realizou o procedimento
•	Outros cuidados importantes no pós:
•	Evitar relações sexuais por alguns dias (geralmente 3 a 5, conforme orientação)
•	Evitar exercícios físicos intensos nas primeiras 48 horas
•	Manter higiene adequada da região
•	Se a viagem for curta (menos de 1–2 horas) e você estiver sem dor significativa, geralmente não há problema.
 
Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação de pós-operatório (imediato e dia anterior ao procedimento) 
•	O orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou do início do parcelamento.

Atenciosamente,
Dra. Christiane Calixto 
CRM-3316 
------------------------
03/06/2026
exames lab 
Exames laboratoriais do dia 28/04/2026 estradiol inferior a 20 progesterona 1,3 prolactina 11,9 vitamina B12 895 hemoglobina glicada 5,4
Exames laboratoriais do dia 7/05/2026 cortiça 11,4 como sistema 8,3 magnésio 22 vitamina D28 ferro 119 ferritina 245 insulina 8,8 fsh 53 LH 38 testosterona total 835 SB SLHS 36 cobre 170 5 82 selênio 116 vitamina 0,6 vitamina E 19,8 vitamina C um PCR não reagente EAS não infeccioso

exames lab neessita de reposicao de vit d 
hormônios lenzetto e utrõgestán 

paciente refere melhora canal vaginal ( diminuindo a flacidez, melhora da lubrificação, melhora das fissuras no introito vaginal 

conduta:

exames lab neessita de reposicao de vit d 
hormônios lenzetto e utrõgestán 
laser intimo 2 sessao  
paciente deseja preenchimento do ponto g no mesmo dia do laser intimo 
NOME: Josilene de Assis Gonçalves Silva


Uso transdérmico 

1.	Lenzetto 1,53 mg/spray  __________________01 TUBO
Aplicar 01 pump, na pele seca do antebraço interno, após o banho com a pele seca

Uso oral

2.	UTROGESTAN 100MG ____________________01 CAIXA 
Tomar 01 comprimido via oral á noite 

reavaliar os exames após 3 meses de uso de hormônio lenzetto e utrõgestán 

bioestimuladr de colágeno para melhorar a flacidez, existe uma discreta hipertrofia de pequenos lábios, porem em posição ortostática é quase imperceptível, 
fazer bioestimulador para verificar antes 





', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033873, '231', 'josilene ferreira lima amaro', 2, 2, '05038914284', NULL, NULL, '2023-05-18', 3, 'paciente  refere dor em baixo de ventre, alega purido em região intima.
apresenta usg tv 07/07/23
utero 139, endometrio 9,7mm, od9,6, cisto simples.
secreção esbranquiçada fluida com odor.
tv dor a mobilização do colo.
conduta: ceftriaxona, azitromicina, secnidazol, metrozidazol, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60702724, '701', 'JUCELANE ABADIA PINHEIRO', 2, 0, '00176228241', NULL, '(69) 99362-2757', '1988-10-27', 3, '37 ANOS
G2 P2 
MC: PRESERVATIVO
UPCCU: 04/04/2025: NEG PARA NEOPLASIA 


QP: PACIENTE REFERE QUE MAIS OU MENOS 15 ANOS VEM COM SECRECAO AMARELADA E ODOR
ALEGA TAMBEM DOR EM BAIXO, DISPAREUNIA 
TRATAME4NTO PARA DIP


16/12/2025
37 ANOS
G2 P2 
MC: PRESERVATIVO
UPCCU: 04/04/2025: NEG PARA NEOPLASIA 

ao exame:
colo centralizado, em fenda , presença de secreção esbranquiçada com grumos 

conduta: coletado preventivo convencional, prescrevo crevagin e fluconazole 1 /7 dias 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61278314, '804', 'Juciele cosmo da silva', 2, 0, '06539961286', NULL, '(69) 9266-5883', '2009-10-09', 1, 'idade: 16 anos 
menarca 10 anos 
sexarca: 14 anos 
DUM 27 /03
MC: -------
parceiros 2 

QP: PACIENTE RELATA QUE NAO GOSTA DE TER RELACAO SEXUAL, POR VERGONHA DA REGIAO INTIMA 
HIPERTROFIA E EXCESSO DE PELE NO CLITORIS 
CONDUTA: NINFOPLASTIA E CAPUZPLASTIA 
11.150,00 a vista ou 12.950 no credito 
realizar 2 sessões de laser por operatório 

REALIZADO NINFOPLASTIA E CAPPLASTIA

Ninfoplastia (redução dos pequenos lábios) e Capuzplastia (redução do capuz do clitóris):
Marcação:
Delimitação prévia da área a ser ressecada, respeitando a anatomia e simetria dos pequenos lábios, evitando ressecção excessiva.
Ressecção:
ressecção da borda livre dos pequenos lábios;
Hemostasia:
Realizada com eletrocautério
Síntese:
Sutura com fios absorvíveis (ex: vicryl 4-0  contínuos,
Aplicação de pomada antibiótica tópica.

Orientações quanto a repouso relativo, abstinência sexual por cerca de 30 dias e cuidados com higiene.

Procedimento realizado em ambiente ambulatorial.
Tempo médio: 1 hora e meia 

06/05
paciente refere que apresentou baixa imunidade, fez algumas vitamina injetáveis
19 dias pós operatorio de ninfoplastia e capuzplastia - foto em anexo
paciente gostou do resultado, refere melhora na vestimenta e movimentação

retorno com 3 meses 
solicitar exames lab de vitaminas 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59430279, '481', 'Jucineide Rodrigues da Silva', 2, 3, '99939991215', NULL, '(97) 8435-5343', '1984-12-10', 1, 'IDADE: 40 ANOS
G 3 PN3 
DUM: MAIO/ 2025
MC: LT
UPCCU: + 3 ANOS
SOLTEIRA 

QP: DESEJA AVALIACAO HARMONIZACAO INTIMA 

RETORNO ON LINE
EXAMES LAB 
VITAMINA D E B12 BAIXA
CONDUTA; MELHORA ALIMENTAÇÃO PRINCIPALMENTE GLICEMIA, COLESTEROL, SUPLEMENTAR VITAMINA D E B12 480,00 OU 530,00 VEM DIA 12/07 OU 22/07 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59136555, '389', 'Judite  Queite n batista', 2, 0, NULL, NULL, NULL, NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61090209, '772', 'Júlia Noemi Kuriyama Bandeira', 2, 0, '06087565205', NULL, '(69) 9223-2722', '2011-08-18', 1, 'IDADE: 14 ANOS 
MENARCA: 11 ANOS 
SEXARCA: NEGA 
VACINA: OK
COMORBIDADE: NEGA
MEDICACAO NEGA 
ALERGIA: NEGA 
DUM: 20/01/2026

QP: PACIENTE REFERE DOR EM FOSSA ILIACA, MAE REFERE QUE TOMA POUCA AGUA ( URINA MUITO ESCURA)

AO EXAME
ABDOME FLACIDO, DOR A PALPACAO PROFUNDA EM FOSSASILIAS

CONDUTA: 
ORIENTACOES
INGESTA DE LIQUIDO
TRIPLO A
EXAMES LAB 
RNM PARA PESQUISA DE ENDOMETRIOSE 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59619161, '529', 'Julia Serafim Menegucci Pereira', 2, 0, NULL, NULL, '(69) 8120-9517', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033668, '225', 'Juliana Claudia Machado  Cunha', 2, 0, '05038914284', NULL, NULL, '2012-08-18', 3, 'irregularidade menstrual
conduta: exames lab, pelvica.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033898, '232', 'Juliana Da Costa Salles', 2, 2, '05038914284', NULL, NULL, '1998-01-05', 3, 'rotina ginecologica, sem queixas.
solicito: usgtv, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58958640, '107', 'Juliana Freitas Ferreira', 2, 2, '01231476206', NULL, '(69) 9213-6568', '1999-10-04', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59089808, '332', 'Juliana Reis Fonseca', 2, 0, '04950152297', NULL, '(69) 99329-6920', '2006-12-20', 3, '18 ANOS
G0 P0
SEXARCA: 17 ANOS
COMORBIDADES: NEGA 
MEDICACAO EM USO ROUCUTAN 
MC ACO - IUMI 

QP: PACIENTE REFERE QUE ESTA FAZENDO USO DE ACO, FEZ PAUSA DE 7 DIAS, POREM APRESENTA - SE COM SANGRAMENTO VAGINAL, JA RETOMOU USO DE NOVA CARTELA 

CONDUTA: EXAMES LAB, BETA, USG TV, RETORNO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59033719, '227', 'Juliana Reis Fonseca', 2, 1, '05038914284', NULL, NULL, '2004-12-20', 3, 'paciente refere que  iniciou ciclo 21 e parou por conta propria.
orientações: exames 11/06 hb 14, glicose 90,06, colest 143, trigl 58.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60305291, '625', 'Juliana Vieira Da Silva', 2, 2, '03123287297', NULL, '(69) 99251-6891', '1996-10-24', 3, 'paciente vem para rotina ginecológica 
assintomática no momento 
conduta: solicito exames lab, exames e imagem e preventivo 
deseja planejamento familiar - deseja anticoncepcional  mensal ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59089404, '330', 'Juliane Nogueira Cavalheiro', 2, 0, NULL, NULL, '(69) 9360-0286', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60596631, '676', 'Jullya Rojas nunes de souza', 2, 2, '00686946286', NULL, '(69) 99309-3785', '1990-11-17', 3, 'IDADE: 35 ANOS
DUM: 22/09/2025
MC: NENHUM
G 0P0 
UPCCU: +2 ANOS 

QP: PACIENTE REFERE HISTORICO DE MIOMATOSE UTERINA, 
CICLO DE 7 DIAS, FLUXO, MODERADO /LEVE ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59469952, '488', 'Juscelina Flôres', 2, 0, '28981405204', NULL, '(69) 99347-3252', '1971-01-11', 3, '54 anos
G2 P 2N 
DUM: HSITERECTOMIA SUBTOTAL: AOS 29 ANOS 
UPCCU: 2024
COMORBIDADES: HIPERLIPIDEMIA 
MMG JA REALIZADA - AGUARDO RESULTADO DE EXAMES
medicação em uso: SINVASTATINA, 

QP: PACIENTE REFERE PERDA DE URINA AOS PEQUENOS ESFORCOS , ALEGA DOR EM BAIXO VENTRE, ALEGA DISPAREUNIA, LIBIDO BAIXO 
APRESENTA EXAMES LAB 
Exames laboratoriais do dia 14/05/2025 hematócrito 41,7 hemoglobina 13,4 leucócitos 10290 plaqueta 182000 VHS 83 t 4 livre 1,16 tsh 3,37 Vitamina B12 593 vitamina D 28,5 sorologia não reagente estradiol menor que 5 fsh 52,1 ácido úrico 5,37 creatinina zero ponto 70 glicose 90 gama GT 29 ponto 10 tgo 26 tgp 31,6 triglicerídeos 142 uréia 24 hemoglobina glicada 6,73 colesterol total 287 HDL meia 4,6 PCR 31,6 ldl 28,4

CONDUTA: ORIENTACOES, PREVENTIVO 
ALEGA SECURA VAGINLA- VER LUBRIFICANTE INTIMO E VAGINAL 
29/05
AO EXAME
COLO ATOFICO, PRESENCA DE POLIPO ?, SECRECAO ESBRANQUICADA SEM GRUMOS, SEM DOR A MOBILIZACAO
PRESENCA DE DISTOPIA VESICAL LEVE, A MANOBRA DE VALSALVA 
COLETADO PREVENTIVO
SOLICITO ESTUDO URON=DINAMICO
REPOSICAO DE VITAMINA A DEK 480 A VISTA OU 560 NO CARTAO 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59444172, '483', 'Jussara Alice Beleza Macêdo', 2, 0, '52054004200', NULL, '(97) 8114-1622', '1981-04-05', 1, '44 ANOS 
DUM: AGOSTO 2024

Exames laboratoriais 28/04/25
 hemoglobina 12,5 hematócrito 39,6 leucócitos 4350 plaquetas 263000 glicose 91 uréia 22 creatinina 0,7 triglicerídeos 47 colesterol total 172 ldh 81 HDL 81 tgo 23 tgp 16 gama GT 12 tsh 1,95 t 4 livre 12 Vitamina B12 567,8 FSH 53,9 LH 45,6 Prolactina 7,67 estradiol 44 SHBS 117 testosterona livre 0,21% progesterona zero, sempre 3 sorologia não reagente Vitamina D 36,11 EAS turbo NÃO INFECCIOSO 
Preventivo do dia 24/ 3 /2025 negativo para neoplasia
 ultrassonografia transvaginal 16/04/25 útero de 28,9 cm³ ovário direito 1,2 cm³ ovário esquerdo 1,6 cm³ hipótese diagnóstica ou vários com dimensões reduzidas
 ultrassonografia de mamas do dia 16/04/2025 BIRADS 1  
DENSITOMTRIA  óssea: BI RADS 1 

NO MOMENTO EM USO DE PROGESTERONA 100 MG 1 VEZ A DIA, ESTROGEL 0,6 MG TRANSDERMICO Á NOITE, LIBIDO NORMAL, ALEGA DIMINUICAO DA MEMORIA 

CONDUTA: 
ORIENTACOES, SOLICITO VITAMINAD. B12, MAGNESIO
ESTROGEL 1 PUMPS, PROGESTERONA 100 MG
PRESCREVO MELATONINA 
RETORNO ON LINE 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62077443, '971', 'Kailany Lourenço de Araújo', 2, 0, '02802403257', 'kailanylourenco45@gmail.com', '(69) 99392-3854', '2004-11-29', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58994485, '172', 'Kamilly Kristyna F Dos Santos', 2, 0, '05038914284', NULL, NULL, '2007-02-12', 3, '1 consulta no ginecologista, acompanhada da mãe andreia, nega secreção vaginal, nega disuria, nega nodulo mama.
Conduta: metodo contraceptivo noregyna, programar coleta preventivo, oriento sobre dst, usgtv, exames lab, uso de preservativo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58994502, '173', 'Karine Sousa Rodrigues', 2, 2, '05038914284', NULL, NULL, '2000-04-30', 3, 'Secreção amarelada com odor fetido, sem purido.
1 relação sexual agosto de 2023.
Conduta: gynotran, secnidazol, exames lab, converso sobre planejamento familiar.

24/10
retorna com queixa de secreção vaginal, apos o uso da medicação.
apresenta exames 12/09
snr
conduta: secnidazol, gynotran 2 cx, alta d 50,000 us, iumi.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59173337, '409', 'Karla Cristina Keller Moraes Dutra', 2, 0, '00897380207', NULL, '(69) 9231-2889', '1994-07-04', 1, 'IDADE: 30 ANOS
DUM: 25/03
MC: NOREGYNA
G 0P0
UPCCU: HOJE NO AGUARDO
COMORBIDADES: OFFORECTOMIA OUTUBRO DE 2024 / HPV
MEDICACAO: NO MOMENTO EM REPOSICAO DE VIT B 12 E VIT D
ALERGIA NEGA 

PACIENTE VEM PARA AVALIACAO DA REGIAO INTIMA, ALEGA QUE OS PEQUENOS LABIOS SAO GRANDES E INCOMODAM, TEM VERGONHA DO PARCEIRO
HIPERTROFIA DE PEQUENOS LABIOS
7MIL A VISTA 
CLAREAMENTO 400,00 SESSAO
HIDRATACAO E INTESIFICADOR 120,00
 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59392153, '463', 'Karla Francisca Lemos Da Silva Assunção', 2, 0, '55883036287', NULL, '(69) 99984-4876', '1974-10-04', 1, 'PACIENTE COM QUEIXA DE QUEIXAMCAO NO INTRIOTO VAGINAL

AO EXAME
PRESENCA DE GRUMOS EM GRANDE QUANTIDADE DESDE O INTRITO ATE COLO DO UTERO E PAREDE VAGINAL

CONDUTA: ORIENTACOES, CREVAGIN 14 DIAS, ITRACONAZOL 

04/07/2024
HISTRECTOMIA
ESTRADIOL GEL, TESTO IMPLANTE
PACIENTE REFERE QUE INICOU QUADRO DE ardência vaginal, nega secreção vaginal, iniciou há mais ou menos 3 dias, alega odor forte na urina da manha 
exame especular: colo ausente, presença de secreção grumos, esverdeada
hiperemia do canal 
conduta: orientações,exames lab, fluconazol, gynotran 

MARQUEI RETORNO DA PACIENTE NO DIA 08/08 PARA O DIA 09/08 AS 14:30 E PACIENTE DESMARCOU SABADO DE MANHÃ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58920701, '19', 'Karla Silva Postiglione', 2, 0, '66318122249', NULL, '(69) 9283-5518', '1980-01-18', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58917982, '10', 'Karlla candido gonçalves', 2, 0, NULL, NULL, '(69) 9303-4073', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60879879, '725', 'Karynne Oliveira de Lima', 2, 0, NULL, NULL, '(69) 8454-2486', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58994441, '171', 'katia Cilene Gomes Ribeiro', 2, 2, '05038914284', NULL, NULL, '1976-07-18', 3, 'Paciente com disminorreia, alega que pos cesarea realizou miomecomia.
Usgtv 06/03/23
utero 120cm, mioma submuco e subseroso, end 0,9cm polipo, od 4,1, oe 7,8, presença de foco de endometriose.
Conduta:rnm pelve, curetagem uterina.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61620856, '879', 'Katiane Botelho Martins dos Santos', 2, 0, '90620504099', NULL, NULL, '1987-05-07', 1, 'paciente tem desejo de implante hormonal
fazer orçamento
porem antes irar usar lenzetto e ultrogestan 
gynotran para flora mista no preventivo ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61933242, '950', 'Kauane Thais Farias de Queiroz', 2, 1, '05733567260', 'kkthaispvh35@gmail.com', '(69) 99278-4651', '2003-01-08', 3, 'IDADE: 23 ANOS 
DUM: INICIO DE JULHO E NAO PAROU ATE O MOMENTO 
G 0 P0 
UPCCU: 2025

QP; PACIENTE REFERE DESEJO PARA RETIRARDA DE IMPLANON INSERCAO DEZEMBRO DE 2025 

CONDUTA;
ORIENTACOES 
EXAMES LAB
USG TV
PREVENTIVO 
CONTROLE DO SANGRAMENTO DISFUNCIONAL DO IMPLANON
NOME: Kaune Thais Farias de Queiroz


Uso oral


1.	ACIDO MEFENÂMICO 500 MG ________01 caixa
Tomar 01 comprimido via oral de 8/8 horas, por 5 dias  

2.	Etinilestradiol 30mcg + levonorgestrel 150 mcg ____01 cx
Tomar 01 comprimido via oral, no mesmo horário,, durante 4 semanas, iniciar no primeiro dia do ciclo



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62116840, '981', 'KAUANE THAIS FARIAS DE QUIROZ', 2, 0, '05733567260', NULL, '(69) 99347-5454', '1972-06-29', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59668493, '535', 'Kaune Isabele Lima Rodrigues', 2, 0, '03074093250', NULL, '(69) 9273-4334', '2010-10-05', 3, 'IDADE: 14 ANOS
MENARCA 11 ANOS
DUM: 21/06/25 - DURACAO DE 5 DIAS, FLUXO INTENSO

PACIENTE ACOMPANHADA DA MAE ELCIANE, NEGA DISMENORREIA, PRURIDO NAS PERNAS 
PRESENCA DE ESCABIOSE EM RAIZA DA COXA
IVERMECTINA, PERMETRINA
PACIENBTE REFERE PANO BRANCO
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60900292, '728', 'Kawany Pereira dos Santos', 2, 2, '71233733249', NULL, '(69) 9227-0826', '1993-07-11', 1, 'idade: 32 anos 
mc: aco sem pausa
COMORBIDADES: NEGA 
ALERGIA ALIMENTAR 
DUM: 03/01/2026
G1PC
UPCCU: ABRIL 2025

PACIENTE VEM PARA INSERCAO DE IMPLANON, TROUXE O MESMO 
PACIENTE COM BRACO ESQUERDO FLETIDO 
ASSEPSIA
ANESTESIA 
INSERIDO IMPLANON
PACIENTE SENTE BASTAO 
ATO SEM INTERCORRENCIA 

ENTREGO CARTAO DE IMPLANON E TCLE ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59077102, '308', 'Keiliane Limoeiro da Silva', 2, 0, NULL, NULL, '(69) 9314-4769', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59392756, '465', 'Keith Soares', 2, 0, NULL, NULL, '(92) 99508-7591', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58990024, '169', 'Kelly Cristunna Da S volski', 2, 0, '05038914284', NULL, NULL, '1989-06-09', 3, 'dor em baixo do ventre.
Conduta: preventivo, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58994582, '174', 'Kelly Garcia Silveiro', 2, 0, '05038914284', NULL, NULL, '2010-05-17', 3, 'Q.P: secreção vaginal amarelada com odor.
ao exame secreção  esbranquiçada com grumos, presença de tinea corporea, face e antebraço +-5cm.
Conduta: flucunazol, por 4 semanas, exames lab, retorno.

24/07/2023
paciente acompanhada da irmã, refere irregularidade menstrual.
apresenta exames 29/11
vitamina d 18,06 ng/ml
conduta:retorno 3 meses checar imunidade.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59169434, '404', 'Kemilly Kethellyn Farias Da Conceição', 2, 0, '06555554207', NULL, '(69) 99349-8731', '2009-03-10', 3, 'IDADE 16 ANOS 
DUM: 21/03/25 IRREGULAR
MENARCA 11 ANOS 
SEXARCA: NAO INICIOU
VACINACAO EM DIA 
ALERGIA NEGA
COMORBIDADES: RINITE ALERGICA 

QP: PACIENTE REFERE DISMENORREIA, INCAPACITANTE, NECESSIDADE DE MEDICACAO EV, 
PACIENTE APRESENTA EXAME DO DIA 21/03/2025: EAS INFECCIOSO 13 - 15 PIOCITOS FEZ TRATAMENTO COM AMOXILINA E CLAVULANATO E CEFALEXINA 

CONDUTA: ORIENTACOES, UROCULTURA E USG PELVICA COM PREPARO INTESTINAL

07/05/2025
paciente retorna acompanhada da mãe Nedina
RNM  25/04/25 UTERO 53 CM , ENDOMETRIO 5MM, OD E OE NORMAIS exame normal 
EXAMES LAB 24/04: GLICOSE 85, COLESTEROL 127, TRIGLICERIDEO 65,6,T4 LIVRE 1,25, TSH 2,3, UROCULTURA NAO HOUVE CRESCIMENTO 

CONDUTA: POSNTAN + DIPIRONA 1 G SE DOR
RETORNA PARA AVALIAR ADAPATACAO DA MEDICACAO 

03/06/2025

DUM: 20/05/2025
PACIENTE REETORNA COM MAE , ALEGA MELHORA PARCIAL DA DISMENORREIA APOS USO DA MEDICACAO, 
OPTAMOS POR ACRESCENTAR ACO , VISTO AS COLICAS, ACNES E FLUXO DESREGULAR 
PACIENTE REFERE QUE INICIOU AS ATIVIDADES SEXUAIS 

CONDUTA: SOLICITO BETA HCG 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989998, '168', 'Kethelen Lonhany N Campos', 2, 1, '05038914284', NULL, NULL, '1999-08-12', 3, 'Rotina ginecologica.
exames lab, usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58995595, '176', 'Kethllen Matos Floresta', 2, 1, '02348628236', NULL, '(69) 99386-7326', '1995-07-06', 3, '3 meses aminorreia , fez uso incorreto de acj (noregyna), fez exames beta hcg negativo.
Orientações: sobre uso de preservativo devido a gravidez indesejada e irregularidade  mc  acj.
solicito: exames lab e usgtv.

30 ANOS 
IMPLANON

QP: VEM PARA MOSTRAR RESULTADO DE PCCCU 
PRENETIVO INSATISFATORIO 
CONDUTA: COLETAR NOVO PREVENTIVO 
COLETA DE PREVENTIVO COM VIDEO 
 190, 00 A VISTA OU 250 NO CEREDITO EM 3 X
EXERESE DE VERRUGA NA NUCA 1200, 00 A VISTA OU 1500 EM 3 X NO CREDITO 

------------
27/03
DUM: -----
IMPLANON - INSERCAO EM DEZEMBRO 
nega alergia, REFERE CIRURGIA PREVIA DE CESAERA 

PACIENTE VEM PARA EXERESE DE VERRUGA VULGAR E COLETA DE PREVENTIVO 
AO EXAME 
COLO CENTRALIZADO, PUNTIFORME, DISCRETA SECRECAO ESBRANQUICADA, SEM ODOR ( FISIOLOGICO?)

VERRUGAR VULGA EM REGIAO CERVICAL ( FOTO EM ANEXO)

CONDUTA
ORIENTACOES 
RETORNO 
COLETO PREVENTIVO CONVENCIONAL 
ENTREGO MATERIAL PARA ANATOMOPATOLOGICO 
ENTREGO TERMO DE CONSENTIMENTO 

Paciente: Kethllen Matos Floresta

Eu___________________________________________________________________, abaixo assinada, declaro que fui devidamente informada pela médica assistente sobre o procedimento de exérese de verruga vulvar localizada em região cervical, a ser realizado em consultório, sob anestesia local.
Fui esclarecida de forma clara e compreensível sobre os seguintes pontos:

1.	Sobre o procedimento: 

A exérese consiste na retirada da lesão (verruga) por meio de técnica cirúrgica simples, realizada no consultório, com uso de anestesia local, com o objetivo de tratar a lesão e possibilitar, se necessário, avaliação histopatológica.

 
2.	O procedimento: é indicado para remoção da lesão vulvar, seja por desconforto, crescimento, risco de transmissão (como no caso de HPV) ou necessidade de diagnóstico definitivo.
3.	Anestesia:

Será realizada anestesia local, podendo causar leve desconforto no momento da aplicação.
4.	Riscos e possíveis complicações:

Fui informada de que, apesar de ser um procedimento de pequeno porte, podem ocorrer:
•	Dor leve a moderada no local
•	Sangramento
•	Infecção local
•	Cicatriz
•	Recidiva da lesão
•	Reações à anestesia local (raras)

5.	Cuidados pós-procedimento:

Receberei orientações quanto à higiene local, uso de medicações (se necessário) e sinais de alerta. Comprometo-me a seguir corretamente as recomendações. 

6.	Consentimento:

Declaro que tive a oportunidade de fazer perguntas, que foram devidamente esclarecidas, e que estou de acordo com a realização do procedimento.












Responsabilizo o envio do material retirado para exame anatomopatológico.

Local e data: ______________________________________

Assinatura da paciente: ______________________________

Assinatura da médica: _______________________________


Dra Christiane Alves Calixto 

CRM: 3316



NOME: Kethllen Matos Floresta
Uso oral
1.	TRIPLO A _______________________ 01 CAIXA 
Tomar 01 comprimido VO 12/12 horas, por 3 dias. 
Uso tópico 
2.	TROK -N __________________________01 TUBO
Aplicar no local 3 vezes ao dia, no local, por 3 dias.
CUIDADOS APÓS EXÉRESE DE VERRUGA 
1. Curativo e higiene
•	Manter o local limpo e seco nas primeiras 24 horas.
•	Após esse período, realizar higiene diária com água e sabonete neutro.
•	Secar delicadamente, sem esfregar.
2. Cuidados locais
•	Evitar manipular, coçar ou retirar a crosta formada.
•	Não aplicar produtos caseiros ou substâncias sem orientação.
•	Evitar roupas apertadas se a lesão for em área de atrito.
5. Exposição solar
•	Evitar exposição solar direta no local, por 30 dias.
•	Se área exposta, usar protetor solar após cicatrização inicial (geralmente após queda da crosta).
6. Sinais de alerta (procurar atendimento)
•	Vermelhidão intensa, calor local ou inchaço progressivo
•	Saída de secreção purulenta
•	Dor intensa ou piora progressiva
•	Febre
•	Sangramento persistente
7. Cicatrização
•	A cicatrização geralmente ocorre em 7 a 14 dias, pode haver formação de pequena cicatriz ou alteração de cor local.

--------------------
retorno
local da exegese em cicatrização, sem pontos de pustulacao
14/04biopsia 31/03: QUERATOSE SEBORREICA.
preventivo 31/03: neg para neoplasia 
conduta; orientações 
retorno com 6 meses avaliar cicatrização ou antes se intercorrência ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61898620, '939', 'Kezia do Espirito Santo Silva', 2, 0, '90620504099', NULL, '(69) 9919-4979', '2000-12-15', 1, '- Interesse em fazer o laser
PLANO DE SAUDE : NEGA 
idade: 35 anos
dum: 18/07
G4 P4N A1
MC: DIU DE COBRE - INSERCAO 2023 E VASECTOMIA 
UPCCU: 2024
ALERGIA NEGA 
COMORBIDADE:  -------
MEDICACAO  -----------
SONO: INSONIA E ACORDA VARIAS VEZES A NOITE E DIFICULDADE DE INICIAR O SONO
EXERCICCIO FISICO: NEGA
CONSTIPACAO: REGULAR

QP:  SECRECAO VAGINAL QUE VARIA DO BRANCO A ESVERDEADO, PERTO DA MENSTRUAÇÃO E COM ODOR QUE MELHORARVA APOS TERMINO DA MENSTRUAÇÃO, POREM NO MOMENTO A SECRECAO CONTINUA MESMO APOS TERMINO DA MENSTRUAÇÃO.
PACIENTE REFERE PERDA DA SENSIBILIDADE DURANTE O ATO SEXUAL, REFERE ALARGAMENTO DO CANAL VAGINAL 
PACIENTE REFERE TAMBEM ALGUNS SINTOMAS DO CLIMATERIO 

ao exame
presença de hipertrofia de pequenos lábios 
presença de laceração de perineo posterior - apresentando uma vala 
colo centralizado, diu mau posicionado, presença de secreção amarelada com grumos em parede e odor 

CONDUTA: 
ORIENTACOES
LASER INTIMO
FISIOTERAPIA PELVICA
EXAMES LAB
PREVENTIVO  COM VIDEO COLPOSCOPIO 

-------------------------------------------------
NOME: Kezia do Espirito Santo Silva

Uso oral

1.	Secnidazol 1 g______________________04 comprimidos 
Tomar 02 comprimidos via oral dose única para o casal.

2.	Fluconazol 150 mg _________________03 comprimidos 
Tomar 01 comprimido via oral hoje, repetir com 3 dias, após 7 dias.

3.	Zaila ___________________________01 caixa
Tomar o1 comprimido via oral, 1 vez ao dia, por 3 meses. 

Uso vaginal

1.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.
2.	Gynotran ______________________________01 caixa
Aplicar 01 óvulo via vaginal, 1 vez por semana. 






ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: Kezia do Espirito Santo Silva
Procedimentos: Labioplastia e períneo posterior

Prezada Cecília,
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia e períneo posterior.
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
Períneo posterior procedimento indicado para restaurar a anatomia e proporcionar melhor sustentação dos tecidos da região perineal..
Esses procedimentos, quando realizados em conjunto, proporcionam melhoria estética, conforto íntimo, aumento da autoestima e bem-estar funcional da paciente. Reconstrução e fortalecimento da região posterior do períneo.
•	Correção da flacidez decorrente do parto vaginal e da episiotomia.
•	Melhora do suporte e da firmeza do canal vaginal.
•	Potencial melhora do conforto durante as relações íntimas.
•	Procedimento realizado em ambiente de consultório, com maior comodidade.
•	Recuperação geralmente mais rápida quando comparada a procedimentos realizados em centro cirúrgico, conforme indicação médica.
•	Atendimento individualizado, com acompanhamento em todas as etapas do tratamento.



Valores dos procedimentos:
•	Labioplastia: R$ 7.650,00
•	Períneo posterior 7890,0

Total: R$ 15.000,00 à vista

Ou: R$ 15.540,00 parcelado em até 6 vezes


 
Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação de pós-operatório (imediato e dia anterior ao procedimento) 
•	O orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou do início do parcelamento.

Atenciosamente,

Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima

--------------------------------------03/08/2026



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59054985, '265', 'Kezia Gonçalves Gorayeb', 2, 0, '03682152296', NULL, '(69) 9230-5867', '2000-11-19', 1, 'FISSURA VAGINAL

DIPROPIONATO DE BETAMETASONA 0,5 MG/G 

exame para coleta de biopsia 
690,00 a vista / 730,00 2x credito





16/04/2025
PREVENTIVO 19/02/25 NEGATIVO PARA NEOPLASIA - 
paciente refere que continua com sensibilidade na região intima, mesmo após uso de corticoide
ao exame
Fissura próxima a clitoris 
conduta: thuya, cha de crajiru 
------------------------------------
07/05
COLO COM SE CRECAO ESBRANQUICADA COM GRUMOS 

TERICIN AT , , ZAILA, ZELIX 
EXAMES LAB, EXAMES DE IMAGEM 

Exames laboratoriais do dia 23/05/2026 hemoglobina 13,6 hematócrito 40,2 leuco 5550 plaqueta 4 245 hemoglobina glicada 5.4 tsh 2,09 t 4 livre 1,4 fsh 4,5 LH 3,4 sorologia não reagente anti h bs reagente insulina 4,6 cortisol 17,2 como cisteína 12,4 vitamina 0,4 vitamina D 34,2 vitamina B12 316 vitamina E 8,9 estradiol 58 progesterona zero ponto 52 zinco 91 cobre 91 teste 27 é com esse reagente ácido úrico 3,9 t go 20 tgp 23 triglicerídeos 54 colesterol 162 glicose 92 por é 45 creatinina 0,7 ferritina 70 ferro sérico 102 magnésio 1,8 PCR 02 Vitamina C 1,3

USG DE MAMAS 23/05: BI RADS 3 
USG TV 23/05: DIU NORMOPOSICIONADO, SEM ALTERACOES 
NO MOMENTO ESTA MENSTRUADA VEM OUTRO DIA PARA COLETA DE PREVENTIVO EM MEIO LIQUIDO 

----------------------------------
10/06
DUM: 30/05
COLO PUNTIFORME, SANGRANTE A COLETA 

CONDUTA: COLETADO PREVENTIVO MEIO LIQUIDO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58990028, '170', 'Kinberly Cauane Dantas Aguiar', 2, 1, '05038914284', NULL, NULL, '2009-12-15', 3, 'Paciente refere irregularidade menstrual, em atividade sexual, porém sem metodo contraceptivo.
conduta: exames lab e peventivo.

28/05/24
herps
vdrl + 1:32
preventivo negativo para neoplasia + gardnerella, hiv, anti hcv negativo.
Conduta:gynotran, secnidezol, p benzatina, controle de vdrl.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59458213, '486', 'Klyvanir Celina Cruz de Araújo', 2, 0, NULL, NULL, '(69) 9956-1814', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61228701, '799', 'Laiane dos Santos Silva', 2, 0, '02834228230', NULL, '(97) 8420-8188', '2005-11-02', 1, 'Sou a paciente Laiane, queria saber como faço para pegar um laudo médico sobre a minha endometriose para da entrada em um benefício. 
Com isso preciso de um laudo, a Dra. Conseguiria me entregar um?


conduta: 
LAUDO MÉDICO GINECOLÓGICO – FINALIDADE INSS/CONVÊNIO Paciente: Laiane dos Santos Silva Idade: 20 anos Exame base: Ultrassonografia transvaginal Data do exame: 07/03/2026 Descrição dos achados: Exame de ultrassonografia transvaginal evidenciando achados sugestivos de aderências pélvicas, com alterações compatíveis com processo inflamatório crônico pélvico. Os achados são compatíveis com hipótese diagnóstica de endometriose, devendo ser correlacionados com quadro clínico de dor pélvica crônica e possíveis sintomas menstruais incapacitantes. Diagnóstico provável: Quadro sugestivo de Endometriose com provável formação de aderências pélvicas. Impacto funcional: A paciente pode apresentar, conforme evolução clínica: Dor pélvica crônica recorrente Dismenorreia importante Limitação para atividades laborais e físicas durante crises Possível prejuízo funcional temporário em períodos sintomáticos Conduta e recomendações: Acompanhamento com ginecologia especializada Considerar investigação complementar (ex.: ressonância magnética pélvica) Tratamento clínico conforme sintomas e resposta terapêutica Avaliação periódica da capacidade funcional Conclusão: Achados compatíveis com doença ginecológica crônica de caráter potencialmente incapacitante em fases de exacerbação, podendo justificar afastamento laboral conforme avaliação clínica e perícia médica.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59176862, '416', 'Lara Emanuelle S De Olivera', 2, 1, '05038914284', NULL, NULL, '2001-06-04', 3, 'Gestante de 8 sem e 4 dias.
usg 1 trim 02/06/23 6 sem e 1 dia.
lab 05/06, glicose 92, b+, eas normal.
conduta: anti-hbs, dieta, usg morf.

26/07/23
13 sem e 5 dias, sem queixas, em uso de materna gest.
totg 23/06  93/139/115.

conduta: dieta, perfil 4 pontos, retorno 01/08/23

01/08/23
maternagesta.
ig 14 sem e 5 dias, usg 02/06/23 6 sem e 1 dia.
perfil glicemico 27 a 01/08, 13% alterado.
obs: alega  que após ingesta de arroz ocorre pico glicemico.
pa: 110x70mmhb bcf: 157bpm mf+.
conduta: perfil 4 pontos, dieta, hidroginastica.

25/10/23
assitomatica.
26 semanas e 6 dias pa:110x60mmhg
bcf: 137bpm  mf:+
conduta: materna gest, omega 3 + vitd.

21 dias pós parto vaginal 17/01/24
laceração sem sinais flogistico, alega boa amamentação exclusiva..
solicito: hc, pcr, lactato.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61838450, '929', 'Lara Emanuelle Souza de Oliveira', 2, 2, '04521934277', 'laraoliveira2186@gmail.com', '(69) 9811-4178', '2001-06-04', 3, 'Idade: 25 anos
D.N.: 04/06/2001
D.U.M.: está atualmente
M.C.: DIU de cobre
G.P.A.: G1 P1 A-0
Menarca: 14 anos
Estado civil: Casada
Comorbidade: não
Medicação em uso: não
Cirurgia prévia: não
Último preventivo: não fez
Última mamografia / U.M.M.G.: não tem
Atividade física: não
Q.P.: menorragia
P.A.: 121 × 71
Peso: 112.800
Evolução/Observações:
Paciente refere escape durante o mês.
Alega acne, oleosidade capilar.
Parceiro sente o DIU durante o ato sexual.
Conduta:
Orientações
USG TV
Exames lab.

----------------------------

03/09/2026

USG TV 13/08: SEM VOLUME E DIMENSOES NO LAUDO, DIU BEM POSICIONADO

Exame	             Resultado	        Unidade*
Hemoglobina	12,10	g/dL
Hematócrito	        37,3	%
Leucócitos	     7.860	/mm³
Plaquetas	379.000	/mm³
Cálcio	         9,9	mg/dL
Colesterol total	136	mg/dL
Creatinina	0,7	mg/dL
Colesterol HDL	45	mg/dL
TGP (ALT)	21	U/L
Triglicerídeos	104	mg/dL
Ureia	26	mg/dL
LDH	70	U/L
Glicose	101	mg/dL
Ferritina	44	ng/mL
Ferro sérico	35	µg/dL
Hemoglobina glicada (HbA1c)	5,6	%
Estradiol	42	pg/mL
Insulina	15	µUI/mL
LH	9,1	mUI/mL
T4 livre	1,42	ng/dL
TSH	1,81	µUI/mL
Vitamina B12	445	pg/mL
SHBG	37	nmol/L
Testosterona total	54	ng/dL
Testosterona livre	0,91	—
Androstenediona	1,14	—
Cortisol	17,9	µg/dL
FSH	65	mUI/mL
Vitamina D	18	ng/mL


CONDUTA: 
ORIENTACOES
DIETA ALIMENTAR
SUPLEMENTACAO DE VITAMAINA B12 E D ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60074207, '595', 'Lara Geovanna Silva Carvalho', 2, 0, '05841272276', NULL, '(69) 99223-8722', '2006-06-08', 3, 'upccu - 11/04/2025 neg neoplasia + gardnerella 
paciente refere secreção vaginal com prurido 
refere dor em baixo ventre

gynotran, secnidazol', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59119195, '352', 'Larissa Beatriz Lima Dos Santos', 2, 0, '96642971272', NULL, '(69) 99309-5663', '1998-10-17', 3, 'IDADE: 26 AMOS
G0 P0
DUM: 16/02
MC: PRESERVATIVO

ENDOMETRIOMA 

PACIENTE REFERE DOR EM BAIXO VENTRE, ATRASO MENSTRUAL DE 4 DIAS, NEGA SECRECAO VAGINAL, NEGA DISURIA, 
AGUARDO RESULTADO DE EXAME DE IMAGEM ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59329566, '448', 'Larissa de Moraes Coene', 2, 0, '03101204208', NULL, '(69) 9947-0339', '1998-02-03', 1, 'idade: 27 anos
DUM: 16/04/25
G0P0
MC: -----
UPCCU: + 1 ANOS 
COMORBIDADES: NEGA
NEGA ALERGIA 

QP: PACIENTE REFERE SECRECAO AMRELADA, COM ODOR, NEGA PRURIDO, NEGA DISPAREUNIA, NEGA DISURIA, NEGA MASTALGIA 
COLO CENTRALIZADO, PUNTIFORME, SECRECAO FLUIDA AMARELADA COM ODOR

CONDUTA: SECNIDAZOL, METRONIDAZOL GEL, FLUCONAZOL

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59018559, '191', 'Larissa Kelly Nogueira Vieira', 2, 0, '01749855330', NULL, '(98) 8264-1037', '1995-08-16', 1, 'idade: 29 anos 
G 0 P0
DUM: 07/02/24
MC: DIU DE COBRE E PRATA ( INSERCAO EM JULHO DE 2024) - 
COMORBIDADES- ENXAQUE COM AUREA 
QP: PACIENTE REFERE QUE APOS INSERCAO DO DIU APRESENTA SANGRAMENTO VAGINAL INTENSO E PROLONGADO, ALEGA ESCAPE 
PACIENTE FEZ ESCOLHA DO DIU NAO HORMONAL, POR CONTA DA ENXAQUECA E DESEJAVA MENSTRUAR, 

USG DE MAMAS 22/04: BI RADS 1
USG TV 04/2024: UTERO 55,6 - HISTEROMETRIA COLO 2,5 / CAVIDADE UTERINA 3,3 CM / OVARIOS POLICISTICOS
USG TV 10/07/24: UTERO 60 - OD6,7 OE  7,3 
PREVENTIVO 06/04: NEGATIVO PARA NEOPLASIA + VAGINOSE (REALIZADO TRATAMENTO - GYNOTRAN)

COLO CILINDRICO, PUNTIFORME, OBSERVO FIO DO DIU, DISCRETO SANGRAMENTO VAGINAL, SEM ODOR 

CONDUTA: SOLICITO EXAMES LAB E USG TV 


--------------------------  ///   ----------------------

06/03/2025
PACIENTE VEM OARA RETIRADA DO DIU
APRESENTA EXAMES LAB 27/02
VITAMINA D 13,6 
VITAMINA B 12 482
FERRITINA  46,33
TSH 2,13
T 4 LIVRE 0,90
FERRO 63,9
HB14,4
HT 40,2
LEUCO 9690/ PLQ 291/ COLESTEROL 172 / TRIH]G 67 / GLICOSE 73
USG TV DIU NORMOPOSICIONADO, UTERO 57, 1, ENDOMETRIO 4,6 MM OD 10,7 OE 11,8 
PACIENTE EM POSICAO DE LITOTOMIA 
ASSEPSIA
VISUALIZO FIO DO DIU
RETIRO O DIU COM PINCA DE JACARE 
APCIENTE VISUALIZA  O DIU FORA DO UTERO 
HEMOSTASIA 

CONDUTA: ORIENTACOES
RETIRADA DO DIU
REPOSICA DE VITAMINAS B 12 E VITAMINA D 460,00
REPOSICAO COM 1 MES  05/04 SABADO 
PRESCREVE MANUTENCAO APOS 1 MES ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59111725, '347', 'Larissa Wirla Araujo Rosa', 2, 0, NULL, NULL, '(69) 9208-3718', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62215142, '1002', 'LARYSSA TOTE MOURA', 2, 0, '60868912301', NULL, NULL, '2003-09-23', 1, 'Primeira Consulta veio pelo Tem Saúde ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60051697, '582', 'Laudiane da conceição lima', 2, 0, '54552974220', NULL, '(69) 9368-6551', '1991-08-27', 1, 'IDADE: 33 ANOS
G2 P1 N A0
DUM: 17/03/2025

PACIENTE JA INICIOU PRE NATAL 
ALTO RISCO B 24 
TS O RH POSITIVO, SNR EXCETO HIV , GLICEMIA 77 / TOXO IMUNE TSH 1,18 / T4 LIVRE 0,91 / ANTI HBS REAGENTE 
UROCULTURA 09/07 NEG
CARGA VIRAL NAO DETECTAVEL 

USG 13/06: MORF DO 1 TRIM 13 SEM E 2 DIAS , NORMAL 

QP: PACIENTE SEM QUEIXAS NO MOMENTO  DA CONSULTA, DESEJA FAZER A CESAREA E LAQUEADURA 

IG 20 SEM E 6 DIAS PELO USG 13/06/25 COM 13 SEM E 2 DIAS 
PA: 120 X 60 MMHG
PESO 65KG
BCF:155 
AU: 21 CM 
MF: PRESENTE
MENINA: ANA CLARA 
CONDUTA: ORIENTACOES, PASSAR ORCAMENTO DA CESAREA 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61386174, '831', 'LAUHANY DA SILVA MENDONÇA', 2, 0, '06005141295', NULL, '(69) 98417-3583', '2002-01-09', 3, 'IDADE 24 ANOS 
G1 P0 A1
DUM: 
UPPCU: ALTERADO EM ANEXO 
QP: PACIENTE REFERE DOR EM BAIXO VENTRE, NO MOMENTO ESTA MENSTRUADA 
CONDUTA: COLPOSCOPIA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58983936, '152', 'Laura Catarina Valerio Resende Matos', 2, 0, '02195511206', NULL, '(69) 99398-6346', '2007-11-03', 3, 'idade 17 anos
menarca 10 anos 
sexarca 16 anos (NUMERO DE PARCEIRO )
mc: ------
ATIVIDAE FISICA AUSENTE 
DN 03/11/2007
DUM: 

QP: PACIENTE SECRECAO VAGINAL ESBARNQUICADA, NEGA PRURIDO, SEM ODOR, INICIOU HÁ MAIS OU MENOS DEZEMBRO, 

COLO CENTRALIZADO COM GRUMOS E SECRECAO AMRELADA E BOLHOSA 

SECNIDAZOL E GYNOTRAN
EXAMES LAB, USG TV
CONVERSO SOBRE METODO CONTRACEPTIVO. IRA FAZER A ESCOLHA NA PROXIMA CONSULTA 

03/04/2025
EXAMES LAB 06/03 VIT B 12 407, VIT D VIT D 22,7 
PREVENTIVO 21/02/2025: NEGATIVO PARA NEOPLASIA 

CONUTA: REPOSICAO DE VIT B 12 E VIT D INJETAVEL 2 DOSES, SERA REALIZADA POR CONTA PRORPIA , REPETIR EXAMES COM 3 MESES 
METODO DE ESCOLHA DIU DE PRATA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59175709, '413', 'Laura Isabel Lins De Brito', 2, 1, '05038914284', NULL, NULL, '2002-01-23', 3, 'Paciente refere secreção vaginal esbranquiçada, não puriginoso, com odor.
conduta: exames lab, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60849016, '717', 'Layana de Oliveira Paes Galvão', 2, 2, '00775824208', NULL, '(97) 9156-7545', '1992-04-02', 1, '33 anos 
DUM: 27/12/2026
MC: SELENE 
G2 P2 A0
UPCCU: 2 ANOS - RESULTADO NEGATIVO SIC 

COMORBIDADES: NEGA 
ALERGIA : NEGA
EXERCICIO FISICO: NEGA
SONO: PRESERVADO
RELACAO SEXUAL:  BAIXA LIBIDO 
NAO AMAMENTOU - MAMAILOS INVERTIDOS 

QP: PACIENTE REFERE QUE VEM PARA ROTINA GINECOLOGICA, SONO INTENSO, BAIXA LIBIDO ( DESANIMO PARA INICIAR AS RELACOES SEXUAIS), SENTE FOME, MAS NAO SENTE VONTADE DE SE ALIMENTAR, NEGA CORRIMENTO, NEGA SINUSSORRAGIA, NEGA DISURIA, NEGA NODULO MAMARIO.
AO EXAME
MAMAS NUMERO DE 2, AUSENCIA DE NODULOS, MAMAILOS INVERTIDOS 
COLO CENTRALIZAADO, PUNTIFORME, PRESENCA DE SECRECA ESBRANQUICADA ESPESSA, PRESENCA DE RAIA DE SANGUE E ECTOPIA

CONDUTA: ORIENTACOES
COLETADO PREVENTIVO MEIO LIQUIDO
SOLICITO EXAMES LAB
USG TV, USG DE MAMAS
FLUCONAZOL E CREVAGIN
NEXTELA 
\\
RETORNO
USG DE MAMAS 22/01/26: BI RAS 1
EXAMES LAB E PREVENTIVO EM ANEXO

REALIZO PROTOCOLO ZMA EV , ADEK E B12IM', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60491996, '644', 'Layza Eduarda Guedes dos Santos', 2, 2, '05588751221', NULL, '(69) 9324-8002', '2003-09-16', 1, 'idade: 22 anos
DUM: 05/10/2025
MC: -----
UPCCU: ABRIL


PACIENTE VEMA PARA INSERCAO DO IMPLANON
ATO SEM INTERCORREENCIA
ENTRE TERMO DE CONSENTIMENTO 

30/12/2025
PACIENTE APRESENTA ESCAPE, ACOMPNHADA DE DISMENORREIA , COMO ESTA EM USO DE ABSORVENTE ALEGA CANDIDIASE 

AO EXAME;
COLO CENTRALIZADO, PRESENCA DE SECRECAO ESBRANQUICADA, COM GRUMOS E BOLHOSA 

CONDUTA:
ORIENTACOES
PONSTAN
NOME: Layza Eduarda Guedes dos Santos

Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos via oral dose única para o casal.
2.	ZELIX 150 mg _________________02 comprimidos
Tomar 01 comprimido via oral HOJE e repetir com 7 dias     
3.	GINOBIOTTA ___________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses 


Uso vaginal 

4.	Gynotran ___________________________01  caixas 
Aplicar 01 óvulo via vaginal, à noite, por 7 dias.

----------  /// ----------
06/03/2026
vem para primeira dose de vacina para candida
----------
10/04
paciente em uso de implanon, refere escape ( discreto há 9 dias)
acido mefenamico 500 mg 8/8 horas 
1 dose de vacina para imunidade 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59175624, '411', 'Leia Alencar De Freitas', 2, 2, '05038914284', NULL, NULL, '1976-07-20', 3, 'Paciente refere perda de urina aos esforços.
Conduta: solicito estudo urodinamico, programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59038004, '245', 'Léia Carolina Barbosa Sobreira Luz Dalligna', 2, 0, '00088704203', NULL, '(69) 9988-1265', '1988-10-13', 1, 'idade: 36 anos 
PROFESSORA PERSONAL TREINER
DUM28/02/25
MC: VASECTOMIA 
G2 P2C A0
UPCCU: +3 ANOS 
CMORBIDADES: NEGA
MEDICACAO EM USO ESPIROLACTONA E METFORMINA (ESTICA - NUTROLOGO)
EXERCIO FISICO REGULARMENTE

QP: ROTINA GINECOLÓGICA, SEM QUEIAS NO MOMENTO DA CONSULTA
PACIENTE REFERE QUE O VOLUME DOS PEQUENOS LABIO ESTA INCOMODANDO COM A VESTMENTA, ISSO FOI APOS EMAGRECIMENTO E TALVEZ UMA FLACIDEZ 
EMAGRECIMENTO EM 1019 DE 15KG EM 3 MESES  
AO EXAME
AUSENCIA DE COCHIM GORDUROSO NOS GRANDES LABIOS, ESCURECIMENTO DA REGIAO INTIMA, ASSIMETRIA DOS PEQUENOS LABIO LADO DIREITO COM PREGA ACESSORIA E CAPUZ DE CLITORIZ 
INDICO PREENCHIMENTO COM ACIDO HIALURONICO 2 ML EM CADA LADO 
PEELING 400,00 A SESSAO 
NINFOPLASTIA, CAPUZPLASTIA, PREENCHIMENTO DE GRANDES LABIOS COM 2ML DE CADA LADO ( CASO NECESSITE DE MAIS SERA COBRADO) VALOR 13.500,00

NINFOPLASTIA E CAPUZPLASTIA 7500,00
PREENCHIMENTO 2ML 6000,00

VAI TENTAR VER A POSSIBILIDADE DE REEMBOLSO PELO PLANO DE SAUDE ( CONSULTA COM PSIQUIATRA E RESULTADO FUNCIONAL COM A NINFOPLASTIA DEVIDO SER PERSONAL)  

 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60563202, '662', 'Leide Da Costa Tejas', 2, 0, '77146247287', NULL, '(69) 99326-6214', '1981-01-12', 3, 'IDADE 44ANOS 
DUM: 2024
UPCCU: 19/03/2025: NEGATIVO PARA NEOPLASIA 
MMG17/09/2025: BI RADS 1 
Exames laboratoriais do dia 15/07/2025 glicose 90 triglicerídeos 144 ureia 30 creatina 0,7 colesterol 253 ldh 180 é uma globina glicada 5,99 TGU 18,4 TGP 17,3 estradiol 39,3 sorologia não reagente t 4 livre 1,21 progesterona 0,06 prolactina 10,5 tsh 0,59 hemoglobina 13 hematócrito 38,6 leuco 7090 plaqueta 270000 exame de urina infeccioso NITRITO + frequentes Cristais de oxalato de cálcio

CONDUTA: 
ORIENTACOES 
PROGESTERONA, ESTRADIOL, 
REPOSICAO DE VITAMINAS 460,00
PRESVREVO PROGESTONA ANOITE, STELE EM DIAS ALTERNADO, OESTROGEL
RERONO COM 1 MES 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60020522, '566', 'Leide Márcia Aparecida Santos', 2, 0, NULL, NULL, '(69) 9229-0956', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59248442, '440', 'Leila Graziela silveira', 2, 0, NULL, NULL, '(69) 9907-8850', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59469905, '487', 'Leiliane Paulino Da Silva', 2, 1, '88397530282', NULL, '(69) 98116-3006', '1985-03-24', 3, 'IDADE: 40 ANOS
DUM: 26/05/25
G2 PN2
MC: -----
NO MOMENTO NAO ESTA EM ATIVIDADE SEXUAL 
UPCCU: 11/09/2024: NEGATIVO PARA NEOPLASIA 
USG DE ABDOME TOTAL: 26/05/2025: NORMAL 

QP: PACIENTE REFERE CANSACO CONSTANTE, ALEGA MASTALGIA DE MAMA ESQUERDA SEMPRE APOS A MENSTRUACAO 
ALEGA ALEGA AUMENTO DO FLUXO MENSTRUAL, USO ABSORVENTE NOTURNO

CONDUTA: ORIENTACOES
EXAMES LAB
USG DE MAMAS E MMG 
TRAZER O RESULTADIO DE USG TV JA REALIZADA SIC  ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60040411, '575', 'Lenilda figueiredo França', 2, 2, '59978740287', NULL, '(69) 9931-1680', '1972-01-16', 1, 'IDADE: 53 ANOS
DUM: FEVEREIRO DE 2025
G2P2 A0
MC: ACI MENSAL
UPCCU: 2024
COMORBIDADES: NEGA
ALERGIA/ MEDICAO: NEGA
EXERCICIO FISICO:  NEGA 

QP: PACIENTE  REFERE SINTOMAS DO CLIMATERO, FEZ USO DE TESTOSTERONA TRANSDERMICO, FEZ TRATAMENTO PARA ANEMIA, ALEGA DISPAREUNIA POR RESSECAMENTO VAGINAL, SEM MELHORA COM USO DE LUBRIFICANTE, NAO LIBIDO 

COLO ATROFICO, SANGRANTE A COLETA 
CONDUTA: COLETADO PREVENTIVO, EXAMES LAB E IMAGEM 
EXAMES DE SANGUE 
998,76 A VISTA E 1132,70 CREDITO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61118588, '778', 'Lenira Lima', 2, 0, NULL, NULL, '(69) 8148-6963', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59163587, '399', 'Lenize leal da  silva', 2, 0, '05038914284', NULL, NULL, '1976-04-10', 3, 'Q.P: caroço na vulva, saiu secreção serosanguinolenta, sem odor .
Ao exame: ausecia de cisto de bartholin ( rompeu?)
Conduta:', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59163475, '395', 'Leticia  Estefany Araujo Paiva', 2, 0, '05038914284', NULL, '(69) 99246-4631', '2001-07-08', 3, 'Paciente refere que a menstruação desce 3 dias e para e depois retorna +- 7 dias.
Apresenta exames lab 10/01/25
hb 13,8, ht 39,7, leuco 6000, plq 226,30, glicemia 84,6, colest 1333, trigl 51, t4 livre 1,74, tsh 4,86, eas normal, vitd 24.
usgtv 06/01/25
utero e ovarios normais, diu normoposicionado.
usgtv 11/06/24 normal.

Conduta: reposição vitD.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61740790, '905', 'Letícia campina geremia', 2, 0, '03880236275', NULL, '(69) 99377-1151', '1999-08-24', 1, 'A paciente Ganhou no Placar do Brasil x Japão e ganhou uma Hidratação Íntima ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61027300, '748', 'LETICIA OLIVEIRA SILVA', 2, 0, '05757692200', NULL, '(69) 99272-0611', '2012-08-11', 3, '13 ANOS 
MENARCA 11 ANOS 
SEXARCA 12 ANOS 

QP: PACIENTE ACOMPANHAADA DA MAE FABIANA, REFERE DOR EM BAIXO VENTRE, CONSTANTE, PIORA AO SE MOVIMENTAR , ALEGA SECRECAO VAGINAL, COM ODOR COM PRURIDO, NO MOMENTO NAO ESTA TENDO RELACAO SEXUAL , ALEGA METRORRAGIA 
PRESENCA DE SECRECAO FLUIDA COM ODOR 
DOR A MOBILIZACAO DO COLO 

CONDUTA: ENTREGO AMOSTRA DE TRIVAGEL , UG PELVICA 
EXAMES LAB 

-----
04/03
Oratoria e do dia 13/02/2026 
hemoglobina de 11 e ht 32 leu com 6700 plaquetas 190000 colesterol 139 creatinina 0,40 107 intrigue cerídeos 57 ureia 22 vitamina B12 335 vitamina D 29,2 ferritina 34 t 4 livre 1,08 tsh 1,58 EAS não infeccioso ultrassonografia pélvica do dia 21/02/2026 útero ante verso fletido volume 85,6 cm³ endométrio 13 mm ovário direito 7,2 ovário esquerdo 13,5

conduta: 
anemia
suplementação com vit b e d 
vi feriu, alta d 50 000 , dozemast
retorno com 1 mes 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59583838, '524', 'Letícia Rani Pimenta Almeida', 2, 2, '05915148344', NULL, '(69) 8144-6373', '1994-12-23', 1, 'IDADE: 30 ANOS
PLANO UNIMED
MENARCA: 12 ANOS
DUM: 18/06/2025
MC: IMPLANON ( INSERCAO EM 2023) 
casada
G0 P0
UPCCU:25/06/2024: NEGATIVO PARA NEOPLASIA 
USG TV 16/12/2024: PEQUENA QUANTIDADE DE LIQUIDO ENTRE OS FOLHETOS ENDOMETRIAIS, 
SONO PRESERVADO
EXERCICIO FISICO: REGULAR
ALIMENTACAO - DIFICULDADE EM LEGUMES 
RELACAO SEXUAL: NDN

QP: PACIENTE REFERE QUE VEM PARA CHECK UP, ALEGA SANGRMANTE DESFAVORAVEL APOS USO DO IMPLANON, ALEGA INCOMODO SESANCAO DE QUIEMADURA NA REGIAO INTIMA
AO EXAME:
COLO ECTOPIA, PRESENCA DE SECRACAO ESBRANQUICADA, BOLHOSA COM GRUMOS EM PAREDE
CONDUTA:
ácido mefenâmico 500 mg tomar 01 comprimido via oral de 8/8 horas por 5 dias ( FAZER RECEITA NO RETORNO)
1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos via oral dose única para o casal. Gynotran ___________________________01 caixa 
Aplicar 01 óvulo via vaginal, á noite, por 7 dias 
EXAMES LAB, USG TV, USG DE MAMAS

________________.  // _______________________
retorno 38/07
Preventivo do dia 26/06/2025 negativo para neoplasia 
exame laboratorial do dia 21/07/2025 exame de urina não infeccioso urocultura não houve crescimento bacteriano hemoglobina 12,5 hematócrito 37 leucócito 6640 plaqueta 194000 hemoglobina glicada 5,5 tsh 2,16 t 4 livre 1,14 insulina 8,9 cortisol 18,5 homocisteína 7,77 Vitamina A 0 43 vitamina C 0,66 Vitamina D 39,1 Vitamina B12 463 estradiol 623 ácido úrico 3,8 TGU 22 tgp 17 gama GT 33 glicose 84 colesterol total 162, triglicerídeos 67 uréia 28 creatinina 0,90 ferritina 21 ferro 66 magnésio 1,9
Exames laterados  Vitaminas, magnésio , ferritina
Ultrassonografia de mamas e regiões axilares no dia 7/07/2025 cisto simples bilateral BIRADS 2 
ultrassonografia transvaginal útero 51,5 cm³ endométrio 3,7 mm o vário direito 41,2 devido a um cisto unilocular paredes finas e  lisas sem certos fluxo ao doppler com volume de 21,7 ( O-RADS 2) ovário esquerdo volume de 8,5 cm³

conduta: e mama
ácido mefenâmico 500 mg tomar 01 comprimido via oral de 8/8 horas por 5 dias
reposição de vitaminas a,d,e,k e b 12 
reforço da b 12 e d  com 45 dias 
retorno com 3 meses para solicitar nova uso tv
entreguei solicitação de uso tv

22/10/2025

Paciente refere SUA com duração +/- 12 dias, alega dr tipo pontada no canal vaginal há 2 dias, atualmente assintomática, nega secreção vaginal, refere secura vaginal

conduta: aguardo usg tv, reposição de vit b 12 e D
1.	Hemolip  ____________________________________01 CAIXA 
Tomar 01 comprimido via oral, durante 60 dias.

     3.VITERGAN master -N  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, durante 60 dias. 

4.	Caldê max __________________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia.
caso usg tv vinherer normal doxiciclina por 14 dias para o SUA,  ou avaliar o resultado do usg tv 

retorno on line 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60899148, '727', 'Letícia Tavares Gasparelo', 2, 0, '02464367273', NULL, '(69) 9261-5885', '2007-09-18', 1, 'FILHA DA PACIENTE: MARIANA TAVARES
idade: 18 anos 
MENARCA: 13 ANOS 
SEXARCA 15 ANOS 
DUM: 05/01/2026
MC: DIU DE COBRE - INSERCAO 2022
COMORBIDAE: NEGA
MEDICACAO: NEGA 
SONO: OK
ALIMENTACAO: REGULAR
EXERCICIO FISICO: AS VEZES 

QP; PACIENTE VEM PARA ROTINA GINECOLOGICA E AVALIACAO DA REGIAO INTIMA 
INCOMODO ESTETICO

AO EXAME:
PRESENCA DE HIPERTROFIA UNILATERAL Á ESQUERDA DE PEQUENO LABIO
PRESENCA DE VERRUGA INTERGLUTO DIREITO
PRESECA DE ESCURECIMENTO EM REGIAO INTIMA ( LASER E PEELIG - COM HOME CARE) 

CONDUTA: 
NIFOPLASTIA + EXERESE DE VERUGA 
CLAREAMENTO REGIAO INTIMA
SOLICITO EXAMES LAB
USG TV _ DIU 
ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: Letícia Tavares Gasparelo
Procedimentos: Labioplastia 
USO ORAL
1.CEFADROXILA 500MG -----------------------------------14 CP
TOMAR 01 CP VO 12/12 HORAS POR 7 DIAS

2.PROFENID PROTECT 200/20------------------------------01 CX
TOMAR 01 CP VO 1 VEZ AO DIA, POR 3 DIAS

3. NOVALGINA 1G --------------------------------------------01 CX
TOMAR 01 CP VO 6/6 HORAS SE DOR 

4.ZIRVIT PLUS--------------------------------------------01 CX
TOMAR 01 01 CP VO 1 VEZ AO DIA,APÓS ALMOÇO

USO TÓPICO
4. ANDOLBA SPRAY ---------------------------------------01 TUBO
APLICAR A CADA 4 HORAS OU APÓS CADA MICÇÃO POR 7 DIAS 

5. NEBACETIN ----------------------------------------------01 TUBO
APLICAR 2VEZES AO DIA, POR 7 DIAS

Prezada letícia,
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia, exérese de verruga vulgar clareamento íntimo
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
O tratamento para clareamento íntimo, combina o uso do laser íntimo, que atua estimulando a renovação celular e a produção de colágeno, com o peeling químico íntimo, que auxilia na uniformização do tom da pele e na redução de manchas. O protocolo é individualizado, respeitando as características da pele e a necessidade da paciente.
Exerese de verruga vulgar O procedimento consiste na retirada da lesão cutânea (verruga vulgar), com anestesia local, onde ser realizado por técnica cirúrgica, eletrocauterização, visando conforto, segurança e adequado resultado estético. O material poderá ser encaminhado para exame anatomopatológico.






Esses procedimentos, quando realizados em conjunto, proporcionam melhoria estética, conforto íntimo, aumento da autoestima e bem-estar funcional da paciente.
Valores dos procedimentos:
•	Labioplastia e exérese de verruga vulgar R$ 4.150,00
•	Clareamento íntimo 400,00 a sessão

 
 
Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação de pós-operatório (imediato e dia anterior ao procedimento) 
•	O orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou do início do parcelamento.

Atenciosamente,

Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima

10/01
REALIZADO NINFOPLASTIA E EXERESE DE VERRUGA VULGAR
ENTREGO RECEITA E SOLICITACAO DE ANATOMOPATOLOGICO 
REALIZADO LASER POS OPERATORIO IMEDIATO
ATESTADO DE 7 DIAS 


12/01/2026:
REALIZO LASER PARA CICATRIZACAO
ORIENTO COMPRESSA GELADA 
-----------------------------------
27/01/2026
paciente sem queixas
usg tv 16/01: diu normoposicionado 

Ultrassonografia do dia 16/01/2026 útero 42,4 cm³ endométrio apresentando de o normal posicionado ovário direito 10 cm³ ovários qer dos 6 cm³ 
exame anatomopatológico de exérese de lesão de nevedo dia 20/01/2026 resultado nevo melanocitico intradérmico 
Laboratoriais do dia 14/01/2026 hemoglobina 12,8 hematócrito 38,1 leucos 7120 plaqueta 337000 vdrl não reagente hemoglobina glicada 4,5% tsh 1,73 t 4 livre 1,46 hepatite b não reagente hepatite c não reagente HIV não reagente insulina 11,4 vitamina D 49,5 Vitamina B12 515 triglicerídeos 109 colesterol 144 TGU 21 tgp 19 glicose 85 uréia 35 creatinina 0,7 ferritina 35 ferro sérico 86 urocultura não houve crescimento bacteriano e es não infeccioso Vitamina C 8,7

conduta: manter vitamina zivit Plus por mais 30 dias 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60201393, '608', 'Letícia Vitória Correa de Assunção', 2, 0, '02019721236', NULL, '(69) 8150-5226', '2000-09-12', 1, 'IDADE: 24 ANOS
DUM: 18/08
MC: IMPLANON
G0 P0 
PREVENTIVO:  1 ANO

QP: PACIENTE REFERE QUE APOS USO DE IMPLANON APRESENTOU ESCAPE MAIS OU MENOS 5 MESES, VAI VENCER EM AGOSTO DE 2025 
APRESENTA USG TV 12/08/25: EXAME NORMAL
ALEGA QUE DURANTE O MES FICA SEM SANGRAMENTO POR MAIS OU MENOS 4 DIAS, E RESTANTE FAZ USO DE PROTETOR DIARIO, NEGA DISMENORREIA, ALEGA DIMINUICAO DA LIBIDO 

CONDUTA: ORIERNTACAO 
SOLICITO EXAMES LAB MEDICACAO 
PRESCREVO DOXICICLINA E LEVONOGESTEREL E ETINILESTRADIOL 

PACIENTE REFERE MELHORA DO ESCAPE APOS USO DE DOXICICLINA E LEVONOGESTEREL E ETINILESTRADIOL 
APRESENTA RESULTADO DE EXAMES VIT D 26,6 E VITAMINA B 12 339 

CONVERSO SOBRE OBSERVAR SE TERA ESCAPE E AI ENTAO DECIDIRAR SOBRE A RENOVACAO DO IMPLANON 
REPOSICA DE VIT B E D 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60544318, '654', 'Lewzeny aurea silva rocha', 2, 5, '65545095268', NULL, '(69) 99274-6263', '1980-06-26', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59321272, '447', 'Lícia Castor Maciel', 2, 0, '02055831216', NULL, '(69) 9287-2316', '1993-09-01', 1, 'IDADE: 32 ANOS
G2 P2 C A 0
MC: PRESERVATIVO
UPCCU: DEZEMBRO DE 2024

QP: PACIENTE REFERE SECRECAO ESBRANQUICADA COM GRUMO, COM ARDENCIA, ODOR DE AZEDO, INICIO HÁ MAIOS OU MENOS 5 MESES, 
PACIENTE REFERE QUE APOS RELACAO SEXUAL O PRESERVATIVO FICOU DENTRO DO CANAL VAGINAL, ALEGA QUE ESAT FAZENDO USO FREQUENTE DA PILULA DO DIA SEGUINTE 

AO EXAME
COLO CENTRALIZADO, PUNTIFORME, ECTOPIA, PRESENCA DE SECRECAO ESBRANQUICADA

CONDUTA: ORIENTACOES, EXAMES LAB, USG TV, GYNOTRAN , ITRACONAZOL, FLUCONAZOL,  CONVERSO SOBRE A VACINA 

------------------------------  // ----------------
DUM: 16/06/25
MC: PRESERVATIVO
SUSPENSO USO DO GYNOTRAN SEMANAL, E OS OVULOS DIARIOS ATÉ CESSAR A MENSTRUACAO
VIT D  E VIT B 12 BAIXA 

CONDUTA: 
FARA USG TV E ENVIARA VIA WHATSS AP 
EXAMES LAB
REPOSICAO DE VIT D E B 12 E REFORCO COM 30 DIAS  ( 460,00) 
PREVENTIVO DEZEMBRO DE 2025 
------------------------  // -------------------------------------
03/06/2025
DUM: 16/06
USG TV UTERO 57,1 , ENDOMETRIO 6,7 / OD 13,2/ OE 11,8, EXAME NORMAL 

CONDUTA: PREVENTIVO EM DEZEMBRO
REFORCO DE VITAMINA EM AGOSTO DE 2025: 460,00
OBSERVAR SE MATEM VAGINOSE DE REPETICAO PARA AVALIAR POSSIBILIDADE DE VACINA 
------------------------------------------------------------------------------------------
01/06/2026
32 anos 
dum: 22/05
mc: preservativo 

QP: DISURIA E HEMATURIA 
COLO EM FENDA, SAIDA DE SANGRAMENTO PELO OCE 

EXAME 27/02/2026: VITAMINA B12 451 / VIT D 39/ TSH 1,31/ T4 LIVRE0,81/ GLICOSE 89

CONDUTA: 
1.	Ciprofloxacina 50Omg _____________________________ 14 comprimidos 
Tomar 1 comprimido via oral de 12/12 horas por 7 dias 

2.	PYRIDIUM 200 MG  _________________________01 CAIXA
Tomar 01 comprimido via oral de 12/12 horas, por 5 dias 

ORIENTO A IMPORTANCIA DA SUPLEMETACAO DE B 12 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61612186, '877', 'Lídia Vitória Albuquerque de Freitas', 2, 0, '90620504099', NULL, '(97) 98415-7525', '2002-03-30', 1, 'Lídia Vitória Albuquerque de Freitas

idade: 24 anos 
DN: 30/03/2002
UPCUU: 2025: POREM NAO APRESENTOU NO MOMENTO DA CONSULTA 
COMORBIDADES: NEGA 
ALERGIAS: NIMESULIDA?
MEDICACAO: NEGA 
DUM: 19/03/2026
PACIENTE ESTUDANTE DE ENFERMAGEM 

QP: INICIAR PRÉ - NATAL, PACIENTE FAZIA USO DE ACO 

####### 1º USG OBSTETRICA 01/06/2026:  11SEM E 2 DIAS 

IG  PELO USG 11SEM E 5 DIAS 
IG DPELA DUm (19/03/2026)  11 SEM 
#########EXAMES LAB01/06
TS O RH POSITIVO / SNR / ANTI HBS NAO REAGENTE 
GLICOSE 81 / HB 11,2/ HT 31,1/ LEUCO 9400/ PLQ 269.000/ CMG IMUNE / TOXO SUCETIVEL / EAS 4-5 PIOCITOS 

PACIENTE EMUSO DE SULFATO FERROSO E ACIDO FOLICO,  NO MOMENTO FAZEBDO USO DE PROTETOR SOLAR 
PACIENTE ESTUDANTE DE ENFERMAGEM 

AO EXAME: 

69.400
pa 110 x 80 mmhg
especular secreção esverdeada bolhosa 
CONDUTA:
USO DE MÁSCARA CONSTANTE 
HTLV 
UROCULTURA 
VITAMINA B 12 
VITAMINA D3
TSH
T4 LIVRE 
PERFIL LIPIDICO 
rubeola 
gynotran
repenseis lipinova
-----------------------------
15/06
ig 13 sem e 2 dias pelo usg 
paciente sem queixas
apresenta usg morfologica do dai 11/06: 12 se e 3 dias, morfológica ok
PA 11 X 70
PESO 69 KG 

CONDUTA: AGUARDO EXAMES LAB 
NOVA CONSILTA DIA 12/07
-------------------------------------
13/07/2026

PACIENTE COM QUEIXAS DE SECRECAO VAGINAL, APOS RELACAO SEXUAL, REFERE QUE FEZ USO DE GYNOTRAN 

AU 17 CM
BCF: 152
PA 130 X 80

CONDUTA: ORIENTACOES
MRPA
REPOSICAO DE VITAMINAS 
CREVAGIN POR 10 DIAS 
---------------------------------------------------  ////----------------------------

18/08/2026

PACIENTE REFERE RINITE E ALERGIA TOPICAS

AO EXAME
BCF: 142
AU 22 CM
PA 130 X 90
ESPECULAR: SECRECAO ESVERDEADA, COM GRUMOS 

CONDUTA: 
ORIENTACOES
OGESTAN GOLD LACFLORE ATE POS PARTO 
SOLICITO EXAMES LAB PRE NATAL 
ECOCARDIOGRAMA FETAL COM 28 SEMANAS 
NOME: Lídia Vitória Albuquerque de Freitas


SOLICITO

HEMOGRAMA 
GLICOSE
VITAMINA D3
VITAMINA B 12
TSH
T4 LIVRE 
HIV I E II
VDRL
HBSAG
ANTI -HCV
ANTI HBS
TOXOPLASMOSE IGG E IGM
HTLV I E II
EAS 
UROCULTURA E ANTIBIOGRAMA 
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                                                    
BILIRRUBINA TOTAIS E FRACOES
ACIDO ÚRICO
LDH 
RELACAO PROTEINA E CREATININA ( NA URINA ) 


USO ORAL

1.	Zaila ________________________________03 caixas
Tomar 01 cápsula, 1 vez ao dia por 3 meses. 

USO VAGINAL 

1.	Gynotran  _____________________________ 1 caixa
Aplicar 01 óvulo via vaginal, por 7 dias.

USO TÓPICO 

1.	HIGI CALM   _____________________________ 1 frasco
Usar 2 vezes ao dia, ou sempre que necessário.

2.	Flogo – rosa _______________________________01 caixa
Diluir 01 envelope em 1 litro de água e fazer banho de assento.

----------------------------------------------------------
14/09/2026
PACIENTE REFERE DESCONFORTO ONTEM, POREM HOJE ASSINYTOMÁTICA

USG OBSTETRICA 14/09/2026: 26 SEM , PESO FETSL 893G, ILA NORMAL, PLACENTA POSTERIOR.

PA 11 X 70
PESO 74 KG 
COLO CENTRALIZADO, PRESENCA DE GRANDE SECRECAO ESBRANQUICADA, SEM GRUMOS, SEM ODOR 
BCF 142 
CREVAGIN










', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59470248, '489', 'Lidiane Barbosa Dos Santos Brito', 2, 0, '67822290215', NULL, '(69) 99282-0605', '1980-05-28', 3, 'IDADE 45 ANOS 
G 2 P 2C
MC: PRESERVATIVO
COMORBIDADES: HAC - LOSARTANA 

QP: PACIENTE REFERE AUMENTO DO FLUXO MENSTRUAL
Exames laboratoriais do dia 15 de outubro de 2024 ácido úrico 4,5 creatinina um, 06 triglicerídeos 74 colesterol 195 HDL 41 ldl 139 15 fsh 7,15 potássio 4,1 LH 1,94 ter 4 livros 0,89 tsh 3,71 hemoglobina glicada 5,5 ultrassonografia transvaginal do dia 16/05/2025 útero 183,5 cm³ apresenta mioma intramural em parede posterior 2,3 cm³ fundi com intramural 2,1 endométrio de 6 mm ovário direito 3,44 ovário esquerdo 2,8 hipótese diagnóstica nódulos uterinos prováveis miomas útero de volume aumentado preventiva do dia 28/11/2024 negativo para neoplasia

CONDUTA: ORIENTACOES, SOLICITO EXAMES LAB 
AVALIAR POSSIBILIDADE DE ACO PARA MELHORAR SANGRAMENTO VAGINAL 

EXAMES DE SANGUE FICOU 266,50 A VISTA', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59266473, '444', 'Lidiane Monteiro da Silva', 2, 0, '05038914284', NULL, '(92) 9148-5522', '1999-11-19', 1, 'IDADE: 27 ANOS
CASADA 
DUM: 26/03/2025
MANAUS 
G:0 P:0 A:0
UPCCU: 20/02/2025 HSIL
MC:
SOP
COMORBIDADE: NEGA 
ALERGIA: NEGA

Q.P: DOR EM BAIXO DO VENTRE HÁ 2 MESES, COM SECREÇÃO AMARELADA, COM ODOR APÓS MENSTRUAÇÃO, NÃO FEZ USO DE MEDICAÇÃO
DIP

AO EXAME: COLO CENTRALIZADO, PUNTIFORME, SECREÇÃO AMARELADA COM GRUMOS E ODOR , DOR A MOBILIZAÇÃO AO COLO.
CONDUTA: CEFTRIAXONA, AINH, AZITROMICINA, SECNIDAZOL.
RETORNO COM RESULTADO DE USGTV
REALIZAR APÓS O TTO, REALIZAR COLPOPSCOPIA 600,00 REAIS PREVENTIVO INCLUSO NÃO COBRAR.
CHÁ DE CRAJIRU E BARBATIMÃO.

27/05/2025
paciente retorna com resultado de exames: 
Exames Lab: colesterol e triglicerídeo aumentados, vitamina d e B12 baixas
apresenta Anatomopatologico NIC 1
Uso Tv com ovario direito com aspecto de policístico

paciente em posição ginecologica
assepsia
anestesia topica e injetavel
caf cut 35 e coat 50 w 
realizo teste de Schiller positivo
area aceobranca em labio anterior e posterior a direita 
realizo car em labio anterior e posterior
tiro foto
calterizo
realizo fotobiomodulacao


prescrevo metronidazol e triplo a , MANUTENCAO DE VITAMONA D 50.000UI E DOZEMAST

PROGRAMACAO DE ACOMPANHAMENTO 
27/05/2025: 1310,00 ( 850,00 CAF / 460,00 VITAMINA B12 E D *ADEK) - BIOPSIA 450,00
realizar 3 sessões de fotobiomodulacao 160,00 cada ( 27 -28 -29 /05)
2 MESES ======  RETORNO EM JULHO 2025 860,00 REPOSICAO DE VITAMINA B 12 E D E VISUALIZACAO DO COLO 
6 MESES ======  janeiro de 2026 = 1180,00 (rotina ginecológica, realizar preventivo com videocolposcopia 
6 MESES ======  julho.   de 2026 = 1180,0.   (rotina ginecológica, realizar preventivo com videocolposcopia

28/05
realizo 2 sessao de fotobiomodulacao
colo sem sangramento em processo de cicatrização, paciente refere perda de líquido serossanguinolento, oriento quanto ao processo de cicatrização, entrego nota fiscal valor de 1310,00 

29/05
realizo 3 sessao de fotobiomodulacao

30/05paciente refere desconforto com saída de secreção esbranquiçada, sem odor, em uso de metronidazol via oral 

ao exames:  colo em cicatrização 

conduta: faço fotobiomodulacao 

paciente refere secreção serosanguinolenta, 
resultado de biospsia 29/05; cervicite crônica com metaplasia escamosa endocervical 
paciente refere queda capila
conduta: segunda dose de vitamina d e b 12
protocólo capilar460, 1050total 
1450,00 ( 3 aplicações capilar e as 2 dose da vitamina ) 


17/06/2025
NOTA PROMISSORIA DIA 17/06/2025
PACIENT E FICOU DEVENDO 160,00 REAIS RESTANTE DA VITAMINA PAGOU 300,00 REAIS NO DINHEIRO/ VOLTA EM AGOSTO E VAI PAGAR O RESTANTE QUANDO VIER REALIZAR A VIZUALIZAÇÃO DO COLO DO UTERO VALOR 400,00 REAIS.
VALOR TOTAL 560,00 REAIS.

----------------------  /// ---------------
11/09/2025

paciente refere melhorar significante das dores, porem alega que no momento apresenta secreção esbranquiçada, nega prurido, refere odor 
nega dispareunia

ao exame
colo centralizado, presença de secreção fluida, discreta quantidade, com odor 
teste de schlier iodo claro (foto) - processo de cicatrização? - calterizacao realizada dia 27/05
fotos em anexo 
conduta: tericina AT, zirvit plus, zelix, ozone, flexone ( entrego amostra gratis para paciente) 
retorno com 6 meses após calterizacao  para avaliar o colo 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59826796, '540', 'LILIAN ARAUJO BARBOSA', 2, 5, '64304086200', NULL, '(55) 11992-32596', '1979-12-03', 1, '69 9967-3792 CONTATO DA PACIENTE 
IDADE: 45 ANOS
DUM: 17/06/2025
G3 P3C 
LT
UPCCU: +3ANOS 
COMORBIDADES: TIREOIDECTOMIA 
MEDICACAO PURAN DE 200 MG 
COLECISTECTOMIA/HERNIA UMBILICAL/ CESAREA + LT 

QP:  PACIENTE REFERE QUE HÁ MAIS DE 3 ANOS NAO REALIZA ROTINA GINECOLOGICA, FAZ MAIS DE 10 ANOS QUE FAZ USO DO PURAN, ALEGA TAMBEM IRREGULARIDADE MENSTRUAL COM ALTERRACAO DO FLUXO ACOMPANHADA DE DISMENORREIA, ALEGA CALOR NOTURNO, DIFICULDADE DE EMAGRECIMENTO , DIMINUICAO DA LIBIDO, NEGA VAGINA SECA, FEZ USO DE CREME VAGINAL POR CONTA PROPRIA (GINOPAC) DEVIDO CANDIDIASE, REFERE QUE NOS ULTIMOS DIAS APRESENTA UMA IRRITACAO VAGINAL
ULTIMOS EXAMES : 2023 - DEFICET DE ALGUMAS VITAMINAS 
AO EXAME: COLO CENTRALIZADO, PRESENCA DE SECRACAO AMRELADA, GRUMOSA EM PAREDE E AO REDOR DO COLO DO UTERO

CONDUTA: USG DE MAMAS, MMG, USG TV, DENSITOMETRIA OSSEA, EXAMES LAB,  GYNOTRAN, FLUCONAZOL

Exames laboratoriais do dia 21 do 7 hemoglobina 12,10 hematócrito 36,10 leu 5350 plaqueta 385000 ácido úrico 4,6 glicose 95,3 omo sistema 8,3 triglicerídeos 121 uréia 28 creatinina 0,6 colesterol total 162 magnésio 2,13 ferritina 24,7 hemoglobina glicada 5,2 desde o 27 tgp 48 gama GT 24 ferro sérico 51 Vitamina B12 414 estradiol 22 dosagem de insulina 14 progesterona menor que 0,05 cortisol 10,3 Vitamina D 21,8 testosterona 21,8 fsh de 33 sorologia não reagente t 4 livre 1,08 LH 18,7 tsh 5,53

PACIENTE EM USO DE GYNOTRAN, JA FEZ FLUCONAZOL
PREVENTIVO NEG PARA NEOPLASIA , PRESENCA DE COCOS E CANDIDA ( TRATADA ANTERIORMENTE)

CONDUTA: AGUARDO EXAMES DE IMAGEM 
REPOSICAO DE VIT D E B 12 PROGRAMAR 
REPOSICAODE TRH APOS AVALIACAO DE EXAME DE IMAGEM 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61799353, '913', 'Liliane de Souza Jesus', 2, 0, '00027061485', NULL, '(69) 99233-5982', '1973-10-15', 3, 'Paciente primeira consulta Sindicato 
Liliane de Souza Jesus idade 52 anos data da última menstruação há 2 anos método contraceptivo não utiliza gesta Três Passos normais aborto zero menarca aos 13 anos com morbida dese nega cirurgias prévias nega último preventiva em 2025 queixa principal rotina ginecológica sinais vitais 185% e 22 MMMHG peso 77, 2 conduta orientações é MRPA exames laboratoriais.
---------------------------------------------------------------------------------------------------------------------------------------

Data retorno; 15/07/26
Idade: 52 anos
D.N.: 15/10/1973
D.U.M.: janeiro/2024
Estado civil: Casada
M.C.: não
G.P.A.: G3 P3 normal A-0
Menarca: 15 anos
Comorbidade: não
Medicação em uso: não
Cirurgia prévia: não
Último preventivo: Há 1 ano
U.M.M.G.: Há 1 ano
Atividade física: não
Q.P.: Retorno
Peso: 76.900
P.A.: 156 × 104
Evolução / Conduta
Anemia → Def. Vit. B12.
Hipercolesterolemia – Col. 306.
Menopausa → ↓ Horm.
H.A.C. → ↑ P.A.
Cuidado → Ateroma – Infarto – AVC.
Conduta:
Orientações
Losartana 50 mg – 1x/dia + HCTZ pela manhã
MAPA
Reposição vit.
Rosuvo. (provavelmente abreviação de Rosuvastatina)
AAS
ECG
Endocrinologista 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59163581, '398', 'lindaci das dores ribeiro', 2, 2, '05038914284', NULL, NULL, '1972-01-14', 3, 'Rotina ginecologica, sem queixas no momento.
Conduta: exames lab, programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928524, '77', 'Lioniza Da Silva Costa', 2, 2, '00841164207', NULL, NULL, '1992-02-09', 3, 'IDADE: 32 ANOS 
DUM: 21/01/25
MC: PRESERVATIVO
G 3 P3N A0
UPCCU: + 3 ANOS 


QP; PACIENTE SEM QUEIXAS NO MOMENTO DA CONSULTA, REFERE DISPAREUNIA DEPENDE DA POSICAO, ALEGA DISURIA,  NEGA NÓDULO NA MAMA, NEGA SECRECAO VAGINAL

COLO CENTRALIZADO, EM FENDA, PRESENCA DE MUCO HIALINO, DISCRETO SECRECAO VAGINAL ESBRANQUICADA, COM SANGRAMENTO APOS COLETA
INICIO CFREVAGIN 5 DIAS, 

EXAMES LAB, USG TV  ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61283738, '805', 'Lívia Ramos de Passos', 2, 0, '03089566214', NULL, '(69) 8500-1400', '1995-02-20', 1, 'idade 31 anos
DUM: 24/03
MC: INICIOU 20 DAIS ACO - SELENE 
UPCCU: 2 ANOS 
MEDICAO NEGA 
MANICURE EM VISTA ALEGRE DO ABUNA 
QP: PACIENTE REFERE ABSCESSO DE SKNNER COM SAIDA DE PUS, NEGA ALGIA 
REFERE QUE VEM EM PVH PARA REALIZAR OS EXAMES 
PACIENTE COM ACNE EM ROSTO, 

----------
06/04
PACIENTE REALIZOU COLETA DE EXAMES LAB 
AO EXAME: 
PRESENCA DE CISTO DE Glândulas de Skene ( CISTO ROTU)
COLO CENTRALIZADO, PRESENCA DE SECCRECAO AMRELADA COM ODOR
 
AO EXAME DE IMAGEM 
CONDUTA: 
Azitromicina 500 mg VO 1x/dia por 3 dias + TRIPLO A ( TRATAMENTO PARA CNE E CISTO DE SKENE)
GYNOTRAN POR 7 DIAS e secnidazol  ( VAGINOSE) 
TRIPLO A
manter preservativo por 7 dias 
retorno on line para resultado de exames lab
retorno com 3 meses
ao Dermato para acne 

NOME: Lívia Ramos de Passos
DATA: 06/04/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 10,3 x 3,43 x 2,43 cm (volume: 84 cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.
. 
Endométrio: centrado, ecogênico e com espessura de 3 mm de basal a basal.

Ovário direito: tópico, volume de  3 cm³, de forma habitual, contorno preservado e textura normal.

Ovário esquerdo tópico: volume de 2,5 cm³, de forma habitual, contorno preservado e textura normal.

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Exame de ultrassonografia dentro dos limites da normalidade normalidade.


OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.
----------------
consulta 6/5/2026
paciente refere que continua com secreção vaginal, alega diminuição da libido, nao foi ainda ao dermatologista

conduta:
orientações 
consulta on line com 3 meses ou nova consulta presencial 
repetir exames lab hormonais ovariano com 3 meses 
avaliar sintomas da menopausa visto alteração de estradiol, progesterona 
aguardando parecer da dermato visto acne em face ( paciente realiza foto do rosto n dia de hoje para comparação)
crevagin
zaila 3 meses 
testosterona transdermico 
dieta hipolipidica
reposição de vit d - paciente para injetável 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59081684, '311', 'Liynnaa Duarte', 2, 0, '01253021260', NULL, '(69) 8114-1731', '2005-10-08', 1, 'IDADE: 19 ANOS 
DN : 08/10/2005
MENARCA: 14 ANOS 
SEXARCA: NEGA 
VACINACAO: OK
COMORBIDADES: NEGA 
MEDICACAO: NEGA
ALERGIA: NEGA 
ATIVIDADE FISICA: REGULAR - ACADEMIA 
PACIENTE REFERE DISMENORREIA HÁ MAIS OU MENOS 3 MESES, MELHORA COM IBUPROFENO, 
FLUXO MENSTRUAL: MODERADO NOS 2 PRIMEIROS DIAS, COM DURACAO DE 4 A 5 DIAS
NEGA SECRECAO VAGINAL, NEGA DISURIA, NEGA ALGIA 
ABSORVENTE 
AUTO EXAME
DEPILACAO
AO EXAME ABDOME INOCENTE 
CONDUTA: ORIENTACOES
EXAMES LAB E USG PELVICA

PACENTE VEM COM MAE, APRESENTA RESULTADO DE EXAMES LAB: COM VITAMINAS A, B,D, BAIXA
FERRITINA 

VITAMINA A,D,B, K B12, NORIPURUM 920,00

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61342708, '817', 'LORENA ROSA DA COSTA', 2, 0, '05875000260', NULL, '(69) 98114-4567', '2001-11-09', 3, 'dum: -----
mc------
G1 P1A0
PREVENTIVO:  ------
Exames laboratoriais do dia 25 de fevereiro hemoglobina 12,1 hematócrito 36,7 leu 4700 plaqueta 279000 colesterol total 152 TGP 12,7 tgo 20,8 triglicerídeos 136 glicose 92 creatinina 0.5 por EE a 21 tsh 1,35 t 4 livre 1,19 exame de urina leu posto 2 cruzes 60 pior 12 por Campos exames de imagem realizado no dia 21/03/2026 ultrassonografia da glândula tireóide normal ultrassonografia de mama presença de nódulo às 11:00 em mama esquerda medindo 1,5 x 0,4 x 0,7 cm nos maiores diâmetros classificação Bing Red 2 ultrassonografia de abdômen total estrutura visibilizada sem alterações evidentes ao método ultrassonografia transvaginal útero de volume de 100,6 cm³ em dô metre 5 mm ovário direito 23 ovário esquerdo 11,2 cm³ ou vários com morfologia policística
Paciente deseja gestar sem uso de contraceptivo
 conduta 
orientações 
SOPI
FEMINIS 
 retorno com 1 mês
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61551800, '868', 'lorena sa', 2, 0, NULL, NULL, NULL, NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61378664, '828', 'Lorena Sarraf Borges.', 2, 0, '70422613215', NULL, '(69) 8407-0215', '1983-04-06', 1, 'Já realizou um procedimento na vitaee Retirada de custos sebáceos!
idade: 43 anos 
PLANO DE SAÚDE: UNIMED 
G0 P0
DUM: DIU KYLENA
COMORBIDADES": NEGA
EXERCICIO FISICO 3 VEZES NA SEMANA
SONO REPARADOR 
INTESTINO: IRREGULAR 
UPCCU: JANEIRO DE 2025

QP: PACIENTE REFERE HÁ MAIS DE 2 MESES VEM APRESENTANDO FOLICULITE, E PRESENCA DE CISTO SEBACEOS, 
DESEJA ENGRAVIDAR 

AO EXAME
MAMS: NUMERO DE 2 , AUSÊNCIA DE NODULO, EXPRESSAO MAMARIA NEGATIVA
REGIAO INTIMA APRESENTANDO HIPERCROMIA EM REGIAO INTIMA, VIRILHA, RAIZ DA COXA E INTERGLÚTEO, ASSIMETRIA, FLACIDEZ EM MAIOR GRAU DO LADO ESQUERDO, PRESENCA DE MANCHA HIPERCROMICA EM FURCULA VAGINAL DE MAIS OU MENOS 1 CM ( PACIENTE NAO SABE CARACTERIZAR TEMPO E PRESENÇA ) 
PRESENÇA DE FOLICULITE EM FÚRCULA VAGINAL E CISTO SEBÁCEOS DIFUSO EM REGIAO INTIMA 

EXERESE DE CISTIO SEBACEOS E FULICULITE COM ANESTESIA LOCAL + LASER PÓS PROCEDIMENTO RS 2100,00- FAZER ORCAMENTO E ENVIAR NO WHATSS APP
PROVAVEL DATA DIA 08/05 AS 17H ou 2450,00 em 3x

---------------------------------------------------------------------
02/06/2026
exames lab vit b 12 449 / vit d 33,7 / magnésie 1,6
demais ok 

conduta: 
ORIENTACOES 
USG TV PARA RESERVA OVARIANA 
---------------
08/09VEM PARA RETIRAR OS PONTOS 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58981049, '141', 'Lorraine Iyacoca de Assis Gonçalves silva', 2, 0, '96718463272', NULL, '(69) 9209-2821', '1993-09-25', 1, 'IDADE: 31 ANOS
DN 25/09/93
DUM: 10/02
G 0 P0 
MC: NENHUM
CASADA HA 1 ANO
UPCCU: 23/11/24: NEGATIVO PARA NEOPLASIA + VAGINOSE BACTERIANA 
GENOTIPAGEM HPV NAO DETECTADO 
HIPOTIREOIDISMO - LEVOIDE 
ADVOGADA

QP: PACIENTE REFER SECRECAO VAGINAL COM ODOR, QUE PIORA APOS RELACAO SEXUAL, APOS MENSTRUACAO, ALEGA DISPAREUNIA NO INTROITO (ESPORADICO E DURANTE O ATO QU E MELHORA COPM. MUDANCA DE POSICAO, NEGA DISURIA, PERDA DE URINA AOS PEQUENOS ESFORCOS, DISCRETA SECURA VAGINAL, ALEGA QUE MESMO APOS ESVAZIAR A BEXIGA TEM SENSACAO DE URINA NA BEXIGA, PRESENCA DE LESAO BOLHOSA NO PERINEO - (HERPES VAGINAL), 

COMORBIDADES: ALEGA ALOPERCIA ANDROGENICA, HIPOTIREOIDESMO, TPM, ALTERACAO HORMANAL 

USG TV 29/10/24: NEGATIVO PARA ENDOMETRIOSE, PRESENCA DE MIOMATOSE UTERINA SUBSEROSO E INTRAMURA, OVARIO POLICITICO A DIREITA 
EXAMES 26/10: GLICOSE 81, FERR 104, FERRITINA 61, HB 13, 8, HT 42, VIT B12 632, VIT D 80 , , HEMOGLOBINA GLICADA 5,3 

conduta: SECNIDAZOL, GYNOTRAN, exames lab, use de mamas 


----------      /// -------------   /// -----------

24/03/25
exames 26/02
hbglicada 5,1 / ssh 0,80/ t4 livre 1,39 / FSH 5,77 / LH  7,12  / ANTI HBS NAO REAGENTE / SNR VIT A 0,61 / VIT C 0,55/ VIT B12 632/ ESTRADIOL 96,4 / PROGESTERONA 9,04 / VIT D 67 /TESTO 24/ COLESTEROL 205 / TS A RH NEGATIVO / 
USG DE MAMA BI RADS 2 

PACIENTE REFERE QUE PAROU ACO, NAO FEZ USO DE GYNOTRAN E NEN DO SECNODAZOL, MAS ESTA FAZENDO USO DE PROPIOTICO E SENTIU MELHORAS 
ORIENTACOES

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60033074, '573', 'Louislaine da silva Guedes', 2, 2, '03087025224', NULL, '(69) 9236-6499', '1997-01-14', 1, 'IDADE: 28 ANOS
DUM: 13/07

QP; ESCURECIMENTO DA REGIAO INTIMA, POS PARTO ( 4 ANOS)
DEPILACAO GILETE
NEGA DIABETES E OVARIO POLICISTICO 
TRABALHA COM ENGENHEIRA, LOJA DE ROUPA 
3 MESES POS CIRURGIA DE ABDOMINOPLASTIA MASTOPEXIA , REFERE MAIOR ESCURECIMENTO , NEGA FLACIDEZ 


OLI OLA  300 MG 
ACIDO TRANEXAMICO 200 MG
PICNOGENOL 100 MG 
TRANSVERATROL 50 MG 
TOMAR 01 CAPSULA PELA MANHÃ

20/08/2025
PACIENTE REALIZOU O POTENCIALIZADOR  120,00 COM A DONA NEIVA E COMPROU O CLAREADOR, ESFOLIANTE E SABAONTE 150 ML 490,50', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62164327, '987', 'Luana de Almeida Siqueira', 2, 0, '01964184290', 'luanassamd@gmail.com', '(69) 99399-9480', '1998-01-15', 1, 'Paciente: Luana de Almeida Siqueira 
Procedimento: Consulta Particular mais o Preventivo com Vídeo
Paciente veio pela campanha

IDADE 28 ANOS
G 1 PC A0
DUM: 08/09/2026
MC: ACO - NIKY drospirenona 3,0 mg / etinilestradiol 0,02 mg
UPCUU: 2024
U USG TV 2024

QP: PACIENTE REFERE QUE FAZIA USO DE IMPLANON, POREM APRESENTOU SANGRAMENTO VAGINAL DESFAVORAVEL, NO MOMENTO EM USO DE ACO, POREM ALEGA ENXAQUECA ,  ALEGA SECRECAO VAGINAL AMARELADO, SEM ODOR, SEM PRURIDO,

AO EXAME
COLO LATERALIZADO A ESQUERDA, SECRECAO ESBRANQUICADA

CONDUTA:
ORIENTACOES
CREVAGIN
VACINA CANDIDA - PROGRAMAR A APLICACAO 
EXAMES LAB
USG TV 
NOME: Luana de Almeida Siqueira

SOLICITO

HEMOGRAMA   
HIV I E II
VDRL
HBSAG
ANTI- HCV                          
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
EAS

Uso vaginal

1.	CREVAGIN _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 7 dias.



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59927520, '548', 'Luana Najara Costa De Souza', 2, 1, '06920399296', NULL, '(69) 99219-2334', '2003-09-24', 3, 'EXAMES DE SANGUE
 A VISTA 292,05
CREDITO 319,50', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60543222, '651', 'Lucelia .Ferreira Gomes', 2, 2, '00062867202', NULL, '(69) 99905-9341', '1987-08-18', 1, '38 ANOS 
G 4 P 3N 1C A 0
DUM: 26/10/25 
MC: L.T 
UPCCU SETEMBRO DE 2025

PACIENTE REFERE SANGRAMENTO UTERINO ANORMAL APRESENTA USGTV 06/10/25  UTERO 109,8 CM, END 5MM, MIOMA INTRAMURAL 28X22MM, OD 14,2 , OE 11,3.
CONDUTA: TAMISA SEM PARAR ( QUANDO RETORNAR)
AGUARDO O PREVENTIVO
SOLICITO EXAMES LAB', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59163599, '400', 'Lucia  Ferreira De Souza', 2, 1, '05038914284', NULL, NULL, '1986-10-14', 3, 'Deseja  engravidar, nega dispareunia.
Conduta: exames, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59214805, '432', 'Lucia Ferreira De Souza', 2, 0, '91929482272', NULL, '(69) 9926-2087', '1986-10-14', 3, 'dum: 06/03/2025 
paciente refere que fez o teste de gravidez 08/04: positivo, alega ardência e diminuição da acuidade visual 
não esta fazendo uso de medicação

IG: 4 sem e 6 dias 

conduta: orientações, encaminhamento oftalmologista, oxalato dfer, exames pre natal, USG após 15 dias ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61316357, '809', 'LUCIANA DA SILVA', 2, 1, '00192790277', NULL, '(69) 9221-9120', '1986-08-17', 1, '39 anos 
LT
UPCCU: 2024

QP: PACIENTE ASSINTOMATICA, VEM PARA ROTINA GINECOLOGICA, 

AO EXAME:
HIPERTROFIA CLITORIANA, CAPUZ CLITORIANO
PREGA ACESSORIA A ESQUERDA
HIPERTROFIA E ASSIMETRIA DE PEQUENOS LABIOS 
ESPECULAR: COLO CENTRALIZADO, PRESENCA DE SECRECAO ESVERDEADA FLUIDA, SEM ODOR 
CONDUTA:
ORIENTACOES
PREVENTIVO COM VIDEO EM MEIO LIQUIDO
USG TV
USG DE MAMAS
EXAMES LAB 
retorno dia 06/05
usg de mamas 14/04: bi rads 2 cisto mamario a esquerda 0,43 x 0,16
usg tv cisto funcional ovariano a esquerda 6,91 cm 

Uso oral

1.	Alta D 50 000ui______________________o1 caixa
Tomar 01 comprimido via oral 1 vez por semana.

Uso vaginal 
1.	Crevagin  ___________________________01 caixa 
Aplicar via vaginal, á noite, por 7 dias.
orçamento de ninfoplastai, capuzplastia, correção de prega acessória 12648,00




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60850283, '718', 'Luciana Silva', 2, 2, '85284920287', NULL, '(97) 8407-9909', '1985-07-06', 1, 'IDADE: 40 ANOS 
G1 P1
MC: COITO INTERROMPIDO
UPCCU:  NUNCA REALIZOU
COMORBIDADES: NEGA 
DUM: 19/12/2025 

PACIENTE VEM PARA INSERCAO DE IMPLANON

CONDUTA: ORIENTACOES, CURATVO, RETIRAR CURATIVO COM 24 HORAS ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59988587, '560', 'Luciele da silva nascimento', 2, 0, NULL, NULL, '(97) 8413-3485', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60503423, '646', 'Lucileide de Fátima Nery Rodrigues', 2, 3, '42077460210', NULL, '(69) 9229-9917', '1971-10-13', 1, 'idade: 54 anos  13/10/71

DUM: 48 ANOS - TRH INICIOU ESSE ANO E SUPLEMENTACAO DE VITAMINAS 
PREVENTIVO:  2025 
ATUALMENTE APOSENTADA, POREM ANT4ES ERA POLICIA 
IRREGULARIDADE NA ACADEMIA ATUALMENTE, DEVISO TRAUMA O DEDO DA MAO DIREITA 

QP: PACIENTE REFERE IRREGULARIDADE NO USO DE TRH, NO MOEMNTO SEM ATIVIDADE SEXUAL,  NAO SABE REFERE SOBRE A LIBIDO, PELE COROPROAL SECA, ALEGA INSONIA, 
ATUALEMNTE EM TRATAMENTO COM SEMAGLUTINA SEMANALMENTE 
VEM PARA FAZER LASER INTIMO  


--------------  // ----------------

19/11
2 sessao de laser 
exames lab 
Exames laboratoriais no dia 23 do 10 por é 29 creatina zero ponto 75 ferro 74 tgp 25 tgo 17 glicose 71 colesterol 203 Tsh 1,72 t 4 livre zero ponto 94 estradiol inferior a 20 ferritina 168 fsh 81 LH 15 progesterona inferior a 05 testosterona 41 Vitamina B12 288 vitamina D 36,3 hemoglobina 13 hematócrito 39 leucócito 7000 plaqueta 340 Vitamina A 0,57 vitamina C 5,2 hemoglobina glicada 5,9
no momento fazendo tri de forma irregular, oestrogel e progesterona 
conduta: orientacoes belamy


71 200kg 
implante 6487,00
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59163572, '397', 'Lucilene Almeida Silva', 2, 2, '05038914284', NULL, NULL, '1978-04-22', 3, 'Irregularidade menstrual, fogacho, irritabilidade.
Conduta: exames lab, programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59163557, '396', 'Ludiane De O Ribeiro', 2, 2, '05038914284', NULL, NULL, '1993-06-08', 3, 'Rotina Ginecológica, nega secreção vaginal no momento, porém fez uso de nistantina +- 2 semanas.
Conduta: exames lab, usgtv, preventivo.

18/11/24
paciente com queixa de disuria, nega  secreção vaginal.
Conduta: exames lab, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59163449, '394', 'Ludiete N Batista', 2, 2, '05038914284', NULL, NULL, '1983-05-07', 3, 'Vem para apresentar resultado de exame 11/10/24
hb 12,10, ht 37,5, leuc 10,040, plq 441,00, vitd 22,5, trigl 150, u 19, cret 0,6, colest 178, ferretinina 10,6, tgo 23, tgp 20, ferro 40, vit b12 241, t4 1,35, tsh 1,50.
Conduta:  orientar metronidazol, secnidazol,', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59986214, '559', 'LUIZA NAVARRO FERREIRA', 2, 0, NULL, NULL, '(69) 8412-0067', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59175668, '412', 'luiza pereira da silva', 2, 1, '05038914284', NULL, NULL, '1984-08-06', 3, 'Em acompanhamento cirugica p/ perineoplastia.
rotina: usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61746124, '907', 'Luma de Oliveira Paes', 2, 0, '00791530205', NULL, '(97) 8438-0157', '1991-04-25', 1, 'NOME: Luma de Oliveira Paes


DATA: 06/07/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 8,4 X 3,31 X 5,3 cm (volume: 32,30 cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.
. 
Endométrio: centrado, ecogênico e com espessura de 7 mm de basal a basal.

Ovário direito: tópico, volume de 6,2 cm³, de forma habitual, contorno preservado e textura normal.

Ovário esquerdo tópico: volume de 5,23 cm³, de forma habitual, contorno preservado e textura normal.

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Exame sem anormalidade detectável pelo método.


OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.


CONDUTA:
ORIENTACOESZAILA
SECNIDAZOL
TERICIN AT
GYNOTRAN
TRIPLO A 
NOME: Luma de Oliveira Paes

Uso oral

1.	Secnidazol 1 g______________________04 comprimidos 
Tomar 02 comprimidos via oral dose única para o casal 

2.	ZAILA ___________________________01 caixa
Tomar 01 comprimido, via oral 1 vez ao dia, por 3 meses

Uso vaginal

1.	TERICIN AT _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.

2.	GYNOTRAN __________________________01 caixa
Aplicar 01 óvulo, á noite 1 vez por semana 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59015727, '188', 'Luzenira Magalhaes Batista', 2, 0, '59551712234', NULL, '(69) 99239-6920', '1977-05-27', 3, 'IDADE: 47 ANOS 
HISTERECETOMIA AOS 43 ANOS
G4 P3 A1 
UPCCU: 2024
COMORBIDADES: NEGATIVO

QP: PACIENTE REFERE FRAQUEZA, UNHA QUEBRAQUICA, FOGACHO, MELHOROU APOS USO DE CHA CASEIRO
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60486727, '641', 'Luzia Gabriele de Carvalho Rosas', 2, 1, '02571388207', NULL, '(97) 8400-2683', '2001-02-27', 1, 'IDADE: 24 ANOS
DUM: 08/Q0/2025
UPCCU: 27/08/2025 ASC H 
MC: AC INJETAVEL MENSAL 
G 0 P0 
1 PARCEIRO
VACINA DE HPV REALIZOU AS 3 DOSES 

QP: PACIENTE ENCAMINHADA PARA COLPOSCOPIA 

AREA ACETO BRANCA AS 11 H , IODO CLARO , REALIZO BIOSPIA E CALTERIZACAO 
ENCAMINHO AP 


----------------------------------
09/05
DUM: MARCO DE 2026
MC: ACI MENSAL 

--------------------------
11/06/2026
DUM: 03/06/2026

PACIENTE ACOMPANHDA DA MAE, REFERE QUADRO DE ESTRESS EXCESSIVO NO TRABALHO

CONDUTA: SOLICITO EXAMES LAB
PROGRAMO COLPOSCOPIA E POSSIVEL CALTERIZACAO DO COLO DEVIDO DETECCAO DE HPV 31 
VACINA PARA IMUNIDADE
1º  DOSE 11/06
REFORCO COM 1 MES ( JULHO) 


------------------------------------------

03/08/2026

preventivo 12/05: CONCLUSÃO
Compatível com Lesão Intraepitelial de Baixo Grau (LSIL), englobando Neoplasia intraepitelial Cervical Grau I (NIC I) e infecção viral do tipo HPV.

PACIENTE REFRE 1º DOSE DE HPV 26/06/2026

EXAMES LAB 21/07 SNR / U 25/ CREAT 0,68/ TGP 17/ TGO 13/ GLICOSE 79/ COLESTEROL 162/ TRIG 50 / TSH 3,04/T4L 0,99/ HB 13,3/HT 39,9/LEUCO 6300/PLQ 266000/VIT B12 494/ VIT D 27,8 

CONDUTA: ORIENTAÇÕES 
SUPLEMENTACAO DE VIT B 12 E D - REFORCO DA B12  INJETAVEL EM SETEMBRO  e vacina E MANUTENCAO ORAL

NOME:  Luzia Gabriele de Carvalho Rosas


Uso vaginal


1.	ALBOCRESIL ÓVULO __________________ 01 caixa

Aplicar 01 óvulo via vaginal, em dias alternados 

 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60309560, '633', 'Luzia Rodrigues da Silva', 2, 0, NULL, NULL, '(69) 9208-0831', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61813647, '920', 'Luziandra Nonata Barbosa', 2, 0, '85423114268', NULL, '(69) 99954-0608', '1983-03-18', 3, ' Ida e idade 44 anos data do último menstruação a mais ou menos 2 semanas método contracetivo injetável 
G2P1 A 1
Comorbidades nega medicação em uso nega cirurgias prévias hérnia umbilical 
último preventivo 12/05/2025 mamografia 2 anos 
atividade física caminhada 
sinais vitais PA 126 x 78 
peso 63 e 200 
laboratoriais do dia 17/03/2026 virose 90 serido 155 BRL 16 creatinina 0,8 colesterol 211 magnésio 2,1 
 e uma globina glicada 5,3 tegel 21 tgp 16 ele também AB 12 647 
estradiol 143 FSH 1,9 LH 2,03 progesterona 7,5 vitamina D 25,4 
hemoglobina 13,7 hematócrito 39 leuco 5560 plaqueta 213000 e
xame de urina não infeccioso 
conduta solicitou exames laboratoriais recentes de hormônio ultrassom transvaginal ultrassonografia de mamas 
mamografia e preventiva há um retorno a avaliar a possibilidade de utilização de terapias de reposição hormonal devido à presença da paciente no climatério
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60856493, '719', 'Luzilene Santos Ferreira', 2, 1, '42278260200', NULL, '(69) 9341-4742', '1971-08-14', 1, 'IDADE: 54 ANOS
DUM: MENOPAUSA 45 ANOS - FEZ TRH POR 3 MESES, SUSPENDEU POR CONTA PROPRIA DEVIDO TER APRESENTADO LESAO HIPERCROMICA DIFUSA
TABAGISTA 
MALARIA, SIND DE INTESTINO IRRITADO, GASTRITE
MEDICCAO EM USO: B1. B6, VIT D, PROMESTRIENO
NAMORANDO

PACIENTE ALEGA ESQUECIMENTO, REFERE FLACIDEZ VAGINAL, IUE AOS PEQUENOS ESFORCOS, DIMINUICAO DA LIBIDO, RESSECAMENTO DE PELE, RECECAMENTO VAGINAL 
AO EXAME: COLO CENTRALIZADO, EM FENDA,

Exames laboratoriais do dia 6/11/2025 prolactina 2,6 omo sistema 15,3 vitamina D 33,6 vitamina B12 516 hemoglobina glicada 4,9 tsh 2,7 t 4 livre 1,37 hemoglobina 14,8 hematócrito 44,8 leuco 7170 plaqueta 311000 fosfatase alcalina de 74 tgo 26 tgp 31 gama GT 28 sorologia não reagente insulina 9,1 Curtis 11,2 BT 0,95 BD 0,29 b um 0,6 the cosy 88 30 e cerrillos 137 colesterol total 244 puré 24 creatinina 0,9 ferritina 380 ferro sérico 127 fator antinuclear um para 80 exames laboratoriais do dia 3 do 12 ácido fólico 8,1 tgo 34 tgp 42 gama GT 30 BT zero ponto 45 BD zero ponto 14 BE zero ponto 31 ferritina 503 ferro 16 posso trazer aquele né 61 hemoglobina 11,7 hematócrito 36,1 leuco 7020 plaqueta 428
Ultrassom de abdome total 19/11/2025estruturas normais ao método
ultrassom de tireoide cisto colóide ( TI RADS 1)
ultrassom de doppler da carótida vertebral direita com fruto fluxo anterior hoga do velocidade padrões habituais
ultrassonografia transvaginal do dia 19/11/2025 útero antô verso fletido volume 31,8 ovário direito 1,2 ou vário esquerdo não identificado demais estruturas normais

CONDUTA: 
ORIENTACOES
BELAMY, MANTER PROMOSTRIENO 
EXAMES LAB
CERAVE, BEPANTOL DERMA, OLEO DE GIRASSO,
REALIZADO 1 SESSAO DE LASER INTIMO 
USO VAGINAL


1.	BELAMY ________________________________01 CAIXA

APLICAR VIA VAGINAL, Á NOITE  A CADA 3 DIAS ( 2 APLICAÇÕES)


USO TÓPICO

2.	CERAVE – LOÇÃO HIDRATANTE  - PELE SECA A EXTRA SECA  - 1 TUBO
APLICAR NA PELE LIMPA 2 VEZES AO DIA 

3.	BEPANTOL DERMA ___________________________01 TUBO
APLICAR Á NOITE 

4.	OLEO GIRASSOL NEEDS _______________________01 TUBO
    APLICAR Á NOITE 
--------------------------------- /// -------------------
14/02/2026

paciente com historia de malaria em setembro de 2025, no momento ainda sente muita fraqueza, fezuso de noripurum, mas refere que perdeu pelas fezes, ainda nao realizou exames lab solicitados anteriormente 
paciente refere que ainda mantem IUE, e que terminar a micção ao levantar ainda desce muita urina (ensopando o papel higiênico) 
refere também uma secura no introito vaginal, porem nao fez uso do bepantol derma 
PACIENTE NAO DESEJA MAIS FAZER USO DE PROMESTRIENO 

conduta:
realizo 2 sessao do laser intimo 
bepantol derma no introito e grandes labios 
Bifilac Sii
---------------------------------------------------


Exames laboratoriais do dia 19/02/2026 hemoglobina 13,1 hematócrito 39,9 leu pro 7890 plaquetas 356000 tsh 3,1 t 4 livre 1,33 EPCH 57 LH 33 vitamina 0,6 vitamina D 53 vitamina B12 400 estradiol 19 progesterona 0,2 testosterona de 11 ferritina 288 região 28 tgp 27 glicose 91 por é 26 creatino 0,6 ferro Sério por 103 determina c 2,2 ao exame a presença de um nódulo no colo uterino interrogou o mioma solicita ultrassom transvaginal solicita a paciente ultrassom o resultado do ultrassom de mama ou mamografia no retorno

----------------------------

PR3ESENCA DE 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61934310, '951', 'Luzimar de Oliveira Queiroz', 2, 2, '70398445249', 'aidasson.es@gmail.com', '(69) 99338-6484', '1978-09-21', 3, 'Paciente já realizava Consultas Diretamente pelo Sindicato, Na Clinica e a Primeira Vez a Consulta.
05/08/2026
IDADE 47 ANOS 
DUM: 05/08
MC:PRESERVATIVO
G 1 P1 A0
UPCCU: JANEIRO DE 2025 - NEG PARA NEOPLASIA - SIC 

QP: PACIENTE REFERE CANSACO EXCESSIVO, 

Resumo de Exames
Ultrassonografia Transvaginal (01/04/2026)
Útero em anteversoflexão (AVF).
Volume uterino: 124 cm³.
Presença de múltiplos nódulos uterinos, compatíveis com miomas, localizados em:
Parede corporal anterior – intramural;
Parede corporal posterior – subseroso;
Parede corporal lateral direita – intramural.
Endométrio: 7,1 mm.
Ovário direito:
Volume: 9,6 cm³.
Presença de lesão cística paratubária/paraovariana unilocular, de bordas finas e regulares, conteúdo anecoico homogêneo, medindo 1,9 × 1,0 × 1,2 cm.
Ovário esquerdo:
Volume: 4,1 cm³.
Impressão diagnóstica da ultrassonografia:
Miomatose uterina (múltiplos miomas).
Cisto paraovariano unilocular à direita.
Exames laboratoriais (04/2026)
Triglicerídeos: 165 mg/dL
Colesterol total: 251 mg/dL
Ureia: 19 mg/dL
Creatinina: 0,7 mg/dL
Hemoglobina glicada (HbA1c): 5,6%
TGO (AST): 21 U/L
TGP (ALT): 23 U/L
Vitamina B12: 856 pg/mL
TSH: 3,2 µUI/mL
T4 livre: 1,2 ng/dL
Vitamina D: 19,7 ng/mL
Hemoglobina: 14 g/dL
Hematócrito: 45%
Leucócitos: 6.590/mm³
Plaquetas: 271.000/mm³
Sorologias: não reagentes.

Resumo clínico:
Miomatose uterina.
Cisto paraovariano simples à direita.
Hipercolesterolemia (colesterol total: 251 mg/dL).
Hipertrigliceridemia discreta (165 mg/dL).
Deficiência de vitamina D (19,7 ng/mL).
Função renal, função hepática, função tireoidiana, hemograma e controle glicêmico sem alterações relevantes.

MELASMA - TRANSAMIM 250 MG 1 VEZ AO DIA E HELIORAL, POREM VEM DEPOIS PQ NAO USA PROTETOR SOLAR REGULAR 

CONDUTA; 
ORIENTACOES 
NOME: Luzimar de Oliveira Queiroz


SOLICITO


USG DE MAMAS E AXILARES 

ROTINA GINECOLÓGICA 
EAS
UROCULTURA
GLICEMIA DE JEJUM 
RETORNO COM 3 MESES - SOLICITAR VITAMINA D 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60826346, '713', 'Macicleia Marinho', 2, 2, '90119185253', NULL, '(69) 9242-2268', '1985-04-03', 1, 'IDADE: 40 ANOS
CASADA HÁ 19 ANOS 
DUM: 20/11/2025
MC: COITO INTERROMPIDO 
UPCCU: +3 ANOS
COMORBIDADES: NEGA 
MEDICACAO EM USO: NEGA 
ALERGIA: NEGA 
G1 P1C A0 (MENINA 18 ANOS)
UMMG NUNCA REALIZOU
PROFISSAO SERVIDORA PÚBLICA 

PACIENTE REFERE VERGONHA DA REGIAO INTIMA, RELACAO SEXUAL COM LUZ APAGADA,  

COLO PUNTIFORME, PRESENCA DE SECRECAO COM GRUMOS E ODOR

CONDUTA: COLETADO PREVENTIVO
GYNOTRAN
SECNIDAZOL
NINFOPLASTIA
ASSIMENTRIA E HIEPTROFIA DOS PEQUENOS LABIOS GRAU 2-3
LASER INTRAOPERATORIO E NO SEGUNDO DIA POS OPERATORIO
VALOR 7600,00 A PRAZO 
7200 Á VISTA 

---------------- //---------------



26/12/2025
paciente em posição de litotomia
realizo marcacao
assepsia
realizo ninfoplastia 
sutura cromado 4,0
laser fotobiomodulacao
ato sem intercorrencias 
entrego receita, paciente nao precisa de atestado medico
 27/12/25
dona neiva realiza a segunda sessão do laser para a cicatrização na paciente

21/01/26
DECLARAÇÃO MÉDICA

            Declaro, para os devidos fins, que a paciente Macicleia Marinho encontra-se, no presente momento, temporariamente inapta para a realização de exercícios físicos, por orientação médica.
Recomenda-se a suspensão das atividades físicas até nova avaliação médica, a fim de evitar prejuízos à sua saúde.
Esta declaração é emitida a pedido da interessada para fins comprobatórios.


Porto Velho, 21 de Janeiro de 2026
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61838283, '926', 'MADALENA FERREIRA ALFAIA LOPES', 2, 0, '00057212295', NULL, '(69) 99348-4985', '1949-09-01', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921866, '29', 'Madalena Ferreira Alfaia Lopes', 2, 0, '05038914284', NULL, NULL, '1975-05-22', 3, 'ROTINA GINECOLOGICA
Idade: 58 anos
Menarca: 15 anos
DUM: 46 anos
Comorbidade: não
Faz uso de medicação: Sertralina
U.M.M.G.: Há 2 anos
Preventivo: Há 2 anos
Cirurgia prévia: Laqueadura
Faz atividade física: não
Q.P.: Sangramento e dor pós-coito
P.A.: 123 × 78
Peso: 54.500
Conduta:
Orientações
Solicito videocolposcopia com coleta de preventivo em meio líquido
USG TV
Valores:
237
150
Total: 387,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61813953, '921', 'Maely de Souza Prado', 2, 0, '01505302269', NULL, '(97) 98460-1682', '1991-03-17', 3, 'IDADE 35 ANOS 
DUM: 28/06
MC: LT
G 2 PN A0 
COMORBIDADES: NEGA
UPCCU: 2025

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA SECRECAO ESBRANQUICADA, SEM PRURIDO, COM ODOR POS RELACAO SEXUAL 
 

NOME: Maely de Souza Prado

SOLICITO

HEMOGRAMA  
HIV I E II
VDRL
HBSAG
ANTI HCV
HERPES I E II 
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58923766, '38', 'Magaly Magalhaes De Menezes', 2, 0, '05038914284', NULL, NULL, '1972-05-30', 3, 'Q.P: SECURA VAGINAL, IRREGULARIDADE MENSTRAUAL.
CONDUTA:EXAMES LAB,  USGTV,MMC EUSG DE MAMAS E PREVENTIVO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58920304, '16', 'Magda Pantoja Neres', 2, 0, '05038914284', NULL, NULL, '1990-05-04', 3, 'Q.P: MENSTRUAÇÃO IRREGULAR, PREVIDO VAGINAL COM ODOR, NEGA SECREÇÃO VAGINAL.
CONDUTA: METRONIDAZOL CREME VAGINAL
PROGRAMAR PREVENTIVO.
RETORNO DA PACIENTE 13/06/2024
Q.P: REFERE QUE FEZ O USO DE FLUCUNAZOL E CREME VAGINAL (MEDICAÇÃO POR CONTA PROPRIA), PLANEJAMENTO FAMILIAR.
CONDUTA:USGTV, PROGRAMAR PREVENTIVO,PLANEJAMENTO FAMILIAR.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61204815, '794', 'MAILANE MAGNO DA SILVA', 2, 0, '01956735224', NULL, '(69) 99251-2375', '1993-01-06', 3, '33 ANOS 
G1 PC A 0 ( DCP)
MC; DIU DE COBRE - INSERCAO EM FEV 2022
DUM: 08/02/2026
UPCCU: 25/11/25: NEGA PARA NEOPLASIA + GARDNERELLA 

VEM PARA MOSTRAR RESULTADO DE EXAMES 
UPCCU: 25/11/25: NEGA PARA NEOPLASIA + GARDNERELLA 
USG TV 19/02/2026: UTERO  AVF 192,  DIU NORMOPI]OSICIONAD, ENDOMETRIO 9 MM, PRESENCA DE POLIPO OVARIOS NORMAIS 

CONDUTA: ORIENTACOES 
NO MOMENTO ESTA  MENSTRUADA PARA AVALIAR SE TEM PRESENCA DE POPLIPO VISIVEL OU NECESSITA DE NOVA USG TV 
NOME: MAILANE MAGNO DA SILVA

Uso oral

1.	Secnidazol 1 g _____________________4 comprimidos 
Tomar 02 comprimidos VO dose única para o casal 


Uso vaginal 

1.	Gynotran ___________________________01 caixa 
Aplicar 01 óvulo via vaginal, á noite, por 7 dias 

--------
07/04
NAO VISUALIZO POLIPO NO OCE, SAIDA DE SANGRAMENTO EM PEQUENA QUANTIDADE ( MENSTRUAÇÃO) 

USG Transvaginal

PÓLIPO ENDOMETRIAL? 

-----------------------------
03/09/2026
USG TV 28 DE AGOSTO DE 2026
UTERO 178 CM, MIOMA INTRAMURAL 30 X 20 MM, ENDOMETRIO 12 MM, PRESENCA DE DIU E POLIPO ENDOMETRIAL 
OVARIOS NORMAIS 

CONDUTA: ORIENTAÇÕES, 
ENCAMINHO PARA HISTEROSCOPIA 


ENCAMINHAMENTO 
PARA HISTEROSCOPIA  

Paciente: Mailane Magno da Silva, 
Idade: 33 anos,
G1 PC A0 
Método contraceptivo: DIU de cobre, inserido em fevereiro de 2022
DUM: 30/09/2026
Exames
Paciente comparece para avaliação de exames ginecológicos.
UPCCU – 25/11/2025:Negativo para neoplasia.,presença de Gardnerella.
USG transvaginal – 19/02/2026:
•	Útero em AVF, volume aproximado de 192 cm³.
•	DIU em normoposição.
•	Endométrio medindo 9 mm.
•	Presença de imagem sugestiva de pólipo endometrial.
•	Ovários de aspecto normal.
USG transvaginal – 28/08/2026:
•	Útero com volume aproximado de 178 cm³.
•	Mioma intramural medindo 30 × 20 mm.
•	Endométrio medindo 12 mm.
•	DIU presente.
•	Presença de imagem compatível com pólipo endometrial.
•	Ovários de aspecto normal.
Conduta
Diante da persistência do achado sugestivo de pólipo endometrial em exames de imagem, encaminho a paciente para  realização de histeroscopia
Atenciosamente,


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60813191, '711', 'Maisa de Melo Morais', 2, 0, NULL, NULL, '(68) 9203-0441', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926809, '63', 'Maiza Estefane Bergamaschi Moreira', 2, 1, '05038914284', NULL, NULL, '2002-07-09', 3, 'Q.P: DISMINORREIA, ACNE, MÃE TEM ENDOMETRIOSE.
CONDUTA:USG PELVICA, EXAMES LAB.
11/08/23 
USG PELVICA NORMAL 25/07/23
11/04/2024 
APRESENTA USGTV 04/04/24 NORMAL
ENDOMETRIOSE?
DUM:30/03/24
SOLICITO USGTV COM PREPARO.
14/06/24
PACIENTE REFERE ENXAQUECA, CONDUTA NO AGUARDO DA USGTV COM PREPARO INTESTINAL, INSERIR DIU OU IMPLANON.
02/07/24
USGTV COM PREPARO INTESTINAL 
CONDUTA:INSERIR DIU', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921097, '24', 'Maiza Santana Da Silva Ticona', 2, 0, '05038914284', NULL, NULL, '1993-07-28', 3, 'Q.P: SECREÇÃO VAGINAL COM ODOR FORTE 
CONDUTA: GYNOFRAN
SEENIDAZOL
FLOGO ROSA', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58908002, '3', 'Maniêdi Marques Pontes', 2, 2, '71290028249', NULL, '(69) 99243-6375', '1984-02-09', 1, 'DUM: 06/03

PACIENTE REFERE QUE APRESENTOU QUADRO GRIPAL, COM PERDA DE URINA EM ALGUNS EPISÓDIO DE  ESPIRRO, NO MOMENTO NEGA ESSA QUEIXA

CONDUTA: 2º SESSAO DE LASER INTIMO 
DURANTE A APLICACAO DA 2 SESSAO DO LASER ( PARTE COM FLACIDEZ, AUMENTO POTENCIA), REALIZO FLUCONAZOL DOSE UNICA ENTREGO PARA PACIENTE APLICA 3 TUBOS DE BELAMY A CADA 72 HORAS 
PACIENTE REFERE QUE APOS NINFOPLASTIA APRESENTOU EXCESSO DE PELE 4 MIL
7MIL EXERESE DE PEQUNO LABIO ESQUERDO, CAPUZCLITORIANO E VAGINA POSTERIOR







22/04/2025
3º SESSAO do laser intimo 
OTIMO RESULTADO

06/03
paciente refere correção da ninfoplastia 
paciente refere crise de repetição de vaginose - provavelmente sobre estresse 

LASER INTIMO DE MANUTENCAO ANUAL 
VACINA 490, 00

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924721, '53', 'Manoela Alves Martins', 2, 1, '05038914284', NULL, NULL, '1983-11-17', 3, 'ROTINA GINECOLOGICA, USGTV 2022 NORMAL, USG MAMAS 2022 BI-RADS2, 
CONDUTA:EXAMES LAB E IMAGENS.
RETORNO 07/11/23 MC:VASECTOMIA
DUM:IRREGULAT, FLUXO TIPO BORRA DE CAFÉ, PACIENTE SEM ALGIA, ALEGA IRREGULARIDADE MENSTRUAL.
CONDUTA:EXAMES LAB, USGTV,USG MAMAS ,MMG (NOV JÁ COMPLETA 40 ANOS)', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60541272, '650', 'Manuela Luciana De Souza Barbosa Nestor', 2, 0, '03240867257', NULL, '(69) 9239-5562', '2010-07-30', 1, '15 anos 
menarca: 14 anos 24/01/2025

paciente acompañada da mas referencias que a Menorca foi em janeiro e apos apresentou amenorreia 

Ultrassonografia de abdômen inferior pélvico feminino do dia 6/10/2025 útero 40,9 cm³ endométrio 7,4 mm ovário direito 7,7 cm³ por vários esquerdo 5,9 cm³ hipótese diagnóstica estruturas sem alterações evidente ao método

Exames laboratoriais do dia 09/05/2025 hemoglobina de 14,3 hematócrito 40,9 leuco 6040 plaqueta 218000 tsh 1,06 t 4 livre 1,16 Vitamina D 35,6 vitamina B12 621 imunoglobulina e 80,2 glicose 84 triglyceride 87 colesterol 137 HDL 47 ldl 73 ldh 284 ferritina 44,4 ferro sérico 122 PCR 0,3 fator reumatoide 18 VHS de 8 mm

ao exame: pelos normoimplantado, hiperemiado, secreção discreta

conduta: solicito exames lab, bacterioscopia 
retorno
flogorosa e trok  ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926536, '58', 'Mara Cristina Da Silva Pedrosa', 2, 2, '05038914284', NULL, NULL, '1987-02-27', 3, 'RESSECAMENTO VAGINAL, AO EXAME PRESENÇA DE FISSURAS VAGINAL, EXAMES LAB 01/2023 NORMAL.
CONDUTA:ESTRADIOL TOPICO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59454460, '485', 'Maracelia Lima de Oliveira', 2, 5, '42209587204', NULL, '(69) 9285-8076', '1973-09-24', 1, 'idade: 51 anos 
dum: histerectomia dezembro de 2021
trh: oxadralonana 3,5 sl / testpsterona / progesterona 200 / flebancerina 


PREVENTIVO: 15/05/2024: NEGATIVO PARA NEOPLASIA 
QP: PACIENTE REFERE FOGACHO, 
NO MOMENTO NAO ESTA REALIZANDO TRH, NO AGUARDO DE EXAME GENETICO 

CONDUTA: 
REPOSICA DE  VITAMINA B 12 / COENZIMA Q 10 

02/06/2025
1º SESSAO DE FRAXX
DUM: HISTERECTOMIA 

PACIENTE EM POSICAO GINECOLOGICA, APRESENTA TRAUMA POS SEXUAL INTROITO VAGINAL E INTRAVAGINAL  ( FOTO )
APRESENTA LESAO PUSTULOSA EM LABIO DIREITO, RETIRO COM CALTERIZACAO 
PRESENCA DE FLACIDEZ MAIOR EM PAREDE ANTERIOR 
REALIZO FRAX INTRA VAGINAL 
ATO SEM INTERCORRENCIA 
ANTROFI
REALIZO LIMPEZA E HIDRATACAO EM VULVA 
CONDUTA: ORIENTACOES, BELAMY 

______________________. // _______________
30/06
paciente refere melhora na libido e na lubrificação, alega que após 15 dias do uso de fraxx melhorou o desconforto sexual 
em uso de THR em adesivo
hoje vem para 1º sessao do laser intimo 
conduta; 
fluconazole
laser protocolo basico 
belamy hoje e utilizar mais 2 vezes em 3 dias 


15/07
2 SESSAO DE LASER
REALIZO COLETA DE SALIVA 
ORIENTACOES 


09/08
paciente refere melhora no desconforto na relação sexual, melhora da lubrificacao intima 
3 sessao do laser 
reposição de vit b 12 e coenzima q 10 
solicito exames de imagem e lab 

23/10
01/09 - mamografia bi rads 2 
usg tv 01/09 : Útero ausente (cirurgia).
Ovário direito tópico, de contornos regulares e dimensões reduzidas.
Ecotextura do parênquima característica.
Volume ovariano estimado em 2,7 cm³.
Ovário esquerdo tópico, de contornos regulares e dimensões reduzidas.
Ecotextura do parênquima característica.
Volume ovariano estimado em 2,2 cm³.
Regiões anexiais sem alterações aparentes.
Fundo de saco posterior sem lesões expansivas, líquido livre ou coleções.
Hipótese Diagnóstica:
. Status pós-histerectomia.

01/09/25 usg de abdome total: Hipótese Diagnóstica:
Estruturas visibilizadas sem alterações evidentes ao método

Exames laboratoriais 18 /8 / 2025 sorologia não reagente 
Como cisteína 12 SBH 12,3 Vitamina C 0,6 aldosterona 6,6 gama GT 20 magnésio 2 PCR 8 por é 51
ecocardiograma: Pericárdio com aspecto ecocardiográfico normal.

Hipótese Diagnóstica:
Nódulos tireoidianos classificados como TI-RADS 4 e 3.
faz acompanhamento de nodulo de tireoide, ano passo realizou punção e estava normal 

oncologista: sem criterios de malignidade 

no momento paciente usando System em adesivo e progesterona de 200 mg 
2 vezes na semana testosterona transdermic, oxadrolona de 3,5 mg sl 
retorno com 6 meses 
mantem - TRH
----------------------------
14/05
adesivo
oxadrolona 3,5 mg sublingual 
progesterona 200 mg 
testosterona 2 vezes na semana 
densitometria ossea 01/09/2025; osteopenia 
MMG 01/09: IMPLANTE/ BI RADS 2 

------------------------------
EXAME 

AUSENCIA DE COLO, PRESENCA DE HIPEREMIA EM PAREDE VAGINAL
PRESENCA DE POLIPO EM PAREDE VAGINAL ESQUERDA 

CONDUTA:
SOLICITOEXAMES LAB , 
EC\\XAMES DE IMAGEM
INDICO SUPLEMENATCA DE VITAMINA D E VITAMINA C INJETAVEL 240 + 160
ORIENTO EXERESE DE POLIPO VAGINAL  1800,00
--------------------------------------------------------------------------
DUM: 2021
HISTERECTOMIA 
System em adesivo e progesterona de 200 mg ,testosterona transdermic2 vezes na semana , oxadrolona de 3,5 mg sl, LIBERDIA, ROSUVASTATINA 

PACIENTE ASSINTOMATICA 

Exames laboratoriais do dia 14 e 9 de 2026 

AC URICO 4,5 
tgo 32 
tgp 31 
glicose 89 
triglicerídeos 59 
colesterol 171 
creatinina 0,80 
ferritina 189 
ferro Serico159 
hemoglobina 14,7 
hemato 45,6
 leoco 6930 
plaqueta 270000 
EAS leucos positivos piox 2 por campo flora bacteriano normal
Coaglograma normal 
beta negativo

ao exame: ausencia de colo, presença de pólipo em parede vagoinal esquerda, presença de secreção esbranquiçada 
conduta:

realizo 1 sessao de laser
zelix ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61873632, '934', 'Maralene Lisboa dos Santos', 2, 0, '04173548273', NULL, '(97) 98112-8058', '1999-05-15', 1, 'Ligar no Mês de Agosto para Confirmar a Vacina de Cândida  no Valor de 480,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62161958, '986', 'MÁRCIA CLÁUDIA DUTRA', 2, 0, '90682254215', NULL, '(69) 99359-1947', '1986-11-11', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60501013, '645', 'Marcia Cristina Aragão', 2, 1, '49754041253', NULL, '(69) 8102-5235', '1975-05-26', 1, 'idade: 50 anos 
PLANO DE SAUDE - UNIMED 
DUM: MENOPAUSA COM 47 ANOS - TRH 2 MESES - PROGESTERONA E LAZETOT SPRAY, FAZ REPOSICAO DE VITAMINAS 
G0 P0 A0
MC: ACO
UPCCU: + 2 ANOS 
COMORBIDADE: TIREOIDE - PURAN T4 150 MG - DRA BARBARA

QP: PACIENTE REFERE DISPAREUNIA, ALEGA SECURA VAGINAL, SECRECAO VAGIANL ESBTRANQUICADA, SEMPRURIDO, COM ODOR , PIORA APPOS RELACAO SEXUAL, NEGA COSTIPACAO, SONO PRESERVADO
ATIVIDADE FISICA FREQUENTE 
AO EXAME
EXCESOO DE PELE EM PERINEO POSTERIOR
COLO CENTRALIZADO, PUNTIFORME, PRESENCA DE SECRECAO ESBRANQUICADA COM BOLHOSAS

COLETO PREVENTIVO EM MEIO LIQUIDO 
EXERESE DE EXCESSO DE PELE EM PERINEO POSTERIOR     ----------- 7650,00 nas ferias em novembro 
AGUARDO EXAMES IMAGEM 
crevagin E SECNIDAZOL 

Uso oral

1.	SECNDAZOL1G  ______________04 comprimidos
Tomar 02 comprimidos via oral dose única, para casal.

Uso vaginal 

2.	CREVAGIN___________________________01 caixa 
Aplicar, á noite, via vaginal por 7 dias 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60061368, '585', 'Márcia Cristina da Silva Morais', 2, 1, '22196374253', 'marciamoriis32@gmail.com', '(69) 9267-8856', '1967-03-27', 1, 'PACIENTE COM HIPERCROMIA NA REGIAO INTIMA 

PROTOCOLO DE CLAREAMENTO INTIMO 

PEELING E LASER 800,00

08/08/2025 
LASER ACROMA 900 + PEELING INTIMO 

HOME CARE 
 PACIENTE REALIZOU O PEELIG COM A DONA NEIVA NO DIA 10/09/2025

retorno dia 13/10/2025
paciente refere que realizou 3 dias de hidratação, nao uso clareamento por 3 dias 

retorno
 oestrogel, testosterona, de medicação 
hoje vem para clareamento intimo 

27/12/25
paciente realizou laser vulvar e deixou pago o peeling para daqui 20 dias

03/03/26
paciente realizou o peeling com a doutora

------------------------------------------------




TERMO DE CONSENTIMENTO LIVRE E ESCLARECIDO
PREENCHIMENTO DOS GRANDES LÁBIOS DA VULVA

Paciente: MARCIA CRISTINA DA SILVA MORAIS 

Data de nascimento: 27/03/1967

CPF: 221.963.742-53
Médica responsável: DRA CHRISTIANE ALVES CALIXTO – CRM 3316
Data: 03/09/2026



1. DESCRIÇÃO DO PROCEDIMENTO
Declaro que fui informada, de maneira clara e compreensível, sobre o procedimento de preenchimento dos grandes lábios da vulva, que consiste na aplicação de substância preenchedora na região vulvar, com o objetivo de promover aumento de volume, melhora do contorno e/ou correção de alterações relacionadas à perda de volume dos grandes lábios.
O procedimento será realizado por meio de aplicações com agulha e/ou cânula, utilizando o seguinte produto: renovva deep line-lido lLOT VO4513 



Fui informada de que o resultado pode variar de acordo com características individuais, anatomia, quantidade de produto utilizada, técnica empregada e resposta do meu organismo.

2. OBJETIVOS E EXPECTATIVAS
Estou ciente de que o procedimento tem finalidade estética e/ou reparadora, conforme indicação individualizada, e que não existe garantia de resultado específico.
Compreendo que podem ser necessárias sessões adicionais para atingir ou manter o resultado desejado, mediante nova avaliação médica.
Também fui informada de que o resultado pode ser temporário, dependendo do produto utilizado e de sua absorção pelo organismo.

3. RISCOS E POSSÍVEIS COMPLICAÇÕES
Fui esclarecida de que, apesar de serem adotadas medidas para reduzir os riscos, podem ocorrer complicações, incluindo:
•	Dor, ardência ou desconforto durante ou após o procedimento;
•	Vermelhidão, edema e sensibilidade local;
•	Hematomas e equimoses;
•	Pequenos sangramentos;
•	Coceira ou irritação;
•	Assimetria ou irregularidade do contorno;
•	Formação de nódulos ou áreas endurecidas;
•	Resultado estético insatisfatório ou diferente do esperado;
•	Infecção;
•	Inflamação persistente;
•	Reação de hipersensibilidade ou reação inflamatória ao produto;


•	Migração ou deslocamento do material, dependendo do produto utilizado;
•	Alterações de coloração ou cicatrização;
•	Necessidade de tratamento complementar ou procedimento corretivo.
Fui informada de que complicações vasculares, embora incomuns, podem ocorrer em procedimentos com substâncias injetáveis e podem causar sofrimento tecidual e outras consequências importantes, dependendo do produto e da técnica utilizada.
Estou ciente de que complicações graves são possíveis, embora pouco frequentes, e que podem exigir tratamento médico adicional, inclusive procedimentos para correção ou remoção do material quando tecnicamente possível.

4. ALTERNATIVAS
Fui informada sobre a possibilidade de:
•	Não realizar o procedimento;
•	Realizar acompanhamento clínico;
•	Considerar outros tratamentos, quando indicados;
•	Optar por outro procedimento ou técnica, conforme avaliação médica.
Tive oportunidade de discutir as alternativas com o profissional responsável.

5. CONTRAINDICAÇÕES E CONDIÇÕES DE SAÚDE
Declaro ter informado ao médico sobre minhas doenças, alergias, medicamentos em uso, procedimentos prévios, gestação ou possibilidade de gestação, infecções e demais condições relevantes.
Comprometo-me a informar qualquer alteração no meu estado de saúde antes do procedimento.
Fui orientada de que o procedimento poderá ser adiado ou contraindicado caso sejam identificadas condições que aumentem o risco de complicações.

6. CUIDADOS APÓS O PROCEDIMENTO
Receberei orientações específicas sobre os cuidados após o procedimento e sobre sinais e sintomas que deverão motivar contato com o profissional ou procura por atendimento médico.
Comprometo-me a seguir as orientações fornecidas, especialmente quanto a higiene local, atividades físicas, atividade sexual e uso de medicamentos, quando aplicável.

7. DECLARAÇÃO DE CONSENTIMENTO
Declaro que recebi explicações claras e suficientes sobre o procedimento de preenchimento dos grandes lábios da vulva, incluindo sua finalidade, benefícios esperados, limitações, alternativas e possíveis riscos e complicações.
Tive oportunidade de fazer perguntas, que foram respondidas de maneira satisfatória.
Declaro que minha decisão de realizar o procedimento é livre e voluntária, sem qualquer tipo de pressão, e que compreendo que não há garantia de resultado estético específico.
Autorizo a realização do procedimento descrito neste termo.
Declaro, ainda, que recebi uma via deste documento e que estou ciente de que posso retirar meu consentimento antes da realização do procedimento.












Local: _________________________________________________
Data:
Assinatura da paciente:


 




Nome completo: DRA CHRISTIANE ALVES CALIXTO 
Assinatura do(a) médico(a):


 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59397541, '473', 'Marcia Cristina Pinheiro Nunes Costa', 2, 2, '00113754264', NULL, '(69) 99272-5652', '1989-06-20', 1, 'IDADE 35 ANOS
G: 3 P:3 A:0
DUM: 11/03/2025
UPCCU: + 2 ANOS
MC: VASECTOMIA

Q.P: PACIENTE REFERE IRREGULARIDADE MENSTRUAL, ULTIMA CESAREA 1 ANO E 11 MESES, PAROU AMAMENTAÇÃO HÁ +- 3 MESES, ALEGA SINDROME DE OVARIO POLICISTICO.
SOLICITO EXAME E USGTV', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61656975, '891', 'MARCIA CRISTINA SEMBRASKI', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60083970, '599', 'Marcia Mendonça dos Santos', 2, 3, '22024662234', NULL, '(69) 9222-3089', '1966-08-03', 1, 'idade: 58 anos 
menopausa + 10 anos - fez tri com tibolona, nativa pro (atualmente) 
G4 P3 N 1C A 0
UPCCU: 11 /2023

QP: PACIENTE REFERE PERDA DE URINA AOS PEQUENOS ESFORCOS,  NEGA RESSECAMENTO VAGINAL, REFERE FLACIDEZ VAGINAL, ALEGA PUM VAGINAL, ALEGA UMA ASSIMENTRIA DOS PEQUENOS LABIOS,
ENTREGO TERMO DE CONSETIMENTO DE LASER PARA PACIENTE 
REALIZO ORIENTACOES E INFORMACOES SOBRE LASER, ESCLARECIMENTO DE DUVIDAS SOBRE O LASER 

ao exame: 
colo centralizado, presença de secreção fluida esbranquiçada, sem odor e sem grumos 

conduta: 

orçamento 5650, 00 6 vezes e 
5150,00 a vista 
realizo assepsia do canal vaginal, realizo laser intimo, entrego ornamento de ninfoplastia 
GINOBIOTTA ___________________01 CAIXA
TOMAR 01 COMPRIMIDO VIA ORAL, 1 VEZ AO DIA, POR 3 MESES 

mirabi 1 vez ao dia 

-------------------  /// ------------------
01/12/2025
em uso de mirai, alega melhora no inicio, porem depois apresentou novamente IUE nas ultimos 7 dias 
apresenta resultado de exames 03/10/25
vit b 12 803 / ferritina 105 / vit d 42 / FSH 36 /LH 30 / ESTRADIOL 35/ PROGESTERONA 0,25 / PROLACTINA 8,2 / VIT C 0,52 
EM USO DE NATIFA PRO - PACIENTE REFERE QUE SE ADAPTA BEM A MEDICACAO
2 SESSAO DO LASER - PROVAGIN, FLUCONAZOL 2 DOSES, ALTA D 50.000 UI POR SEMANA, FISIOTERAPIA PELVICA 

08/01/2026
paciente referente que ainda esta tendo escape de urina
alega que já iniciou fisioterapia pelvica 
conduta: orientações
manter laser
manter fisioterapia ( com feedback de laudo)
Mirab ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61614848, '878', 'Márcia Moura Ribeiro', 2, 0, '90620504099', NULL, NULL, '1978-10-23', 1, 'Consulta em 21 de agosto (Confirmado)
Procedimento ninfoplastia com perineo em Setembro (há confirmar)', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58920773, '20', 'Marcia P Dos Santos', 2, 0, '05038914284', NULL, NULL, '1981-02-09', 3, 'Q.P: DISPAREUNIA, ALEGA DOR EM BAIXO DO VENTRE QUE IRRADIA PARA PERNA DIREIT. LABILIDADE EMOCIONAL, ANSIEDADE.
USG 28/04/2023 USG DE ABDOME NORMAL 
USG TRANSVAGINAL 26/04 HISTERECTOMIA, OD CISTO ONICULAR, CISTO HEMORRAGICO, OE NÃO VISUALIZANDO.
PREVENTIVO 19/04/23 GARDNERELLA, NEGATIVO PARA MALIGNIDADE.
NO EXAME DOR AO TOQUE, ODOR NA LUVA.
CONDUTA:', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59230523, '437', 'Marcia Regina Souza Da Conceição', 2, 0, '64024601253', NULL, '(69) 99394-9011', '1980-01-16', 1, 'IDADE 45 ANOS
DUM 31/03/2025
MC: LT
G3 P3C A0
COMORBIDADES: NEGA
MEDICACAO NEGA
UPCCU: 2023
MMG 2023
ALERGIA: NEGA 

PACIENTE VEM PARA COLETA DE PREVENTIVO 
PACIENTE APRESENTA RESULTADO DE EXAMES 

11/12/2024 
EAS PRESENCA LEVEDURAS - REFRE TRATAMENTO COM CREME VAGINAL  EM DEZEMBRO DE 2025 
VITAMINA B 12 303
RESISTENCIA INSULINA 9,51 
VITAMINA D 25,50
GLICOSE 104
MAGNESIO 1,87 
SNR
ANTI HBS REAGENTE 


AO EXAME


CONDUTA: ORIENTACOES 
COLETADO PREVENTIVO 
ORIENTO QUANTO A REPOSICAO DE VITMAINA D, B 12 

12/06/2025
PACIENTE VEM PARA REPOSICAO DE VITAMINA B, K2MK7 E D 
MANUTENCAO
REFORCO COM 60 DIAS 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61199422, '790', 'MARCIA SILVA RODRIGUES DOS SANTOS', 2, 0, '76867099220', NULL, '(69) 99386-0634', '1983-07-04', 3, '42 ANOS 
G1 P1 A0
DUM: HISTERECTOMIA AOS 28 ANOS 
UPCCU: 2024
COMORBIDADE: ANSIEDADE,  ( VELAFAXINA), DERMATITE ATOPICA - APRESENTANDO URTICARIA DIFUSA NO CORPO, TIREOTEOPATIA (NEGA USO DE MEDICACAO)

PACIENTE VEM PARA ROTINA GINECOLOGICA 

CONDUTA: 
ORIENTACOES
EXAMES LAB
USG TV E USG DE MAMAS 
--------------------
06/04
assintomática, vem para usg tv 
histerectomia parcial 
dum-------

NOME: MARCIA SILVA RODRIGUES DOS SANTOS
DATA: 06/04/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico, presença de cisto de naboth ás 2 horas 

Útero:  Útero não visualizado, compatível com história de histerectomia prévia.


Ovário direito: tópico, volume de 1.9 cm³, de forma habitual, contorno preservado e textura normal.

Ovário esquerdo tópico: Ovário não visualizado ao exame, não sendo evidenciadas formações expansivas anexiais.

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Histerectomia prévia parcial, ovário esquerdo não visualizado, cisto de naboth ás 2 horas



OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59265858, '443', 'Marciele Batista Ferreira', 2, 0, NULL, NULL, '(97) 8411-4073', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60477898, '638', 'Marcileia Alves de Lima', 2, 1, '85323357215', NULL, '(69) 99209-5045', '1984-04-05', 1, 'IDADE: 41 ANOS 
PLANO VIVA VIDA 
DUM: 15/10/2025
MC:  PRESERVATIVO
G 4 P2 A2 
UPCCU: + 1 ANO
COMORBIDADES: MIOMATOSE UTERINA E CISTO OVARINAO 

QP: PACIENTE REFERE CANAL VAGINAL COM FLACIDEZ,APOS PARTO VAGINAL, ALEGA HIPERTROFIA DE PEQUENOS LABIOS, 

EXAMES LAB 
Exames laboratoriais do dia 30 do set de 2025 hemoglobina 12,5 hematócrito 38,4 leucócito 7360 plaquetas 233000 por é 18,9 creatina 0.7 glicose 86 coagulograma normal EAS normal sorologia não reagente
Vitamina D 32,7 (reposição) tgo 15 tgp 12, beta h CG negativo, 

ultrassonografia de mamas do dia 30/07/2025 bi rads 3 cisto simples mamários passados bilaterais se isso com conteúdo  espessos bilaterais
mamografia do dia 30/07/2025 BRADS I
AO EXAME:
FLACIDEZ DE GRANDE LABIO - PREENCHIMENTO E BIOESTIMULADOR 
PEQUENO LABIO HIEPERTROFIA E ASSIMENTRIA A ESQUERDA 
PERINEOPLAASTIA POSTERIOR 

COLO CENTRALIZADO EM FENDA, SANGRANTE A COLETA ( MENSTRUACAO?)

CONDUTA: COLETO PREVENTIVO EM MEIO LIQUIDO COM VIDEOCOLPOSCOPIO, ENTREGO MATERIAL PARA PACIENTE, 

06/11/2025

DUM 15/10
APRESENTA EXAMES 
Ultrassonografia transvaginal do dia 28/10/2025 útero 141,2 com presença de miomas posterior intramural medindo 1,1 presença de um cisto millimetre ao na parede anterior 0,5 cm endométrio 10,8 mm ovário direito 1,7 com presença de corpo lúteo com volume de 10,1 cm³ ovário esquerdo 3,9 exame nódulos uterinos sugestivo de mioma cisto miometriais ao simples corpo no último var direito
Exames laboratoriais SHBG 49,1 testosterona 18 vitamina B12 335 Vitamina D 56,8 tsh 1,31 t 4 livre 0,99 Vitamina A 0,47 vitamina C 0,8 LH 4.4 fsh 5,72 progesterona zero ponto 10 estradiol 144 insulina 9.2 cortisol 11,2 PCR ferritina 27,6 magnésio 2,1 gama GT 17 colesterol 213 triglicerídio 80 uma globina glicada 5.6% fap 77 glicose 96 hemoglobina 12,5 hematócrito 35,6 Leandro 5960 plaqueta 200 33
Preventivo do dia 4 do 11 negativo para neoplasia processo inflamatório moderado presença de gardnerella

CONDUTA: REPOSICAO DE VITAMINA B 12, GYNOTRAN E SECNDAZOL
REPOSICAO DE VITAMINAS PARA DISPOSICAO 460, 00 CADA DOSENECESSITA DE 2 DOSES 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60598574, '677', 'Marcionila Ferreira Veloso', 2, 0, '03999975393', NULL, '(69) 9218-9490', '1989-08-13', 1, 'Idade 36 anos 
data da última menstruação dia 9/10/2025
GOPO
UPCCU: 23 de junho de 2025 negativo para neoplasia mas candidíase exames laboratoriais do dia 23/06/2025 vitamina B12 200 vitamina D 25,4 hemoglobina 7,2 hematócrito 26,9 leucócito 9300 plaqueta 302000 triglyceride 73 colesterol total 104 glicemia 94 t go 22 tgp 14 creatina 1,3
Exames de imagem ultrassonografia transvaginal 11/03/2022 útero avf volume 123,8 cm³ presença de miomas em parede posterior de 25,8 por 18,5 e 14,2 por 10,9 e outro em parede anterior medindo 19,5 por 18 ambos do tipo intramural endométrio de 11,7 ovário direito de 1,3 ovário de esquerdo de 4 ultrassonografia transvaginal do dia 12/04/2023 útero 135 endométrio de 11 mm ovário direito de 7,6 ovário esquerdo de 3,4 conclusão Mion 1000 ultrassonografia do dia 28/10/2025 útero avf presença de mioma intramural sub seroso medindo 4,2 por 4,5 parede posterior 3,5 por 3,3 em parede anterior endométrio de 6,7 mm volume uterino de 342,4 cm³ para o direito não caracterizado abre parentes atrófico? Interposição? Fecha parentes ovário esquerdo de 2,7 e pode ser diagnóstica o trio com tamanho aumentado a custa de nódulos uterinos sugestivo de mioma ovário direito não caracterizados ao exame colo centralizado puntiforme presença de secreção esbranquiçada com odor em orifício cervical interno presença de borra de café 
conduta solicita exames laboratoriais hemograma ferro ferritina vitamina B12 vitamina D triplo a vore que surgiram em sessão de DIU de mirena

retorno dia 17/11/2025
Exames laboratoriais no dia 31/10/2025 hemoglobina 10 hematócrito 33,5 leucócitos 6940 plaqueta 256000 ferro 61 Vitamina B12 582 Vitamina D 30,8 ferritina 7,74

noripurum
vitamina b 12 e vitamina d 

aplicação paciente trazendo noripueeum e vital e d 860,00 as 5 aplicações de noripiurum
paciente prefere via oral 
NOME: Marcionila Ferreira Veloso

Uso oral
1.	ALTA D 50.000UI  ____________________01 caixa
Tomar 01 comprimido via oral por SEMANA, durante 30 dias. 

2.	Hemoplip _________________________03 caixas
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses

Uso sublingual 

1.	Dozemast 1000mcg _________________________03 caixas
01 comprimido SL 1 vez ao dia, por 3 meses 

tamisa sem parar
Uso oral
1.	Tamisa 30 sem parar  ____________________01 caixa
      Tomar 01 comprimido via oral no primeiro dia do ciclo, 1 vez ao dia, no mesmo horário, seguindo cartela, sem pausa.


retorno com 3 meses 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60619148, '691', 'Marcleide Rodrigues dos Santos', 2, 0, '73121525204', NULL, '(97) 8114-6236', '1981-09-16', 1, '44 ANOS
G1 P1 
DUM: 27/10/2025
MC: PRESERVATIVO

PACIENTE REFERE SECRECAO VAGINAL ESBRANQUICADA COM PRURIDO E ARDENCIA, COM ODOR 
JA FEZ USO DE VARIAS MEDICACOES SEM MELHORA,
ALEGA SINUSSORRAGIA, 

USG TV 27/09/2025: UTERO 96,8 CM, PRESENCA DE MIOMA INTRAMURAL EM PAREDE ANTERIOR / OD 7,8 /OE 5,5 
PREVENTIVO EM MEIO LIQUIDO 03/10/2025: NEGATIVO PAAR NEOPLASIA E COMPATIVEL COM INFLAMACAO INESPECIFICA 

AO EXAME 
COLO CENTRALIZADO, PRESENCA DE SECRECAO ESBRANQUICADA, FLUIDA COM ODOR , CISTO DE NABOTHNAS 12 H 

ZELIX , GYNOTRAN 2 CAIXAS , SECNIDAZOL GINOBIOTTA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61027111, '746', 'Margarete Kuriyama', 2, 0, '83669205268', NULL, '(69) 9223-2722', '1983-08-09', 1, 'IDADE: 42 ANOS
G6 P2 A4
MENARCA: 13 ANOS
SEXARCA: 21 ANOS
DUM: 18/01/2026
MC: LT 
UPCCU:2022
COMORBIDADE: OBESIDADE/HAC
MEDICACAO/ ALERGIA/: NEGA
CIRURGIA: CESAREA/ COLECISTECTOMIA/

QP: PACIENTE REFERE IRREGULARIDADE MESNTRUAL. MENORRAGIA ALEGA QUE NUNCA FEZ MMG, ALEGA PERDA DE URINA AOS PEQUENOS ESFORCOS 

COLO CENTRALIZADO, SECRECAO ESBRANQUICADA, FLUIDA, SEM ODOR 
PRESENCA DE CISTO DE NABOTH AS 1, 3 E 5 HORAS 
SANGRANTE A COLETA 

CONDUTA; 
ORIENTACOES
COLETADO PREVENTIVO
EXAMES LAB
USG TV
MMG
USG DE MAMAS

-----02/03 --------

preventivo 07/02/26; negativo para neoplasia + inflamacao bacteriana 
Exames laboratoriais do dia 4 do 2 de 2026 
hemoglobina 14,1 hematócrito 34,5 leuco 8600 plaqueta 345000 
glicemia de jejum 100,2 colesterol 224 HDL 47 ldh de 177 triglicerídeos de 94 testosterona total 17 TGO 18 TGP 14 ferro sérico 53 uréia 24 magnésio 2,2 creatinina 0,67 progesterona 3,5 tsh 1,66 estradiol 48 fsh 2,1 insulina 18,8 SHBG 30 LH 4,6 ter 4 livros 1,03 PCR inferior 6 ferritina 42 Vitamina B12 461 Vitamina C 0,7 vitamina E 15 vitamina D 32
DENSIitometria óssea do dia 5/02/2026- NORMAL
Ultrassonografia de mamas e axilares do dia 5/02/2026 BIRADS I
Ultrassonografia transvaginal do dia 5/02/2026 útero Retro verso fletido volume de 141 cm³ endométrio 4,7 mm ovário direito 4,2 ovário esquerdo 5,5 presença de mioma submucoso fúnDico 41 mm 
mamografia o dia 5/02/2026 bi rads 2

CONDUTA: 
ORIENTACOES
DIETA ALIMENTAR
REPETIR EXAMES COM 3 MESES 
GYNOTRAN
REPOSICAO DE VITAMINAS B 12 VIA ORAL 
VITAMINA D IM 
indico laser intimo para IUE
HEMOLIP 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61012580, '740', 'Margareth da Silva Martins', 2, 0, '01637648243', NULL, '(69) 9201-3983', '1993-07-03', 1, 'retorno por mensagem de whatssapp bruna 
progesterona e estradiol baixos 
sup;lementacao de vitaminas 
retorno on line ou presencial em Humaitá com 3 meses 
usa tamisa 30, doutora troucou por nextela sem pausa

Dona Margareth,

Informamos que, na sua investigação para endometriose, não foi evidenciado nenhum sinal, estando o exame dentro da normalidade.

Os demais resultados também estão normais:
– Fator reumatoide: negativo
– HIV: negativo
– Anemia: negativo

A doutora observou a necessidade de melhorar seus níveis de vitamina B12, e a receita já será encaminhada.

A doutora também solicita, por gentileza, que nos informe qual método contraceptivo a senhora utiliza atualmente.

Além disso, será necessário repetir os exames hormonais em 3 meses e realizar uma consulta de retorno nesse mesmo período para avaliação dos resultados.

Esse retorno poderá ser realizado de forma online ou presencialmente em Humaitá, conforme sua preferência.

MARGARETH DA SILVA MARTINS

32 ANOS 
DUM: 17 / MAIO
MC: NEXTELA 
PROFESSORA
HISTORICO DE ENDOMETRIOSE 

PACIENTE REFERE QUE AUMENTOU O FLUXO DA MENSTRUACAO COM COÁGULO 
PRECISANDO DE TOMAR VITAMINA K E ACI TRNOXICAMICO, FEZ USO DO TAMISA SEM PARAR 
POREM USG TV EM JANEIRO SEM ALTERACAO 
ALEGA LI




Exames laboratoriais do dia 28/04/2026 estradiol inferior a 20 progesterona 1,3 prolactina 11,9 vitamina B12 895 hemoglobina glicada 5,4
Exames laboratoriais do dia 7/05/2026 cortiça 11,4 como sistema 8,3 magnésio 22 vitamina D28 ferro 119 ferritina 245 insulina 8,8 fsh 53 LH 38 testosterona total 835 SB SLHS 36 cobre 170 5 82 selênio 116 vitamina 0,6 vitamina E 19,8 vitamina C um PCR não reagente EAS não infeccioso

Flibanserin
Maniopulado para libido 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61055842, '756', 'MARIA ADRIANA GOMES DE SOUZA', 2, 0, '59745118249', NULL, NULL, '1970-06-07', 3, 'IDADE 55 ANOS 
G 5P3A2
DUM: JANEIRO DE 2025
UPCCU: 2024
COMORBIDADES: ANSIEDADE, TIREOIDE 
MEDICACAO EM USO:  PURAN , AMITRIPTILINA 

QP: PACIENTE REFERE DOR EM BAIXO, 
ALEGA QUE ESTA PASSANDO POR ESTRESSE COM OS VIZINHOS, DEVIDO SOM ALTO, NAO CONSEGUE DORMIR ( MAS JA ESTA PROVIDENCIANDO A JUSTIÇA),  APRESENTANDO CRISE DE HERPES EM REGIAO INTIMA, E CEFALEIA CONSTANTE 

CONDUTA: 
ORIENTACOES 
USG TV
COLETAR PREVENTIVO
SOLICITO EXAMES LAB 
SOLICITO

HEMOGRAMA   
HERPES TIPO I E II 
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
EAS

--------------------

NOME: MARIA ADRIANA GOMES DE SOUSA 
DATA:07/02/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga parcialmente cheia.

Vagina: com eco central normorrefrigente.

Colo uterino: anatômico

Útero:  em anteversoflexão, centralizado medindo 8,05 x 3,7 x .5,6 cm (volume: 90,5cm³).
Ecotextura miometrial é heterogênea, com presença de ilhas ecogênicas sombras em estrias, com paredes assimétricas, podendo corresponder a sinais indiretos de adenomiose, a demais  de nódulos hipocogênicos, bem definidos, assim descritos:
•	N1: parede posterior, intramural com componente subseroso (FIGO 5), medindo 1,2 X 0,8 X 1,2 CM
Endométrio: centrado, irregular, ecogênico e com espessura de 4 mm de basal a basal, com perdas de zona juncional e presença de estrias ecogênicas. 

Ovário direito: tópico, volume de 1,0cm³, de forma habitual, contorno preservado e textura normal.

Ovário esquerdo tópico: volume de 1,2 cm³, de forma habitual, contorno preservado e textura normal.

Ausência de líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Miomatose uterina
Sinais sugestivo de adenomiose
Ovários atróficos 

NOME: Maria Adriana Gomes de Sousa 
DATA:



ULTRASSONOGRAFIA DA TIREÓIDE 
TÉCNICA:
Realizado estudo com transdutor linear multifrequencial nas modalidades bidimensional, 

RELATÓRIO:
Tireóide tópica, móvel à deglutição, com dimensões normais, contornos regulares, ecotextura heterógena devido a nódulos, com  ecogenicidade usual.
N1: no terço inferior do lobo direito, nódulo sólido, arredondado regular, bem delimitado, hipoecogênico, mais largo que alto, sem calcificações, medindo 0,28 x 0,19 x 0,31cm, com fluxo periferico ao Doppler (TI-RADS 4).
C1: no terço médio do lóbulo direito se observa imagem anecoica de paredes finas circunscritas bem delimitado, com calcificação em calda de cometa medindo 0,3 x 0,1 x 0,2cm correspondendo a cisto simples ( TI-RADS1)

Medidas:
•	Lobo direito:1,2 x 4,3 x 1,5 (volume de 4,12cm³).
•	Lobo esquerdo: 2,3 x 1,9 x 1,0(volume de 1,36cm³).
•	Istmo: 0,2 x 1,9 x 0,9 mm.(volume de 0,46)
•	Volume total da glândula 6 cm³.
O volume normal da glândula tireóide é de aproximadamente 6 a 15 - cm³.
Grandes vasos cervicais pérvios e com calibres normais.
Não foram identificadas anormalidades morfológicas em linfonodos cervicais satélites.


IMPRESSÃO: 
Nódulo e cisto tireoideano 


-------------------------------      ///     -----------------------

Os exames laboratoriais do dia 18/03/2026 ácido úrico 3,67 clico 99 triglicerídeos 151 purê é 24 creatinina 0,9 colesterol total 195 ferritina 136 hemoglobina glicada 5.7 TJ 23.9 e GT 15.7 ferro 58 vitamina B12 456 t 4 livre 1,54 tsh 3,5 vitamina D 36,2 hemoglobina 12,5 hematócrito 36 leucócitos 5840 plaqueta 284000

preventivo 24/03/26: neg para neoplasia 
mas nao infeccioso 

conduta: orientações 
repetir usg tireoide 6 meses 
suplementação de vit d via oral 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58927080, '68', 'Maria Adriana Gomes Souza', 2, 1, '05038914284', NULL, '(69) 9924-8646', '1976-06-07', 3, 'Q.P: DOR EM BAIXO DO VENTRE, SECREÇÃO VAGINAL AMARELADA COM ODOR, EM USO DE CREME VAGINAL NÃO SABE O NOME. 
CONDUTA:BACTERIOSCOPIA SECREÇÃO VAGINAL, USGTV.
RETORNO 07/11/22 PACIENTE REFERE SANGRAMENTO VAGINAL NO MES DE SETEMBRO, DEGA DOR, NEGA ODOR, NEGA SECREÇÃO,NEGA SANGRAMENTO NO MOMENTO, APRESENTA BACTERIOSCOPIA NORMAL 15/08/22, CONDUTA: NO AGUARDO DO PREVENTIVO.
15/09/23 PACIENTE REFERE QUE ESTEVE NA UPA DEVIDO HEMATURIA, FOI SOLICITADO USG DE RINS E VIAS, REALIZOU USG DIA 31/08 NORMAL.
APRESNTA USGTV 11/10/22, VOLUME 135, MIOMA PAREDE POSTERIOR.
PREVENTIVO 11/07/23 NEGATIVO PARA MALIGNIDADE.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921700, '28', 'Maria Andreia Da costa Guimaraes', 2, 0, '05038914284', NULL, NULL, '1987-07-03', 3, 'PACIENTE SEM QUEIXAS NO MOMENTO, APRESENTA EXAMES USGTV 20/03.
UTEERO 90 CC, PAREDE ANTERIOR, NODULO 23X14 (INTRAMURAL).
ESPASSAMENTO ENDOMETRIAL A/E.
CONDUTA:REPETIR USGTV
RETORNO: APRESENTA USG TV 19/04/2023 
UTERO 93,7 CM, OD 7,6, OE6,5.
EXAME NORMAL.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924562, '50', 'Maria aparecida dos santos', 2, 1, '39038165234', NULL, NULL, '1971-03-11', 3, 'LAQUEADURA TUBBARIA, PERDA DE URINA AOS PEQUENOS ESFORÇOS.
CONDUTA:ESTUDO URODINAMICO.
RETORNO:AINA NÃO REALIZOU O ESTUDO URODINAMICO.
PREVENTIVO: 08/08/24 NEG PARA NEOPLASIA,
ENCAMINHAMENTO A GINECO CIRUGIA

------------  //. --------------

paciente vem com resultado de estudo urodinâmico realizado dia 19/02/25: exame normal, porem não descarta IUE
A paciente refere fogacho, dor nas articulações, irritabilidade, insônia, nega secura vaginal
encaminho a POC
solicito exames Lab 

--------------------   // ---------------
COLESTEROL 191
TRIG 157
FERRITINA 44,3
FERRO 50,6
VITAMINA B12 421.  / VIT D 39,6
ESTRADIOL 59
FSH 17,3
LH 15,4
TSH 6,47 / T 4 LIVRE 0,84
PROGESTERONA 0,05
HB 13/ HT 39/ LEUCO 6910/PLQ 27500

USG DE RINS E VIAS URINARIA S06/03/25 DENTRO DA NORMALIDADE

CONDUTA: ORIENTACOES, NEUTROFER, DOZEMAST
SOLICITO BACTERIOSCOPIA ( PACIENTE REFEERE FUNDO DE CALCINHA UMIDO  COM SECRECAO ESBRANQUICADA) 
REPETIR TSH COM 3 MESES

27/03:
LEUCOCITOS MODERADA, FLORA BACTERIANA MODERADA, TRICHOMONAS AUSENTE, LEVEDURA AUSENTE .
PROVAVELMENTE PERDA DE URINA AOS ESFORCO MOLHANDO A CALCINHA 
PACIENTE IRAR REGULAR GINECO CIRURGICA P;ARA POC 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60994400, '734', 'MARIA BIANCA', 2, 0, '05038914284', NULL, '(92) 9333-5515', '1999-11-19', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59425071, '479', 'Maria Carolina Reche', 2, 1, '01528163214', NULL, '(16) 99633-3010', '2002-10-30', 1, 'idade: 22 anos
DUM: 8/05/2025
MC: ACO 
MENARCA:  13 ANOS
SEXARCA: 17 ANOS
MEDICACAO EM USO: SERTRALINA
COMORBIDADE: DEPRESSAO / ANSIEDADE
ALERGIA A MEDICACAO NEGA
UPPCU: + 2 ANOS 
NEGA HISTORIA DE CANCER DE MAMA NA FAMILIA 
ESTUDANDE DE MEDICINA - FIMCA 

QP: PACIENTE REFERE SECRECAO VAGINAL AMRELADA, NEGA ODOR, NEGA PRURIDO, INICIOU HÁ MAIS OU MENOS 3 SEMANAS, NEGA DISPAREUNIA, NEGA ATIVIDADE SEXUAL NO MOMENTO, NEGA DISURIA, NEGA ALGIA MAMARIA, NEGA OUTRAS QUEIXAS 
ALEGA TAMBEM REGIAO INTIMA ESCURA 

CONDUTA: ORIENTACOES, COLETADO PREVENTIVO 

29/05: realizado 1º sessã0 de peeling 
12/06/25: potencializados ( utilizar betamtol derma por 3 dias seguidos, após retornar uso de clareador)

agendar 2 sessão de peeling com 30 dias após a 1º sessão 
-------------------------------------------------------------------------------------------
07/07/2025
paciente realizou segunda sessão de peeling 

apresenta resultado de exames.
col 211, 
vit b12 630
glicemia 97
hbglicada 5%
tsh 3,45
mg 2,1
ferritina 84
hb 14, 
ht 40,9

conduta: reposição de vitamina B12/ D/ K2mk7
valor: 480,00 reais.
------------------------------------------------------------------------
DIA 21/07
PACIENTE VEM PARA REALIZAR O POTENCIALIZADOR NO DIA 21/07 AS 11:00 COM A DONA NEIVA.
 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62074748, '970', 'Maria Clara Marinho Alves', 2, 0, '02796934276', '970clara@gmail.com', '(97) 98431-6578', '2006-10-05', 1, 'Paciente  Maria Clara Marinho Alves 19 anos.
Paciente Já realiza consulta na cidade de Humaitá, Exames de sangue anexado ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58920361, '17', 'Maria Cristina S. De Silva Martins', 2, 0, '05038914284', NULL, NULL, '1988-07-17', 3, 'Q.P: PACIENTE REFERE SENSAÇÃO DE MOVIMENTO DENTRO DA BARRIGA.
REFERE A REGULARIDADE MENSTRUAL
NEGA NODULO MAMARIO
CONDUTA:EXAMES LABORATORIAIS
USG TV ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58923456, '37', 'Maria Da Conceição Leite Dos Santos Rocha', 2, 0, '05038914284', NULL, NULL, '1974-02-23', 3, 'Q.P: VEM DEVIDO A ALATERAÇÃO DO PREVENTIVO.
01/09/22=A5C-H
PACIENTE NEGA SECREÇÃO VAGINAL, REFERE COLETA DE NOVO NO HOSPITAL DO AMOR, JUNTAMENTE FEZ MAMOGRAFIA E USG DE MAMAS.
MAMA DIREITA APRESENTA CISTO 1,5CM, COM CICATRIZ HIPERTROFICA, EXPRESSAO MAMILAR NEGATIVA.
CONDUTA:COLPOSCOPIA.
AGUARDO USG DE MAMAS E MMG.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60199020, '607', 'Maria da Conceição Soares De Lima', 2, 2, '91666570249', NULL, '(69) 99282-3830', '1984-03-07', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926698, '61', 'Maria Da Gloria Da Paz Olivera', 2, 0, '05038914284', NULL, NULL, '1961-03-23', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61656993, '895', 'MARIA DA GLORIA PAZ OLIVEIRA', 2, 0, '10648020282', NULL, '(69) 99282-1660', '1961-03-23', 3, 'IDADE: 56 ANOS 
DUM: PAROU HÁ MAIS OU MENOS 8 ANOS 
método contraceptivo laqueadura tubária bilateral 
gesta 2 parto 2 aborto zero 
menarca 17 anos 
comorbidades nega
 medicação em uso nega 
cirurgias prévias cesariana e colecistectomia 
último preventivo em 2025 
última mamografia em 2024 
atividade física regular academia 
A paciente vem até o consultório com queixa de ressecamento vaginal fissuras vaginais que incomoda durante o ato sexual 
sinais vitais pressão 151 x 80 MmHg peso 68 e 200 g 
conduta 
orientações gerais 
exames laboratoriais 
ultrassom transvaginal 
 preventivo com vídeo 
MR PA 
prescrevo ANTROFI por 15 dias

Exames laboratoriais no dia 29/06/2024

vitamina D 36,6 hemoglobina 13.3 hematocto 40 leuco 6480 plaqueta 270 
glicose 90 triglicerídeos 82 ureia 29 creatinina 0.8 
colesterol total 233 ferritina 202 hemoglobina glicada 6,2 
TGO 24 TGP 18 ferro 59 vitamina B12 506 
estradiol inferior a 5 fsh 38,5 LH 26 tsh 3T 4LIVRE 1,25

exames laboratoriais do dia 26/08/2026
ácido úrico 4.1 
cálcio 9.2 
ácido fólico 7,17 
Vitamina B12 425 
vitamina D 28,5
fsh 41 LH 22
t 4 livre um tsh 2,92
MMG 23/04/26: BI RADS 2 

CONDUTA: 
REPOSICAO DE VITAMINAS D, B12
AGUARDO COLETA DE PREVENTIVO 

--------------------------------
08/09/2026

NOME: MARIA DA GLORIA PAZ OLIVEIRA

DATA: 08/09/2026


ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 5,85 X 2,65 X 4,1 cm (volume:  33,3 cm³).
Ecotextura miometrial homogênea, apresentando imagem nodular hipoecogênica, com contornos definidos, sugestivo de mioma, localizado a seguir:

	Localização	Parede	Medidas	Figo
1	Intramural 	Anterior 	1,73 cm	4
1	Intramural 	Anterior 	0,86 cm	4

Endométrio: centrado, ecogênico e com espessura de 2,2 mm de basal a basal.

Ovário direito: não caracterizado ao exame, devido à interposição de alças intestinais gasosas.

Ovário esquerdo tópico: volume de 1,6 cm³, de forma habitual, contorno preservado e textura normal.

Ausência de  líquido livre patológico em fundo de saco.

IMPRESSÃO: 
Dois nódulos miometriais hipoecogênicos, bem delimitados, intramurais, localizados na parede anterior, compatíveis com leiomiomas uterinos (FIGO 4), medindo 1,73 cm e 0,86 cm.
Ovário direito não caracterizado ao exame, devido à interposição de alças intestinais gasosas.
vário esquerdo com aspecto ultrassonográfico habitual.
Ausência de líquido livre pélvico significativo.

OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.

------------------------------------------------------------------------------------------------------------------------------------------------------------------

10/09/2026

paciente vem para coleta do preventivo em meio liquido 

após resultado do preventivo avaliar possibilidade de tri, hoje inicio antrofi 

colo centralizado, presença de lesão exofitica, em labio de colo anterior e posterior
realizo biopsia 
ENTREGO 01 CP SL DE VORIC APOS BIOPSIA 
PACIENTE CHORA PREOCUPADA COM O DIAGNOSTICO
COLOCO OB COM CREME VAGINAL, RETIRAR 3 HORAS 
ATESTADO MEDICO 5 DIAS 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59471391, '494', 'Maria da Solidade Pinheiro Dias', 2, 0, NULL, NULL, '(69) 8111-3891', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59176486, '414', 'Maria das Dores Corrêa Rosas', 2, 1, '88792331220', NULL, '(69) 9217-7365', '1981-01-20', 1, 'IDADE: 43 ANOS
DUM: 2023
MC: -----
TRH (TESTOSTERONA,  NATIFA PRO)
UPCCU: + 1 ANO 

QP: PACIENTE REFERE FOCHAGO, IRRITABILIDADE, INSONIA,  ALEGA QUE PAROU DE MESNTRUAR HÁ 2 ANOS, FAZENDO USO DE RTH (TESTO E NATIFA PRO), EM MAIS OU MENOS 02/04/ 25 APRESENTOU SANGRAMENTO VAGINAL, DURACAO DE 1 DIA, ALEGA SANGRAMENTO VAGINAL ESCURO COM COAGULO E NO OUTRO DIA TIPO BORRA DE CAFE 
AO EXAME
COLO ANTEROR, PRESENCA DE DISCRETA GRUMOS EM PAREDE 

CONDUTA: ORIENTACOES, SOLICOT EXAMES LAB , USG DE MAMAS, USG TRANSVAGINAL, COLETADO PREVENTIVO, REALIZO HIDRATRACAO INTIMA 

PACIENTE RETORNA PARA MOSTRAR RESULTADO DE EXAMES
PREVENTIVO: ABRIL DE 2025: NEGATIVO PARA NEOPLASIA ( EM ANEXO)
Exames laboratoriais do dia 24/04/2025 hemoglobina 12,6, hematócrito 37,10, leucoCITOS 6350, plaqueta 247000, GLICOSE 87, colesterol 181, triglicerídeo 126, HDL 54, ldl 101, ferritina 173, ferro sérico 84, VITAMINA b 12 2000, estradiol 90,9 fsh 6,3 LH 7,1 t 4 livre 0,95 progesterona 6,4 tsh 1,04 testosterona 2,5 Vitamina D 35,1
ultrassonografia de mama do dia 16/05/2025 BIRADS 1 
ultrassonografia transvaginal do dia 16/05/2025 útero 54,3 cm³ endométrio 11 mm ovário direito 8,1 ou vários esquerdo 6,1 exame dentro do padrão de normalidade 
mamografia 16/05/2025 mamas densas: BIRAS 2 

CONDUTA: REPOSICAO DE VITAMINA D, COM REPOSICAO E MANUTENCAO 
                              ENCAMINHAMENTO PARA HISTEROSCOPIA 



Encaminho a sra. MARIA DAS DORES CORREA ROSAS, 44 anos, em tratamento de reposição hormonal há mais ou menos 2 anos, apresentou episódios de sangramento uterino anormal durante esse período, realizou citologia oncótica no dia 29/04/2025 negativo para neoplasia, USG transvaginal do dia 16/05/2025 útero 54,3 cm³, endométrio 11 mm, ovário direito 8,1 ovário esquerdo 6,1, encaminho para Histeroscopia 

Grata 

HD: espessamento endometrial pós menopausa com TRH

retorno com 30 dias 
para reposiçãoo de 2 dose de vitamina d, avaliar se realizou histeroscopia
trazer exames anteriores para comparação ( uso tv para avaliar endometrio) 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61144497, '782', 'MARIA DE FÁTIMA NUNES', 2, 0, '18275109434', NULL, '(69) 8170-0008', '1953-03-28', 1, 'IDADE: 73 ANOS 
MENOPAUSA 48 ANOS 
G2 P2 A0

QP: PACIENTE REFERE IUE AOS PEQUENOS ESFORCOS, HÁ MAIS OU MENOS  2 ANOS 
Exames laboratoriais do dia 25/11/2025 
hemoglobina glicada 5,5% tsh 4,62 Vitamina D 33,1 ácido úrico 2,7 TGO 16 TGP 16 glicose 88 triglicerídeos 135 colesterol 231 uréia 39 creatinina 0,60 magnésio, 8 potássio 4,5 só de 139 PCR 0,3 EAS não infeccioso

AO EXAME
AUSENCIA DE DISTOPIA GENITAL 

CONDUTA: 
ORIENTACOES 
SOLICITO ESTUDO URODINAMICO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62194258, '997', 'Maria de Fátima Santana', 2, 0, '64531872215', NULL, '(97) 98437-6739', '1963-01-02', 1, 'Observação: Paciente não sabe Ler', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58927183, '70', 'Maria De Nazare Barbosa Ramos', 2, 2, '05038914284', NULL, NULL, '1975-07-12', 3, 'Q. P: REFERE MODULO NO CANAL VAGINAL QUE INCOMODA, ALEGA ALGIA MAMARIA EM MAMA DIREITA, AO EXAME DE MAMA N2, AUSENCIA DE NODULO, EXPRESSAO NEGATIVA, ESPECULA PRESENÇA DE NODULO +- 0,5CM EM INTROITO VAGINAL ESQUERDO.
CONDUTA: EXERSE DE NODULO INTROITO VAGINAL 1200,00 COM RETIRADA P/
EXAME DE MAMA POR 90 DIAS.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59203842, '426', 'Maria Dionéia Nogueira da Silva Oliveira', 2, 0, NULL, NULL, '(69) 9938-6172', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60862062, '721', 'MARIA DO CARMO SOARES DE FREITAS', 2, 0, NULL, NULL, '(69) 9944-8083', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58923977, '41', 'Maria Do Socorro Ferreira', 2, 0, '05038914284', NULL, NULL, '1972-10-27', 3, 'PACIENTE REFERE FOGACHO, IRRITABILIDADE, ALTERAÇÃO MENSTRUAL, NEGA NODULO NA MAMA, REFEREA SECREÇÃO VAGINAL ESBRANQUIÇADA. AO EXAME GRUMO EM PAREDE.
CONDUTA: CREVEGIN, FLUCUNAZOL, USGTV,USG MAMA,MMG.
RETORNO 09/05/2023.
EXAMES LAB 12/04.
USGTV 14/04/2023 UTERO 36,3, MIOMA INTRAMURAL, PAREDE ANTERIROR.
USG MAMAS BI-RADS .
CONDUTA:CONTRACPÇÃO, CIRUGIA VASECTOMIA, PARA RETIRADA DE CONTRACEPTIVO ORAL,
OTIMIZO METFORMINA,', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59557000, '511', 'Maria do socorro Ferreira  De castro', 2, 0, '23202041215', NULL, '(97) 99173-3742', '1966-12-07', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59169723, '405', 'Maria Do Socorro Ferreira Clementino', 2, 0, '58562010278', NULL, '(69) 99385-2001', '1972-10-27', 3, 'IDADE: 52 ANOS
MC: VASECTOMIA 
UPCCU: DIA 19/02/2025: NEGATIVO PARA NEOPLASIA 
USG TV 18/06/2024: UTERO 86, ENDOMETRIO 7,3 , PRESENCA DE MIOMA SUBSEROSO PAREDE POSTERIOR , OD 3,42/ OE 2,9
USG PELVICA 03/03 /25: NODULO UTERINO SUGESTIVO DE MIOMA, USG TV PODERA TRAZER MAIS ACHADOS 
QP: PACIENTE ACOMPANHADA DO ESPOSO REFERE DISPAREUNIA APOS PERINEOPLASTIA, NO MOMENTO ALEGA DISPAREUNIA DURANTE O ATO SEXUAL, NEGA LUBRIFICACAO, PACIENTE REFERE AUMENTO DO FLUXO MENSTRUAL, NEGA DISPAREUNIA 
 AO EXAME 
NAO REALIZADO, DEVIDO A MENSTRUACAO 
CONDUTA: ORIENTACOES, SOLICITO USG TV, EXAMES LAB 
NA PROXIMA CONSULTA FAZER EXAME ESPECULAR E TV 
BELAMY E KY

--------------------   /// ---------------------  /// -----------------
03/06/2025
Exame laboratorial do dia 22/05/2025 
Glicose  204 triglicerídeo 272 ureia 24,4 creatina 0,70 colesterol total 236 colesterol hdl 65,1 colesterol ldl 116 ferritina 51 hemoglobina glicada 11,9 desde o 31,2 tgp 25,5 amilase 67 ferro 53,90 vitamina B12 309 estradiol 62,1 fsh 4,18 LH 2,8 t 4 livre 1,09 progesterona 0,12 Vitamina D 20,4 hemoglobina 14,8 hematócrito 43,4 leucócito 9040 plaqueta 337000 anticorpos anti h bs 2 sorologia não reagente
USG de abdome total 24/05/25: esteatose hepatica leve, sinais de colecistectomia 

USG TV 21/05/25: NODULO UTERINO INTRAMURAL 1,3 X 0,8 NCM E PAREDE POSTERIOR 1,3 X 0,8, UTERO 69,2, ENDOMETRIO 8 MM
OD 3, OE 9,2,  SINAIS DE ADENOMIOSE 
CONDUTA: ORIENTACOES, SOLICITO USG DE MAMA E MMG, DENSITIMETRIA OSSEA 
REPOSICAO DE VITAMINA B, D E FERRO 
SOLICITO EXAMES LAB PARA ESPOSO 

----------------------------------------
06/02/26
DUM: 10/01/26
G2P2A0
PACIENTE VEM PARA COLETA DE PREVENTIVO E MOSTRAR RESULTADO DE EXAMES 

Densitometria  óssea do dia 24/11/2025 coluna lombar normal femur normal
 mamografia do dia 14/08/2025 BI RADS1 
ultrassonografia de mamas do dia 12/01/2026 mama esquerda presença de imagem no do lar às 3:00 medindo 0,5 x 0,5 x 0,3 cm BIRADS categoria 3 
ultrasonografia de abdômen total do dia 24/05/2025 esteatose hepática grau 1,  colecistectomia

COLO ANTERIOR, PRESENCA DE SCRECAO ESBRANQUICADA COM GRUMOS EM PAREDE
COLETADO PREVENTIVO CONVENCIONAL, FENTIZOL OVULO E NOVACORT PARA GRANDES LABIOS 
RETORNO
SOLICITO USG TV E LAB
------------------------- /// ------------------------
04/03/2026
exames lab 26/02/2026
EAS GLICOSE 
GLICOSE 296
COL 143
TRG 140
MAG 1,77
VIT B 12 339
VIT D 27,6 
LH 32
PROGESTERONA < 0,05
TSH 2,40

CONDUTA; 
ORIENTACOES 
PROGESTERONA
ANTROFI POR 1 MES APOS TROCAR POR OESTROGEL 
ALTA D E METILCOBALAMINA 


NOME: Maria Do Socorro Ferreira Clementino



Uso oral

1.	UTROGESTAN 100MG ____________________01 CAIXA 
Tomar 01 comprimido via oral á noite 

     3.VITERGAN COG  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, durante 30 dias. 

4.	Caldê max __________________________01 caixa
          Tomar 01 comprimido via oral 1 vez ao dia.

Uso vaginal 

5.	Antrofi _______________________01 tubo 
  Aplicar á noite em dias alternados. 

-------------------------------------------------------
08/05/26
PACIENTE REFERE QUE MELHOROU PARCIALMENTE O RESSECAMENTO VAGINAL 
Manipular

1. Testosterona 5 mg _____________________________
Gel transdérmico base hormonal QSP 60 g
Aplicar 1g de gel sobre a pele seca e limpa em região sem pêlos, uma vez por semana.

2. Arginina HCI 100 mg
Ginseng Siberiano 100 mg
Maca peruana 150 mg
Mucuna 150 mg
Vitex Agnus Castus 200 mg
Ashawganda 100 mg
Tomar 01 dose (02 cápsulas) ao dia.
PROGESTERONA
ANTROFI POR 1 MES APOS TROCAR POR OESTROGEL 
ALTA D E METILCOBALAMINA 
----------------------------------------------------------------
08/09/2026

53 ANOS : DM E HAC 
MC: VASECTOMIA 
DUM: 23/06/2026 
CIRURGIAS PREVIAS: COLECISTECTOMIA E PERINEOPLASTIA 
PREVENTIVO : 09/02/2026 NEGATIVO PARA NEOPLASIA 
USG TV 14/02/2026: UTERO 88 CM, END 3,7 MM PRESENCA DE MIOMA SUBSEROSO 1,5 X 1,8 X 1,42. OD 3,98 OE 3,76 
Densitometria  óssea do dia 24/11/2025 coluna lombar normal femur normal
 mamografia do dia 14/08/2025 BI RADS1 
ultrassonografia de mamas do dia 12/01/2026 mama esquerda presença de imagem no do lar às 3:00 medindo 0,5 x 0,5 x 0,3 cm BIRADS categoria 3 
ultrasonografia de abdômen total do dia 24/05/2025 esteatose hepática grau 1,  colecistectomia
exames lab 26/02/2026
EAS GLICOSE 
GLICOSE 296
COL 143
TRG 140
MAG 1,77
VIT B 12 339
VIT D 27,6 
LH 32
PROGESTERONA < 0,05
TSH 2,40

CONDUTA; 
MEDICAO EM USO: 
Testosterona 5 mg
PROGESTERONA Á NOITE 
ANTROFI 
ALTA D E METILCOBALAMINA 

QP: PACIENTE REFERE ARDENCIA NO CANAL VAGINAL, FEZ TROCA DE MEDICACAO PARA DIABETES ( METFORMINA  500 MG 8/8 HORAS E FORXIGA 10 MG CAFE ) ALEGA TAMBEM IUE
AO EXAME: 
PRESENCA DE SECRECA ESBRANQUICADA ESPESSA PROXIMO AO CLITORIS, PRESENCA DE SECRECA ESBRANQUICADA COM GRUMOS EM PAREDE VAGINAL 

CONDUTA:
Uso oral

1.	UTROGESTAN 100MG ____________________01 CAIXA 
Tomar 01 comprimido via oral á noite ( 20 HORAS)  

2.	ZELIX 150 MG ______________________01 comprimido
Tomar 01 comprimido via oral dose única.

Uso transdérmico 

3.	OESTROGEL 0,6 MG/G __________________01 TUBO
Aplicar 01 pump, atrás do joelho ou na parte interna da coxa, após o banho com a pele seca

Uso vaginal

1.	CREVAGIN _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 7 dias. ( CASO NAO MELHORE APOS USO DE UNICA- ENTREGO AMOSTRA ) 

RETORNAR MES QUE VEM PARA AVALIAR MELHORA DO QUADRO, PARA SOLICITAR EXAMES LAB PARA AVALIAR HORMONIO 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58922193, '34', 'Maria Do Socorro Martins', 2, 0, '05038914284', NULL, NULL, '1972-05-06', 3, 'Q.P: PACIENTE SE REFERE IRRITABILIDADE, SECURA VAGINAL. 
CONDUTA:EXAMES LAB
USGTV, MAMAS E EXAMES.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58922026, '32', 'Maria Dos Milagres Machado Pereira', 2, 0, '05038914284', NULL, NULL, '1983-06-20', 3, 'PACIENTE COM  COM HISTORIA NA FAMILIA DE SECREÇÃO VAGINAL AMARELADA COM ODOR.
APRESENTA PREVENTIVO 03/02/2023 NEG PARA NEOPLASIA+ VAGINOSE BACTERIANA.
CONDUTA:SECNIDUZAL, GYNOTRAN.
24/10/2023 PACIENTE REFERE A SECREÇÃO VAGINAL AMARELADA, COM ODOR, PIORA APOS RELAÇÃO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58927148, '69', 'Maria Edilene Neres', 2, 0, '05038914284', NULL, NULL, '1973-08-24', 3, 'Q.P: IRREGULARIDADE MENSTRUAL, EXAMES LAB
HEMOGLOBINA GLICADA 12,1
GLICOSE 296
USG ABDOMINAL 06/09/23 ESTEATOSE HEPATICA
CONDUTA:USGTV,MMG, USG MAMAS, ENCAMINHAMENTO URGENTE PARA O ENDOCRINOLOGISTA.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61824725, '925', 'MARIA EDNA DE OLIVEIRA', 2, 0, '86663739204', 'edna.oliveira111@gmail.com', '(69) 99320-2420', '1986-02-10', 3, 'G 2 P1 A1
MENARCA 12 ANOS 
COMORBIDADE NEGA 
ULTIMO PREVENTIVO: JANEIRO 2026 NEGA PARA NEOPLASIA 

QP: PACIENTE REFERE DESCOFORTO NO ATO SEXUAL, ARDENCIA, PRURIDO

AO EXAME: COLO CENTRALIZADO, PRESENCA DE SECRCAO ESPESSA ACINZENTADO, BOLHOSA E COM GRUMOS EM PAREDE 

usg tv 15/08/2026: utero 91,3, end 8 mm, ovarios sel alteração 

CONDUTA: 
ORIENTACOES
TRIVAGEL
FLUCONAZOL 0,7 DIAS 
EXAMES LAB 


----------------------------------
05/08/2026

Exames laboratoriais (14/07):
Hemoglobina: 13,7 g/dL
Hematócrito: 43%
Leucócitos: 10.640/mm³
Plaquetas: 395.000/mm³
EAS: sem evidências de infecção
Glicemia: 122 mg/dL
Ureia: 19 mg/dL
Creatinina: 0,6 mg/dL
Colesterol total: 173 mg/dL
Triglicerídeos: 133 mg/dL
Ferritina: 195 ng/mL
Hemoglobina glicada (HbA1c): 6,9%
TGO (AST): 19 U/L
TGP (ALT): 25 U/L
Ferro sérico: 55 µg/dL
Vitamina B12: 319 pg/mL
Estradiol: 109 pg/mL
Vitamina D: 16 ng/mL
TSH: 3,75 µUI/mL
T4 livre: 1,22 ng/dL
Progesterona: 0,30 ng/mL
Sorologias: não reagentes.
Anti-HBs: reagente.
Solicito avaliação endocrinológica para estratificação do risco cardiometabólico, definição de conduta terapêutica, incluindo medidas de mudança do estilo de vida e avaliação da indicação de tratamento farmacológico para obesidade, bem como acompanhamento das alterações glicêmicas (HbA1c 6,9%)

CONDUTA: REPOSICAO DE VITAMINA D , VIT B12 = 480,00 = NO PIX 400
DIETA ALIMENTAR DEVIDO HIPERGLICEMIA
EXERCICIO FISICO  
ENTREGO CAIXA DE AMOSTRA ANTROFI, BELAMY, DOZEMAST E HIGI CALM 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61629395, '880', 'MARIA EDUARDA AZEVEDO RIBEIRO', 2, 0, '02822875235', NULL, '(69) 99298-6504', '2010-01-29', 1, '16 anos 
dum: 16/06/2026
MC: ----
SEXARCA: ---
MENARCA: 12 ANOS 
COMORBIDADES: NEGA
MEDICAO NEGA
ALERGIA NEGA 

QP: PACIENTE ACOMPNHADA DA MAE, REFERE CORRIMENTO ESBRANQUICADO, NEGA ODOR, NEGA PRURIDO
NEGA DISURIA  

EXAMES: PRESENCA DE SECTRECAO MUCOIDE ESBRANQUICADA, SEM ODOR 
CONDUTA: 
ORIENTACOES
EXAMES 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60305315, '626', 'Maria Eduarda Brito Da Silva', 2, 0, '02359039229', NULL, '(69) 99925-4199', '2010-02-23', 3, 'idade:  15 anos 
menarca 10 anos 
sexraca: 15 anos 
preventivo: negativo para neoplasia
comorbidades: nega
vacina em dia 
exercício regular - natação 
alimentação : saudável 
sono: preservado
PREVENTIVO 25/06: NEG PARA NEOPLASIA 

QP: PACIENTE REFERE QUE DESDE DE JUNHO VEM APRESENTADO DOR EM BAIXO VENTRE, DISMENORREIA INCAPACITANTE , PROCUROU SERVICO MEDICO ONDE FOI REALIZADO UG TV 25/06: UTERO 51,82, END 6 MM, OD 10,37/ OE 5,53, EXAMES SEM ALTERACAO 
RNM PELVE 03/07/2025: SEM ANORMALIDADE
POREM FOI DIAGNOSTICADA PELA DRA ANDREIA COM ENDOMETRIOSE, QUE PRESCREVEU FORMULA MANIPULADA, ACO IUMI ES
EXAMES: 03/07: VITAMIAND 33, 4/ VIT B12 489
AO EXAME COLO CENTRALIZADO, PUNTIFORME, PRESENCA DE SECRECAO ESBRANQUICADA COM GRUMOS, DOR A MANIPULACAO DO COLO

CONDUTA: CEFTRIAXONA, AZITROMICINA, GYNOTRAN 
Uso Injetável
1.	Ceftriaxona 500 mg_______________________01 ampola
Aplicar meia ampola IM em região glútea.
 
Uso oral

1.	Azitromicina 500 mg _________________02 comprimidos
Tomar 02 comprimidos VO dose única

2.	Triplo A ___________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas por 3 dias.

Uso vaginal

1.	Gynotran  _____________________________01caixa 
Aplicar 01 óvulo VV, á noite, durante 7 dias.

REPOSICAO DE VITAMINA D E B 12 
 300,0. 

21/10/2025

NO MOMENTO ESTA FAZENDO USO DE PIETRA ED E IUME ES, POREM REFERE QUE APRESENTA LABILIDADE EMOCIONAL

CONDUTA: SUSPENDO IUME ES, PRESCREVO LIMIAR E VORIC, MANTENHO PIETRA ED, DIETA ALIMENTAR E DOZEMAST
NOVA CONSULTA DIA 31/10

paciente refere que quando faz uso deu piora original apresenta cefaleia, mas quando usa po genérico nao apesenta cefaleia, NEGA ALGIA (COLICA) 

conduta: intercalar pietra original com generico, se mater cefaleia usar apenas o genérico 
ENTREGO RECEITA DE LIMIAR E VORIC ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60305597, '627', 'Maria Eduarda Da silva Passos', 2, 0, '05196355235', NULL, '(69) 99249-5717', '2009-09-15', 3, '16 anos
menarca 10 anos 
sexarca 13 anos
DUM: 31/08
G0P0
MC: ACI mensal - noregyna

Paciente vem pela primeira vez no ginecologista, 
paciente refere que desde de maio apresenta corrimento esbranquiçada 

conduta: exames lab 
video colposcopio 180,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61199369, '789', 'MARIA EDUARDA GOES FREIRE', 2, 0, '04858293203', NULL, '(69) 99963-7721', '2007-11-08', 3, '18 ANOS 
DUM: 18/02/2026
MC: NENHUM 
PACIENTE VEM PARA ROTINA GINECOLOGICA, PACIENTE DESEJA INSERCAO DE IMPLANON

CONDUTA: 
ORIENTACOES 
EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58907953, '2', 'Maria Eduarda Gouvêa Tavares', 2, 1, '00593619218', NULL, '(69) 9946-7631', '2006-10-24', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924707, '52', 'Maria eduarda nobre lima', 2, 1, '05038914284', NULL, NULL, '2000-03-17', 3, 'Q.P: PLANEJAMENTO FAMILIAR 
DUM:08/09/2024
MC:
Q.P: ATRASO MENSTRUAL
CONDUTA:EXAMES E USGTV', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59556960, '510', 'Maria Eduarda Pimentel Teixeira', 2, 1, '04978380286', NULL, '(69) 9220-9947', '2006-07-07', 1, 'IDADE: 18 ANOS 
MENARCA: 11 ANOS
SEXARCA: 16 ANOS
MC: INJETAVEL MENSAL 
UPCCU: NOV 2024

QP: PACIENTE REFER SECRECAO VAGINAL AMARELADO, COM ODOR, INCOMODO NA RELACAO SEXUAL, QUADRO TEVE INICIO HÁ 40 DIAS
MEDICAO: QUE FEZ USO: CREME VAGINAL, (CREVAGIN), FEZ USO DE MEDICAO MAS NAO LEMBRA O NOME DA MEDICACAO
AO EXAME
SECRECAO AMARELADA, BOLHOSA COM GRUMOS 
conduta: GYNOTRAN, SECNIDAZOL, ITRACONAZOL

27/06
PACIENTE RETORNA REFERINDO MELHORA DO QUADRO DE VAGINOSE
ALEGA QUE ESTAVA FAZENDO USO DE GYNOTRAN NO 5º OVULO QUE ESTAVA USANDO FEZ LASER E SENTIU UMA SENSIBILIDADES NOS GRANDES LABIOS
APRESENTA RESULTADO DE EXAMES LAB COM VITAMIN B 12 E VITAMIN D BAIXA 
CONDUTA:
TROK, VITAMINA D E VITAMINA B 12 ( 480,00) CONVERSO SOBRE IMPLANON  ( 2400,00)
PACIENTE DESEJA FAZER PARCELADO NO PIX 5 PARCELAS DE 600,00 ( 7 -07/ 7-08 / 07-09/07-10 /07-11
REPOR VITAMINAS NO MES DE JULHO 
INSERIR IMPLANON NO MES 09 
ENTREGO 3 CAIXAS DE SLINDA
SOLICITAR BETA HCG ANTES DE INSERIR IMPLANON ( PACIENTE CIENTE)

DIA 29/07/2025
PACIENTE REALIZOU A INSERÇÃO DO IMPLANON, PAGOU 1231,00 CREDITO 2X, FALTA PAGAR 1000,00 REAIS ATÉ O DIA 15/08 COBRAR
PAGO

20/08/2025
PACIENTE REALIZOU A REPOSIÇÃO DA VITAMINA D E B12 COM A DONA NEIVA', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58920550, '18', 'Maria Eduarda Pontes Pinto', 2, 0, '03726877258', NULL, '(69) 99263-8882', '2008-01-31', 3, 'USG TIREOIDE NORMAL 31/05/2024
EAS 11 PIOCITS?? 01/07/2024
GLICOSE 91
TRIGL 37
COL 139
TSH 2,30
CONDUTA: OROCULTURA
HERPS
RETORNO? UROCULTURA NEGATIVO
HERPS +
SOLICITO USG PELVICA

------------------------
08/05
DIVERSO ABSCESSO EM VULVA 
CEFALeXINA E NEOMICINA + BACITRACINA TOPICO 
Exames laboratoriais do dia 10/04/2000 hemoglobina 12,1 hematócrito 37,5 leucos 6800 plaqueta 315000 PCR 0,3 tgp 17 tegel 27 fosfatase alcalina 95 creatinina 0.6 uréia 21 tsh 3,7 t 4 livre 1,22 polissemia de jejum 94 hemoglobina glicada 5,42 colesterol 177 gama GT 10,9 exame de urina não infeccioso é pensar h 5,1 LH 10 vitamina D22 vitamina A 0.4 Vitamina E 9,2 b 12 422 magnésio 1,8 Vitamina C 1,6
Uso oral

1.	Triplo A ___________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas por 3 dias.
2.	Cefalexina 500 mg _________________28 comprimidos 
Tomar 01 comprimido via oral de 6/6 horas, por 7 dias  

Uso tópico

3.	Neomicina + bacitracina ____________01 tubo
Aplicar 3 vezes ao dia, por 7 dias 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926430, '57', 'Maria Eduarda Santos Souza', 2, 0, '05038914284', NULL, NULL, '2008-06-09', 3, 'PACIENTE SEM QUEIXAS ,EXAMES LAB, NORMAL EXCETO EAS 20-24.
CONDUTA:SOLICITO EAS E URUCULTURA.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924455, '47', 'Maria Eduarda Souza De Farias', 2, 1, '05038914284', NULL, NULL, '2005-05-17', 3, 'DOR PELVICA A/E.
CONDUTA: USGTV, EXAME LAB.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60606961, '684', 'MARIA ELENA TENORIO DA SILVA', 2, 0, '02812461225', NULL, '(69) 99358-9294', '1998-09-14', 3, 'IDADE: 27 ANOS
DUM:18/10/25
MC: PRESERVATIVO
G 2 P 2 A 0
UPCCU: + 2 ANOS 


QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA CANSACO FISICO E FADIGA, ANTES ERA MUITA ATIVA

Uso oral

1.	FLUCONAZOL 150 MG  ______________2 comprimidos
Tomar 01 comprimido via oral, repetir com 7 dias 

Uso vaginal 

2.	CREVAGIN___________________________01 caixa 
Aplicar, á noite, via vaginal por 7 dias 


12/01
PACIENTE AINDA NAO REALIZOU PREVENTIVO, APRESENTA EXAMES LAB
Games laboratoriais do dia 14 de setembro vitamina D25, Vitamina B12 434 hemoglobina 11,7 hematócrito 33,9 leuco 6200 plaqueta 292000 colesterol 127 tgp 13 DGO 18 triglyceride 40 ureia 20 creatinina 0.7 glicose 83 ferro 128 tsh 1,7 t 4 livre 1,6 sorologia não reagente
ultrassom transvaginal do dia 9/12/2025 o útero ântero verso fletido 86 cm³ ovário direito 10,1 centímetros cúbico ou vários esquerdo 6,9 cm³ exames sem alteração

CONDUTA: HEMOLIP 
VITAMINA B, D, 
AGUARDO PREVENTIVO 

Uso oral
1.	ALTA D 50.000UI  ____________________01 caixa
Tomar 01 comprimido via oral por SEMANA, durante 30 dias. 

2.	Quelatus mulher _________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia 

3.	HEMOLIP _____________________________02 caixas
Tomar 01 comprimido via oral 1 vez ao dia, por 60 dias 

Uso sublingual 

1.	Dozemast 1000mcg _________________________01 caixa
01 comprimido SL 1 vez ao dia, por 30 dias 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60607048, '685', 'MARIA ELIDIANA SOUZA DA SILVA', 2, 2, '78717795249', NULL, '(69) 99337-7909', '1980-03-30', 3, 'idade: 45 anos 
dum: menopausa aos 42 anos 
G6 P 5 A1

QP: PACIENTE VEM PARA MOSTRAR RESULTADO DE PREVENTIVO 
PCCU: 07/10/2025: NEGATIVO PARA MALIGNIDADE

ALEGA SECRECAO ESBRANQUICADA COM PRURIDO

CREVAGIN E FLUCONAZOL ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59191225, '420', 'Maria Erinete Texeira Da Silva', 2, 0, '51290910278', NULL, '(69) 99379-0555', '2007-12-29', 3, 'IDADE: 49 ANOS 
DUM: 30/02/2025
UPCCU: JULHO DE 2025

PACIENTE REFERE QUE ESTA FAZENDO USO DE REPOPIL E PRIMOLUT, POREM ALEGA METRORRAGIA

CONDUTA: ORIENTACOES
MMG, USG TV, USG DE MAMAS ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61883729, '937', 'Maria erivaneide Oliveira do Nascimento Brito', 2, 0, '81170637272', 'm.erivaneide@hotmail.com', '(69) 99235-4828', '1984-01-11', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58920958, '22', 'Maria F De albuquerque', 2, 0, '05038914284', NULL, NULL, '1978-10-25', 3, 'Q.P: MENSTRUAÇÃO IRREGULAR
CONDUTA:SOLICITO EXAMES DE IMAGENS E LAB
PROGRAMAR PREVENTIVO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60063054, '587', 'Maria Fernanda  Trombini Brasileiro', 2, 0, '06582201280', NULL, '(69) 99321-5032', '2004-11-20', 3, '20 anos
dum: 03/08
MC: NAO INICIO ATIVIDADES SEXUAL

QP: PACIENTE ACOMPANHADA DA MAE VEM PARA MOSTRAR RESULTADO DE EXAMES 
ALEGA IRREGULARIDADE MENSTRUAL, ACNE NO ROSTO, COLO COSTA, HIRSUTISMO, DIFICULDADE DE PERDE PESO.
PSCIENTE REFERE ANSIEDADE
10/07 EXAMES ALTERADOS
LH 21 / FSH 7,55, GLICOSE 102,  PCR: 2,35 , EAS URATOS AMORFOS  
CONDUTA: PROTOCOLO DE SOP, EMAGRECIMENTO E ANSIEDADE E COMPULSAO ALIMENTAR .

 06/01/2026
paciente retornar com interesse em realizar protocolo para SOP e reposição de vitaminas 

apresenta exames lab 14/10/2025
vitamina b 12 396
vit d 27,6
vit a o,32 
vit C 0,11
alega que iniciou atividades fisica

conduta: cada sessao de soP com intervalo a cada 15 dias 530,00 


07/01/2026
PESO 98 KG 
CIRCUNFERENCIA ABDOMINAL 105
COMPULSIVIDADE PARA DOCES
NAO SE ALIMENTA PELA MANHA, SO FAZ 2 REFEICOES 

CONDUTA: 
NUTRICIONISTA
EXERCICO FISICO -CAMINHADA + CORRIDA 
PROTETOR SOLAR COM COR 
 VITAMINA D E VITAMINA B 12 

----------------
08/01
INUSITOL GLUTEO D 
--------------
21/01/2026
PACIENTE REFERE MELHORA NA CLAREAMENTO NO ROSTO, REFERE PERDA DE PESO, 
Inositol é um carboidrato que funciona como uma "pseudovitamina" do complexo B, essencial para a formação de células saudáveis, comunicação celular, metabolismo de gorduras e sensibilidade à insulina, sendo crucial na saúde mental (humor, ansiedade) e feminina (SOP). Presente em alimentos e produzido pelo corpo, ele melhora a ação da insulina, ajuda no equilíbrio emocional e cerebral, e auxilia no tratamento de condições como SOP, depressão, TOC e resistência à insulina, atuando como um mensageiro celular fundamental. 
Morusil é um extrato da laranja vermelha Moro, rico em antocianinas, que auxilia na redução de gordura corporal, especialmente abdominal, e na saúde metabólica, atuando como antioxidante e anti-inflamatório, combatendo radicais livres e podendo ajudar no controle do colesterol e triglicerídeos. Ele age inibindo a formação de novas células de gordura, diminuindo o volume das existentes e melhorando a sensibilidade à insulina, sendo encontrado em cápsulas ou em formulações injetáveis para protocolos de emagrecimento. 
Principais benefícios
Redução de gordura: Ajuda a diminuir a gordura localizada, principalmente na barriga, e a gordura visceral.
Ação antioxidante: Combate os radicais livres, protegendo as células.
Anti-inflamatório: Reduz o estado inflamatório do corpo.
Saúde metabólica: Contribui para o controle do peso, melhora a sensibilidade à insulina e pode reduzir colesterol e triglicerídeos.
Saúde do fígado: Ajuda no tratamento da esteatose hepática (gordura no fígado). 
Como funciona
Compostos bioativos: As antocianinas (pigmentos vermelhos), flavonoides e vitamina C, presentes no Morusil, são os responsáveis pelos seus efeitos.
Mecanismo de ação: Inibe a formação de novas células de gordura (adipócitos) e reduz o volume das existentes, além de ativar enzimas que metabolizam gorduras. 
Formas de uso
Oral: Suplementos em cápsulas.
Injetável: Formulações lipolíticas para aplicação intramuscular, geralmente em protocolos estéticos. 
Importante
É um suplemento natural derivado de uma laranja cultivada na Sicília, Itália.
Sempre procure orientação de um profissional de saúde para indicar o uso e a dosagem correta. 
Morusil K Laranja Moro Morosil Redução de Medidas e Gordura
CONDUTA: ORIENTACOES 
MORUSIL, INUSITOL, CARNITINA, FUROSEMIDA 
PESO 94KG
-------------------------
dum: 04/01/2026

paciente refere constipação há 7 dias, 
--------------------
09/04

dum: 05/04/2026
paciente refere sindrome gripal há 15 dias influenza
no momento peso 90 kg, porem peso pelos manha e estava 87kg
alega compulsão alimentar 
paciente parou o uso de metformina, nao esta fazendo uso de sopi
conduta: aguardo exames lab 






', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61199294, '788', 'MARIA FERNANDES MIRANDA', 2, 0, '01241040290', NULL, '(69) 99372-0683', '1991-11-29', 3, 'PACIENTE REFERE QUE VEM PARA MOSTRAR RESULTADO DE EXAME
ALEGA DOR EM BAIXO VENTRE, REFERE DISPAREUNIA 
PREVENTIVO 11/02/26: NEG PARA NEOPLASIA 
USG TV  11/02/26: UTERO 88,3 ENDOMETRIO 6 MM OD 5,4 OE 5,6  - EXAME NORMAL 
EAS NOA INFECCIOSO 

CONDUTA; 
TTO PARA DIP
Uso Injetável
1.	Ceftriaxona 500 mg_______________________01 ampola
Aplicar meia ampola IM em região glútea.
 
Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos VO dose única, para o casal
2.	Azitromicina 500 mg _________________04 comprimidos
Tomar 02 comprimidos VO dose única para o casal
3.	Triplo A ___________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas por 3 dias.

Uso vaginal

1.	Gynotran  _____________________________01caixa 
Aplicar 01 óvulo VV, á noite, durante 7 dias.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921905, '30', 'Maria Francisca Pereira Da silva', 2, 0, '91362172200', NULL, NULL, '1982-06-05', 3, 'Q.P: ROTINA GINECOLOGICA SECREÇÃO EMBRANQUIÇADA, COM ODOR, DOR APOS A RELAÇÃO SEXUAL.
DOR EM BAIXO DO VENTRE.
CONDUTA:METRONIDAZOL CREME VAGINAL, EXAMES LAB, USGTV.
04/08/2023 CONTINUA COM DOR PELVICA, COLO EM FENDA POSTERIOR.
TV COM DOR A MOBILIZAÇÃO DO COLO.
 ________________.  ///. __________________   /// _________
19/02/2025
IDADE 42 ANOS 
DUM: 11/02/25
MC: LT
UPCCU: 2024 NAO APRESENTOU

QP: PACIENTE REFERE QUE NAO REALIZOU USG TV E EXAMES LAB E VEM PARA PEGAR O PEDIDO NOVAMENTE

 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59963121, '554', 'Maria Geele F Barreto', 2, 0, '92628699249', NULL, '(97) 8434-4008', '1983-11-26', 1, 'Maria Geele F Barreto
41 ANOS
DUM: JUNHO DE 2025 
MC: CAMISINHA 
COMORBIDADE NEGA 
UPCCU: 2025

PACIENTE VEM PARA EXERESE DE CONDILOMA 

INTRAVAGINAL EM PAREDE POSTERIOR 
E OUTRO NO INTROITOVAGINAL A ESQUERDA

CONDUTA: METRONIDAZOL
ATESTADO POR 5 DIAS 
DESEJA VACINA CANDIDA 480,00
LASER INTIMO 1800,00
5400 NO CREDITO OU
4600,00 A VISTA 
DIU DE MIRENA 3.200,00 

05/09/2025
PREVENTIVO 17/02/2025: NEGATIVO PARA NEOPLASIA , GARDNERELLA ( JA TRATADO ANTERIORMENTE) 
PACIENTE REFERE QUE O NODULO DO CANAL VAGINAL AINDA PERSISTE 
AO EXAME:
CONSIGO TOCAR NO NODULO, POREM NAO CONSIGO REALIZAR A EXERESE DO MESMO
CONDUTA: SOLICITO RNM PELVICA 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60290849, '623', 'Maria Graciane Silva Lima', 2, 2, '02259872280', NULL, '(69) 99208-5940', '1986-06-18', 3, 'G67P3N 3 C A 1
MC: PRESERVATIVO
DUM: 12/08/2025
UPCCU: HÁ 3 ANOS 
paciente refere dor em baixo ventre, há mãos ou menos 1 semana ALEGA QUE APOS CESAREA SEMPRE APRESENTO INCOMODO EM BAIXO VENTRE, NEGA DISPAREUNIA, NEGA DISURIA, REFERE MELHORA COM USO DE BUSCOPAN 

CONDUTA: SOLICITO USG TV 
VIDEOCOLPOSCOPIA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59823686, '539', 'Maria Helena Cavalcante de Oliveira', 2, 2, '34387676272', NULL, '(97) 9155-4399', '1972-10-08', 1, '52 ANOS
DUM: 20/07/24
LT
G1P1A0
UPCCU: 2024
CIRURGIA: CESAREA E LT
USG TV 03/07
UTERO 48, PRESENCA DE MIOMAS PAREDE CORPORAL SUBSEROSO / INTRAMURAL E EM PAREDE FUNDICA INTRAMURAL , ENDOMETRIO COM PROVAVEL POLIPO, / OD 1,2 /OE 1,2, PRESENCA DE PEQUENA QUANTIDADE DE LIQUIDO NA CAVIDADE UTERINA , 
AO EXAME
PRESENCA DE LINQUEN EM LABIO ESQUERDO (FOTO)
COLO CENTRALIZADO, PONTIFORME, HEMATOMETRIA (FOTO)
TV: DOR A MOBILIZACAO DO COLO DO UTERO
CONDUTA: ORIENTACOES
TTO DE DIP 
LASER INTIMO
REALIZO COLPOSCOPIA - REPETIR COM 1 MES 
REALIZO PREVENTIVO
REPETIR USG COM 3 MESES 

-----------
09/09/25paciente refere melhora do quadro clinico 

colposcopia 
realizada sessao de frase
promestrieno 
tericin at e fluconazol
paciente refere que irar repetir usg tv  - polipo 
realizo laudo de colposcopia e envio via whastapp
08 de outubro aniversario , nao marcar laser nesse dia 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924088, '43', 'Maria Hidaleia Rabelo', 2, 2, '05038914284', NULL, NULL, '1962-07-12', 3, 'PACIENTE COM FOGACHO, ESQUECIMENTO, PARESTESIA, ALEGA EPSODIO EPITACSE.
APRESNTA USG DE ABDOME TOTAL, CISTO HEPATICO A/E , NEFROLITIASE NÃO OBSTRUTIVA BILATERAL.
PA:140X80MMHG
CONDUTA:ECG, ENCAMINHAMENTO CARDIOLOGISTA,SOLICITOS EXAMES LAB,MARPA.
19/03/24
PACIENTE EM USO DE CECI, REFERE SANGRAMENTO VAGINAL +- 4 DIAS APOS USO DE MEDICAÇÃO (06/02/24), ALEGA QUE NÃO REALIZOU USG, NEM CONSEGIU IR AO ENDOCRINO, REFERE ARDENCIA EM REGIÃO INTIMA.
CONDUTA:EXAMES LAB, USGTV, AGUARDANDO PREVENTIVO.
30/04/24
USGTV 06/02/2024 ESTEATOSE HEPATICA GRAU 2', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58927243, '72', 'Maria Hosana Gomes De Araujo', 2, 2, '05038914284', NULL, NULL, '1977-03-23', 3, 'Q.P: PACIENTE ENCAMINHADA DEVIDO PROLAPSO UTERINO, PACIENTE ACOMPANHADA DA FILHA ELIANA, AO EXAME DISTOPIA GENITAL, ENCAMINHAMENTO PARA POC CIRUGIA.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58929091, '82', 'Maria Ieda Ribeiro  Da Silva', 2, 4, '05038914284', NULL, NULL, '1970-04-20', 3, 'Q.P: paciente vem para rotina ginecologica, nega secreção vaginal,nega diseria, nega presença de nodulo na mama.
exame das mamas, pendulares, sem nodulo, sem retração, mamilos invertidos.
conduta:usgtv, mamas, exames lab, aguardo de mmg.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924385, '46', 'Maria Isabela Martins Da Silva', 2, 1, '06672376232', NULL, NULL, '2006-05-09', 3, 'PACIENTE REFERE A DISMINORREIA, IRREGULARIDADE  MENSTRUAL.
CONDUTA: ORIENTAÇÕES QUANTO AOS METODOS CONTRACEPTIVOS, USAR SEMPRE PRESERVATIVO NO ATO SEXUAL, GRAVIDEZ INDESEJADA, EXAMES LAB, RETORNO AVALAIAR METODO ,USGTV DISMINORREIA.

05/09
DUM: 07/08/2025

PACIENTE REFERE QUE FAZIA USO DE ACI MENSAL E PAROU POR CONTA PROPRIA NO MES  DE AGOSTO, POREM DESDE O DUM 07/08 OCORRE SUA ATE O NOME

CONDUTA: SOLICITO EXAMES LAB E USG TV E PRESERVATIVO

RETORNO
USG PELVICA 24/09/25  UTERO 42,78 , END 5,1, OD 21,13 , OE 24,5, OVARIOS MICROPOLICISTICOS BILATERAL.
EXAMES 11/09/25
BHCG - , GLICOSE 77, COL 189 , TRIGL 98, HB 15,3, HT 44, LEUCO 6000, PLQ 298,00, TSH 3,25, THL 1,07, B12 305, D 27,4
CONDUTA: VIT D E B12, IUME, RETORNAR  EM DEZEMBRO DE 2025', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60289643, '618', 'Maria Jane Avelar Ramalho De Sousa', 2, 2, '05088192290', NULL, '(69) 99356-1728', '1999-07-28', 3, 'IDADE: 26 ANOS 
paciente com histórico de atrofia ovariano, devido acidente injetável, mais de 5 anos   - sugiro diu de cobre
USG TV 03/08/3035: UTERO 54,1,, END 5 MM, DIU NORMOINSERIDO, OD 0,8 OE 2,1

ALEGA QUE INSERCAO DE DIU EM DEZEMBRO DE 2024, ALEGA OTIMA ADAPTACAO, POREM EM JULHO APRESENTOU MENSTRUACAO IRREGULAR , ACOMPANHADA DE DOR EM BAIXO VENTRE TIPO COLICA, ALEGA SECRECAO. AMARELADA, 
NEGA ODOR, NEGA PRURIDO, ALEGA DIFICULDDAE DE EMAGRACER 

CONDUTA: TERICIN AT, SOLICITO EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924596, '51', 'Maria Jane Velar Ramalho De Sousa', 2, 2, '05038914284', NULL, NULL, '1999-07-28', 3, 'PACIENTE REFERE A DOR EM BAIXO DO VENTRE, IRREGULARIDADE MENSTRUAL.
13/08/24 DOR EM BAIXO DO VENTRE, ONDE PROCUROU SERVIÇO DE SAUDE, PAROU POR CONTA PROPRIA ACS TRIMESTRAL.
 CONDUTA: ENCAMINHAMENTO PARA INSERÇÃO DE DIU, EXAMES LAB.
09/10/24 PACIENTE REFERE SANGRAMENTO VAGINAL 10 DIAS APOS INSERIDO O DIU.
DIU DE C0BRE', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61746658, '908', 'Maria jose Barros pinto', 2, 0, '11351071220', NULL, '(69) 99235-2280', '1960-02-23', 1, 'MARIA JOSE BARROS PINTO 
IDADE 66 ANOS 
DUM: HISTERECTOMIA COM 44 ANOS, NUNCA REALIZOU TRH 
G 3 P 3 A0
LT
PREVENTIVO: 60 ANOS 
COMORBIDADES: HAC, PRE DIABETICA
SONO: CONSERVADOR 
INTESTINO REGULAR
EXERCÍCIO FISICO: NÃO REALIZADA
colonoscopia 09/03/26: plicoma anal
MMG: 20/05/2025 BI RADS 2 

QP: FLACIDEZ DO CANAL VAGINAL , RESSECAMENTO VAGINAL

AO EXAME: FALCIDEZ EM CANAL VAGINAL
FLACIDEZ EM GRANDES LABIOS 

CONDUTA: INDICO LASER INTIMO -
PREENCHIMENTO COM ACIDO HIALURONICO 
1000 ENTRADA
2224,60 PARCELADO NO CREDITO 


---------------

14/07 

1 SESSAO DE LASER

-----------

17/08 

2 SESSAO DE LASER

ENTREGO AMOSTRA DE ANTROFI E AMOSYTRA DE BASIC 4U
-------------------
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61756158, '909', 'Maria jose barros pinto', 2, 0, '11351071220', NULL, '(69) 99235-2280', '1960-02-23', 1, 'MARIA JOSE BARROS PINTO 
IDADE 66 ANOS 
DUM: HISTERECTOMIA COM 44 ANOS, NUNCA REALIZOU TRH 
G 3 P 3 A0
LT
PREVENTIVO: 60 ANOS 
COMORBIDADES: HAC, PRE DIABETICA
SONO: CONSERVADOR 
INTESTINO REGULAR
EXERCÍCIO FISICO: NÃO REALIZADA
colonoscopia 09/03/26: plicoma anal
MMG: 20/05/2025 BI RADS 2 

QP: FLACIDEZ DO CANAL VAGINAL , RESSECAMENTO VAGINAL

AO EXAME: FALCIDEZ EM CANAL VAGINAL
FLACIDEZ EM GRANDES LABIOS 

CONDUTA: INDICO LASER INTIMO -
PREENCHIMENTO COM ACIDO HIALURONICO 
1000 ENTRADA
2224,60 PARCELADO NO CREDITO 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61593968, '875', 'Maria José Cardoso da Silva Cardoso Scalzer', 2, 2, '62872060200', NULL, '(69) 99231-1054', '1980-06-06', 1, 'Maria José Cardoso Irá realizar as 3 sessões do laser íntimo.
Primeira Sessão realizado no dia 18/08/26
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58946078, '97', 'Maria José carril Feitosa', 2, 0, NULL, NULL, '(97) 8459-2178', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928393, '76', 'Maria Josilene Da silva DE Souza', 2, 2, '05038914284', NULL, NULL, '1984-06-11', 3, 'PACIENTE SEM ALGIA, ALEGA USO ACO HA 10 ANOS, HISTORIA DE MIOMATOSE UTERINA, FLUXO MENSTRUAL 5-6 DIAS, MAIS INTENSO 2-3 DIAS, NEGA DISMINORREIA, NEGA DISPARAAUTERINA, REFERE SECURA VAGINAL, FALTA DE ESTIMULO?.
CONDUTA: DESEJA FAZER TROCA DE METODO CONTRACEPITIVO, SOLICITA EXAMES LAB, USGTV.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928613, '78', 'Maria Lene Da Conceição', 2, 2, '05038914284', NULL, NULL, '1975-08-02', 3, 'HISTERECTOMIA A 4 ANOS, ALEGA SECREÇÃO NASAL, NDN PELO OTORINO, PELO PNEUMOLOGISTA, AO EXAME AUSENCIA DE COLO, SECREÇÃO AMRELADA FUIDA COM ODOR.
CONDUTA:GYNOTRAN, ZINA,USGTV, EXAMES LAB.
RETORNO 19/03/24 QUEDA CAPILAR.
 PACIENTE REFERE SECREÇÃO VAGINALCOM PURIDO.
APRESENTA USG PELVICA 23/02/24, HISTERECTOMIA.
 CISTO ONICULAR EM O.E, 
VOLUME 3,8, CISTO 1,3 X 0,9 X 1 CM.
CONDUTA: EXAMES LAB, EAD.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61010803, '739', 'MARIA LENI DA CONCEIÇÃO', 2, 0, '58244190272', NULL, '(69) 99221-9194', '1975-08-02', 3, '50 ANOS
DUM: HISTERECTOMIA EM 2019
UPCCU: 2025
COMORBIDADE: DM? 
G4 P4 A0

QP: PACIENTE REFERE SINTOMAS DA MENOPAUSA 
EXAMES LAB 14/01/2026: EAS NAO INFECCIOSO TRG 113/ U 26/ CEAT 0,80/ COLEST 156/ CALCIO 10/ MAG 2,23/TGO 19/TGP 17/ VIT B12 551/ FSH 145/LH 74/TSH 1,14/ T4 LIVRE 0,95/ VIT D 18 HB 14 LEUCO 6620/ PLQ 277000

CONDUTA:
ORIENTACOES
USG TV
USG DE MAMAS
MMG

---------------  /----

11/02
AO EXAMES
AUSENCIA DE COLO ( HISTERECTOMIA), SECRECAO ESBRANQUICADA, SEM ODOR 

CONDUTA:
 COLETADO PREVENTIVO CONVENCIONAL

---------- // --------
paciente refere que fez uso de suplementação de vitamina injetáveis 
apresenta resultado de exames 

13/02/ preventivo Negativo para lesão intra-epitelial e malignidade

usg tv 12/02: ausencia de utero, od 3,8 oe 5,3
usg de mamas :  bi rads 2  ( cisto mamaria a direita 0,7 x 0,4 0,6 ) 
mamografia bi rads 2 

conduta: 
orientações 
oestrogel progesterona 
retorno com 3 meses 


NOME: MARIA LENI DA CONCEIÇÃO


Uso transdérmico 

1.	OESTROGEL 0,6 MG/G __________________01 TUBO
Aplicar 01 pump, atrás do joelho ou na parte interna da coxa, após o banho com a pele seca

Uso oral

2.	UTROGESTAN 100MG ____________________01 CAIXA 
Tomar 01 comprimido via oral á noite 

3.	Cog fox max   ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, durante 30 dias. 

4.	Alta d 50000 ui __________________________01 caixa
Tomar 01 comprimido via oral 1 vez por semana 

retorno com 3 meses 

08/05: paciente refere que após uso de progesterona, sentia tontura
conduta:
troco oestrogel por nativa 
acrescento ytestosterona e manipulado para libido 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58922232, '35', 'Maria Lenililse Gomes Silva', 2, 0, '42129893287', NULL, '(69) 99269-2077', '1973-02-25', 3, 'PACIENTE SE QUEIXA DE DISPNEIA APOS ACORDAR NOTURO, PACIENTE SE REFERE QUE NÃO FOI NO ENDOCRINO.
SOLICITO EXAMES LAB.
AGUARDO NOS EXAMES DE MAMAS, PREVENTIVO.

 ----------- /// ----------

19/02/2025
PACIENTE REFERE QUE HÁ MAIS OU MENOS 10 DIAS APRESENGTOU UMA TAQUICARDIA, SEM MOTIVO, ACOMPANHADA DE DOR MUSCULAR  E FRAQUEZA
APRESENTA USG CERVICAL 10/02: TURGENCIA JUGULAR Á DIREITA 
EXAMES LAB 05/02: HB 13,3 / HT 40,5 / LEUCO 9200, PLQ 239.000
PREVENTIVO: 11/02/25: NEGATIVO PARA NEOPLASIA 
SOLICTO EXAMES LAB, USG TV, MMG 

ENCAMINHO AO VASCULAR - TURGENCIA JULGAR 

----------------  /// -------------------------  /// ---------
13/03/25
PREVENTIVO: 11/02/2025: NEGATIVO PARA NEOPLASIA
EXAMES LAB: 25/02/25: FSH 2,72 / LH 6,43/ ESTRADIOL 229/ PROGESTERONA: INFERIOR O,5 VITAMINA D 42/ VITAMINA B12 746/ TSH 2,75 / T4 LIVRE 0,95 / HB 12.9/ HT 37,1/ LEUCO 9780/ PLQ 230.000/ COLESTEROL 216/ TRIG, 129/ 
USG TV 25/02: HISTERECTOMIXADA/ OD 9,8 PRESENCA DE CISTO SIMPLES E SEPTADO 1,2 CM, OE NAO VISUALIZADO 
DENSITOMETRIA OSSEA 14/10/24: NORMAL
MMG 14/10/24: BI RADS 2 
USG DE AXILARES LINFONODO BILATERAL 
USG DE MAMAS 14/10/24: BI RADS 1 
14/10/24: CISTO HEPATICO / COLECISTECTOMIA PREVIA / USG TV OVARIOS HIPOTROFICOS
ECO CARDIOGRAMA, INSUFICIENCIA MITRAL LEVE E INSUFICIENCIA TRICUSPIDE LEVE, 

CONDUTA: REPETIR USG TV, REPETIR EXAMES LAB HORMONAIS, QUELATUS BARI   
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59362638, '458', 'Maria Lenira Bezerra Do Nascimento', 2, 1, '46565574200', NULL, '(69) 99238-8107', '1974-06-18', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924262, '45', 'Maria Lucia Texeira', 2, 2, '05038914284', NULL, NULL, '1972-07-06', 3, 'PACIENTE ENCAMINHADA DEVIDO MIOMATOSE UTERINA.
PACIENTE REFERE DISPAREUNIA, FAZ USO DE THR TIBILONA 2,5MG, SECURA VAGINAL.
CONDUTA:PROGRAMADO COLETA DE PREVENTIVO PARA O DIA 09/05, ANTROFI POR 3 DIAS.
23/05/2023 VEM PARA COLETA DO PREVENTIVO, EXAME ESPELCULAR, COLO CENTRALIZADO, PRESENÇA DE POLIPO ENDOMENTRIAL, COLO EM FENDA , SECREÇÃO MUCOCRISTALINA.
CONDUTA:REALIZO COLETA DE PREVENTIVO, SOLICITO USGTV.
RETORNO 24/10/2023
PACIENTE EM USO DE TIBOLONA, PREVENTIVO 23/09/2023 NEGATIVO PARA NEOPLASIA+ CANDIDIASE.
USGTV 28/09/2023 NODULO UTERINO 2,7X2,2 SUBSEROSO, OD 2,5, OE 2,8.
CODUTA:MICONAZOL CREME VAGINAL.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60275544, '617', 'Maria Luísa Jorge de Oliveira', 2, 2, '18715676889', NULL, '(16) 98155-0188', '1975-12-23', 1, 'IDADE: 49 ANOS 
G2P2 A0
DUM: HISTERECTOMIA 2019
COMORBIDADES: TU DE ADRENAL EM 2021 EM ACOMPANHAMENTO 
MMG 18/07/25: BI RADS 0 
USG DE AXILA 25/07/25: SEM ALTERACAO 
USG TV 25/07/25: POS HISTERECOMIA OD 6,6/ OE 3,6
ANATOMOPATOLOGICO DO COLO DE UTERO E UTERO FOCO DE ADENOMIOSE 
ALERGIA: FRUTOS DO MAR 

QP; PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA ARDENCIA NO CANAL VAGINAL, 
CONDUTA: ORIENTACOES, EXAMES LAB 

----
10/09 VESPERTINO
COLETA DE PREVENTIVO E FRAXX 
AO EXAME: AUSENCIA DE COLO, PRESENCA DE SECRECAO FLUIDA ESBRANQUICADA 
FLUCONAZOL ,BELAMY 


15/10/2025

PACIENTE REFERE PRURIDO DISCRETO
AO EXAMES: PRESENCA DE SECRECAO FUIDA ESBRANQUICADA COM GRUMOS EM PAREDE

UMMA E FLUCONAZOL 1 E REPETIR COM 7 DIAS 

exames lab 20/09/2025
Hemoglobina 13 hematócrito 37 leu 5470 plaquetas 231000 cura é 34 creatinina 0,7 t go 34 tgp 21 fé 52 glicose 95 colesterol 199 triglicerídeos 50 magnésio 1,7 ferritina 134, insulina 6,9 estradiol 20 progesterona 1,6 fsh 6,7 LH 4,5 tsh 0,9 t 4 livre 0,85 sorologia não reagente exame de urina não infeccioso Vitamina A 0,3 Vitamina C 2,1 vitamina D43 Vitamina B12 486 testosterona 28
reposição de vit b 12 e c 
prescrevo umma, fluconazole 1 e 7 dias, vitergan com e calde max 

20/10/2025
VEM PARA O LASER INTIMO
TEVE ALERGIA A VITERGAN COG E CALCE MAX, POIS CONTEM PEIXE.

TROCO BELAMY POR PROVAGIN ( CANDIDIASE?)

------------     //   -------------------   /// -----------
10/09 / 2025 -  1 sessao de fraxx - belamy 
20/10/2025 1 sessao de laser intimo provagin
01/12/2025 2 sessao de laser intimo  - provagin - paciente refere que mantem ardência ao urinar pela manha, melhora com andolba, no momento refere que está com náusea, em uso de meclin 
ao exame: ausencia de colo, discreta secreção esbranquiçada no fundo de saco de Douglas, 
conduta: fluconazole amanha devido nausea e repetir com 7 dias 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61520880, '865', 'MARIA LUIZA OLIVEIRA DOS SANTOS', 2, 0, '06533451278', NULL, '(69) 99266-3093', '2014-03-16', 3, 'Maria Luiza 
12 anos 
menarca 29/03/2026 
comorbidades, medicação em uso, cirurgia prévia nega
 Paciente acompanhado da mãe veio devido à menstruação ter vindo apenas um episódio 
Pressão Arterial 113 x 63 mmHg
peso 61 e 900 
conduta orientações exames laboratoriais e ultrassom  pélvica
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59043062, '257', 'Maria Luiza Xavier Da Silva', 2, 0, '05232525280', NULL, '(69) 99238-3131', '2002-03-23', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924045, '42', 'Maria Maciel Silva', 2, 2, '05038914284', NULL, NULL, '1960-10-18', 3, 'PACIENTE REFERE A DOR EM BAIXO DO VENTRE, NEGA SECREÇÃO VAGINAL.
ABDOME PLANO:DOR EM FOSSA ILIACA,+- 45 DIAS.
CONDUTA:USGTV E USG ABDOME TOTAL', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921356, '26', 'Maria Marcia Cherpinski', 2, 0, '05038914284', NULL, NULL, '1981-01-30', 3, 'Q.P PACIENTE SEM QUEIXAS NO MOMENTO, VEIO PARA ROTINA GINECOLOGICA.
CONDUTA: EXAMES LAB
USG TV.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58918973, '14', 'Maria Marta De Jesus  Marcelino', 2, 0, '05038914284', NULL, NULL, '1980-12-19', 3, 'BACTERIOCOPIA 07/11/2024 
GRAM +
PREVENTIVO 10/10/2024  NEGATIVO  PARA NEOPLASIA
CONDUTA:CREVGIN', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60595643, '672', 'Maria Neires Barbosa Dos Santos', 2, 0, '24228524249', NULL, '(69) 99393-1143', '1960-04-17', 3, '65 anos
menopausa 58 anos
UPCCU: 2020
g3 p3 a0

QP: paciente refere diagnostico de miomatose uterina, alega sangramento vaginal por 6 dias há 30 dias atras, apos os 6 dias apresentou escape 



CONDUTA: PREVENTIVO
USG TV
EXAMES LAB


05/11/2025
paciente vem para coleta de preventivo
colo centralizado, secreção amarelada com odor 
conduta: coletado preventivo 
prescrevo secnidazol e gynotran 


18/11/2025
NAO FEZ USO DE GYNOTRAN E SECNIDAZOL
EXAMES LAB VITAMINA D BAIXA , COLESTEROL E TRIGLICERIO ALTO 
COLPOSCOPIA  650,00
VIT D 180,00
USG TV MIOMATOSE UTERINA COM UTERO DE 730 CM3 
SOLICITO USG DE ABDOME TOTAL E COLPOSCOPIA 
DIETA ALIMENTAR 

12/01/2026
PACIENTE REFERE USO DE GYNOTRAN E SECNIDAZOL, REFERE USO DE VITAMINA D IM 
COLPOSCOPIA 28/11/25: TESTE DE SCHILER NEGATIVO, HIPOESTROGENICA, ACHADOS COLPOSCOPIO NORMAIS , ECTOPIA CERVICAL 
REPETIR VITAMINA D E LIPIDOGRAMA COM 3 MESES 
ORIENTO CHA CASEIRO DE CURCUMA, CHA VERDE, CHA DE GENGIBRE 
REPETIR COLETA DE PREVENTIVO COM 6 MESES
2 PREVENTIVOS NEGATIVOS, FAZER ANUAL 
EXERCICIO FISICO

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59214383, '429', 'Maria Oricelia Parente De Olivera', 2, 0, '06679956250', NULL, '(69) 8172-7506', '1983-04-19', 3, 'IDADE: 41 ANOS
DUM: 22/03/25
MC:  ----
UPCCU: OUTUBRO DE 2024

QP: PACIENTE REFERE CISTO OVARIANO, SUSPEITA DE NEOPLASIA 

CONDUTA: ORIENTACOES
ENCAMINHO A CIRURGIA 
SOLICITO PRE OPERATORIO 
--------------- // ---------------
vit b 12 526
vit D 34,9, ferritina 57,3 / fsh 22,12 / lh 6,31 / glicose 105/ trig 192/ cols 157 

USG DE MAMAS 15/10 BIRADS 2 
conduta: orientações, suplementação de vit b e d via oral e mama, usg tv e retorno em jan, solicitar exames lab para avaliar vitaminas 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926890, '64', 'Maria Regina mota Costa', 2, 2, '05038914284', NULL, NULL, '1993-10-28', 3, 'GESTANTE DUM:30/03/2024, BHCG + 22/05/2024
CONDUTA: MANTER METFORMINA, EXAMES LAB, PERFIL 4 PONTOS, DEITA, USGTV, DTN FOL, APOS ENCAMINHAR PNAR.
28/05 PACIENTE REFERE NÃO ESTA FAZENDO O USO DE METFORMINA, NÃO ESTA FAZENDO DEITA ALIMENTAR, PERFIL COMPLETAMENTE ALTERADO, SOLICITO GLICEMIA E REPETIR USGTV, PERFIL DE 4 PONTOS, DIETA RIGOROSA, EXERCICIO FISICO.
20/06/24 RECEBO USGTV 18/06/24 11 SEMANAS E 3 DIAS, DUM 30/03/24, POREM PACIENTE REFERE DUM 20/04/24, EM USO DNT, METFORMINA, VARIZES  EM MMIF, CONDUTA MEIAS COMPRESSIVAS,.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60563049, '661', 'Maria Rita Oliveira Nogueira', 2, 1, '68202059291', NULL, '(69) 99920-5590', '1973-08-30', 3, '52 ANOS 
MENOPAUSA 45 ANOS  - INICIO TRH AOS 52 ANOS - PROGESTERONA, 
PACIENTE EREFERE SECURA VAGINAL, APRESENTA RESULTADO DE EXAMES Exames laboratoriais do dia 1/07/2025 Vitamina D 22,8 hemoglobina 14,2 hematócrito 41,4 leucócitos 6700 plaqueta 303000 glicose 103 triglicerídeos 166 colesterol total 306 ldl 214 cálcio 10 estradiol 10,8 fsh 55 LH 24T 4 livre 1,7 tsh 1,4 exame de urina não infeccioso

USG TV 18/09/2025: UTERO 59, PRESENCA DE MIOMATOSE UTERINA, ENDOMETRIO 1,9 MM, OVARIOS ATROFICOS 

ALEGA QUE FEZ USG DE MAMAS E MMG AGUARDANDO RESULTADO, POIS ESTÁ ALTERADO 
CONDUTA: PROVAGIN, STELE, SOLICITO EXAMES LAB, RETORNO TRAZER O NOME DAS MEDICACOES QUE ESTA EM USO 
ALEGA COLETA DE PREVENTIVO AGENDADO NO POSTO SABADO 25/10/25', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928704, '79', 'Maria Rosalia De Olivera Silva', 2, 1, '05038914284', NULL, NULL, '1977-10-18', 3, 'Q.P: paciente refre cefaleia durante  menstruação, alega aumento do fluxo menstrual.
conduta: exames lab, usg.
retorno 18/04/23
paciente alega que não realizou usg, apenas exames lab do dia 20/02/24.
 conduta: orientações sulfato ferroso.
miomatose?', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59119105, '350', 'Maria Rosalia De Olivera Silva', 2, 0, '70927286220', NULL, '(69) 99347-6479', '1977-10-18', 3, 'IDADE 47 ANOS
UPCCU: 2024
MC: LT 
COMORBIDADES: NEGA

QP: PACIENTE REFERE DOR EM BAIXO VENTRE, CICLO IRREGULAR E FLUXO INTENSO 

CONDUTA: EXAMES LAB, PROGRAMAR PREVENTVO, USG TV ( MIOMATOSE?), USG DE MAMAS E MMG.

PREVENTIVO: 120,00  A VISTA E 180,00 CREDITO.

______________ // ----------------------

04/06/2025
DUM: 23/05/25
G3P3A0
paciente refere incômodo em baixo ventre tipo cólica desde ontem, alega secreção vaginal esbranquiçada, prurido discreto, com odor 
ainda nao realizou os exames solicitados anteriormente
ao exame:
PRESENCA DE MANHAS HIPOCROMICA EM REGIAO GLUTEA, NAO DESCAMATIVA
ESPECULAR:  COLO ANTERIOR, PUNTIFORME, SANGRANTE A COLETA, PRESENCA DE SECRECAO FLUIDA ESBRANQUICADA E BOLHOSA.

conduta: coletado preventivo,  GYNOTRAN, FLUCONAZOL, 1/3/7/14 DIAS

--------------------   /// --------------

30/06
PREVENTIVO: NEGATIVO PARA NEOPLASIA E GARDNERELLA ( JA TARATADO ANTERIORMENTE)
APRESENTA RESULTADOMDE EXAMES12/06: 
HB 11,90 / HT 36,2 /VCM 66,2 / FERRITINA 16,70/ FERRO 55,50 / GLICOSE 88,5 / TRG 88,/ COLESTEROL 186 / VITAMINA D 27,3 / VITAMINA B 12 803 / PROGESTERONA 2,34 / ESTARDIOL 103/ FSH ---/ LH 1,59/ TSH  2,45/ T4 LIVRE1,03 
MMG 17/06/25: BI RADS 2 
USG DE MAMAS 17/06/25: BI RADS 2 ( NODULO MAMARIO A ESQUERDA 1,6 X0,6  X0,9 CM 
USG TV 23/06: UTERO 55,7 / OVARIO ATROFIA //EXAME NORMAL 

CONDUTA: ORIENTACOES, RETORNO ANUAL OU ANTES SE INTERCORRENCIAS 
NORIPURUM (180,00) E VITAMINA D (180,00)
SO APLICACAO PACIENTE TRAZENDO A MEDICACAO 80,00

------------ /// -------------------
11/02/2026
48 ANOS 
G3P3A0
DUM: 06/02/2026
MC: LT 
COMORBIDADES: NEGA
UPPCU: 06/06/2025 NEG PARA NEOPLASIA + GRADNERELLA 
MMG 17/06/25: BI RADS 2 
USG DE MAMAS 17/06/25: BI RADS 2 ( NODULO MAMARIO A ESQUERDA 1,6 X0,6  X0,9 CM 
USG TV 23/06: UTERO 55,7 / OVARIO ATROFIA //EXAME NORMAL 

PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA DISMENORREIA E CEFALEIA NO PERIDO DO CICLO

-------------------------
Exames laboratoriais do dia 3/05/2026 tem uma globina 11,2 hematócrito 34,5 leu com 6460 plaquetas 258000 ferritina 58 ácido úrico 3,25 creatinina 0,6 ferro 84 glicose 87 tegel 19 tgp 17 triglicerídeos 69 uréia 27 estradiol 26 LH 1,45 progesterona 0,62 tsh 1,31 Vitamina B12 790 vitamina D 27,30 FCH 3,62 hemoglobina glicada 5,89

CONDUTA: ORIENTACOE 
VIT D 50. IL VO 
REPOSICAO DE FERRO - NORIPURUM 5 AMPOLAS 
RETORNA PARA EXAMES 
----------------------------------------------------

15/07/2026

conduta:
orientações 
exames lab 

NOME: Maria Rosalia De Olivera Silva

USO ORAL

1.	SECNIDAZOL 1 G ________________________04 Comprimidos 

Tomar 02 comprimidos via oral, dose única, para o casal. 

2.	FLUCONAZOL 150 MG ___________________01 Comprimido

Tomar 01 comprimido via oral, dose única. 


USO VAGINAL 

1.	CREVAGIN _________________________________01 Tubo 

         Aplicar via vaginal, á noite, por 7 dias 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58918955, '13', 'Maria Roseane Sena Da Silva', 2, 5, '05038914284', NULL, NULL, '1985-12-12', 3, 'ROTINA:
SOLICITO:PREVENTIVO
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58938460, '92', 'Maria Roseane Sena Da Silva', 2, 5, '89838475220', NULL, '(69) 99243-9648', '1985-12-12', 3, 'dn 12/12/85
dum: 05/01/24
LT
G4P 2 A2
UPPCU: DEZ 2023
COLO CENTRALIZADO, PRESENCA DE GRUMOS EM PAREDE, SECRECAO AMRELADA COM ODOR 
SECNIDAZOL E GYNOTRAN 
COLETADO PREVENTIVO


-----------     ///.   PACIERNTE REFERE ALERGIA A MICONAZOL
REFERE QUE MANTEM SECRECAO VAGINAL ESBRANQUICADA, ARDENCIA, PRURIDO PRICNCIPLAMENTE VULVAR 
PREVENTIVO 12/02/25: NEG PARA NEOPLASIA E CANDIDA
EXAME 25/02/25 VIT B 12 334, VIT D 27,2 UROCULTIRA NAO HOUVE CRESCIMENTO TSH 2,48, T4 L 1,02 
CONDUTA: REPOSICA DE VIT D E B 12, FLUCONAZOL E CREVAGIN 

CONDUTA: FLUCONAZOL, MICONAZOL CREME VAGINAL, ALTA D 50000 UI, DOZEMAST , TRATAMRNTO POR 3 MESES, RETORNAR PARA REPETIR EXAME

23/06/25
39 anos 
dum: 01/05 e 30/05/25 ( sangramento escuro)
PACIENTE REFERE SECRECAO VAGINAL ESBRANQUICADA, COM ÓDOR, REFERE QUE ESTA EM USO DE VIT D E VIT B 12 VIA ORAL, 
METRONIDAZOL VIA ORAL, SECNIDAZOL
EXAMES LAB VITAMINA D E B12, FERRO, FERRITINA, HEMOGRAMA 


EXAMES DE SANGUE A VISTA 323,10 E NO CREDITO 420,03

05/08/2025

exames 03/07: vit b 12 505 / vit d 51,4 / hb 12,1/ leuco 9600/ col 199/ top 15/ trig 111/ glicose95,1 / tio 16,4
Ressonância magnética da pelve feminina do dia 25/07/2025 mínimo espessamento tecidual retrô cervical inespecífico que pode estar relacionado a fibrose ou então acometimento endometriose e ciente de dependência de correlação clínica

05/08:
PACIENTE REFERE QUE MELHOROU A DISPOSICAO, NAGA CANDIDIASE, POREM ALEGA DISPAREUNIA, REFEFRE MELHORA COM USO DE IBUPROFENO 
PACIENTE REFERE QUE NAO DESEJA TOMAR NENHUMA MEDICACAO QUE CONTEM HORMONIO
FAZENDO USO DE CINTA PARA COMPRESSAO ABDOMINAL, DEVIDO SESANCAO DE ESAT ALGUMA COISA SOLTA NO ABDOME

CONDUTA:
 MANTER IBUPROFENO 
COLETAR COELTA DE PREVENTIVO OU ANTES SE INTERCORRENCIAS 
REPOSICA DE VIT D E B 12 POR 2 MESES
SOLICTO EXAMES LAB 
----------------------------------------
05/11/2025

hb 11,4 
HT 33,4 
LEUCO 8 MIL
PLQ 247000
VIT B12 494
VIT D 69,1
CONDUTA: MANTER DOZEMAST E NORIPURUM
---------------------------------------------------------------------------------------------------------------------------------------
Data; 15/07/26
EXAMES: USG TV COM PREPARO INTESTINAL.
Idade: 40 A
D.N.: 12/12/85
D.U.M.: 28/06/2026 – polimenorreia
Estado civil: União estável
M.C.: Laqueadura
G.P.A.: G4 P2 cesária A2
Menarca: 11 anos
Comorbidade: Não
Medicação em uso: Não
Cirurgia prévia: Laqueadura
Último preventivo: Há 1 ano
U.M.M.G.: Não
Atividade física: Não
Q.P.: Rotina
Peso: 76.300
P.A.: 123 × 82
Observação: Paciente queixa de "bola" próximo ao clitóris, dolorosa há 1 semana.
Ao exame:
Presença de provável cisto de abscesso em região próximo ao clitóris do lado direito, em ponto de pustulação, dolorido à palpação.
Conduta:
Orientações
amoxi, triplo a, bacitracin 
Preventivo
Exames lab.

------------------------------

--------------------------------------03/08/2026

paciente retorna com resultado de exames, vem para coleta de preventivo 

Exames laboratoriais do dia 16/07/2026 vitamina B12 535 vitamina D30 ureia 19 creatinina 0.7 ferro sérico 41 tgp 15 tgo 13 glicose 88 colesterol 194 triglicerídeo 87 TSH 1,5 t 4 livre um ferritina 104 hemoglobina 12,8 hemato 37,7 leucócito 11200 plaqueta 250000 sorologias não reagente exceto herpes imune vtrl reagente um trauma cicatriz sorológica 
ultrassonografia de abdômen total do dia 31/07/2026 esteatose hepática graú um 
ultrassonografia transvaginal do dia 31/07/2026 útero 71,1 endométrio 4,1 mm ovario direito 5,2 ovário esquerdo 6,1 presença de pequena quantidade de líquido no fundo saco de Douglas

conduta:
orientações
coleta de preventivo em meio liquido
reposição de vit

---------------------------
preventivo: 07/08/2026:  Negativo para células neoplásicas;
· Compatível com Inflamação Bacteriana;
· Metaplasia Escamosa Imatura.

paciente refere secreção amarelada, com odor 

conduta;
orientacoes 
trivagel - n 

NOME: Maria Roseane Sena da Silva

Uso oral

1.	Secnidazol 1 g______________________04 comprimidos 
Tomar 02 comprimidos via oral dose única para o casal.

 

Uso vaginal

1.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58920906, '21', 'Maria Roziane Da Silva Lima', 2, 0, '05038914284', NULL, NULL, '1980-04-08', 3, 'PACIENTE DESEJA ENGRAVIDAR, EM USO DE ACIDO FOLICO.
USGTV 27/01/2023
MIOMA 
O.D HIPOTROFICO 
O.D 2,07
O. E 4, 12
CONDUTA :USGTV
BHCG, EXAMES LAB.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60066066, '593', 'Maria Silvana Ferreira Sousa', 2, 0, '66399513391', NULL, '(69) 9224-0689', '1982-12-29', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61838427, '928', 'MARIA SILVANA FERREIRA SOUSA', 2, 1, '66399513391', 'Silguiferreira8@gmail.com', '(69) 99224-0689', '1982-12-22', 3, 'Idade: 43 anos
D.N.: 29/12/1982
D.U.M.: 02/07/26
Estado civil: Solteira
M.C.: Laqueadura
G.P.A.: G2, P1 normal, P1 cesárea, A-0
Menarca: 16 anos
Comorbidade: não
Medicação em uso: não
Cirurgia prévia: Laqueadura
Último preventivo: em 2024
U.M.M.G.: em 2024
Atividade física: Funcional e Zumba
Q.P.: Rotina
P.A.: 129 × 82
Peso: 72.300
Conduta / Solicitação:
USG Transvaginal
USG de Mamas
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61702043, '901', 'Maria Silvane Pires Teixeira', 2, 0, '90620504099', NULL, '(97) 8420-9312', '2000-12-15', 1, 'Ela me disse que eu tinha que marca uma outra colcospia, que era pra ela ver como que tava a cicatrização da cirurgia q fiz com ela
Quantos q fica o valor
E qual dia ela pode me atender em Porto Velho

consulta on line 
Procedimento excisional da zona de transformação:
Conização cervical (bisturi frio ou CAF)
Exérese da zona de transformação (EZT)
📌 Objetivos:
Remover toda a lesão
Permitir avaliação de margens cirúrgicas
Excluir microinvasão
oriento paciente a procurar dr loura neto em Humaitá 
e após retorna com desfecho da conduta médica 

paciente entrar em contato via mensagem para avisar sobre o desfecho 

oriento paciente ficar em acompanhamento ginecologico 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58923910, '40', 'Maria Socorro Rosa Da Silva', 2, 0, '05038914284', NULL, NULL, '1959-04-16', 3, 'DOR EM BAIXO DO VENTRE, APRESENTA USG 15/03, NODULO UTERINO SUGESTIVO DE MIOMA, ENDOMETRIO SUGESTIVO DE MUCO ENDOCERVICAL.
PREVENTIVO 11/10/22 NEGATIVO
MMG:08/07/22 
MD:BI-RADS 1
ME BI-RADS 1
CONDUTA:SOLICITO USGTV', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921186, '25', 'Maria Sueli De LIma', 2, 0, '05038914284', NULL, NULL, '1993-09-01', 3, 'DESEJA ENGRAVIDAR, POREM SOFREU ACIDENTE EM ABRIL DE 2022.
ORIENTO PRIMEIRO O TRATAMENTO DE FRATURA DE TIBIA E FIBULA . APOS ORIENTO ENGRAVIDAR NESSE MOMENTO. USA PRESERVATIVO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60842264, '715', 'Maria Vanielly de Lima Honorato Portela', 2, 2, '84357045215', NULL, '(69) 9277-7660', '1986-11-07', 1, '39 ANOS
PLANO DE SAUDE: SALVE SAUDE 
DUM: -
MC: DIU DE MIRENA - INSERCAO 28/08/2024
CIRURGIA PREVIA OOFORECTOMIA ESQUERDA/ CESAREA / LT/ VIDEOLAPAROSCOIPIA - ENDOMETRIOSE UMBILICAL 
G1P1C
UPCCU: DEZ 2024
COMORBIDADES: ENDOMETRIOSE UMBILICAL
MEDICACAO EM USO - NEGA 

QP: PACIENTE REFERE FLACIDEZ VAGINAL, PUM VAGINAL, FRUXIDAO NO CANAL, PERDA DE URINA AOS PEQUENOS ESFORCOS , NEGA SECRECAO VAGINAL, 
AO EXAMES: COLO CENTRALIZADO, PUNTIR=FORME, PRESENCA DE SECRECAO AMARELADA FLUIDA, SEM ODOR, NAO VISUALIZO FIO DO DIU
FLACIDEX DA CANAL VAGINAL 
CONDUTA: GYNOTRAN, LASER INTIMO, EXAMES LAB, USG TV 

----------------- 27/12/2025 
1 SESSAO DE LASER INTIMO 

USG TV 26/12/2025
UTERO ANTEVERSOFLETIDO, 94CC, ENDOMETRIO 3,2 MM, OD 7,8 OE AUSENTE ( POS OOFORECTOMIA) , ADENOMIOSE, MIOMA INTRAMURAL , DIU POSICAO BAIXA, ENDOMETRIOSE PROFUNDA 

24/01/2026
PACIENTE REFERE DISURIA E DIFICULDADE DE URINAR 
Exames laboratoriais do dia 9/01/2026 e uma bobina glicada 4,7 tsh 7.2 t 4 livre um ponto 14 fsh 2,25 LH 3,14 insulina 22,9 Vitamina D 33,3 Vitamina B12 397 anti tpo 6,6 estradiol 106 progesterona 0,68 triglicerídeos 134 colesterol 93 desde o 17 tgp 31 glicose 79 uréia 13 creatinina 0,5 ferritina 96 ferro sérico 94 hemoglobina 14,8 hematócrito 45 leuco 8540 plaqueta 232 urocultura não houve crescimento EAS  não infeccioso


CONDUTA: ORIENTACOES
CIPROFLOXACINA
PYRIDIUM 200 MG 
solicito densitometria ossea
solicitado  vitamina b 12 e d  ca 125, cromo, magnesio, zinco, selênio ( realizar com 30 dias após injetável) 

26/01
preventivo do dia 19/12/2026: negativo para neoplasia 
suspender Pyridium
vacina imunoestimulante 
laser intimo 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61915030, '946', 'MariaMaciel da Silva', 2, 0, '20316593249', 'maciel.controleadm@gmail.com', '(69) 99212-3025', '1960-10-18', 3, '65 ANOS 
COMORBIDADES: HAC  - LOSARTANA 
DUM: 52 ANOS 


QP: PACIENTE REFERE MAIS OU MENOS 3 ANOS SIND DE SJOGREN
PACIENTE REFERE DOR PELVICA , NEGA SECRECAO VAGINAL, NAO TEM RELACAO SEXUAL   

ABDOME: PACIENTE REFERE DOR A PALPACAO PROFUNDA  EM REGIAO HIPOGASTRICA 
NEGA CONSTIPACAO 

CONDUTA; USG DE ABDOME TOTAL
CASO NAO SE AVALIADO A PELVE 
SOLICITAR NO RETORNO USG PELVICA 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926382, '56', 'Mariana Bras Da Silva', 2, 1, '05038914284', NULL, NULL, '2001-09-15', 3, 'Q.P: SECREÇÃO VAGINAL ESBRANQUIÇADA, SEM PURIDO, DISURIA.
CONDUTA:USGTV, EXAMES LAB, PROGRAMAR PREVENTIVO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58927215, '71', 'Mariana Pereira Da Silva', 2, 2, '05038914284', NULL, NULL, '1982-01-01', 3, 'Q.P: PACIENTE REFERE PERDA DE URINA AOS PEQUENOS ESFORÇOS, ALEGA DOR EM BAIXO DO VENTRE, NEGA DISPAREUNIA, NEGA DISURIA, REFERE ANSIEDADE, IRRITABILIDADE, REFERE QUE FARIA A COLETA DO PREVENTIVO EM OUTRO MOMENTO.180,00
NO EXAME DISCRERA DISTOPIA GENITAL.
CONDUTA, EXAMES LAB, PREVENTIVO,USGTV, ESTUDO URINARIO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60538470, '649', 'Mariana Tavares da Silva Alves de Oliveira', 2, 2, '99572427253', NULL, '(69) 9261-5885', '1989-12-08', 1, 'IDADE: 35 ANOS
DUM: 27/08/2025
G 2 P1 A1
MC: NEGA 
UPCCU: JULHO DE 2025
COMORBIDADE: NEGA 
PACIENTE REFERE PELE EM EXCESSO EM GRANDE LABIO DIREITO, PACIENTE REFERE QUE FEZ USO DE ABSORVENTE E FICOU COM ALERGIA?, ALEGA ATRASO MENSTRUAL COM BETA NEGATIVO 
EXERESE DE LESAO DE VULVA CONDILOMA?
CEFALEXINA, NEOMICINA BACITRACINA, AP 
 USG TV

REALIZADO CALTERIZACAO DE LESAO DE VULVAR 

30/10/2025 

Citologia micótica do dia 30 do 10 negativo para câncer no colo do útero
Captura híbrida para HPV do dia 4/07/2025 a ausência de DNA HPV de alto risco
Relatório de patologia cirúrgica do dia 23 do 10 papiloma escamoso com alterações focais consistente com lesão de etiologia viral ( COILACITISE) ultrassonografia transvaginal útero Ant versus fletido assimetria de parede uterina associado a 2 diminutos focos císticos achávamos que podem estar relacionados a adenomiose com espessura de 6,9 mm de endométrio volume uterino de 67 cm³ ovário direito de 5,4 cm³ ovário esquerdo de 6,1 cm³ e Posse diagnóstica assimetria das paredes uterinas associado a 2 minutos Focus City co achados que podem estar relacionados a adenomiose

PACIENTE REFERE DESEJA DE ENGRAVIDAR, NO MOMENTO EM AMENORREIA HA 2 MESES, SEM SINAIS DE ESCAPES
SOLICITO USG TV PARA RESERVVA OVARIANA 

--------------------  // -----------------

Exames laboratoriais do dia 3/12/2025 hemoglobina 12,6 hematócrito 39,2 leu 5030 plaquetas 301000 testosterona total 27 Vitamina D 89,9 Vitamina B12 1091 aldosterona 8,2 hemoglobina glicada 4,9 tsh 0,73, t 4 livre 1,37 fsh 7,34 LH 10,7 SBH 27,7 sorologia não reagente anti h bs 4,2 insulina 7,8 cortisol 4,6 omo cisteína 9,17 Vitamina A zero 42 estradiol 35 progesterona 0,22 beta hcg quantitativo 2,3 beta hcg quantitativo 2,3 prolactina 8,5 ACTH 17 ácido úrico 3,8 t go 15 tgp 23 gama GT 19 triglicerídeos 68 colesterol total 151 puré 34 creatinina 0,7 ferritina 32,5 ferro sérico 28 magnésio 1,7 PCR 2,2 por a cultura não houve crescimento EAS não infeccioso Vitamina C 3,1

ultrassonografia transvaginal para contagem folicular abre para avaliação de reserva ovariana útero de 62,7 cm³ ovário direito 5,4 ou vários esquerdo de 6 contágio folicular sexto dia do ciclo menstrual ou vário direito 14 folículos ovário esquerdo 10 folículos hipótese diagnóstica adenomiose focal reserva Mariana de 24 folie Cosan traz no presente estudo


conduta: regenesis premium 
-------------------------------------
04/06
paciente refere que observou + - 1 mês presença e bolinha com pus, pruriginoso localizada em labio esqui=erdo 
exerce de cisto sebaceo com secreção 
cauterizado e colocado curativo
conduta: neomicina + bacitracina 7 dias 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58927045, '66', 'Mariany Lima Da Silva', 2, 1, '05038914284', NULL, NULL, '2007-07-13', 3, 'ROTINA, SEM QUEIXAS.
CONDUTA: EXAMES LAB, USGTV, PREVENTIVO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58906526, '1', 'Mariela (Paciente Teste)', 2, 1, '11540472299', 'teste@prontmed.com', '11999999999', '1984-02-20', 1, 'Paciente de Teste', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59669010, '536', 'Marilene Liborio Gomes De Olivera', 2, 2, '48601535291', NULL, '(69) 8479-5803', '1972-03-21', 3, 'IDADE: 53 ANOS
DUM: ABRIL 2024
UPCCU: 04/06: NEGATIVO PARA NEOPLASIA 
USG DE MAMAS: 04/06: CISTO EM MAMA NA DIRETITA BI RADS 1 

QP; PACIENTE REFERE MASTAGIA, 

CONDUTA: E MAMA 
VIDEOCOLPOSCOPIO  180,00
EXAMES LAB


DUM: 21/07/2025
PACIENTE REFERE MELHORA DA MASTALGIA, ALEGA MELHORA APOS USO E- MAMA 1 CP AO DIA
REPOSICAO DE VITAMINA D, opta por via oral 
retornar com 30 dias para avalaiacao da vit D, glicose e colesterol ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59396131, '471', 'Marilia Dos Santos', 2, 0, NULL, NULL, '(97) 98440-0343', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61342488, '816', 'MARILIA MARIA DE LIMA VICENTE', 2, 0, '85047813215', NULL, '(83) 98787-3616', '1985-05-24', 3, '40 anos 
DUM: 10/03/2024
MENARCA AOS 13 ANOS 
MC: ----
G 0 P0
COMORBIDADE: DEPRESSAO (SERTRALINA 50 MG 1 DIAS), NÓDULOS NA TIREOIDE, ENXAQUE COM AUREA 
UPCCU: 
PACIENTE VEM PARA ROTINA GINECOLOGICA, PIORA 1 SEMANA ANTES DA MENSTRUACAO, ALEGA PERDA VISUAL, FRAQUEZA DE MEMBROS SUPERIORES E INFERIORES, SINCOPE, 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61375752, '825', 'Marina gabrielly Ozório Maturana', 2, 0, '05925524209', NULL, '(69) 9334-1553', '2007-08-26', 1, 'IDADE: 18 ANOS 
MENARCA: 12 ANOS 
SEXARCA: MEGA 
VACINA EM DIA 
COMORBIDADE": AUTISMO
MEDICACAO NAC, VENVANSE
PROVENIENTE DE ARIQUEMES 
INDICACAO DA THAIS SAMARA 

QP; PACIENTE ACOMPANHADA DA MAE REFER EUSO DE IMPLANON EM DEZEMBRO E ALEGA GANHO DE PESO EXCESSIVO ( 10 KG) 
Laboratoriais do dia 28 de novembro de 2025 desse h 2,6 t 4 5,3 cortisol 13 anti tpo 3 peitinho 34 é que esse h 5 LH um testosterona de 69 Vitamina B12 440 vitamina D23 termina c zero vocês hemoglobina duo hematócrito 39 leucos 6200 plaqueta 289 polissemia 97 bilirrubina normal criativa creatinina 0,6 ureia 38 astro único quarto colesterol 157 lipase Camila sempre tem 7 gama GT 17 fator reumatóide negativo tgp 23 Tg ao 22 bobina delicada 5,1 PCRC novamente ultrassonografia pélvica via abdominal útero em avf volume 89,5 endométrio 3,2 ovário direito 5,71 vários esquerdo 4,5
AO EXAME
ESPECULAR NAO REALIZADO
PRESENCA DE ESCORIACOES EM REGIAO INTIMA
PAACIENTE SANGRANDO ( MENSTRUACAO COM ODOR FETIDO)

CONDUTA:
ORIENTACOES
MONURIL REPETIR COM 7 DIAS 
METRONIDAZOL
REPOSICAO DE VITAMINAS: C, D, B12, K2MK7
NORIPURUM 
NOVA CONSULTA EM JUNHO PARA AVALKIAR VITAMINAS 
--------------
retorno on line
mae alega que a paciente apresenta SUA, com odor e dismenorreia 
1.	ACIDO MEFENÂMICO 500 MG ________01 caixa
Tomar 01 comprimido via oral de 8/8 horas, por 5 dias  

2.	Etinilestradiol 30mcg + levonorgestrel 150 mcg ____01 cx
Tomar 01 comprimido via oral, no mesmo horário,, durante 4 semanas, iniciar no primeiro dia do ciclo

3.	Secnidazol 1 g _____________________4 comprimidos 
Tomar 02 comprimidos via oral, dose única.
4.	Transamim 500 mg ___________________01 caixa
Tomar 02 comprimidos via oral de 8/8 horas, até parar o sangramento, após 01 comprimido via oral de 8/8 horas, por 3 dias 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59523844, '501', 'Marina Oliveira do carmo', 2, 0, '85944130253', NULL, '(97) 8459-8055', '1967-03-12', 1, 'paciente refere cefaleia e lacrimejamento nos olhos, diminuição da acuidade visual, apresenta foliculite em axilas, sintomas da menopausa, alega discreta perda de urina aos pequenos esforços  
alega também prurido anal
ao exames: manchas hipecromicas em região de virilha, com descamação 
vagina atrofica, discreto distopia vaginal 
conduta: aplico antrofi via vaginal, 
entrego amostra grátis: aplause, antrofi 10 dias seguidos, após usar dias alternados, biovagin, mega mater
prescrevo trok, albendazol, secnidazol, cefalexina, 
ao oftalmologista ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60889209, '726', 'Marineide Castro da Silva.', 2, 4, '34094075291', NULL, '(69) 8130-3903', '1968-12-01', 1, 'NOME: MARINEIDE CASTRO DA SILVA
IDADE:  57 ANOS 
LUTO MARIDO 
PLANO DE SAUDE -----
DUM: MENOPAUSA AOS 50 ANOS 
G 1 P C A 0
MC -----
COMORBIDADES: NEGA 
ALERGIA: NEGA 
MEDICACAO: NEGA 
CIRURGIAS: COLECISTECTOMIA, MIOMECTOMIA, CESAREA 
UPCCU; 2023
UMMG

exames laboratoriais do dia 4/07/2025 hemoglobina 3,5 hematócrito 39,1 leucócitos 4500 plaquetas 172000 hemoglobina glicada 5,1% tsh 2,28 t 4 livre 1,11 t 3 1,15 fsh 76,4 LH 47,4 globulina ligada de hormônios sexuais 120 zinco 106 cobre 96,7 selênio 125,4 manganês inferior a um croma inferior a 0,5 insulina 9,9 homocisteína 11,5 PCR 0,5 Vitamina C 0,72 vitamina E 14,32 cortisol 10,9 ACTH 18 ideia 35 vitamina B12 655 ácido fólico 7,6 prolactina 7,8 progesterona 0,21 estradiol 19 estrona 15 anti tpo 39 anti tiroglobulina 1,3 testosterona 11 Vitamina D 71,2 aldosterona 8,2 vitamina BC 19 DHT 110 tgo 32 gama GT 25 glicose 86 por aí é 27 creatinina 0,7 ldh 333 ferritina 105 ferro 90 e 92 fósforo 3,2 magnésio 1,9 ácido úrico 1,1 tgp 47 triglyceride 91 colesterol 173 HDL 68 ldh 87 cálcio 4,39 VH S10
exames de imagem
ultrassonografia de mamas do dia 1/07/2025BIRADS 1 
ultrassonografia transvaginal útero ante verso fletido 26,2 cm³ ovário direito 2 ovário esquerdo 2,6 endométrio de 4 mm exame normal
ultrassonografia de abdômen total do dia 1/07/2025 exame sem alteração de status pós colecistectomia
ultrassonografia de tireóide tire ódio volume normal com 2 pequenos cisto simples tipo colóide no lóbulo direito doppler fluxo metria normal


CONDUTA: 
AGUARDO DENSITOMETRIA OSSEa
SOLICITO MMG
COLETADO PREVENTIVO EM MEIO LIQUIDO 
Colonoscopia 

Uso tópico

1.	Flogo – rosa ________________________01 caixa
Diluir 01 envelope em 1 litro de água, fazer banho de assento á noite, por 5 dias.

2.	Aciclovir tópico 3 vezes ao dia 


NOME: MARINEIDE CASTRO DA SILVA

SOLICITO 
HEMOGRAMA 
HEMOGLOBINAGLICADA
TSH  
T 4 LIVRE
ANTICORPO ANTITEROPEROXIDASE
ANTICORPO ANTIREOGLOBULINA 
T3 LIVRE 
T3 REVERSO 
FSH 
ZINCO
LH 
GLOBULINA LIGADORA DE HORMÔNIOS SEXUAL
MERCÚRIO
 ZINCO
 COBRE 
SELÊNIO SÉRICO
MANGANÊS 
CROMO 
HOMOCISTEÍNA 
INSULINA
PCR
VITAMINA C 
VITAMINA E 
ACTH 
VITAMINA B12
SHBG 





ÁCIDO FÓLICO
 PROLACTINA 
PROGESTERONA 
ESTRADIOL
 ESTRONA 
TESTOSTERONA 
VITAMINA D 
VITAMINA B6 
DHT 
TGO
TGP 
 URÉIA 
CREATININA
FERRITINA 
FERRO 
ÁCIDO ÚRICO
PERFIL LIPIDICO 
 CÁLCIO 

21/01/2026


Exames laboratoriais no dia 12 de janeiro de 2026 hemoglobina glicada 5,1 tsh 1,39 t 4 livre 1,24 3 t 3 reverso 3,22 fsh 82 LH 41 testosterona 14 SLH 99 anti tpo 1,35 92 cobre 101 selênio 122 omo sistema 17,7 insulina cede Vitamina E 12 ACTH 10 Vitamina B12 é ácido fólico 7,07 prolactina 6,3 progesterona 0,21 estradiol 19 vitamina D28 anti tpo 6,6 Mercúrio 0,1 manganês inferior a um croma inferior 0,5 b 6 18 vincular 4 ácido úrico, 6 t jovem 7 tgp 26 triglicerídeos 65 colesterol 175 por é 19 creatinina 0,5 cálcio 8,4 ferritina 90 ferro 99 PCR 0,5 hemoglobina 13,9 leu 5070 plaqueta 304000 urocultura não houve crescimento e Aécio não infeccioso Vitamina C 6,1 estrona inferior a 14,8 
preventivo do dia 9/01/2026 presença de flora de Cocos escasso negativo para células neoplásicas esfregaço atrófico com inflamação
exames de imagem
mamografia BI RADS 2
desta metria óssea do dia 1/07/2025 coluna lombar osteoporose femo osteopenia

NOME: Marineide Castro da Silva.

Uso oral
1.	RESTAURE ADEK  ____________________01 frasco
Tomar 5 gotas via oral 1 vez ao dia 
2.	Prosso KM _________________________01 caixa
Tomar 01 tablete via oral, 1 vez ao dia 
3.	Ômega vitafor ________________________90 cápsulas
Tomar 03 capsula ao dia 
4.	Coenzima q 10 _______________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia 
5. Ibandronato 150 mg ____________________ 01 caixa 
Tomar 01 comprimido via oral 1 vez por mês 

Uso sublingual 
5.	Dozemast 1000mcg ______________________01 caixa
01 comprimido SL 1 vez ao dia, por 30 dias 


























', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61199752, '791', 'MARINEIDE DO VALE DO NASCIMENTO', 2, 2, '51296810291', NULL, '(69) 99249-0728', '1981-12-14', 3, 'DUM: JANEIRO DE 2026
G4 P4 A0
UPCCU: 1999
COMORBIDADES: HAC / HISTORICO DE ALTERACAO NO COLO UTERINO 
MC: LT 

QP: PACIENTE COM QUEIXAS DE CLIMATERIO

CONDUTA: ORIENTACOE S
EXAMES LAB
USG TV 
MMG ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59392783, '467', 'Marineide Mendes', 2, 0, NULL, NULL, '(97) 99611-5213', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61855317, '932', 'Marines da Silva Martins', 2, 0, '01750970201', 'mara76504@gmail.com', '(68) 99964-5844', '1991-08-09', 1, 'origem 180, 
USG TV 02/2026: OVARIO AUMENTADO
USG DE MAMAS 02/2026 BI RADS 1 
apresentou historia de trombose venosa nas pernas depois do uso de nativa pro 15/07/2026
alega calafrio a noite e calorão durante o dia 

exame:
eas 
Hemoglobina: (+) Ausente
Leucócitos: (++) Ausente
Piócitos: 18 a 20 P/C Inferior a 5 p/campo
Hemáceas: 12 a 14 P/C Inferior a 4 p/campo

conduta:
ciprofloxacin
outubro nova consulta para comparação de hormônio e iniciar TRH  TRANSDERMICA - OBSERVAR PACIENTE APRESENTOU TROMBOSE
SOLICITAR EXAMES FSH, LH, TSH, T 4 LIVRE, ESTRAIOL E PROGESTERONA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59018555, '190', 'Marinete de Amorim Lima', 2, 0, '66673348291', NULL, '(92) 8279-0661', '1981-07-14', 1, '44 ANOS 
G2 PN A1
DUM: 17/02/25
MC: ----
COMORBIDADES: ADENOMIOSE
PACIENTE REFERE IUE, ALEGA SECRECAO VAGINAL ABUNDANTE, NEGA SINTOMAS DA MENOPAUSA COMO SINTOMA DE ANIMO, SINTOMAS DE SONO, DOR NA MUSCULATURA 
VEM PARA AVALIACAO DA REGIAO INTIMA 

AO EXAME
MAMAS PENDULARES, PRESENCA DE DISCRETO ABSCESSO (0,5 CM ) EM CICATRIZACAO EM MAMAESQUERDA, AUSENCIA DE NODULOS
EXAME DA REGIAO INTIMA
ESCURECIMENTO DA REGIAO INTIMA
HIPERTROFIA BILATERAL DE PEQUENOS LABIOS
ESPECULAR COLO CILINDRICO, EM FENDA, PRESENCA DE SECRECAO ESBRANQUICADA E BOLHOSA

CONDUTA: ORIENTACOES
SECNIDAZOL
UMA
COLETADO PREVENTIVO: 180,00
NINFOPLASTIA 6 MIL
LASER INTIMO 1800,00
EXAMES LAB, USG TV E USG MAMAS 

26/02/2025
USG TV UTERO 648,09 CM , DEVIDO MIOMAS INTRAMURAL EM PAREDE POSTERIOR, ENDOMETRIO 7 MMM, OE NAO VISUALIZADO, OD 11,88 CM 
USG MAMAS 26/02: BI RADS 1 

REALIZO NINFOPLASTIA 
ATO SEM INTERCORRENCIA
ENTREGO TCLE, RECEITA 
NAO NECESSITA DE ATESTADO MEDICO 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61086709, '770', 'Marirlene Pereira Machado', 2, 2, '16519576816', NULL, '(31) 9861-8481', '1970-10-13', 1, 'INDICAÇÃO SANDRA HUMAITA', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58983392, '149', 'Marlene De Carvalho Silva', 2, 0, NULL, NULL, '(69) 99202-6845', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58983397, '150', 'Marlene De Carvalho Silva', 2, 2, '78096162268', NULL, '(69) 99202-6845', '1982-12-21', 3, 'IDADE: 42 ANOS
DUM: DEZEMBRO 2024
MC: ------ ESPOSO ESTERIL SIC
UPCCU: 28/12/24: NEGATIVO PARA NEOPLASIA

QP: PACIENTE REFERE CANDIDIASE DE REPETICAO,  ALEGA QUE REALIZOU CREVAGIN E FLUCONAZOL, POREM ESTA COM SECRECAO AMARELADA, ODOR MENSTRUACAO E RELACAO SEXUAL 

CONDUTA: SECNIDAZOL E METRONIDAZOL CREME VAGINAL', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59015120, '185', 'Marlise De Melo Brasil', 2, 2, '63499118220', NULL, '(69) 99279-8897', '1968-10-13', 3, 'IDADE 56 ANOS 
G5 P2 A2
MENOUPAUSA 47 ANOS
COMORBIDADES -------
UPCCU: 2024

QP: PACIENTE VEM PARA ROTINA GINECOLÓGICA, PACIENTE REFERE ALGIAQ NA MAMA DIREITA, APRESENTA MAMOGRAFIA 19/03/2024 BI RADS 0 - NODULO 0,7CM NO TEERCO MÉDIO DO QUADRANTE SUPEERO-LATERAL DA MAMA DIREITA, CALCIFICACOES DE ASPECTO BENIGNO 


AO  EXAME 
NODULO EM MAMA DIREITA AS 12 H =/- 1 CM, DOR A PALAPACAO PROFUNDA 

SOLICITO USG DE MAMAS ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924221, '44', 'Marly Clemente Chefe', 2, 2, '65491530263', NULL, NULL, '1979-05-29', 3, 'Q.P: DOR EM FOSSA IBIACA E.
GIORDENO POSITIVO.
CONDUTA: USGTV, USG MAMAS,MMG,EXAMES LAB,TROPINAL.
RETORNO 24/07/2023 
COLONOSPIA 20/06/2023 NORMAL, 15/05/23 HERNIA MIATAL, GASTRITE ENANTEMOTOSA MOD. DE ANTRO, USG DE ABDOMEM TOTAL 05/05/2023.
CONDUTA: NORIPURUM, DIGEPLUS, FORFIG;
30/01/2024
QUEIXA DE DOR EM FLANCO E MANCHAS HIPOCROMIA, DESCAMATIVA, PRURIGINOSA, SEM MELHORAS.
CONDUTA: USG DE ABDOME TOTAL, USG RINS,EXAMES LAB, ENEAM P/ORTOP(HERNIA DE DISCO?)
04/03/24
PACIENTE REFERE QUE FOI NO ORTOPEDISTA E DEMARTOLOGISTA(BETAMESTASONA NAS MANCHAS), USG DE ABDOMEM TOTAL 07/2/24 NEFROLITIASE 0,65 A ESQUERDA, EXAMES
CONDUTA:HEMOLIP, VIOSSO, OMEGA 3.


---------------------------------------------------
10/09
histerectomia em 2020
paciente refere desejo de clareamento facial
Paciente dor em flanco direito que irradia para região de fossa Iliaca direita
apresenta preventivo 22/01/2025: negativo para neoplasia + inflamação inespecífico 

conduta: solicito exames lab e usg tv 

__________________ // ____________________

exames lab 24/09
hb anemia hb de 11 / eas 47 piocitos , demais normal

USG de abddeme total 02/10/25: bexiga de esforço, devendo descarta affeccao fúngica 
USG TV 02/10:  histerectomia, ovarios reduzidos, espessamento de bexiga, bexiga de esforço, devendo descarta affeccao fúngica 

conduta: orientações
gynotran, fluconazole, ciprofloxacina ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61950240, '961', 'Marta Bezerra de Araujo', 2, 1, '89473892268', NULL, '(69) 99320-6399', '1986-09-25', 3, 'idade: 39 anos 
dum: 09/08/2026
UPPCU: 2025

QP: PACIENTE REFERE MIOMATOSE UTERINA , PARCEIRO COM ITU DE REPETICAO

APRESENTA USG TV 17/06/2026 -SEM LAUDO  ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61838395, '927', 'Martilene Ribeiro Alves', 2, 5, '31287263291', 'martleneribeiroalves468@gmail.com', '(69) 98112-2868', '1968-12-08', 3, 'Idade: 57 anos
D.N.: 08/12/1968
DUM: 46 anos
M.C.: não
G.P.A.: G.6 P.4 A.0
Menarca.: 15 anos
Comorbidade: não
Medicação em uso: não
Cirurgia prévia: Cesariana, excisão de cisto
Último preventivo: Há 1 ano
U.M.M.G.: Há uns 10 anos
Atividade física: não
Q.P.: dor pélvica
P.A.: 106 × 66
Peso: 56,00
Conduta: Orientações + preventivo + USG TV
Total: 387
237,00
150,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61031845, '751', 'Martyely kawayane dos Reis', 2, 0, '58340517821', NULL, '(18) 99631-2709', '2003-06-28', 1, 'FILHA DA  PACIENTE Macicleia Marinho
IDADE: 22 ANOS
DUM: 
MENARCA 14 ANOS 
SEXARCA: 17 ANOS 
MC: ACO
COMORBAIDADES/ MEDICACAO/ A;ERGIA: NEGA
EXERCICIO FISICO: REGULAR
SONO: PRESERVADO
ALIMENTACAO IRREGULAR
INTESTINO: REGULAR
OBSERVACAO PACIENTE BEM ANSIOSA
UPCCU: NUNCA REALIZOU 
PLANO DE SAUDE NEGA 

QP: PACIENTE REFERE QUADRO DE PRESENCA DE BOLHAS EM REGIAO INTIMA PRURIGINOSA, ALEGA ARDENCIA 

EXAME FISICO  
DUAS LESOES  EM GRANDES LABIOS APARETIMENTE HESPES 
COLO ANTERIOR, PRESENCA DE SECRECAO ESBRANQUICADA, FLUIDA 

CONDUTA:
ORIENTACOES
EXAMES LAB
USG TV
COLETADO PREVENTIVO EM MEIO LIQUIDO

03/03/2026
PACIENTE RETORNA
RESULTADO DE EXAMES LAB VIT B12 E D3 BAIXA, EAS CONTAMINACAO E TURVO, SUGERINDO HIGESTA HIDRICA, HERPES REAGENTE 
CONDUTA: 
VACINA 490,00
VITAMINAS 460,00

13/05/2026
PACIENTE REALIZOU A SEGUNDA DOSE DA VACINA DE HERPES, NA PROXIMA DOSE REALIZAR UMA HIDRATAÇÃO INTIMA NA PACIENTE DE MIMO.

------------------------------
VACINA 13/07/20276
CONDUTA: REPETIR EM SETEMBRO 
------------------------', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921601, '27', 'Matis Regina Carvalho Humeniek', 2, 0, '05038914284', NULL, NULL, '1979-09-11', 3, 'Q.P: INSONIA, QUEDA DE CABELO,SECURA NA VAGINA.
MAMA DIREITA COM NODULO.
ALEGA REDUÇÃO DE MAMAM EM 2016
MAMA N 02, PRESENÇA DE CICATRIZES EM AMBAS MAMAS, PRESENÇA DE  NODULO EM MAMA DIREITA AS 7 H +- 3 CM E NA MAMA ESQUERDA AS 5 HORAS +- 2CM.
CONDUTA: EXAMESLAB
USGTV E MAMAS E AXILAS.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59431633, '482', 'Maura', 2, 0, NULL, NULL, '(69) 9996-8461', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58982780, '145', 'Mauriane viana de Albuquerque', 2, 0, NULL, NULL, '(92) 8116-3053', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926972, '65', 'Mayara Gouvea Duarte', 2, 2, '05038914284', NULL, NULL, '1995-09-19', 3, 'PACIENTE REFERE QUE APOS RELAÇÃO SEXUAL, ALEGA PURIDO, EDEMA, ALEGA QUE FEZ USO DE MICONAZOL, SEM MELHORA.
PACIENTE APRESENTA O RESULTADO DOS EXAMES, URUCULTURA NEGATIVO,PREVENTIVO NEGATIVO PARA NEOPLASIA, CONDUTA FLOGO ROSA, FLUCUNAZOL.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58918678, '11', 'Meireane Aparecida De Souza', 2, 0, '05038914284', NULL, NULL, '1981-02-22', 3, 'Paciente disse que sente dor de baixo do vetre
7 meses de abdominoplastia
secreção vaginal 
conduta: orientações+ metronizadol creme vaginal+ ibuprofeno
exames labotarias;
usg tv+ abdomem total+usg de parede abdominal.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61342422, '815', 'MEIRIANE APARECIDA DE SOUZA', 2, 0, '66479339215', NULL, '(69) 9609-1333', '1981-02-22', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61013615, '741', 'Micaela Lais de Oliveira Calixto', 2, 0, '07790980211', NULL, '(69) 9291-0576', '2001-04-20', 1, 'IDADE: 24 ANOS 
UPCCU: 2025 DEZEMBRO 
MC; IMPLANON

QP: PACIENTE REFERE MENSTRUACAO IRREGULAR, MESMO APOS TRATAMENTO MEDICAMENTOSO 

CONDUTA: 
ORIENTACOES 
NEXTELA E USO DE PRESERVATIVO
RETIRADA DE IMPLANON


1.	Cefalexina 500 mg _________28 comprimidos
Tomar 01 comprimido via oral de 6/6 horas, por 7 dias 

2.	Triplo a _______________________ 01 caixa 
Tomar 01 comprimido vo 12/12 horas, por 3 dias. 

RETIRA DE PONTO DIA 11/02', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921963, '31', 'Micaellen F De Carvalho', 2, 0, '05038914284', NULL, NULL, '1995-10-21', 3, 'Q,P: AMENORREIA, FAZIA USO ACJ TRIMESTRAL, PAROU EM JANEIRO 2024.
CONDUTA:EXAMES LAB, USGTV, PREVENTIVO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61638900, '882', 'Michelle Cristio Rosa da Silva', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58919014, '15', 'Michelli Cristiane Rosa Da Silva', 2, 0, '05038914284', NULL, NULL, '1984-03-12', 3, 'PACIENTE COM O PREVENTIVO ALTERADO
MIOMATOSE UTERINA
EM USO DE CREVEGIN
EAS ALTERADO EM USO DE CIPROFLOXACINA
CONDUTA: ORIENTAÇÕES
ENCAMINHADA AO GINECO CIRUGICO
COLPOSCOPIA.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59981949, '558', 'Michelly M. Alves', 2, 0, NULL, NULL, '(55) 83918-4896', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58918890, '12', 'Mikaely Olivera Duarte', 2, 0, '05038914284', NULL, NULL, '2010-02-01', 3, 'PACIENTE ACOMPANHADA DA TIA 
DUM: 02/10/2024 ALEGA QUE EM SETEMBRO A MENSTRUAÇÃO NÃO DESCEU, PORÉM FEZ USO DO ACJ. 
INICIOU ACO POR CONTA PROPRIA MAIS OU MENOS 4 MESES.
CONDUTA ORIENTAÇÕES:
EXAMES LAB
USG PELVICA.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58921034, '23', 'Milema Gabrielly C Da Silva Aguiar', 2, 0, '05038914284', NULL, NULL, '1998-06-03', 3, 'DISMINORREIA
USG TV 11/08/2022 HIDROSSALPINGE A ESQUERDA 
CONDUTA:IBUPROFENO
METRONIDZOL', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926603, '59', 'Milena Regina Carvalho De Holanda', 2, 1, '05038914284', NULL, NULL, '2004-12-17', 3, 'DISMINORREIA, FLUXO MENSTRUAL INTENSO, REALIZA EXERCICIO FISICO, ALEGA GRIPE VIROSE 4+- 1 MES, NÃO ESTÁ SE ALIMENTANDO ADEQUADAMENTE.
CONDUTA:EXAMES LAB, PROGRAMAR PREVENTIVO.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61736657, '903', 'Milena santos Lopes', 2, 0, '03559027292', NULL, '(69) 8422-6197', '1998-02-18', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59065273, '297', 'Milene da Cruz Araújo', 2, 0, '90954971272', NULL, '(69) 9320-8145', '1986-02-23', 1, 'IDADE: 39 ANOS
DN: 23/02/1986
G3 P2C A1 ( 2010)
DUM: 22/02/25
MC: LT
COMORBIDADE: NEGA 
CIRURGIAS: ABDOMINOPLASTIA 
ALERGIA A MEDICACAO NEGA
UPCCU: 2023

QP: DISMENORREIA E AUMENTO DO FLUXO MENSTRUAL, ESSE QUADRO APRESENTO-SE HÁ MAIS OU MENOS 1 ANO, NEGA DISPAREUNIA
REFERE. SECRECAO VAGINAL ESBRANQUICADA, SEM ODOR E SEM CHEIRO, NEGA NODULO NAS MAMAS (PROTESE MAMARIA EM 2024)
AO EXAME: 
COLO CILINDRICO, POSTERIOR, PRESENCA DE SECRECAO ESBRANQUICADA COM GRUMOS EM PAREDE,
PRESENCA DE DISCRETA FLACIDEZ DE PAREDE VAGINAL ANTERIOR 

USG TV PARA PESQUISA DE ENDOMETRIOSE, USG DE MAMAS E AXILARES, COLETAS DE PREVENTIVO, EXAMES LAB, CREVAGIN 
DIPIRONA 1 G 6/6 H E TRIPLO A 12/12 H POR 3 DIAS 

24/04/2025
preventivo 13/03/2025: negativo para neoplasia
exames Lab: 15/04/2025
VIT B 12 469 / TRG 66/ VITAMIN D 37/ COLESTEROL 150 / GLICOSE 99 / COAGULOGRAMA NORMAL / HB 11,3/ HT 32/LEUCO 4100/PLQ 213000 / TSH 1.,63/ T4 LIVRE 0,86/ EAS 3-4 PIOCITOS - LIGERAMENTE TURVO - F BAC MODERADA
USG DE MAMAS E AXILARES  17/04/2025 : REGIAO AXILARES SEM NODULOS, IMPLANTES MAMARIOS BEM POSICIONADOS - BIRADS 2 
USG TV 17/04/2025: UTERO AVF VOL 163/ ADENOMIOSE, SEM FOCO DE ENDOMETRIOSE, ENDOMETRIO 8MM, OD 4,6 OE 4,3

CONDUTA: REPOSICAO DE VITAMINA D E B12, REFORCO EM 2 MESES, PRESCREVER FERRO - NORIOURUM, REPETIR EXAME VIT B12, D E HEMOGRAMA 
SUGIRO DIU DE MIRENA - 3200,00 - ADENOMIOSE 
VITAMINA 460,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58927058, '67', 'Mirian Da Silva Caetano Dos Santos', 2, 2, '05038914284', NULL, NULL, '1995-10-11', 3, 'ROTINA GINECOLOGICA.
CONDUTA:PREVENTIVO, EXAMES LAB, USGTV.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59576351, '517', 'Mirian Kuriyama', 2, 3, '68544855253', NULL, '(69) 9223-2722', '1981-05-08', 1, 'NAO SALVOU - CONFIRMAR ANAMNESE - 
DUM:  ----- ( AMENORREIA , PAROU USO DE OXADROLONA, GESTRINONA)
PACIENTE COM QUEIXA DE HIPERCROMIA EM REGIAO INTIMA, MANCHAS HIPERCROMICA EM REGIAO DE INTERGLUTEO, GRANDES LABIO, RAIZ  DA COXA
ESPECULAR- SECRECAO ESBRANQUICADA BOLHOSA
GYNOTRAN, SECNIDAZOL, 
HIDRATACAO COM OLEO DE COCO E BAPANTOL DERMA
EXAMES DE SANGUE 
A VISTA 995,42
CREDITO 1118,50 2X

------



01/07/2025
EXAMES LAB OK ( ANTI HBS REPETIR VACINA DE HEPATITE B)

PACIENTE REALIZOU 1 PRIMEIRA SESSÃO DE LASER INTIMO E LASER PARA CLAREAMENTO.
HOME CARE, ESFOLIANTE, SABONTE INTIMO 50ML , LENÇO UMIDECIDO E CLAREADOR.

11/07/2025
USG DE MAMAS 02/07/2025: BI RASD 1 
USG TV 02/07/25: UTERO 79.2, END 7,3, OD 6,3/ OE 6,2 MIMA INTRAMURAL E SUBSEROSO

14/07realizo potencializado do peelingi
prescrevo betametasona 


29/07/2025
PACIENTE REALIZOU A SEGUNDA SESSÃO DO LASER INTIMO.
LASER VULVAR
PEELING

08/08/2025
paciente refere que esta apresentando secreção vaginal esbranquiçada, sem odor, sem prurido
paciente refere que o serum escurece a região intima, esta usando bepantol derma 
conduta: realizado contorno com acido hialurônico em região de vulva e grandes labio
presença de secreção esbranquiçada  com grumos 
tericin at 

MANDEI MENSAGEM PARA A PACIENTE  PARA MARCAR PARA O DIA 18/08 AS 16:30 PARA FAZER A POTENCIALIZAÇÃO E NÃO ME RETORNOU, ENTREI EM CONTATO NOVAMENTE NO DIA 26/08 PARA  TENTAR O AGENDAMENTO E A PACIENTE RELATA QUE ACHA QUE JÁ PASSOU MUITO TEMPO PARA FAZER O POTENCIALIZADOR.

10/09peeliing

A Dra. Christiane analisou as fotos da senhora no prontuário e verificou que o procedimento indicado seria a Capuzplastia associada à Labioplastia.

Ela me repassou o orçamento com as seguintes opções:
💰 À vista: R$ 11.150,00
💳 Parcelado: R$ 12.950,00 em até 6 vezes.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61519242, '863', 'Miriele Rosa de Souza', 2, 0, '01014857279', NULL, '(97) 9188-0019', '1990-11-08', 1, 'IDADE 35 ANOS 
G 1 P N
DUM: 21/04/2026
UPCCU: 12/ AGOSTO DE 2025: NEG PARA NEOPLASIA - PRESENCA DE POLIPO ENDOMETRIAL COM BIOPSIA NEGATIVO 
MC: ACO - CICLO 21 

QP: PACIENTE REFERE SECRECAO VAGINAL, SEM ODOR, COLORACAO ESBRANQUICADA E AS VEZES ESVERDEADA, SEM PRURIDO
FEZ USO DE TERICI AT E METRONIDAZOL E NISTATINA, FEZ USO DE ITRACONAZOL - 
FAZENDO USO DE DUCHA VAGINAL 

COLO CILINDRICO, MODERADA SECRECAO AMARELADA, COM GRUMOS 

CONDUTA:
ORIENTACOES 
SECNIDAZOL
TRiVAGEL E GYNOTRAN 
flogorosa
ZAILA 
---------------------------

11/06/2026

DISCRETA SECRECAO VAGINAL ESBRANQUICADA COM GRUMOS 
SANGRAMENTO AO INTRODUZIR ESCAVA DE AYRES 
CONDUTA: CREVAGIN
ENTREGO AMOSTRA DE NEXTELA 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61838604, '930', 'MIRTIS REGINA CARVALHO HUMENIUK', 2, 2, '68204787200', 'mirtis.regina@gmail.com', '(69) 99206-5646', '1979-09-11', 3, 'Mirtis Regine Carvalho 
Data: 25/07/26
Sindicato: 05
Idade: 46 anos
D.N.: 11/09/79
D.U.M.: 13/07/2026
Estado civil: Casada
M.C.: Laqueadura
G.P.A.: G4 P3 C1 NV A2
Menarca: 10 anos
Comorbidade: Não
Medicação em uso: Não
Cirurgia prévia: Mamoplastia / Bariátrica
Último preventivo: Há 2 anos
U.M.M.G.: Há 2 anos
Atividade física: Academia
Peso: 68,20
P.A.: 123 × 79
Q.P.: Rotina
apresenta exames lab 07/04
hb 10,2
ht 31,9
leuco 7500
plq 279000

Conduta:
Orientações
Exames lab. – HE
Hormônios
Endofer
MMG
USG TV → R$ 150,00
USG mamas
Preventivo → R$ 237,00
Densitometria óssea
-----------------------------

03/08
paciente vem para laudo para usg tv 


Dados laboratoriais e de imagem — 14/08/2026
Exames laboratoriais:
Exame	Resultado
Ferro sérico	19
Ferritina	12
Estradiol	< 20
FSH	52
LH	23
Progesterona	< 0,5
Vitamina B12	263
Vitamina D	23
Hemoglobina	10,2 g/dL
Hematócrito	32,6%
VCM	75 fL
HCM	23 pg
Leucócitos	7.200/mm³
Plaquetas	232.000/mm³

Mama direita: imagem nodular, aproximadamente 1,0 cm, localizada às 9 horas, com contornos irregulares, margens não circunscritas e aspecto espiculado.

Classificação:  BI-RADS 5

Conduta: encaminhamento para mastologista para avaliação da lesão e definição de investigação histopatológica, 
DIETA RICA EM FERRO 
NORIPURUM
SUPLEMENTACAO DE VITAMINA D E B12 

NOME: MIRTIS REGINA CARVALHO HUMENIUK


Uso injetável


1.	Noripurum _____________________05 ampolas
Diluir  01 ampola com soro fisiológico 100 ml EV e fazer a cada 48 horas. 


Uso oral

1.	ALTA D 50.000UI  ____________________01 caixa
Tomar 01 comprimido via oral por SEMANA, durante 30 dias. 

Uso sublingual 

1.	Dozemast 1000mcg _________________________01 caixa
01 comprimido SL 1 vez ao dia, por 30 dias 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928995, '81', 'Monica Lopes Da Silva', 2, 2, '05038914284', NULL, NULL, '1981-06-17', 3, 'paciente refere disminorreia, e s.v.a, não esta fazendo uso de aco há 6 meses.
orientações: exames lab, usgtv endometriose, usg de tireoide.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926650, '60', 'Monica Machado Rodrigues De Freitas', 2, 2, '05038914284', NULL, NULL, '1997-05-21', 3, 'Q.P: 4 ANOS SENTE DORES PELVICAS TIPO COLICAS, SINUSSORRAGIA.
CONDUTA:TRIPLO  A, TROPINAL, USG COM PREPARO INTESTINAL, EXAMES LAB.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58924740, '54', 'Monica Santos  De Olivera', 2, 2, '05038914284', NULL, NULL, '1997-07-20', 3, 'Q.P: DISMINORREIA, ALGIA MAMARIA NA AUREOLA, NEG SECREÇÃO VAGINAL,NEGA DISPAREUNA.
CONDUTA:IBUPROFENO,USGTV, EXAMES LAB.
RETORNO 05/06/2023
USG 1 TRIM, 26/05/23 GESTAÇÃO INICIAL,
CONDUTA:REPETIR USG 2 SEMANAS.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61264447, '803', 'Myrella Lindalva Bernardo brilhante', 2, 0, NULL, NULL, '(84) 9695-6057', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59397858, '475', 'Nadine Gomes Manoel Vanizi Lino', 2, 0, '17429775705', NULL, '(69) 98419-7097', '2000-12-12', 1, 'MCC:  PILULA DESOGESTROL
G: 2 P: 2 A: 0
PREVENTIVO: NÃO LEMBRA A ULTIMA VEZ QUE FEZ
CASADA 
COMORBIDADES: TIREOIDEOPATIA, FAZ USO DE T4 LIVRE 1,28. EXAME FEV 2025 TSH4

Q.P: PÓS PARTO VAGINAL 5 MESES, QUEIXA- SE DE UM CAROÇO NA REGIÃO INTIMA.
AO EXAME: IFLAMAÇÃO DA GLANDULA DE SKENE A ESQUERDA.
CONDUTA: IBUPROFENO POR 3 DIAS
RETORNO 1 MÊS.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60252830, '615', 'Nadine Saiaddy Freitas Leal', 2, 0, '93263996215', NULL, '(97) 8406-3143', '1992-03-15', 1, 'exames de sangue a vista 493,67 credito 540,50

33 anos 
G0 P0 A0 
COMORBIDADES: NEGATIVO
ALERGI : DERMATITE ATOPICA 

VEM PARA ROTINA ROTINA GINECOLOGIca

usg tv 04/09: útero 66,39
indo 5 mm
od 4,84 oe 5,13

mamas : 04/09: bi rads 1 

ao exame: 
colo hioeremiado, presença de secreçAO ESBRANQUICADA

CONDUTA: CREVAGIN  

ATESTO PARA OS DEVIDOS VINS QUE O SR. LUAN ALVES MOREIRA NECESSITA DE 02 DOIS DIAS DE AFASTAMENTO DE SUAS ATIVIDADES LABORAIS, APARTIR DESTA DATA.

realizo colposcopia, e laudo, caso necessite realizar novo exames após resultado de preventivo, coletado no dia do exame


CID Z76.3



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61824629, '924', 'NAIADE DA SILVA SANTOS', 2, 0, '04592479211', 'naiadesantos86@gmail.com', '(69) 99921-9100', '1999-12-07', 3, 'G1 P1N A0
MENARCA 13 ANOS 
UPCCU: + 1 ANO
COMORBIDADE: ANSIEDADE

QP: ROTINA
EXAME LAB, USG TV , PREVENTIVO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61421126, '841', 'NAIANE CRISTINA CHAGAS DE SIQUEIRA', 2, 0, '88193608291', NULL, '(69) 99279-5960', '1984-11-17', 3, 'idade: 41 anos 
G1 P1
DUM: 16/04
MC: -------

QP: PACIENTE VEM PARA ROTINA GINECOLÓGICA, ALEGA IUE, RESSECAMENTO VAGINAL 
CONDUTA:
ORIENTACOES 
EXAMES LAB
USG DE MAMAS
USG TV
MMG 
SOLICITO

HEMOGRAMA   
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
ESTRADIOL
PROGESTERONA
FSH
LH


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59224734, '433', 'Naiara Barbosa Bitencourt vieira', 2, 0, NULL, NULL, '(69) 9971-8239', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59230306, '435', 'Naiara Barbosa Bitencourt vieira', 2, 0, NULL, NULL, '(69) 9971-8239', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58923351, '36', 'Naira Souza Vasconcelos', 2, 0, '05038914284', NULL, NULL, '1986-02-26', 3, 'SECREÇÃO VAGINAL COM PURIDO +- 15 DIAS, NÃO FEZ USO DE MEDICAÇÃO. DESEJA CONTRACEPTIVO INJETAVEL TRIMESTRAL.
 CONDUTA:USGTV, EXAMES LAB, EXPLIQUEI SOBRE OS EFEITOS COLATERAIS DO METODO ESCOLHIDO. PROGRAMAR PREVENTIVO.
RETORNO 05/06/2023 USGTV: UTERO 78,3, PRESENÇA DE LIQUIDO LIVRE EM FUNDO DE SACO DE DOUGLAS, ESPECULAR  COLO CENTRALIZADO,MUCO AMARELADO, PRESENÇA DE ECTOPIA. TV DOR A MOBILIZAÇÃO NO COLO DO UTERO.
CONDUTA:SOLICITO O PREVENTIVO. 
INICIO:CEFTRIAXONA, AZITROMICINA+GYNOFRAN.
20/06/2023
PREVENTIVO:NEGATIVO P/MALIGNIDADE. 
PROC. INFLAMATORIO.
CONDUTA:CEVAGIN.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020344, '193', 'Nana Leandro Cardoso', 2, 2, '05038914284', NULL, NULL, '1986-10-20', 3, 'Aminorreia há 6 meses, exame das mamas, n02, flacidas, sem nodulo, sem retração, expressão mamaria  negativa.
Conduta: exames lab, encaminhamento ao endocrino, usg de mamas, usgtv, aguardando o resultado do preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58995634, '178', 'Natalia Carvalho pedrosa', 2, 0, '05038914284', NULL, NULL, '2004-12-28', 3, 'Q.P: disuria +- 5 dias, porém refere melhora.
conduta: exames lab, usgtv, coleta preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58995695, '183', 'Natalia Costa Melo', 2, 5, '05038914284', NULL, NULL, '1993-08-14', 3, 'Dor em baixo do ventre, parou por conta propria o contracepitivo injetavel +- 7 meses, não deseja engravidar, fazendo o uso de preservatvo.
Exame: diastase de reto abdominal.
Conduta:usg de abdome total,  usg de parede abdominal, ustv, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58995683, '181', 'Natalia Da Silva', 2, 0, NULL, NULL, NULL, NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59015595, '186', 'Natalia Gomes Lourenço Araujo', 2, 0, '05038914284', NULL, NULL, '1996-12-26', 3, 'Pós-parto  normal, +- 6  meses. amamentando, vem para rotina ginecologica, sem queixas, planejamento familiar.
Conduta: nactali, usgtv, exames lab, programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020373, '194', 'Natalia Lima Santos', 2, 2, '05038914284', NULL, NULL, '1987-10-02', 3, 'Paciente apresentando s.v.a, mesmo após a medicação.
Apresenta usgtv 31/10/23
utero 70,8, mioma submucoso 2,3x2,2 cm, od e oe com aspcto micropolicisticos.
Paciente deseja engravidar.
Exames lab 28/10/23
hb 12,4, ht 38,8, leuco 8,400, plq 400,000, col 223, glicose 114, tsh 8,22, vit 22, t6o 58, top 66.
Coonduta: ao endocrino, ao nutricionista, exercico fisico regular, tentar engravidar.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61551857, '869', 'Natália Sarmento Pompeu', 2, 0, NULL, NULL, '(69) 99347-5734', '2026-01-15', 1, 'IDADE: 31  ANOS 
G 0 P0
DUM: 27 /04/2026 ( IRREGULAR)
COMORBIDADES HISTORIA DE SOP /TDH
ALERGIA:  INTOLERANCIA A LACTOSE
SONO: PRESERVADO 
INTESTINO CONSTIPACAO ( SII) - POLIPO - BENIGNO 
EXERCÍCIO FISICO PILATES 2 VEZESA SEMANA 
UPCCU: 2026 ( 20/02/2026) - NEGATIVO PARA NEOPLASIA 

QP: PACIENTE REFERE ALTERAÇÃO EM USG TV 
 AO EXAME
ASSIMETRIA DE PEQUENOS LABIO , SENDO O MAIOR LADO ESQUERDO COM PREGA ACESSSORIA MAIS EVIDENTE QUE O DIREITO 
PRESENCA DE HIPERCROMIA DE REGIAO INTIMA 

AOS EXAMES LAB E DE IMAGEM  
USG TV 29/04/2026 - DENTRO DA NORMALIDADES
20/02: VIT D 28,7 / VIT B 12 415 / VIT C 2,6

CONDUTA: 
ORIENTACOES 
NIFOPLASTIA 7700,00
CLAREAMONETI 400, 00 LASER E PEELINGA CADA
-----------------------
08/03
paciente retorna

para avaliação da ninfoplastia

presença de local hiperemiado

conduta
metronidazol, triplo a, Nebacetin  


 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61204795, '793', 'NATASHA KINSKI PUKOSKI', 2, 0, '01298929202', NULL, '(69) 99296-0027', '1991-10-02', 3, 'IDADE; 34 ANOS 
DUM: 03/02/2026
UPCCU: MARCO DE 2025
MC: NENHUM
G 0 P0
CIRURGIA PREVIA: 19/03/2025 OOFORECTOMIA DIREITO POR CISTO OVARIANO - ANATOMOPATOLOGICO NEGATIVO PARA NEOPLASIA  ( SIC) 

CONDUTA: 
ORIENTACOES
USG TV
EXAMES LAB 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58995672, '180', 'Nathalia Beatriz Da Silva Schaefer', 2, 0, '05038914284', NULL, NULL, '2001-08-02', 3, 'exames:
mamas n2, com nodulo, descarga papilar negativa, nodulo em mama direita 01 h, 11h, 09, mama esquerda.
conduta usg de mamas, exames lab.
Retorno: usg de mamas: bi-rads 3, nodulo 22x14, 19x10, 8x5
exames lab: 08/10/22 normal
conduta: orientação.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58995685, '182', 'Nathalia Chagas De Souza', 2, 1, '05038914284', NULL, NULL, '2001-09-16', 3, 'Q.P: caroço na mama direita esquerda, iniciou +- 5 dias, refere febre, nega saida de secreção, alega amamentação, mamas assimetricas, mama direita bem maior que a esquerda, presença de nodulo  em mama direita as 9 horas.
Conduta: usg de mamas.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59392771, '466', 'Nathalia Da Silva Barbosa', 2, 0, NULL, NULL, '(97) 98123-1473', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58938335, '90', 'Nathalia martins dos santos', 2, 0, NULL, NULL, '(97) 8127-0100', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62242208, '1007', 'Nathalia Rocha dos Reis', 2, 0, '07329361100', NULL, '(69) 99392-5000', '2005-04-16', 1, 'Paciente: Nathalia Rocha dos Reis
 Vai Realizar Uma Consulta: Mês do Outubro Rosa Quer realizar uma cirurgia da Ninfoplastia mais o Laser Intimo ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60844785, '716', 'Natyelli Emily Ohara Lima', 2, 0, '85192678234', NULL, '(69) 9263-7296', '1997-09-18', 1, 'IDADE: 28 ANOS 
DUM: 13/12/2025
MC: PRESERVATIVO
G0 P0
UPCCU: + 1 ANO
COMORBIDADES: SOP, ALERGIA TOPICA 
MEDICACAO: NEGA
ALERGIA NEGA 

QP: PACIENTE REFERE VAGINOSE E CANDIDIASE RECORRENTIE, 
ALEGA ULTIMO EPSODIO ESSE MES ONDE  FEZ USO FREQUENTE DE FLUCONAZOL, CLOTRIMAZOL, 
26/11 FEZ USO DE METRONIDAZOL 400 MG 8/8 H POR 7 DIAS, CLOTRIMAZOL CREME VAGINAL POR 12 DIAS, DOIS DIAS DEPOIS MENSTRUACAO DESCEU, E AGORA APRESENTA NOVO EPSODIO APOS TERMINO IMEDIATO DA MENSTRUACAO  

COLO CENTRALIZADO, PUNTIFORME, PRESENCA DE SECRECACAO AMARELADA, COM ODOR, PRESENCA DE GRUMOS EM PAREDE 
CONDUTA: ORIENTACOES, EXAMES LAB
GYNOTRAN, SECNIDAZOL, FLUCONAZOL 

PACIENTE RETORNAR
RESULTADO DE EXAMES LAB VIT D E B12 BAIXAS
PREVENTIVO; NEG PARA NEOPLASIA 

CONDUTA: 
VIT D E B12 IM 460, 00
SOLICITO USG TV E EXAME DE VIT D E B12
RETORNO EM FEVEREIRO DE 2026
CASO APRESENTE EPSODIOS DE CANDIDIASE ANTES DE FEVEREIRO CONVERSO SOBRE POSSIBILIDADE DE INICIAR TRATAMENTO COM IMUNOMODULADOR

05/01/2026

PACIENTE REFERE PRURIDO, ODOR, SECRECAO HÁ MAIS OU MENOS 3 DIAS, FEZ USO DE FLUCONAZOL ( ONTEM) 
AO EXAME:
COLO CENTRALIZADO COM PRESENCA DE GRANDE QUANTIDADE DE SECRECAO AMARELADA GRUMOSAO COM ODOR EM CANAL E PAREDE VAGINAL

CONDUTA: 
ORIENTACOES 
GINOBIOTTA POR 3 MESES 
ERICIN AT POR 10 DIAS ( ENTREGO 2 CXS DE AMOSTRA)
ZELIZ 150 MG TERCA, REPETIR COM 7 DIAS 
INICIO IMUNOMODULADOR 
--------------------------------
07/04/2026
paciente assintomática 
usg tv 10/03/26: utero avf 78,9, mioma figo 4 1 cm, en 8,1 mm od 13,7 policistico, oe 5,4 

conduta: exercício fisico
realizo 2 dose de vit b 12 
dozemast e alta d 5000 ui  
realizo a 2 dose de vacina candida ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62217484, '1006', 'Neila Mariano Nascimento', 2, 0, '40605825149', 'mariananeila7@agmail.com', '(97) 99179-8373', '1962-08-21', 1, 'Paciente: Neila Marino Nascimento Idade: 64 Anos
G 2, P 2, A 0. - 16/05/1988
UPCCU: 2024
Data: 12/09/2026: Solicito: Citologia oncótica ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62167781, '988', 'Neiva Alves da Guia Calixto', 2, 0, '27508110153', NULL, '(69) 9986-0007', '1961-09-17', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59020237, '192', 'Nelly De Souza Guimarães', 2, 2, '05038914284', NULL, NULL, '1977-09-22', 3, 'Paciente alega secreção de bola na vagina.
Ao exame: retocistocelo grau 2.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928141, '74', 'Nelma Da Costa Silva', 2, 5, '01000382125', NULL, '(69) 9971-7657', '1984-05-07', 3, 'IDADE 40 ANOS
DUM: 27/01/25
MC: PRESERVATIVO 
UPCCU FEVEREIRO DE 2024

QP: PACIENTE REFERE DESCONFORTO EM DOR EM BAIXO VENTRE, DISPAREUNIA NO INTROITO VAGINAL, 
NEGA DISURIA

CONDUTA: ORIENTACOES, 
EXAMES LAB
USG TV 
PREVENTIVO 



07/08/2025
Mamografia do dia 15/07/2025 Bi rads 1 
preventivo do dia 14/04/2025 negativo para neoplasia
USG TV 16/04/25: NORMAL, UTERO 50,5 /OD 6,2 / OE3 
EXAMES LAB 22/07/2025 
GLICOSE 106 E VIT D 27,8, DE MAIS NORMAL 

CONDUTA: ALTA D 50 000UI 
RETORNO COM 3 MESES

---------------------------------

11/08/2026
vem para coleta de preventivo
apresenta exames 
Exames laboratoriais no dia 6/05/2026 ácido úrico 4,1 glicose 105 triglicerídeos 149 ureia 15 creatinina 0.7 colesterol 183 ldh 104, hdl 48 sódio 137 potássio 4 hemoglobina glicada 5,6 t gelo 26 tgp 16 ácido fólico inferior a 20 vitamina B12 517 tsh 1,122t 4 livre 1,22 Vitamina D 25,6 hemoglobina 15 hemato 37 leu com 7110 plaqueta 363000
 		
conduta: 
oerientacoes 
coletado preventivo convencional 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59015804, '189', 'Nicole Araujo De Melo', 2, 0, '06591783202', NULL, '(69) 99393-8723', '2003-04-14', 3, 'idade: 21 anos
DUM: 20/01/25
MC: -----
PARCEIRA 
UPCCU: 2024
QP: PACIENTE REFRE QUE HÁ MAIS OU MENOS 60 DIAS APRESENTOU SECRECAO VAGINAL AMRELADA, COM GRUMO, SEM PRURIDO, PORÉM ASSINTOMÁTICA NO MOMENTO DA CONSULTA 
ALEGA QUE FAZ USO DE BRINQUEDOS EROTICO, E APOS O USO APRESENTOU DOR EM BAIXO VENTRE

CONDUTA: EXAMES LAB, USG TV, COLETAR PREVENTIVO NA PROXIMA CONSULTA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62103724, '976', 'Nicole Isabela de Souza Cabral', 2, 1, '01634217225', 'nycole.bella@hotmail.com', '(69) 99360-5832', '1999-02-22', 1, 'Paciente apenas quer realizar um exame de Rotina Colposcópia.
Filha da Roseli

2020 preventivo -  NIC I FEZ USO DE ALBOCRESIL, APOS TODOS OS PREVENTIVO NORMAL, 2025 LESAO DE ALTO GRAU 

RESULTADO DE TESTE RAPIDO HPV DE ALTO RISCO 16 E 18 
COLOPSOCOPIA 03/09/2025
PRESENTIVO 03/09/2025: LESAO INTRA EPITELIAL DE BAIXO GRAU 

LAUDO DE COLPOSCOPIA

Paciente: Nicole Isabela de Souza Cabral
Data: 02/09/2026
Aparelho: Colposcopia Medpej com Sistema de Vídeo
Indicação: PCCU 03/09/2025: lesão intra- epitelial de baixo grau 


Vulvoscopia
Vulva revestida por pele apropriada para a idade.
Ausência de pelos (depilação sic)
Ausência de anormalidade à vulvoscopia simples com uso de ácido acético a 5%

Vaginoscopia
Sem alteração em parede vaginal e fundo de saco ao uso de ácido acético 5% e solução de schiller.

Cervicoscopia
Colo uterino de forma cilíndrica, centralizado. Orifício externo puntiforme. Junção escamo-colunar visível, coincidente com orifício externo. Presença de secreção esbranquiçada com grumos em parede.


Aspecto das Lesões
Epitélio acetobranco tênue em 360º próximo ao orifício cervical externo, área extensa iodo positivo ao lugol.

Conclusão:
Achados colposcópio anormais menores (grau I)

   
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60764112, '708', 'Nicole Kauane Vicente da Silva', 2, 0, NULL, NULL, '(45) 9108-2745', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58995654, '179', 'Nicoly Maia Lima', 2, 0, '05038914284', NULL, NULL, '2023-01-03', 3, 'Secreção vaginal esbranquiçada, com purido.
Ao exame: presença de lesões  estrofulos difusa em pernas hiperemia entre as coxas, secreção esbranquiçada.
Conduta: loratidina, flucunazol, trok.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62125910, '983', 'NIRCELE CRISTIANA RODRIGUES DOS SANTOS', 2, 0, '64410153234', NULL, '(69) 99214-5694', '1979-06-25', 3, 'ANAMNESE GINECOLÓGICA
Paciente: Feminina
Idade: 47 anos
História ginecológica e obstétrica
DUM: 2025
Menarca: 10 anos
Gestações: 2
Partos: 2 cesáreas
Abortos: 0
Cirurgias prévias: 2 cesarianas
Último exame preventivo (Papanicolau): 21/07/2025: negativo para neoplasia 
Última mamografia: 2025
Atividade física: não realiza

Antecedentes pessoais
Comorbidade: Hipertensão arterial crônica.
Alergias: nega alergias conhecidas.

Queixa principal (QP)
Paciente comparece para consulta de rotina ginecológica, queixando-se de presença de nódulo na região íntima, associado a prurido na região vulvar, principalmente em região externa.

Exame físico
Peso: 125 kg
PA: 140 × 80 mmHg

Exame ginecológico/especular
Presença de foliculite em grande lábio direito.
Presença de cisto sebáceo em grande lábio esquerdo, próximo ao períneo.
especular: colo anterior: presença de secreção acinzentada, bolhosa
Exames complementares

Ultrassonografia das mamas – 15/06/2026
BI-RADS: 1.

Ultrassonografia pélvica transvaginal – 15/06/2026
Útero com volume aproximado de 160 cm³.
Endométrio: 3,8 mm.
Ovário direito: não caracterizado.
Ovário esquerdo: volume aproximado de 7 cm³.

Ultrassonografia de abdome total – 24/08/2026
Colelitíase.
Esteatose hepática grau II.

Impressão clínica
Paciente de 47 anos, hipertensa, em consulta ginecológica de rotina, apresentando lesões vulvares compatíveis com foliculite  e cisto sebáceo em grande lábio direito, associado a prurido vulvar externo.
Apresenta ainda, em exame de imagem, útero aumentado de volume, e ultrassonografia abdominal evidenciando colelitíase e esteatose hepática grau II.

Conduta: 
conforme avaliação clínica, orientar cuidados locais 
 tratamento das lesões vulvares- trok
aguardo resultado de exames
-----------------------------------09/09/2026
### EVOLUÇÃO MÉDICA

**Paciente:** Miceli Cristiane Rodrigues dos Santos
**Data dos exames:** 01/09/2026

**Motivo da consulta:**
Paciente retorna para avaliação dos exames laboratoriais previamente solicitados.

### EXAMES LABORATORIAIS

**Hemograma:**

* Hemoglobina: 13,8 g/dL
* Hematócrito: 41,4%
* Leucócitos: 5.600/mm³
* Plaquetas: 244.000/mm³

**Metabolismo glicídico:**

* Glicemia de jejum: 105 mg/dL

**Perfil lipídico:**

* Colesterol total: 206 mg/dL
* HDL-c: 54 mg/dL
* LDL-c: 119 mg/dL
* Triglicerídeos: 163 mg/dL

**Função renal e metabolismo:**

* Ácido úrico: 6,46 mg/dL
* Creatinina: 0,73 mg/dL
* Ureia: 32,3 mg/dL
* Ferro sérico: 102,3 µg/dL

**Função hepática:**

* TGP (ALT): 47,4 U/L
* TGO (AST): 37,1 U/L

**Função tireoidiana:**

* T4 livre: 0,96 ng/dL
* TSH: 2,96 mUI/L

**Exame de urina:**

* Leucócitos: traços
* Piócitos: 10
* Hemácias: 7
* Bactérias: raras

**Exame parasitológico de fezes:**

* Presença de *Entamoeba histolytica*, conforme laudo informado.

### IMPRESSÃO CLÍNICA

1. Glicemia de jejum discretamente elevada, necessitando correlação com **hemoglobina glicada (HbA1c)** para avaliação do metabolismo glicídico.
2. Dislipidemia leve, com elevação de colesterol total e triglicerídeos.
3. TGP discretamente elevada, necessitando correlação clínica e avaliação de outras possíveis causas de elevação de transaminases.
4. Função renal preservada pelos valores de creatinina e ureia apresentados.
5. Função tireoidiana sem alterações significativas nos parâmetros apresentados.
6. Exame de urina com leucocitúria/piúria e hematúria microscópica, com bactérias raras — correlacionar com sintomas urinários e considerar urocultura se clinicamente indicada.
7. Exame parasitológico de fezes com relato de *Entamoeba histolytica* — confirmar o diagnóstico conforme método utilizado e correlacionar com quadro clínico antes de definir tratamento.

### CONDUTA

* Orientadas medidas de estilo de vida, com atenção à alimentação, redução de açúcares simples e gorduras saturadas e manutenção/introdução de atividade física regular.
* Considerar solicitação de **HbA1c** para melhor avaliação glicêmica.
* Considerar repetição de perfil lipídico e transaminases conforme avaliação clínica.
* Avaliar presença de sintomas urinários; se presentes ou havendo indicação clínica, solicitar **urocultura com antibiograma**.
* Avaliar o resultado do exame parasitológico de fezes e, se necessário, confirmar *E. histolytica* antes de instituir tratamento específico.
* Manter acompanhamento clínico e ginecológico periódico.
SOLCITO REPETIR EXAMES DE FEZES PARA CONFIRMAR DIAGONOSTICO DE E. histolytica


NOME:  NIRCELE CRISTIANA RODRIGUES DOS SANTOS












SOLICITO



EPF: Exame parasitológico de fezes:

Confirmar diagnóstico de E. histolytica

RETORNO PARA MOSTAR EPF
RETORNO COM 3 MESES PARA AVALIAR COLESTEROL, GLICEMIA E LIPIDOGRAMA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59117492, '348', 'Nircele Cristiane Rodrigues dos Santos', 2, 0, NULL, NULL, '(69) 9214-5694', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62125903, '982', 'NIRCELE CRISTINA RODRIGUES DOS SANTOS', 2, 0, '64410153234', NULL, '(69) 99214-5694', '1979-06-25', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58995622, '177', 'Nircella Cristiane Rodrigues Dos Santos', 2, 1, '05038914284', NULL, NULL, '1979-06-25', 3, 'rotina ginecologica, sem queixa no momento da consulta.
Ao exame: especular colo centralizado, presença de secreção bolhosa em fundo de saco de douglas.
conduta:cevagin, exames lab, usgtv, coletado preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61973532, '967', 'Nirma Loras Salvartierra', 2, 3, '19204175249', NULL, '(69) 99209-9533', '1953-02-05', 1, 'Paciente Nirma era Paciente da Dra. Caroline e a Paciente tem Diabetes e faz o controle e os cuidados.
Não Utiliza Monjaro.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59320680, '445', 'Nislene Molina', 2, 0, '05038914284', NULL, '(97) 8113-4001', '1999-11-19', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61339244, '812', 'Niuara Aguiar pereira', 2, 2, '89040880204', NULL, '(69) 9253-5406', '1987-08-21', 1, 'NOVA MAMORE
IDADE: 38 ANOS 
G 2 P1C A1
MC: ----
UPCCU: 25/02/26: NEG PARA NEOPLASIA , CANDIDA ( FEZ USO DE ITRACONAZOL E CREME VAGINAL DOSE UNICA COM MELHORA PARCIAL) 


QP: PACIENTE RETIROU DIU DE COBRE ESTAVA MAU POSICIONADO, NO MOMENTO SEM METODO CONTRACEPTIVO 
PACIENTE REFERE CANDIDIASE DE REPETICAO 
ALEGA USO REFERE DE MONJARO 
REFERE DISPAREUNIA , NEGA DISMENORREIA, REFERE FLUXO MENSTRUAL POUCO, DURACAO 3 DAIS 
RNM 17/01/2026- PEQUENO CISTO SEM SINAIS DE COMPLEXIDADE NO OE, POSSIVEL DE NATUREZA FUNCIONAL , HIDROSSALPINGE Á ESQUERDA NAO REALIZOU TRATAMENTO 
ESPESSAMENTO DOS LIGAMENTOS =UTEROSSACRO INESPECIFICO, POREM PODENDO ESTAR RELACIONADO A ENDOMETRIOSE 
BRIDAS PELVICAS

MMG 16/01/26: BI RADS 2 

Exames laboratoriais do dia 31/03/2026 hemoglobina 12,7 hematócrito 35,4 leu com 7960 plaqueta 300000 coagulograma normal hemoglobina glicada 5,2% glicose 86 ferritina 65 beta h CG negativo t 4 livre 1,10 tsh 1,81 b 12 532

COLO CENTRALIZADO, PUNTIFORME, PRESENCA DE GRUMOS EM PAREDE SECRECAO TIPO BORRA DE CAFE
TV: DOR A MOBILIACAO DO COLO PRINCIPALMENTE A ESQUERDA

CONDUTA:
CEFTRIAXONA
TRIPLOA 
GYNOTRAN 
1 dose vacina 
indico laser intimo ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58908582, '7', 'Noéli Cristina Gouveia Lopes', 2, 2, '01586496212', NULL, '(69) 99984-1005', '1993-08-20', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61509791, '859', 'NOELI ROSLAINE MARQUES DA SILVA', 2, 0, '90620504099', NULL, '(92) 8639-3775', '2000-12-15', 1, 'PACIENTE SORTEIO HUMAITA 
IDADE 66 ANOS 
G6 P6 A 0
DUM: 53 ANOS 
CIRURGIAS: 
COMORBIDADES: NEGA 
QP: PACIENTE REFERE DIFICULDADE DE SEGURAR MUITO TEMPO A URINA ( DOR), NEGA IUE 
AO EXAME
; DISCRETA CISTOCELE 

CONDUTA: ORIENTACOES ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59395921, '468', 'Nubia Rêgo de Araújo', 2, 2, '05304611292', NULL, '(97) 8407-4005', '2001-10-28', 1, 'NUBIA REGO DE ARAUJO
IDADE 23 ANOS  
G: 0 P:0 A:0 
DUM: 13/04/2025
UPCCU: DEZEMBRO DE 2024 AGUARDANDO O RESULTADO
MC: ?

Q.P: PACIENTE REFERE SECREÇÃO VAGINAL, PURIGINOSA COM ODOR APÓS A MENSTRUAÇÃO, APRESENTA EXAMES.
CONDUTA: LAROTADINA, SECNIDAZOL, GYNOTRAN 2 CX, ITRACONAZOL.
PROGRAMAR VACINA DA CANDIDA 4 DOSES+ FOTOBIOMODULAÇÃO+ PREVENTIVO.
SOLICITO: HC, VIT D , VIT B12, SUBTRAX.
EXAMES LAB: HEMOGLOBIGLICADA.

22/05/2025
RETORNO
PACIENTE REFERE MELHORA DO QUADRO, AINDA NAO INICIOU O USO DO GYNOTRAN 

CONDUTA: 
ORIENTACOES, ENVIO PEDIDO DE EXAMES LAB 
HEMOGRAMA                                                                             
HEMOGLOBINAGLICADA
VITAMINA C
VITAMINA D3
VITAMINA B12
PROGRAMAR VACINA E BIOMODULACAO PARA REALIZAR EM HUMAITA 



VACINA 480
B12 280
VIT D 240
VIT C BRINDE 

1000 A VISTA
CREDITO 1200 3X
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58929124, '83', 'Ocielne Carvalho De Souza', 2, 5, '05038914284', NULL, NULL, '1985-03-07', 3, 'Rotina: secreção esbranquiçada,
soliciti: exames lab, preventivo, crevegin.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59190722, '417', 'Ocilene Carvalho De Souza', 2, 0, '91641675268', NULL, '(66) 98117-8352', '1985-03-17', 3, 'DUM: 26/03/25
MC: LT
UPCCU: + 2 anos 
Paciente refere secreção vaginal com odor, próximo a menstruação e relação sexual 

conduta: solicito exames Lab e programar coleta de preventivo 

---------------- // ---------------
exames lab 05/11/2025 colesterol 232/ beta hcg / ser / tsh 2,13  / t4 L 1,19 / progesterona 0,36 / vit d 23,90 / ts o rh negativo / eas nao infeccioso 
conduta: dieta alimentar 
vitamina d 
------------ // -----------------', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59564608, '515', 'Odila Sousa Da Conceição', 2, 2, '51433745291', NULL, '(69) 99366-6443', '1954-01-26', 1, 'IDADE 71 ANOS
G9 P8N 1 C 
LT
DM / HAC

QP: PACIENTE REFERE PRESENÇA DE LESOES PUSTULOSAS EM REGIAO DE AXILAR, PRURIGINOSO, FEZ USO DE CETOBETA COM MELHORA PARCIAL, ALEGA QUE O QUADRO INICIO H;A MAIS OU MENOS 60 DIAS, APOS INTERNACAO HOSPITALAR DO ESPOSO 
CONDUTA: 
ORIENTACOES
SOLICITO EXAMES LAB
USO DE PROTEX SABONETE LIQUIDO
CEFALEXINA POR 7 DIAS
NEOMICINA E BACITRACINA TOPICA 


EXAMES DE SANGUE 306,85 A VISTA', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60599883, '678', 'Ohana Mariae Da Costa Batista', 2, 0, '01884183263', NULL, '(97) 8404-9842', '1997-07-13', 1, 'ORÇAMENTO MÉDICO GINECOLÓGICO

Paciente: Ohana Mariae Da Costa Batista
Procedimentos: Labioplastia 

Prezada Ohana Mariae,
Após avaliação ginecológica e considerando suas queixas e expectativas estéticas e funcionais, foi indicada a realização dos procedimentos de labioplastia.
A labioplastia tem como objetivo a harmonização dos pequenos lábios vaginais, reduzindo o excesso de tecido que pode causar desconforto, irritação, dificuldade durante atividades físicas, dor nas relações sexuais ou insatisfação estética.
Esses procedimentos, quando realizado, proporciona melhoria na  estética, conforto íntimo, aumento da autoestima e bem-estar funcional da paciente.
Valores dos procedimentos:
•	Labioplastia: R$ 9.650,00

Total: R$ 9.150,00 à vista

Ou: R$ 9.650,00 parcelado em até 6 vezes


 




Observações:
•	Os valores incluem honorários médicos, custos relacionados ao procedimento e 2 sessões de laser para recuperação de pós-operatório (imediato e dia anterior ao procedimento) 
•	O orçamento é válido por 30 dias.
•	A data da cirurgia será agendada após confirmação do pagamento ou do início do parcelamento.

Atenciosamente,

Dra. Christiane Calixto 
CRM-3316 
Ginecologia e Cirurgia Íntima

 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58976510, '132', 'Otavia Da Chagas', 2, 2, '05038914284', NULL, NULL, '1955-11-20', 3, 'Q.P: paciente com queixa de trauma em pé direito hoje, porém alega que a perna direita esta hiperremiada, com edema e dor +- 3 dias.
Conduta:cefalexiana, rifocina, caso não haja melhora em 48 horas, encaminhar para upa.
exames lab, usgtv, mamasm usg de abdomem total, densiometria ossea.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59668030, '532', 'Pamela Aline De Olivera Lima', 2, 2, '02998045260', NULL, '(69) 99920-9788', '1997-05-07', 3, 'IDADE 28 ANOS 
DUM: 16/06
MC: VASECTOMIA
G2 P2
UPCCU: 2024

QP: PACIENTE REFERE CANDIDIASE RECORRENTE,  NO MOMENTO REFERE QUE QUANDO TEM RELACAO SEXUAL APRESENTA SECRECAO ESVERDEADA, DESCONFORTO, COM ODOR 
CONDUTA: SECNIDAZOL, GYNOTRAN 2 CAIXAS , FLUCONAZOL 1, 48, 7 E 14 DIAS
solicito exames, uso tv, programar preventivo

01/07/2025
PACIENTE VEM PARA COLETA DE PREVENTIVO
COLO CENTRALIZADDO, PRESENCA DE MODERADA QUANTIDADDE DE SECRECAO AMRELADA, FLUIDA, BOLHOSA, 
AUNSECIA DE DOR A MOBILOZACAO DO COLO DE UTERO 
CONDUTA;''SECNIDAZOL E GYNOTRAN 
COLETADO PREVENTIVO


18/08/2025

PACIENTE REFERE QIE NAO FEZ USO DE SECNIDAZOL E NO ULTIMO OVUKLO A MENSTRUACAO DESCEU ,MATEM SECRECAO ESBRANQUICADA
04/07PREVENTIVO: Negativo para lesão intra-epitelial e malignidade
EXAMES LAB VITAMINA D 20,9, VITAMINA B 12: 485, SNR, APRESENTA ANEMIA 
USG TV 07/07: EXAMES NORMAL 

CONDUTA: 
SECNIDAZOL 2 COMPRIMIDO DOSE UNICA
TERACIN AT 
REPOSICAO DE VITAMINA D E B12  460,00 PIX OU 510, NO CREDITO

20/08/2025
PACIENTE VEM NA CLINICA E REALIZA A REPOSIÇÃO DE VITAMINA D E B12 COM A DONA NEIVA

30/01/2027
UPCCU: 04/07/2025 NEG PARA NEOPLASIA E CANDIDA E VAGINOSE 
PACIENTE REFERE SECCRECAO ESBRANQUICADA COM PRURIDO E OSDOR APOS COITO 

SOLICITO EXAMES LAB 

NOME Pamela Aline De Olivera Lima



USO ORAL


1.	Secnidazol 1 g  ______________________________________04 comprimidos 
Tomar 02 comprimido via oral dose única para o casal.

2.	Ginobiotta _____________________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses.
3.	Zelix 150 mg _________________________________02 comprimidos 
      Tomar 01 comprimido hoje e repetir com 7 dias 


USO VAGINAL 

1.	Gynotran  _____________________________ 1 caixa
Aplicar 01 óvulo via vaginal, por 7 dias.
RETORNAR COM RESULTADO DE EXMAES LAB 

-------- /// ------
paciente vem alega que nao fez uso das medicacaoes prescrita
exames man b do dia 05/03 apresentando anemia 

conduta: noripurum
mantenho medicações anteriores 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58962604, '115', 'Pâmela Rodrigues De Olivera', 2, 2, '05038914284', NULL, NULL, '1995-07-12', 3, 'Parto cesárea( há  2 meses) + L.T em uso de noretisterona (por 3 dias), alega hemorragia pós- parto, em uso de dexfer e multivitaminico.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58961312, '113', 'Patricia Barros De Lima', 2, 2, '05038914284', NULL, NULL, '1986-02-08', 3, 'Q.P: dor pelvica, nega secreção vaginal, alega odor, preseça de nodulo +- 2 cm em mandibula.
Conduta: exames lab, usgtv, usg de mandibula, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58961340, '114', 'Patricia Gomes De Sousa', 2, 1, '05038914284', NULL, NULL, '1992-11-11', 3, 'Nódulo na mama  esquerda, nega algia, observou presença  do nódulo +- 15 dias, nega trauma.
Conduta: preventivo, usg de mamas e axilas, exames lab.
Retorno 26/06/23
usg mamas 12/06/23
nodulo mama esquerda 2,6x1,4 9 horas, 09,x0,5 BI-RADS 3, mama direita BI-RADS 2, exames lab ndn.
Conduta: retornar em nov de 2023 ou antes se intercorrencia, fazer outro exame mensalmen 8 dia após mentruação, repetirusg de mama com 6 meses.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61375901, '827', 'PATRICIA MARIA FERREIRA MAIA', 2, 0, '93901135200', NULL, '(69) 99359-1748', '1982-04-22', 3, 'IDADE: 44 ANOS 
G4 P3C A1
DUM: MARCO DE 2026
COMORBIDADE: OBESIDADE
UPCCU: + 3 ANOS 
UMMG - NUNCA REALIZOU 

PACIENTE REFERE PERDA DE LIQUIDO, IRREGULARIDADE MENSTRUAL
CONDUTA:
ESTUDO URODINAMICO 
USG DE MAMAS
USG TRANSVAGINAL 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59155085, '390', 'Patricia Marques Dos Santos', 2, 1, '00726287237', NULL, '(69) 99246-5298', '1992-01-09', 3, 'G1 P1 C ( 8 ANOS)
LT
DUM: FEV DE 2024 IRREGULAR
PACIENTE REFERE DOR EM BAIXO VENTRE, ALEGA DISPAREUNIA, NEGA SECRECAO VAGINAL
ALEGA QQUE REALIZAOU PREVENTIVO ONTEM 

CONDUTA: AGUARDO PREVENTIVO, SOLICITO USG TV 
PESCREVO TRIPO A , USG ABDOME TOTAL, EXAMES LAB 

Ferro 4 aplicações no valor de 180,00 reais cada
Vitamina B12 4 aplicações 280,00 reais cada ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58962641, '116', 'Patricia Miranda Da Silva', 2, 2, '05038914284', NULL, NULL, '1984-04-11', 3, 'Fluxo menstrual intenso (hemorragia sicfor 2 meses), em uso de ciclo 21 desde jun, porém alega  spot.
Paciente em bom estado geral, hipocorada 2+14.
Conduta: sulfato ferroso 2x ao dia, usgtv, usg mamas, coletado preventivo colo centralizado sangrante, exames lab, transmim.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58963252, '118', 'Patrícia Oliveira de Holanda Rocha', 2, 0, '02498584790', NULL, '(69) 8403-2291', '1975-07-20', 1, 'IDADE: 49 ANOS
ADVOGADA 
PLANO DE SAUDE - UNIMED  
DUM: OUTUBRO 2024
MC: VASECTOMIZADO
G5P2 A3
UPCCU: NOVEMBRO DE 2024
UMMG - DEZEMBRO DE 2024
DENSITOMETRIA OSSEA NOVEMBRO DE 2024 

MEDICACAO EM USO - HIDROXICLOROQUINA, MINOXIDIL, SUPLEMENTOS PARA O MELASMA, COGMAX, BUPI ( ANSIEDADE), 
CIRURGIA, TIREDECTOMIA, PROTESE MAMARIA, ABDOMINO PLASTIA, HEMORRODECTOMIA, BARIATRICA 2020 - DR TIAGO PATA 
ADENOMIOSE, CLIMATERIO 
INTOLERANTE A LACTOSE - GAZES COM DOR 
CANCER DE TIREOIDE AOS 29 ANOS 188 MG DE PURAN - DR LUANA BRAGA ENDOCRINO 
ALOPESIA FIBROSANTE 
ANSIOSA - 
MELASMA - DRA MILENA BRASILEIRO 

PACIENTE REFERE QUE APÓS EMAGRECIMENTO APRESENTOU FLACIDEZ NA REGIAO INTIMA,
PACIENTE REFERE RESISTENCIA A TRH - DEVIDO A CANCER DE TIREOIDE 
MMG 22/11/24: BI RADS 2 

ao exame
assimetria do labio esquerdo e capuz de clitoris 

conduta: ninfoplastia e capuz clitoriano 6800,00
laser 1800,00 cada sessão , deve fazer 3 sessão 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59230329, '436', 'Patrícia Paula Lopes Salkys', 2, 0, '45732353291', NULL, '(69) 9369-2233', '1975-05-11', 1, 'IDADE 49 ANOS 
DUM: 12/04/2025
G 5 P 1C  A4 ( 1 ECTOPICA)
MC: PRESERVATIVO 

QP: PACIENTE REFERE INCONTINENCIA URINÁRIA AOS PEQUENOS  ESFORÇO (TOSSE), O QUADRO INICIOU A MAIS OU MENOS 6 MESES, ALEGA FLACIDEZ VAGINAL, LIBIDO BAIXA
MAIS OU MENOS 8 MESES, NAO CHEGA NO ORGASMO 
QLAIRA, ALEGA QUE DIMINUI O FLUXO MENSTRUAL 
ALEGA QUE REALIZOU REPOSICAO DE VITAMINA B 12 E VITAMINA D 
NAO APRESENTOU EXAMES LAB 
UPCCU: REALIZOU EM FEVEREIRO, NAO APRESENTOU RESULTADO 
AO EXAME:
DIFICUL INTRODUCAO DE ESPECULO, NECESSARIO ANESTESICO TOPICO EM SPRAY 
INICIO COM 360 E AUMENTO PONTENCIA NA SEGUNDA PASSAGEM, 90 COM POTENCIA BASICA
BELAMY E FLUCONAZOL DOSE UNICA 
INICIO COM 360 (15)  E AUMENTO PONTENCIA 20 NA SEGUNDA PASSAGEM, 90 COM POTENCIA BASICA
ANTROFI / FLUCONAZOL DOSE UNICA 
BELAMY EM CASA 


08/09/2025
PACIENTE REFERE QUE NO MOMENTO AINDA ESTA TENDO PERDA DE URINA ( ESCALA INICIO A SESSAO 8/ 
NA 2 º DE LASER NA ESCALA DE O A 10 DE MELHORA FICOU 9, PORÉM DEPOIS DE 1 MES MAIS OU MENOS A PACIENTE FAZ XIXI E APOS MICCA SENTE SAIDA DE URINA 
NA 3º SESSAO AUMENTO A POTENCIA 
INICIO COM ANESTESICO 
CONDUTA: ORIENTACOES, PERDA DE PESO E FLUCONAZOL, PROVAVELMENTE OUTRA SESSAO CASO PERMANENCIA DE PERDA DE URINA BELAMY 



 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61516409, '861', 'PAULA AZZI MELO', 2, 0, NULL, NULL, '(69) 8118-3157', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59529708, '507', 'Paula Guilhermina Soliz Vitorino', 2, 1, '01469145200', NULL, '(69) 9380-6585', '1994-06-16', 1, 'IDADE: 31 ANOS
G 2 PCN
LT (60 DIAS)
BARIATRICA - 60 DIAS - TIAGO PATA 
DUM: IRREGULAR 15/05/25
UPCCU: +5 ANOS 
COMORBIDADES: NEGA 
PACIENTE REFERE QUE O CICLO SEMPRE FOI IRREGULAR, FLUXO AUMENTADO COM NECESSIDADE DE ABSORVENTE NOTURNO, DURANTE O PRE OPERATORIO PARA BARIATRICA OBSERVOU ALGUMAS ALTERACOES HORMONAIS, ALEGA SECRECAO AMERELADA COM DISCRETO ODOR, ALEF=GA IUE, REFERE FROUXIDAO DO CANCAL VAGINAL. ALEGA ALGIA AO SENTAR LOCALIZADA NA PARTE ANAL 
AO EXAME: MAMAS: PRESENCA DE PROTESE MAMARIA BILATERAL, AUSENCIA DE NODULO, EXPRESSAO MAMARIA NEGATIVA, OCO AXILAR LIVRE( EXTRACAO DE MAMA SUPRA NUMERICA) 
COLO "colo em morango" (cervix rubra punctata), PRESENCA DE SECRECAO AMARELADA E BOLHOSA
CONDUTA; USG TRANSVAGINAL COM PREPARDO INTESTINAL, secnidazol, triplo A, gynotran, exames lab 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58961200, '111', 'Paula José Lima', 2, 1, '05038914284', NULL, NULL, '1979-09-23', 3, 'Q.P: paciente refere dispareunia, nega secreção vaginal, nega nodulo em mama, nega disuria.
Conduta: acompanhamento da diabetes, exames lab, usgtv, mmg, planejamento familiar, preventivo.
15/08/24
id:44 anos
dum:julho 2024
m.c:camisinha
upccu: 2023 não apresentou.
Q.P: sangramento uterino anormal, sinussorragia.
usgtv:19/03/2024
utéro:102,13, mioma subseroso e intramural 1,7x1,8, end 8mm, od 3,0, oe12,4 (corpo lutéo).
Conduta:  videocolposco.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60635430, '695', 'PAULA MELO', 2, 0, NULL, NULL, NULL, NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58961165, '110', 'Paula Rodrigues Venâncio', 2, 5, '05038914284', NULL, NULL, '1989-12-07', 3, 'Dor em baixo do ventre + 1 ano, nega  constipação.
Conduta: exames lab, usg com preparo intestinal, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58962681, '117', 'Pauliana De Souza', 2, 2, '95450114249', NULL, '(69) 99307-5915', '1984-05-30', 3, 'Laqueadura tubariana.

Q.P: paciente refere fadiga, atraso menstrual há 2 meses, fogacho, irritabilidade.
Conduta: exames lab, usgtv.

Retorno 28/01/24
usgtv 18/05/24 normal
epf 16/07/24 negativo
preventivo 18/05/24 neg para neoplasia
glicemia 25/10/24 124,40

26/01/25 hb:10,06/ht:32,5/leuco 6,500/plq:284,00

Paciente refere p.o 3 meses de perineoplastia, alega dum 01/01/2025 até 10/01/25 e dia 15/01/25  está menstruada até o momento, muito fluxo, fazendo uso de ibuprofeno 600mg e ac  tramenico 250mg,
Conduta:sulfato Ferroso, transamin, retorno com exames hormonais.

------------ /// ------------ /// -------
RETORNO 

EXAMES LAB 
VIT D 18,6, VIT B 12 127, GLICOSE 145, HB 10, 90, HT 32, LEUCO 7420, PLQ 346.00
 USG TV UTERO 149M CISTO OVARIANO DIREITO 43, 7 

CONDUTA: REPETIR USG TV COM 6 MESES, SULFATO FERROSO, VIT B12 E VIT D 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61095947, '775', 'Pauline Priscila Barroso Lobato', 2, 0, '87182971291', NULL, '(97) 8122-3055', '1987-06-05', 1, 'retorno on line
prescrevo noripurum 5 ampolas
vitamina b 12 im 2 ampolas 1 a cada mes
vit d 01 ampola 
retorno com 2 meses para avalaicao da reposição de vitaminas ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61739839, '904', 'Poliana Carvalho Da Silva', 2, 0, '03822742295', NULL, '(69) 99350-2431', '2002-03-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58922091, '33', 'Poliana landvoigt machado', 2, 2, '00443168288', NULL, '(69) 9365-0061', '1992-09-18', 1, 'CONSULTA ON LINE 
32 anos
DN: 18/09/92
DUM: JAN/ 2025
MC: PRESERVATIVO
UPPCU: NUNCA REALIZOU
SEXARCA 19 ANOS 
MENARCA 11 ANOS 
FLUXO IRREGULAR 
COMORBIDADES: OBESIDADE, 114 KG 
VACINA INFLUENZA NAO REALIZADA
EXERCICIO FISICO: INICIOU SEMANA PASSADA

PACIENTE COM DOR EM FLANCO ESQUERDO, DISPAREUNIA DEPENDEDO DA POSICAO, ALEGA DISURIA, SENSACAO DA BEXIGA CHEIA 
----------  //----------
22/02 RETORNO PRESENCIAL
07/02UGS  TV. Aspecto ecográfico compatível com:
Ovário direito de volume aumentado.
Imagem nodular endometrial. A principal hipótese é de pólipo.

---------- // ----------
10/03
PREVENTIVO 25/02/25 NEGATIVO PARA CANCER DE COLO DO UTERO 
1º LESSAO DE LASER INTIMO 
CONDUTA: 
ORIENTACOES, BELAMY, FUNTYL, LOCAO CALMANTE E SABONETE LIQUIDO 150 ML  ( PAGAMENTO PIX)

DESEJA LASER SABADO FINAL DA TARDE OU DOMINGO 

-------------------------------- /// -------------------------
CONSULTA ON LINE 
32 anos
DN: 18/09/92
DUM: JAN/ 2025
MC: PRESERVATIVO
UPPCU: NUNCA REALIZOU
SEXARCA 19 ANOS 
MENARCA 11 ANOS 
FLUXO IRREGULAR 
COMORBIDADES: OBESIDADE, 114 KG 
VACINA INFLUENZA NAO REALIZADA
EXERCICIO FISICO: INICIOU SEMANA PASSADA

PACIENTE COM DOR EM FLANCO ESQUERDO, DISPAREUNIA DEPENDEDO DA POSICAO, ALEGA DISURIA, SENSACAO DA BEXIGA CHEIA 
----------  //----------
22/02 RETORNO PRESENCIAL
07/02UGS  TV. Aspecto ecográfico compatível com:
Ovário direito de volume aumentado.
Imagem nodular endometrial. A principal hipótese é de pólipo.

---------- // ----------
10/03
PREVENTIVO 25/02/25 NEGATIVO PARA CANCER DE COLO DO UTERO 
1º LESSAO DE LASER INTIMO 
CONDUTA: 
ORIENTACOES, BELAMY, FUNTYL, LOCAO CALMANTE E SABONETE LIQUIDO 150 ML  ( PAGAMENTO PIX)

DESEJA LASER SABADO FINAL DA TARDE OU DOMINGO 

------------------------------ // --------------------
12/04
PACIENTE REFERE QUE QUANDO TOSSE AINDA PERDE URINA, ACOMPANHANTE ESPOSO ALEGA QUE PERCEBEU QUE O CANAL VAGINAL FICOU MAIS APERTADO
INSULINA 38,8
LIPIDOGRAMA 193
COLESTEROL 120
HOMOCISTEINA 10,9
TESTOTERONA 14,19

INDICO FUNCIONAL 5 VEZES NA SEMANA, MANIPULADO PARA LIBIDO, 
SESSAO DO FRAXX 
HIDRATACAO INTIMA 

REALIZA 1º SESAO DE FRAXX, REALIZO PEELING, INDICO CLAREADOR, REALIZO REPOSICAO DE VITAMINA 

-----------------------------  // ------------------------------
10/05/2025

32 ANOS 
PREVENTIVO 25/02/25 NEGATIVO PARA CANCER DE COLO DO UTERO 
UGS  TV 07/02:  Aspecto ecográfico compatível com: Ovário direito de volume aumentado. Imagem nodular endometrial. A principal hipótese é de pólipo.

PACIENTE ACOMPANHADA DO ESPOSO, REFERE MELHORA DA DISPAREUNIA E 80% DA MELHORA DA IUE, 
EM USO DO CLAREADOR DIARIO - REFRE MELHORA DA HIPERCROMIA 
2 º SESSAO DO FRAXX

AO EXAME: 
OBSERVO MELHORA DA HIPERCROMIA DAS MANCHAS NA VIRILHA, INTERGLUTEO E GRANDES LABIOS
COLO ANTERIOR, PUNTIFORME, NÃO VISUALIZO PÓLIPO,  PRESENÇA DE DISCRETA SECREÇÃO COM GRUMOS 

POS FRAXX, OBSERVO MELHORA SIGNIFICANTE DE FLACIDEZ DE PAREDE VAGINAL ESQUERDA  ( ESPOSO VISUALIZA E  ACOMPANHA EVOLUCAO DA MELHORA DA FLACIDEZ)
REALIZO FOTOBIOMODULACAO 
ANTROFI
CONDUTA: 
2º SESSAO DE FRAXX, ANTROFI, FOTOBIOMODULACAO - 5 DISPARO, 
PRESCREVO TRIAZOL, BELAMY
ATESTADO PARA ESPOSO DE 1 DIA 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58961277, '112', 'Poliane Olivera Feitosa', 2, 2, '05038914284', NULL, NULL, '1987-02-28', 3, 'Q.P: usgtv 05/08/22, utéro 154,5 cm, preseça de diu normoposicionado.
Paciente refere dor em baixo do ventre, aalega secreção amarelada com odor, algia mamaria cielica.
Conduta: secnidazol, gynotran. ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61188329, '784', 'Poliani Maria de lima', 2, 0, '75963027268', NULL, '(69) 9292-1259', '1984-09-13', 1, 'idade: 41 anos 
DUM: 01/03/26
IMPLANON - INSERCAO - 10/10/23
UPCCU: 2024: NEG PARA NEOPLASIA 
HISTORICO DE CALTERIZACAO DE COLO DE UTERO COM 18 ANOS 
G1 P1C

QP: PACIENTE REFERE DIMINUICAO DA LIBIDO, NEGA DISMENORREIA, REFERE DISPAREUNIA DE ENTRADA E DURANTE O ATO, ESPORADICAMENTE, PACIENTE MENSTRUADA NO MOMENTO DA CONSULTA 

USG TV 09/10: UTERO 59,1 END 0,38, OD 8,88 OE 3,67
CONDUTA: 
ORIENTACOES
REPOSICAO DE VIT D E B12
SOLICITO EXAMES LAB
EXAMINAR NO RETORNO - TV SE DIP ( DEVIDO DOR PELVICA NO ATO SEXUAL), COLETAR PREVENTIVO COMO VIDEO,  FAZER USG TV E USG DE MAMAS 
ORIENTO LASER INTIMO 

--------------
13/04/26
PACIENTE REFERE QUE NO MOMENTO ESTA MENSTRUADA 
VEM PARA MOSTRAR RESULTADO DE EXAMES LAB 
NA PROXIMA VINDA A PVH FARA PREVENTIVO, USG TV 

AO USG DE MAMAS 
CISTO EM MAMA DIREITA AS 12 HORAS 0,3 X ,029X 0X11 PROXIMO AO MAMAILO 1,8 CM 
CISTO EM MAMA ESQUERDA AS 16 HORAS 1,04 X 0,56 X 1,01 
IMPRESSO FOTO 
AGUARDO MAMOGRAFIA 
REALIZADO PROTOCOLO DE RESISTENCIA AO EXERCICO E MELHORA DA IMUNIDADE 

NOME: Poliani Maria de Lima
DATA: 13/04/2026


ULTRASSONOGRAFIA MAMÁRIA

TÉCNICA:
Realizado estudo ecográfico das mamas com transdutor setorial multifrequencial (5,0 a 10,0 Mhz).
 
INDICAÇÃO: 
Rastreio.
Assintomática.

DESCRIÇÃO DO EXAME:
Pele e tecido adiposo subcutâneo com espessura e ecogenicidade normais.
Fáscia e planos musculares retromamários anatômicos.
Ductos lactíferos retroareolares de trajeto e calibre normais.
Parênquima mamário com ecotextura fibroglandular usual e adequada lipossubstituição.
Prolongamentos axilares anatômicos.
Cisto de paredes finas e conteúdo anecoide, localizado às 16 horas da mama esquerda, medindo 1,04 x 0,56 cm e cisto de paredes finas e conteúdo anecoide, localizado às 12 horas da mama direita, medindo 0,3 x 0,11 cm, distando 1,8 cm do mamilo.

 
AVALIAÇÃO:
Achados benignos.
BI-RADS® US 2.
NOME: Poliani Maria de lima




USO ORAL


1.	SIMETICONA GEL 125 MG  ______________________________01CAIXA 

TOMAR 01 COMPRIMIDO VIA ORAL DE 8/8 HORAS.


2.	Etinilestradiol 30mcg + levonorgestrel 150 mcg ____01 cx
Tomar 01 comprimido via oral, no mesmo horário, durante 4 semanas, iniciar no primeiro dia do ciclo.

REALIZO USG TV
LASER INTIMO 
 
 
RECOMENDAÇÃO:
Manter seguimento conforme indicação clínica.


Laudo padronizado conforme o método BI-RADS® 5ª edição do American College of Radiology (ACR) para imagem da mama.

OBSERVAÇÕES:
1. A ultrassonografia como método isolado não é indicada para rastreamento de neoplasia mamária. É necessária correlação com mamografia atual.
2. Através de normativa do Colégio Brasileiro de Radiologia, a ultrassonografia axilar não engloba avaliação mamária, sendo necessário seu pedido, para sua devida avaliação.
  



________________________________________
DRA CHRISTIANE ALVES CALIXTO CRM 3316-RO

--------------- // ----------------------------------
19/05/2026

omg 30/04/2026: bi rads 1 

-------------------------------


NOME: Poliani Maria de lima




USO ORAL


1.	SIMETICONA GEL 125 MG  ______________________________01CAIXA 

TOMAR 01 COMPRIMIDO VIA ORAL DE 8/8 HORAS.


2.	Etinilestradiol 30mcg + levonorgestrel 150 mcg ____01 cx
Tomar 01 comprimido via oral, no mesmo horário, durante 4 semanas, iniciar no primeiro dia do ciclo.

NOME: POLIANI MARIA DE LIMA 
DATA: 19/05/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 8,82 x  3,60x  2,16 cm (volume: 68 cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.
. 
Endométrio: centrado, ecogênico e com espessura de 2 mm de basal a basal.

Ovário direito: tópico, volume de 2,47cm³, de forma habitual, contorno preservado e textura normal.

Ovário esquerdo tópico: não visualizado

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Identifica-se cisto de Naboth no colo uterino, achado de aspecto benigno. Ovário esquerdo não caracterizado no presente exame em decorrência de interposição gasosa intestinal, limitando sua avaliação.”

OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.





', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61386442, '832', 'PRISCILA ALVES DA SILVA', 2, 0, '03385457270', NULL, '(69) 99242-1189', '1994-01-04', 3, 'DUM: 23/03/26
G3 P3 A0
MC: DIU DE COBRE - 2023
UPCCU; JAN DE 2025 

PACIENTE REFERE QUEDA CAPILAR

CONDUTA: 
ORIENTCAOES
USG TV 120,00 A VISTA
COLETA DE PREVENTIVO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60575113, '665', 'Priscila Zacheu Martins Moreira', 2, 0, NULL, NULL, '(69) 8495-1616', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59176511, '415', 'Queila Carvalho de Oliveira', 2, 0, '81170670210', NULL, '(69) 9217-7365', '1982-02-18', 1, 'IDADE: 43 ANOS
DN: 18/02/1982
DUM: 17/04/25
G 6 P5 (4N E 1C) A1
MC: PRESERVATIVO

PACIENTE REFERE CEFALEIA E REALIZOU ACOMPANHAMENTO COM NEURO, ONDE FOI SUSPENSO ACO DEVIDO ENXAQUECA, 
FLUXO MESNTRUAL DE 4 A 5 DIAS DE DURACAO, IRRITABILIDADE, INSONIA, FOCHAGO
DISMENORREIA 

CONDUTA: ORIENTACOES, USG TV, USG DE MAMAS, MMG, EXAMES LAB, PROGRAMAR PREVENTIVO 

MARQUEI O RETORNO DA PACIENTE PARA O DIA 02/05/2025 E NÃO CONFIRMOU A PRESENÇA E NÃO DEU UMA JUSTIFICATIVA', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928759, '80', 'Queite Cristina Lavareda', 2, 0, '86412345272', NULL, '(69) 98843-9680', '1984-07-29', 3, 'Q.P: paciente deseja engravidar, porem alega ansiedade e desconforto por conta do quadro clinico ocorrido em 2022.
No momento assitomatoica, nega dispareuina,
Conduta:usgtv, exames lab.

RETORNO PARA MOSTRAR RESULTADO DE EXAME


PREVENTIVO DO DIA 27/01/25 NEGATIVO PARA NEOPLASIA 
EXAMES LAB 28/01:
GLICOSE 89
COLESTEROL 161, TRIG 102, EAS NORMAL, HB 12,3, HT 36,6, LEUCOCITOS 5500, PLQ 312.000, TSH 1,84 
, T4 LIVRE 1 , VITAMINA B 12 264, VITAMINA D 13,6
USG TV 31/01/25: UTERO 64, ENDOMETRIO 7,3MM, OD 10, OE 6,5 , EXAMES NORMAL 

CONDUTA: ORIENTACOES, 
REPOSICAO DE VITAMINA D E B12 ( FARA NA PROXIMA CONSULTA) 
---------------------- /// -----------------------
28/02/25
paciente vem para reposição de vitamina 
prescrevo acido fólico por 3 meses 
retorno em 3 meses ( avaliar se gestação e valores de novel de vitamina - avaliar se necessidade de reposição )
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60543358, '652', 'Quele Oliveira Da Silva', 2, 3, '71551530287', NULL, '(69) 99211-7681', '1981-05-05', 3, '44 ANOS 
DUM: 01/10/25
G 4 P 1C A3
MC: SEM ATIVIDADE SEXUAL
Q.P: PACIENTE VEM PARA MOSTRAR RESULTADO DE EXAME.
USGTV 11/03/24 UTERO 122, END 6,4MM, OD 24MM, ENDOMMETRIOMA 
USGTV 12/05/25 UTERO 83, END 8MM, OD IMAGEM CISTCA ALE
TOMOGRAFIA 22/04/25  IMAGEM SUGESTIVA DE DERMOIDE 

FOI PRESCRITO FEMINIQUE 20, PORÉM A PACIENTE SÓ TOMOU 10 CP.
CONDUTA: SOLICITO USGTV.


UPCCU +3 ANOS', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58929309, '84', 'Quele Olivera Da Silva', 2, 3, '05038914284', NULL, NULL, '1981-05-05', 3, 'Candidiase de repetição  + 4 episodios, somente flucunazol.
Conduta: miconazol 7 dias, flucunazol 4cp, kronel 5 dias.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58933987, '85', 'Quetlen Carina De Sousa Cruz OLivera', 2, 0, '05038914284', NULL, NULL, '2023-05-08', 3, 'Idade 33 anos .
G:3, p2 .
Dum:17/03/24
M.c: vasectomia.
Vpccu:+3 anos.
Q.p:  rotina ginecologica, alega dor em baixo do ventre, nega secreção vaginal refere a dispareunia em algumas posições. 
Conduta: exames lab, usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59037958, '244', 'quezia Lima Maciel', 2, 2, '05038914284', NULL, NULL, '1992-05-01', 3, 'paciente refere  diminuição do fluxo menstrual, alega uso de ciclo 21+- 6 anos, nega algia mamaria.
conduta: usgtv, exames lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60562457, '657', 'Quezia Vitoria Silva Telles', 2, 0, '13327565490', NULL, '(69) 98118-8955', '2008-12-13', 3, 'DUM: 09/10/25 
PACIENTE REFERE DOR EM BAIXO VENTRE TIPO COLICA, QUE NOS ULTIMOS TEMPO VEM PERCISTINDO DURANTE TODO O CICLO QUE É DE 5 DIAS, FLUXO LEVE A MODERADO, MELHORA PARCIAL QUANDO FAZ USO DE BUSCOPAN 
CONDUTA: SOLICITO EXAMES LAB E RNM DA PELVE - PESQUISA DE ENDOMETRIOSE 

05/01/2026
17 ANOS 
DUM: 04/01/2025 - DISMENORREIA - 5 A 7 DIAS - FLUXO INTENSO 
SEXARCA 16 ANOS 
MC: PRESERVATIVO
EXAMES LAB 26/11/2025: HB 12,9/ HT 38,6/ LEUCO 8040/PLQ 327 MIL/GLICOSE 73 / TRIG 65/ COLESTEROL 125/ VIT B 12 767/ TSH 6,42 / T4 1,23 / VIT D 18,10 
RNM 24/11/25: ADENOMIOSE PROFUNDA, ENDOMETRIOSE EM COMPARTIMENTO POSTERIOR 

REPETIR COM 3 MESES tsh e t 4 livre
nextela por 3 meses sem pausa
voric
caso mantenha dor retornar com 1 mês e associar limiar 

04/03/2026

PACIENTE REFERE QUE PAROU O USO DE NEXTELA DEVIDO A ESCAPE, 
APRESENTA EXAMES LAB 20/02 NDN, EXCETO VIT D 28,2

CONDUTA: 
ORIENTACOES
PIETRA ED SEM PAUSA 
ALTA D 50 OOO UI 




NOME: Quezia Vitoria Silva Telles



Uso oral

1.	PIETRA ED ____________________01 CAIXA 
Tomar 01 comprimido via oral, uma vez ao dia, sem pausa 

2.	Alta d 50000 ui __________________________01 caixa
Tomar 01 comprimido via oral 1 vez por semana 



04/03/26

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60289706, '619', 'Rafaela De Sousa Lima', 2, 2, '06551444202', NULL, '(69) 99341-4887', '2003-05-16', 3, 'IDADE: 22 NOA 
DUM: JULHO DE 2025
UPCCU: NUNCA REALIZOU

QP: PACIENTE REFERE FALHA NA MENSTRUACAO DOR EM BAIXO VENTRE, DISPAREUNIA, VEM TAMBEM PARA PLANEJAMENTO FAMILIAR

CONDUTA: VIDEO COLPOSCOPIO, EXAMES LAB, USG TV  
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61960552, '964', 'Rafaela Schazmann', 2, 0, '73184292215', 'Rafaela.Schazmann@gmail.com', '(69) 99944-6533', '1982-08-14', 1, 'Laser Intimo 
ADM
IDADE: 44 ANOS 
G0 P0
DUM: 09/09/2026
ACO MICROVILAR
UPCCU: 1 ANO E MEIO 
COMORBIDADE: HIPERTIREOIDISMO
MEDICACAO TAPAZOL , QUETIAPINA ( INSONIA)
SONO: INSONIA
INTESTINO REGULAR:
EXERCICIO FISICO: NAO REALIZA

QP: PACIENTE REFERE IUE 

AO EXAME: COLO CENTRALIZADO, PUNTIFORME, SECRECAO EM GRUMOS COM ODOR

CONDUTA: ORIENTACOES 
COLETADO PREVENTIVO EM MEIO LIQUIDO 
OME: Rafaela Schazmann

Uso oral

1.	Secnidazol 1 g______________________04 comprimidos 
Tomar 02 comprimidos via oral dose única para o casal.

2.	Fluconazol 150 mg _________________06 comprimidos 
Tomar 01 comprimido via oral hoje, repetir com 3 dias, após 7 dias.


Uso vaginal

1.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58988747, '155', 'Rafaela Viana De Olivera', 2, 1, '05038914284', NULL, NULL, '1993-11-03', 3, 'Queixa principal paciente refere sangramento uterino anormal.
Conduta: usgtv, exames labb, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989250, '160', 'Raiane Rodrigues Campos', 2, 1, '05038914284', NULL, NULL, '1991-07-26', 3, 'Q.P: paciente refere dor em baixo do ventre +- 3 anos, nega secreção vaginal.
apresenta usgtv 19/07/23 
utero 71,75, end 5mm, od 26,23,oe 19,88, ovarios micropolicisticos bilateral.
hemograma 05/07/23, hb 13,97, ht 43,1, leuc 7,900, plq 260,000.
conduta:ibuprofeno, programar preventivo, elaini ciclo.

31/10/23
preventivo 21/09/23 negativo para neoplasia, alega cefaleia apos o uso de elaine ciclo.
conduta:selene.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61479514, '849', 'RAILANE ROCHA GUAREGIA', 2, 0, '05245895269', NULL, NULL, '2001-11-29', 3, 'IDADE: 24 ANOS 
PACIENTE  PROCEDENTE DA INGLATERRA 
G 0 P0
DUM: 15/04/2026
UPCCU: + 2 ANOS 
MC: DIU DE COBRE - MARCO DE 2024 
QP: PACIENTE VEM PARA CONSULTA GINECOLOGICA 
CONDUTA: 
ORIENTACOES
USG TV, DE MAMAS, PREVENTIVO E EXAMES LAB 
44 7763 768025 contato inglaterra, ultrassom mama e usgtv pagas debito no dia 04/05/2026
---------
13/05
USG 
PACIENTE REALIZOU A RETIRADA DO DIU 
-------------------------------------------
01/06/2026
retorno com exames 12/05
EAS NAO INFECCIOSO 
HB12,3
HT38
LEOCO 10.010
PLQ 337000
FERRITINA 30
COL 116GLICOSE 79 TRIG 43/ VIT B12 712/ TSH 1,59/ T4 L 4,54/ VIT D 15 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60040522, '576', 'Raimunda Antônia Cardoso Viana', 2, 4, '69658862268', NULL, '(69) 9322-8476', '1979-07-01', 1, 'IDADE: 46 ANOS
DUM: 30/06
MC:  -----
G4P4A0
UPCCU: 6 MESES
COMORBIDADE:/ ALERGIA/ MEDICACAO: NEGA 

PACIENTE REFERE IRREGULARIDADE MENSTRUAL, NAUSEAS, 
ALEGA MMG: 15/01/2025

CONDUTA: 
APRESENTAR MMMG E PREVENTIVO NO RETORNO, SOLICITAR EXAEMS E USG TV 
EXAMES DE SANGUE 
1367,19 A VISTA E 1409,15 CREDITO





10/09/2025 
USG TV 16/08: UTERO 149, PRESENCA DE MIOMAS INTRAMURAL ( 3 ) 2 POTERIORES  16 E 10 MM E 1 MIOMA INTRAMURAL ANTERIOR, ENDOMETRIO 11 MM, OD 4,4 OE 22, 5 A CUSTA DE CISTO FUNCIONAL 
PREVENTIVO 01/09: NEG PARA NEOPLASIA E GARDNERELLA 
EXAMES LAB 01/07: VITAMINA C , COLESTEROL 212, TRIGLICERIDEO 160 

CONDUTA: REPOSICAO DE VITAMINA C , DIETA ALIMENTAR, GYNOTRAN , SECNIDAZOL, NEXTELA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60047426, '580', 'Raimunda Genice Silva de Araújo', 2, 0, '02523555204', NULL, '(88) 9400-1763', '1997-04-18', 1, '
 92 9272-8559 NUMERO NOVO PARA CONTATO
IDADE: 28 ANOS 
G 1 P0 A1
DUM: 26 DE JULHO DE 2025 
MC: PRESERVATIVO
UPCCU: + 2 ANOS 

QP: PACIENTE REFERE DISMENORREIA INCAPACITANTE, APOS SE ALIMETAR COM ALGUNS ALIMENTOS PIORA AS DORES E APRESENTA GAZES, 
APRESENTA USG TV 25/11/2024: FOCO DE ENDOMETRIOSE 
FREQUENCIA DE RELQACAO SEXUAL 2 VEZES AO DIA, DEVIDO DISPAREUNIA E SINUSSORRAGIA, 
ALEGA TAMBEM CANDIDIASE DE REPETICAO 

CONDUTA: DIETA ALIMENTAR, ANALGESIA E PIETRA ED,  
CONVERSO SOBRE A POSSIBILIDADE DE DIU DE MIRENA 
PACIENTE DE CANUTAMA E VEM PARA RETORNO PRESENCIAL , FARA VIDEO COLPOSCOPIO, EXAMES LAB  E SOLICITAR RNM PELVICA 
AVALIAR CANDIDIASE 


__________________
09/09paciente refere melhora da dor, porem alega náusea, cefaleia, tontura, dor nas articulações, edema 
informo que o Limiar 150mg 30 Cápsulas pode causar efeitos colaterais. Os mais comuns incluem tontura, sonolência e dor de cabeça.
Paciente refere que no momento deseja manter o tratamento com  Pietra ED
ao exame: 
colo anterior, puntiforma, secrecao amarelada, bolhosa, sangraste a coleta do preventivo 
tv: dor a mobilização do colo do utero 
hipertrofia de labio

conduta: ceftriaxona, azitromicina, metronidazol ginotran

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62217023, '1005', 'Raimunda Rêgo do valles', 2, 0, '85898457291', 'regoraimunda606@gmail.com', '(97) 98408-1121', '1974-07-18', 1, 'Paciente: Raimunda Rêgo do valles   Idade: 52 Anos
Dum: Maio 2026
UPCCU: Há + ou - 5 Anos
G 9, P 9, A 0
DN Último parto 12/08/2005 ; 21 anos
Data: 12/09/2026 Solicito: Citologia Oncótica em Meio Líquido.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58982534, '144', 'Raniely Araujo De OLivera', 2, 2, '02270342283', NULL, '(69) 99294-0563', '1993-10-13', 3, 'idade 31 anos 
G 3 P3 A0 
DUM: 12/2024
MC AI TIMESTRAL ( INICIOU 19/12/24)
UPCCU: JANEIRO 2024

PACIENTE REFERE QUE APOS USO DA ACI TRIMESTRAL APRESENTOU SANGRAMENTO UTERINO ANORMAL 
CONDUTA: SOLICITO USG TV E EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59581644, '522', 'Raphaela Guerra de Lima', 2, 0, NULL, NULL, '(69) 9994-6726', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60562590, '658', 'Raquel Alves Mereles', 2, 1, '95161007249', NULL, '(69) 99308-2636', '1981-03-26', 3, 'IDADE: 44 ANOS 
DUM: 08/10/2025
G 4 P2 A2
MC: PREVERVATIVO E COITO INTERROMPIDO 
UPCCU: 07/05/2025

QP: PACIENTE REFERE IRREGULARIDADE MENSTRUAL, CEFELIA FREQUENTE, ALGIA NAS PERNAS, LOMBALGIA, ALEGA ALGIA MAMÁRIA CICLICA Á DIREITA, ALEGA DISURIA 

USG TV. 05/01/24 UTERO 117 COM PRESENCA DE ADENOMIOSE OD No visualizado, oe 1,8
USG TV 20/03/25 UTERO 45 CM, ENDOMETRIO 8MM, OD 2,9 OE 3,1 EXAME NORMAL 
usg de mamas 12/05/23  bi rads 1 

exames lab 17/10/2025: ureia 25/creat0,64 / tsh 2,30/t4 l 1,14/ hbgliacada 5,8/ hb 12,6, ht 38,leuco 7900,plq 341000, colesterol 204, trg 139, tgo 19/ tgp 27 


conduta: solicito exames lab, eas usg tv, use de mamas e mamografia  preventivo,

30/10/2025

Uso oral

1.	Transamim 500mg  ______________________01 caixa
Tomar 02 comprimidos, via oral 8/8 horas, até parar o sangramento.

2.	Piroxican 20 mg ______________________01 caixa 
Tomar 1 comprimido, via oral 12/12h, por 3 dias.

3.	Primolut Nor ________________________01 caixa 
Tomar 03 comprimidos ao dia via oral, até parar o sangramento, depois 02 comprimidos ao dia 5 dias, depois 1 comprimido via oral 1 vez ao dia.

07/11/2025
DUM: 24/10/2025

PACIENTE VEM PARA COLETA DE PREVENTIVO, PACOIENTE UTILIZOU MEDICACAO QUANDO PAROU O SANGRAMENTO ELA PAROU A MEDICACAO POR CONTA PROPRIA 
APRESENTA; 
USG DE MAMAS : BI RADS 1 
USG TV : UTERO 89,2, ENDOMETRIO 8,8 / OD 1,2 OE 8,2 EXAME NORMAL

AO EXAME: COLO CENTRALIZADO, EM FENDA, PRESENCA DE SECRECAO ESBRANQUICADA COM GRUMOS EM FUNDO DE SACO E ADERIDO AO COLO SECRECAO AMARELADA
TV: DOR A MOBILIZACAO DO COLO 

CONDUTA: ORIENTAOES GERAIS, ORIENTO A PACIENTE QUANTO A NECESSIDADE DE FAZER O USO DA MEDICACAO CORRETA 
Uso Injetável
1.	Ceftriaxona 500 mg_______________________01 ampola
Aplicar meia ampola IM em região glútea.
 
Uso oral

1.	Secnidazol 1 g ______________________02 comprimidos
Tomar 02 comprimidos VO dose única.
2.	Azitromicina 500 mg _________________02 comprimidos
Tomar 02 comprimidos VO dose única.
3.	Pantoprazol 40 mg ___________________01 caixa
Tomar 01 comprimido VO pela manhã
4.	Triplo A ___________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas por 3 dias.

Uso vaginal

1.	Gynotran  _____________________________01caixa 
Aplicar 01 óvulo VV, á noite, durante 7 dias.


---------------   /// ------------------------
paciente refere sonolência, cefaleia, fraqueza nos braços 
preventivo 17/11/2025: negativo para lesão intra-epitelai e malignidade
exames lab 05/11 : Estradiol 18,7 fsh LH 0.7 progesterona 0, 25 vitamina D 30,6 exame de urina não infeccioso Vitamina B12 416
Mamografia do dia 7 do 11 2025 mama direita BIRADS 0 mama esquerda BIRADS 2 
USG DE MAMAS 05/11/2025: BI- RADS 1 

conduta: CECI, REPOSICAO DE VIT B E D  VIA ORAL


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58981746, '142', 'Raquel França De Souza', 2, 5, '05038914284', NULL, NULL, '1985-06-01', 3, 'Q.P: dor pelvica ha 6 meses.+ amenorreia.
Solicito: exames lab, preventivo, usg programar.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58976855, '135', 'Raquel Olivera Gil', 2, 1, '05038914284', NULL, NULL, '2004-12-05', 3, 'Q.P: paciente refere dor em baixo do ventre, disuria há mais ou menos 4 dias.
Conduta: preventivo, usgtv, atestado 1 dia.

Rotina ginecologica.
Conduta: exames lab, metodos contraceptivos escolhido foi o diu, encaminhamento simi.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59349962, '456', 'RAYLANE SOBRINHO PEREIRA', 2, 0, '05237412270', NULL, '(97) 8450-2494', '2000-07-29', 1, '28/05/2025
paciente vem devido a alteração de preventivo 
20/12/23: LIBG / LSIL 
11/12/2024: ASC - US 
paciente posição ginecologica, 
assepsia
teste de schiler positivo 
area acetobranca em labio anterior 
anestesia
realizo car em labio anterior
encaminho a peca para anatomopatológico 

conduta: orientações, nao realizar relacao sexual por 30 dias 
metronidazol, triplo a 
10/06cervicite cronica
realizar preventivo a cada 6 meses ( nov e junho ) ate 2 preventivo negativo para ser realizado anual 
seguir demais orientações ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59252735, '441', 'Rayline Pereira Almada', 2, 2, '70243240236', NULL, '(69) 9254-0338', '1994-01-20', 1, 'DUM: 10/03/2025 
6 SEM E 6 DIAS 
TS???
 
FAZ USO DE OCULOS, QUEIXA- SE DE COLICA, NEGA SANGRAMENTO, NEGA SECREÇÃO VAGINAL.
VACINA INFLUENZA: NÃO
COVID: NÃO

ORIENTAÇÕES: ORIENTAÇÕES DO TRABALHO, PROTETOR SOLAR, MICROONDAS, LIQUIDO, NÃO PODE SEGURAR XIXI, RELAÇÃO SEXUAL. DISCRETA VARIZES.
INCHAÇO NAS PERNAS: DIOSMIN
BACTERIOSCOPIA, EXAMES LAB, USG OBSTETRICA 1 TRIM APÓS 10 DIAS 
DIOSMIN, UMIDITA, DNT SOL.

---------------------------------------------------------------------------------------
USG OBSTETRICA 
DESLOCAMENTO OVULAR
CONDUTA:  USO ORAL
1. UTROGESTAN 200 MG _______________________01 CAIXA
TOMAR 01 COMPRIMIDO VIA ORAL 1 VEZ AO DIA 
 
LAUDO OBSTÉTRICO

27/05/2025 
peso 66.700g
PA:  100 X 70 MMHG
entrega de resultados de exames 
Exames laboratoriais do dia 23/04/2020 glicemia 81 exame de urina não infeccioso hemoglobina 14,3 hematócrito 38,7 leucócito 8280 plaqueta 285000 urocultura não houve crescimento bacteriano sorologias não reagentes tipagem sanguínea ó RH positivo anti h bs reagente Vitamina B12 359 Vitamina D 22,7 Vitamina C 0,67 Vitamina A 0,51 tsh 1,62 t 4 livre 1,28 toxoplasmose imune rubéola susceptível citomegalovírus imune
CONDUTA: SOLICITO USG OBSTETRICA DEVIDO DESCOLAMENTO OVULAR
REPOSICAO DE VITAMINA B E D (ADEK HOJE ) 

23/06/25
PACIENTE REFERE CRISE DE ALERGICAS TOPICA, NAO SABE A CAUSA

CONDUTA: ZINA
VITAMINA B E D 
SOLICITO EXAMES LAB 

05/08/2025
paciente com dor em baixo ventre, apresenta bacterioscopia com gardnerela
exames lab ok, falta hepatite b
usg morf 2 trim, ecocardio, vacina, manter regenseis, metronidazl creme vaginal 

ig 22 sem e 3 dias 
pa 110 x 60nao realizou vacinas ate o momento 
bcc: 153: retorno em setembro
ecocardiograma aguardo


01/12/2025

37 sem e 1 dia 
81400
pa
bcc: 139
solicito usg com Doppler 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928179, '75', 'Rayssa Aryelle Leitão Dos Santos', 2, 2, '00336724233', NULL, '(69) 99240-5853', '1995-04-22', 3, 'IDADE: 29 ANOS
G 2 P1 A1
DUM: 02/02/25
MC: PRESERVATIVO
UPCCU:  JULHO 2024

QP: PACIENTE REFERE QUE MORA NA ZONA RURAL DIVISAO DO ESTADO DA AMAZONAS, ALEGA SECRECAO VAGINAL AMRELADA, COM ODOR, SEM PRURIDO, ACOMPANHADA DE DOR EM BAIXO VENTRE, ALEGA SANGRAMENTO VAGINAL ANORMAL, E DOR PELVICA 

CONDUTA; EXAMES LAB
PREVENTIVO IRA COLETAR NA PROXIMA CONSULTA
USG TV 
CEFTRIAXONA, AZITROMICINA, GYNOTRAN', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60562790, '659', 'Rayssa Neumann Fernandes', 2, 0, '04024138227', NULL, '(69) 99210-6388', '2000-08-29', 3, '25 anos 
DUM: 15/08/2025
8 SEM E 6 DIAS 

GESTANTE AINDA NAO INICIOU PRE NATAL 

CONDUTA: FEMINIS, EXAMES PRE NATAL E MORFOLOGICA 1 TRIM 
PROTETOR  SOLAR COM COR, UMIDITA 

05/01/2026
-------------
31/03/2026
32 SEMNAS
BCF 145
AU 31 CM
AGUARDO EXAMES LAB E IMAGEM 
===========================
13/04
ig 33 sem e 6 dias 

cesárea programada para o dia 15/05/2026 no Samar
pagamento para o dia 08/05/2026

consulta 
dias: 01/ 08/14 - 05 

-----------------------
12/05
cesarea 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58994616, '175', 'Rebeka Mota D P pinheiro', 2, 0, '05038914284', NULL, NULL, '2010-06-10', 3, 'menarca:11 anos
acompanhada da mãe, refere disminorreia.
Conduta: exames lab, usg pelvica.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59529264, '504', 'Regina Célia Reis Da Silva', 2, 2, '02310681318', NULL, '(69) 99399-7085', '1985-07-28', 3, 'idade: 39 ANOS
G 2 P1 C 1N
VASECTOMIA
UPCCU: 2024
COMORBIDADES, FIBROMIAGLIA, DM E HAC 

QP: PACIENTE VEM PARA MOSTRAR RESULTADO DE USG DE MAMAS, PACIENTE REFERE ALGIA MAMARIA CICLO, COM MELHORA APOS USO DE  EMMMA
USG DE MAMAS: 03/07/24: Ultrassonografia the mamas do dia 3/07/2024 mama direita às 2:00 distando 3 cm da papila medindo 2 por 1,2 por 0,6 cm da mama direita quadrante ínfero medial S4 horas medindo 1,3 1,1 0,6 se isso simples na mama direita
nódulo e cisto em mama direita pormenorizado acima
BI RADS 3 

uso de axilares 02/05/25: normal 
usg TV 26/08/24: normal 

conduta: solicito uso de mamas, exames lab, preventivo.


EXAMES DE 301,60, FICOU POR 232,00 A VISTA





------------------------
09/01/2026

DUM: 02/01/2026
MC; VASECTOMIA 
RNM 04/01/2026: MIOMAS INTRAMURAL DE 2 CM, LOCALIZAO EM PAREDE ANTERIOR Á DIREITA, FOCOS DE ADENOMIOSE, PRESENCA DE CISTO DE CORPO LUTEO A ESQUERDA E O COM AASPECTO DE MICROCISTO 
PEQUENA QUANTIDADE DE LIQUIDO LIVRE NA PELVE

PACIENTE NEGA SECRECAO VAGINAL, NEGA DISPAREUNIA, CICLO REGULAR, COM DURACAO DE 3 DIAS, FLUXO LEVE/ MODERADO, ALEGA QUE NO PRIMEIRO DIA DO CICLO APRESENCA DOR QUE IRRADIA PARA REGIAO LOMBAR E MMII, NECESSITA DE TOMAR BUSCOPAN DE 8/8 HORAS, QUE MELHORA, NO SEGUNDO DIA MELHORA A ALGIA, NO TERCEIRO DIA O FLUXO E DISCRETO E TERMINA.

AO EXAME:
PRESENCA DE SCRECAO BOLHOSA, FLUIDA 
TV: DOR A MOILIZACAO DO COLO

CONDUTA: 
ORIENTACES
CEFTRIAXONA
GYNOTRAN
SECNIDAZOL
TRIPLO A 
--------------------
11/05/2026
SECRECAO DISCRETA COM ODOR 
DISCRETA DOR A MOBILIZACAO
HI[PEREMIA NO CANCAL

Logias não reagente DGU 19 hemoglobina 12,9 hematócrito 36,5 leuco 10150 hemoglobina glicada 7.5 PCR 6.2 glicose 82 triglicerídio 257 uréia 18 creatinina 0.7 colesterol total 249 ferritina 81 tgp 36 anti hbs 131 Vitamina B12 433 tem 4 livros de 1,06 tsh 2,37 vitamina D 24,5

CONDUTA: TERICIN AT 
------------------------------------------------

08/09/2026
41 ANOS 

DUM: 26/08/2026
MC; VASECTOMIA 
RNM 04/01/2026: MIOMAS INTRAMURAL DE 2 CM, LOCALIZAO EM PAREDE ANTERIOR Á DIREITA, FOCOS DE ADENOMIOSE, PRESENCA DE CISTO DE CORPO LUTEO A ESQUERDA E O COM AASPECTO DE MICROCISTO 
PEQUENA QUANTIDADE DE LIQUIDO LIVRE NA PELVE
COMORBIDADES, FIBROMIAGLIA, DM E HAC 

QP: paciente vem para rotina ginecológica, alega dismenorreia 

Exames laboratoriais do dia 4/09/2026 glicose 164 vitamina D29 ferritina 170 creatinina 0.7 desde o 33 ure 34 colesterol total 174 tgp 44 triglicerídeos 185 hemoglobina 14,3 hematox 43 Leo 8150 plaquetas 311000

CONDUTA: 
ORIENTACOES 
USG DE MAMAS 
MMG 
PROGRAMAR COLETA DE PREVENTIVO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60562859, '660', 'Regina Virginio Lopes', 2, 0, '45767726272', NULL, '(69) 99277-1542', '1975-08-08', 3, 'IDADE: 50 ANOS 
DUM: 
UPCCU: + 2 ANOS 
PACIENTE REFERE FOGACHO 

CONDUTA: EXAMES LAB, IMAGEM E PREVENTIVO 

30/01/2027
Exames laboratoriais no dia 5/12/2025 tgo 26 tgp 32 t 4 livre 1,05 insulina 9,73 prolactina 5 ponto 76 SHBG 51 tsh um ponto 42 testosterona total 17,6 ácido úrico 4,48 PCR 8 ponto 13 glicose 117 triglicerídeos 119 uréia 23 creatinina 0.7 colesterol 197 cálcio 9.4 magnésio 2 ferritina 58 hemoglobina 6 ponto 18 vitamina B12 597 vitamina D22 hemoglobina 13 hematócrito 37 leuco 7170 e plaqueta 279000 
exame imagens no dia 27/01/2026 ultrassom transvaginal útero ante verso refletido volume 66 endométrio 5,3 mm ovário direito não visualizado ovário esquerdo 4,4 cm presença de nódulo uterino provável mioma em parede corporal posterior medindo 6 centímetros cúbicos

CONDUTA: AGUARDO EXAEMS HORMONAIS 
PROGRAMAR VIDEOCOLPOSCOPIO 
AGUARDO MMG 
USG DE MAMAS 

NOME: Regina Virginio Lopes

USO ORAL


1.	E-MAMA _____________________________O1 CAIXA
Tomar 01 comprimido via oral, 1 vez ao mês, por 3 meses 

2.	Alta d 50. 000 Ui _____________________________01 caixa
Tomar 01 comprimido via oral 1 vez por SEMANA 

VITAMINA D INJETAVEL  240 ,00 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58977347, '138', 'Rejane Maria Alves Da S Sampaio', 2, 2, '05038914284', NULL, NULL, '1983-07-28', 3, 'Paciente  refere irritabilidade.
Solicito exames lab, usgtv, preventivo, mmg, exercico fisico.

23/05/24 dum: 21/05/24
tsh 1,14/ t4 0,82/ tsh 2,7.
preventivo negativo para neoplasia.
hb:11,4/ht 34,1/ leuco4,650/plaque 205000/glico 91.
Eas: urobilinogenio +, proteinuria +, flora aumentada, ureter aorfo+
usgtv 20/04/24, uter 80,9, endometrio 13mm, nodulo o.e aie.
Conduta:repetir usg, repopsição de b12.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61218471, '798', 'Rejane Torres de Araújo Vieira', 2, 2, '90627628249', NULL, '(69) 9935-6363', '1987-06-09', 1, 'conduta:
laser intimo
vacina
SOLICITO
HEMOGRAMA                             
VITAMINA D3
VITAMINA B12
ESTRADIOL
PROGESTERONA
TESTOSTERONA TOTAL E LIVRE 
FSH
LH



Uso oral


1.	Fluconazol 150 mg ___________________06 comprimidos 
Tomar 01 comprimidos via oral, hoje, repetir com 3 dias, após repetir com 7 dias, por 1 mês.

2.	Ginobiotta _________________________ 90 caps
Tomar 01 cap 1 vez ao dia, por 3 meses.


Uso vaginal

1.	TERICIN AT _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.

2.	Gynotran _______________________________01 caixa
Aplicar 01 óvulo via vaginal, 1 vez por semana 

-------------  // ========
13/05/2026

- PACIENTE EM RETORNO ON LINE, ALEGA MELHORA DO  QUADRO CLINICO 
APRESENTA EXAMES DE VITAMINA D E B12 BAIXA
AGENDAR 
LASER, PREVENTIVO E REPOSICAO DE VITAMINAS





', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59926834, '546', 'Renata Carvalho Monteiro', 2, 2, '83494871272', NULL, '(69) 99218-2231', '1986-08-25', 3, 'EXAMES DE SANGUE 
A VISTA  586,45
CREDITO 642,50


--------
anemia
10,5
noripurujm e feminis 





retorno
 29/07
uso obstetrica 23/07/25 gestacao de 8 sem e 4 dias 

deficiencia de vitamina d 
reposição im
regenseis 

12 sem e 2 dias
no uso de regenesis, fez reposição de vitamina d, entregou usg morfológica do 1 trimestre
retorno e orientações 


28/10/2025
morfologica 2 trimestre? 21/10/2025: 21 sem e 3 dias , menino, morfológica normal 
bcc 152 bpm, MF presente, Du ausente 
PA 120 x 70
sem queixas, já realizou vacina DTPa, influenza esta em falta no momento 

conduta: 
orientações
aguardo exames pre nata 
   

18/11/2025
PACIENTE REALIZA PRIMEIRA APLICAÇÃO DE NORIPURUM', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989094, '158', 'Renata Carvalho Moteiro', 2, 0, NULL, NULL, NULL, '2024-03-25', 3, 'Q.P: rotina, alega disuria e dor para defecar.
Conduta: exames lab, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58983590, '151', 'Renata Parente DE Olivera', 2, 2, '01369433220', NULL, '(69) 99358-2739', '1994-05-15', 3, '7 sem 

usg obstetrica de 6 sem e 2 dias, com descolamento ovular 
ultrogestan 200 mg, dyn fol , exames de pre natal
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61557615, '872', 'RENATA PEREIRA DOS SANTOS', 2, 0, NULL, NULL, NULL, NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61466883, '847', 'Renata pereira dos santos', 2, 0, '89253222000', NULL, '(97) 9167-6604', '2000-12-15', 1, 'APUI 
28 anos 
G2 P 2N A 0
MC: --------
UPCCU: OUT 2025
COMORBIRDADE: NEGA 
NEGA ALERGIA 
QP: PACIENTE REFERE POLIURIA 
PACIENTE PRECEISA USAR ROUCUTAN
FAZ FISIOTERAPIA PELVICA
NAO FAZ USO DE MC, ALEGA QUE A MENSTRUACAO FICA AMEACANDO DE DESCER 3 A 4 DIAS ANTES

ao exame
hiperemia em colo uterino 
assimetria de pequenos labio predominante a esquerda 
presença de carunchas hiemais hipertrofias
flacidez em perineo posterior 

coletado preventivo em meio liquido 
laser intimo 
laser clareador 
peeling
15 mil 3 vezes
---------------------------
19/05
NOME: Renata Pereira dos Santos 
DATA: 19/05/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo  4,13x x  9,34cm x 3,49(volume: 70 cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.
. 
Endométrio: centrado, ecogênico e com espessura de 7 mm de basal a basal.

Ovário direito: tópico, volume de 13,88 cm³, de forma habitual, contorno preservado e textura normal, com múltiplos folículos antrais periféricos.

Ovário esquerdo tópico: volume de 6,16cm³, de forma habitual, contorno preservado e textura normal.

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Ovário direito com múltiplos folículos antrais periféricos, podendo corresponder à morfologia ovariana policística, devendo haver correlação clínico-laboratorial.


OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.

conduta: 
coletado exames lab 
realizado usg tv
prescrevo ACI escolhido pela paciente 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60055194, '583', 'Renata Pereira Maciel de Queiroz', 2, 2, '46089586234', NULL, '(69) 9243-7878', '1974-02-05', 1, 'IDADE:  51 ANOS
DUM: 26/05/2025
G 3 P 3 A 0
LT
UPCCU: 
UMMG:
COMORBIDADES/  MEDICACAO: NEGA
ALERGIA: PLASIL 
EXERCÍCIO FISICO: REGULAR
PROFISSAO SERVIDORA PUBLICA ( ESTRESS MENTAL)
TRH: FEZ E PAROU - ESTRADIOL TRANSDERMICA, PROGESTERONA VIA ORAL

QP: PACIENTE REFERE QUE NO MOMENTO CANSACO EXTREMO, 
APRESENTA EXAMES:
- USG ABDOME TOTAL 02/08: NORMAL 
-USG TIREOIDE: 14/07: NORMAL 
-USG TV 14/7: UTERO 64,5 - END 1MM - OD 1,9 / OE 1,2: EXAME NORMAL
MMG 14/07: BI RDS 2 
PREVENTIVO: 30/07/2025: ASCUS 
Exames laboratoriais do dia 08/7
hemoglobina 14 HT41 LEUCO 5780 plaqueta 312000 hemoglobina glicada 4,9 tsh 1,78 t 4 livre  fsh 114 LH 65,9 sbl 133 Vitamina B12 465 Vitamina D 28,3 estradiol 20 prolactina 10,6 progesterona 0,21 insulina 11 cortisol 17,1 testo 16 ácido úrico 3,8 / TGO  112 tgp 37 AMILASE 81 bilirrubina total e fração normal e GLICOSE 85 triglicerídeos 108 colesterol 249 uréia 34 creatinina 0,80 ldh 476 ferritina 51 magnésio 1,9

CONDUTA: 
ORIENTACOES 
COLPOSCOPIA 600,00
DENSITOMETRIA OSSEA
COLONOSCOPIA 
INJETÁVEL 1060,00 
NAO TER RELACAO SEXUAL POR 3 DIAS, NAO USAR CREME VAGINAL, NAO ESTAR MENSTRUADA

07/08
COLO ANTERIOR, PUNTIFORME, SANGRANTE A COLETA, MUCO HIALINO
TESTE DE SCHILER IODO CLARO EM INTROITO DE OC
ONDE REALIZO BIOSPSIA FOTO DE ACIDO ACETICO NO TABLET , SEM FOTO DE IODO 
COLETA DO PREVENTIVO MEIO LIQUIDO  E BIOPSIA ENTREGUE A PACIENTE ( TEM PLANO) 
05/09/2025

APRESENTA
COLONOSCOPIA 30/08: DIVERTICULITE EM SIGMOIDE SEM COMPLICACOES 
DENSITOMETRIA OSSEA: OSTEOPENIA 

Uso transdérmico 

1.	OESTROGEL 0,6 MG/G __________________01 TUBO
Aplicar 01 pump, atrás do joelho ou na parte interna da coxa, após o banho com a pele seca

Uso oral

2.	UTROGESTAN 100MG ____________________01 CAIXA 
Tomar 01 comprimido via oral á noite 

     3.VITERGAN COG  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, durante 30 dias. 

4.	Caldê max __________________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia.
REPOSICAO DE VITAMINAS 480,00 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989157, '159', 'Risoneide Da S Maciel', 2, 2, '72924497272', NULL, NULL, '1979-07-01', 3, 'Paciente refere irregularidade menstrual, odor na secreção vaginal, secura vaginal, fogacho, irritabilidade.
Conduta: exames lab, usgtv e mamas, metronidazol,

07/11/23
em uso de fluoxetina.
preventivo 04/10/23 negativo para neoplasia+ grardnerella.
eas:3-4 piocitos, hb 11, ht 35,4, leuco 8,100, gçicose 93, col 191, trig 108, tsh 1,99, 
conduta:aguardo usgtv e mamas, atntrofi, fluoxetina.

18/08/2025
idade 46 anos
DUM: 15/07
MC: LT

PACIENTE REFERE IRREGULARIDADE MENSTRUAL, ALEGA SECRECAO AMRELADA COM ODOR, REFERE TAMBEM DOR EM BAIXO VENTRE.

CONDUTA: ORIENATCOES, PREVENTIVO, EXAMESZS LAB 

10/09
preventivo 25/09: neg para neoplasia 
usg tv 05/09/25: normal
exames lab 02/09: vit d 23,30 

fluconazol, Tericin AT 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61375031, '823', 'RITA DE KASSIA GOES DE OLIVERIA', 2, 0, '06497384200', NULL, '(69) 69992-5816', '2005-11-12', 3, 'IDADE: 20 ANOS
MENARCA 14 ANOS 
SEXARCA NEGA
DUM: 01/03/2026
MEDICACAO: NEGA

QP: PACIENTE ACAOMPANHADA DA MAE, ALEGA QUE AINDA NAO INIICOU ATIVIDADES SEXUAIS 
REFERE IRREGULARIDADE MENSTRUAL
COM AUSENCIA DE MNSTRUACAO EM ALGUNS MESES 
Ultrassom pélvica do dia 19/09/2025 útero avf volume 29,6 endométrio 2,3 mm ovário direito 3,9 ou vários esquerdo não visualizar ultrassonografia no consultório cisto ovariano esquerdo? Paciente refere secreção vaginal com odor conduta solicita ultrassonografia pélvica metronidazol via oral retorno 
USG PÉLVICA 
Cisto ovariano?



1.	Metronidazol 400 mg _____________________________ 14 comprimidos 
Tomar  comprimidos via oral de 12/12 horas por 7 dias 

2.	Triplo A ______________________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas , por 3 dias 

3.	Secnidazol 1 g ____________________________________02 comprimidos 
Tomar 02 comprimidos via oral dose única 



Porto Velho, 08/04/26
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60595598, '670', 'Rogelita castro da silva', 2, 0, '49940562268', NULL, '(69) 99314-0948', '1974-11-04', 3, 'idade: 50 anos
dum: 22/10/2025
G 1 P
MC: PRESERVATIVO 
UPCCU: FEVEREIRO DE 2024 
USG TV 06/02/2024: UTERO 88,5, MIOMA INTRAMURA, ENDOMETRIO 1 MM, OD 3,6 OE 8,9 
ALEGA HISTORICO DE SUA 
TREINADOR DE BOX E MUSULACAO 

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA 

exames de imagem, preventivo 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61199109, '787', 'RONILDA FERNANDES AMARAL PANTOJA', 2, 2, '68666241268', NULL, '(69) 99232-7800', '1979-09-16', 3, 'idade: 46 anos 
DUM: 20/02
UPCCU: 28/05/25 NEG PARA NEOPLASIA 

QP: PACIENTE REFERE ARDENCIA NO CANAL VAGINAL , FEZ USO DE COLPOTRIN, ALEGA ARDENCIA DURANTE O ATO SEXUAL 
MMG: 03/06/26: BI RADS 2 
USG TV 27/06/25: ADENOMIOSE, ADERENCIA PELVICA, POLIPO ENDOMETRIAL 
USG DE ABDOMINAL TOTAL ESTEATOSE HEPATICA GRAU III

CONDUTA: 
ORIENTACEOS 
EXAMES LAB
USG TV, USG DE MAMAS, USG DE ABDOME TOTAL 
SOLICITO EXAEMS HC, GLICOSE E HB GLICADA DO ESPOSO 
CANDIDIASE OPORTUNISTA POR DM NO PARCEIRO?

----------
08/05 
exames lab  04/05:
zinco 80
cobre 123
herpes imune 
vit c 3,8
bacteriscopia exsudato leucocitário moderado + inflamação 

Exames laboratoriais do dia 11/03/2026 hemoglobina de 12 hematócrito de 34,3 leuco 6590 plaquetas 323 1000 colesterol 171 triglicerideo  de 99,5 ferritina 14 hemoglobina glicada 6.3 tgo 21 tgp 15 gama GT 27 ferro 54 estradiol 188 fsh 3,9 LH 6, dosagem insulina 27,4 progesterona 8,6 tsh 1,28 t 4 livre 1,17 SHBG 61 cortisol 9,7 testosterona total 10,9 anti h bs reagente HBSAG negativo anti HIV negativo anti HCV negativo EAS 10 pIOCITOS por campo hemoglobina positiva urocultura não houve crescimento bacteriano ácido úrico 4,5 PCR positivo glicose 103 como sistema 8,8 por aí 19 creatina 0,8
ultrassonografia de mamas e axilares e que extasia ductal Retro aureolar bilateral bi rads 2 ultrassonografia de abdômen total do dia 19/03/2026 sinais de leve moderada infiltração gordurosa hepática grau bar 2 colecistectomia prévia se isto cotizar o simples no rim direito outra sonografia transvaginal útero volume de 131 cavidade uterina contendo DIU posicionada a 1,9 cm do fundo uterino o vário direito 8,7 ovário esquerdo 4,7 pode-se diagnóstico nódulo uterino sugestivo de mioma de o novo posicionado
1.	Cimicifuga + amora + isoflavona ________________60 cápsulas 
Tomar 01 comprimido via oral 12/12 horas, após 1 ao dia 

2.	Pasalix PI 1000_________________________________01 caixa
Tomar 01 comprimido as 20 horas 

3.	Vitergan cog ____________________________01 caixa
Tomar 2 comprimido via oral, 1 vez ao dia 
CIPROFLOXACINA E PIRIDIUM ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61016494, '743', 'Ronilda Magalhaes Araujo', 2, 0, '74107828204', NULL, '(92) 9373-2671', '1978-05-20', 1, '47 anos 
Paciente indicada pela Marinete Amorim
47 anos data da última menstruação dezembro de 2025 (escape porque esquece de tomar dionogestell hoje Estrela que iniciou em setembro de 2025)
Comorbidade miomatose uterina
alergia água sanitária
exercício físico regular
sono preservado
boa alimentação
exames laboratoriais preventivo e ultrassom realizado em fevereiro de 2025

queixa principal paciente refere incontinência urinária aos pequenos esforços, queda capilar, queda de massa muscular (houve melhora da massa muscular após suplementação de vitamina AE vitamina D 50000 UI e whey)
refere flacidez vaginal sensação de frouxidão do canal vaginal durante a relação sexual
ao exame da região íntima flacidez clitoriana hipertrofia dos pequenos lábios com assimetria do lado esquerdo maior que o direito
conduta
laser íntimo ------------------1800
capuzplatia -------------------3300
ninfoplastia-------------------7400
total 12.500.00

entrada de 3500,00
cartão em 6 vezes de 1643 =9860,00
ou 10 vezesde 1000,000 = 10.000,00

quando paciente estiver próxima de vim realizar cirurgia solicitar exames lab, preventivo ( rotina ginecologica)

06/03/2026
PACIENTE VEM PARA NINFOPLASTIA 

Ultrassonografia axilar do dia 3 de março de 2026 sem anormalidades ultrassonografia de mamas BI RADS 1 
ultrassonografia transvaginal útero anti verso fletido volume 65 cm³ endométrio linear presença de nódulo miometriais em parede corporal anterior medindo 1,4 x 1 cm ovário direito 8 cm³ ovário esquerdo 16 centímetros cúbicos

Exames laboratoriais do dia 24/02/2026 hemoglobina 12,6 hematócrito 34,5 leuco 6200 plaqueta 338000 ferro sérico 144 glicose 98 vitamina D 36,7 Vitamina B12 949 hemoglobina glicada 5% parte do sanguinhal positivo tsh 1,08 t 4 livre 0,95 estradiol inferior a 20 progesterona inferior a 5 fsh 7,9 LH 1,96 ferritina 216

CONDUTA: 
ORIENTACOES 
REPOSICAO DE VIT D 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58977425, '139', 'Roniza Dos Santos Monteiro', 2, 1, '05038914284', NULL, NULL, '1999-06-14', 3, 'Q.P: dor pelvica, nega dispareunia, paciente deseja engravidar.
exames lab 11/07
hb 15,2/ht 45,9/leuco 6450/plq224,00/glicemia73/col198/trigl98/ureia 32/creat0,47/t6024/tgp32,9/eas: não infevv.
Conduta: exames lab, vitd, b12, ferretina.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59362701, '459', 'Rosa Leiliane Ramos Ferreira', 2, 0, '02347426230', NULL, '(69) 99301-0020', '1991-05-23', 3, 'IDADE: 33 ANOS
G2 P1N A 1 
DUM: 22/04/25
MC: DIU DE COBRE ( INSERIU EM 2022)
UPCCU: NUNCA REALIZOU 
DEPRESSAO POS PARTO - CARBOLITIUM, QUETIAPINA 

QP: PACIENTE REFERE DOR EM BAIXO VENTRE, ALEGA SECRECAO VAGINAL ESBRANQUICADA, ALEGA QUE FEZ USO DE MEDICACAO ( AZITROMICINA ) FOLHA DE ALGODAO 

CONDUTA: SOLICITO USG TV, PROGRAMAR COLETA DE PREVENTIVO 180,00 OU 250,00 CARTAO CREDITO 1 X OU DEBITO 

15/05/2025
VEM PARA COLETA DE PREVENTIVO 
DUM 22/04/25
AO EXAME:
COLO ANTERIOR, EM FENDA, SANGRANTE A COLETA, NAO VISUALIZO FIO DO DIU 
SOLICTO EXAMES LAB, USG TV
COLETADO PREVENTIVO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61520718, '864', 'ROSA SANTANA BARATA', 2, 0, '94969540225', NULL, '(69) 99226-7722', '1977-02-22', 3, 'Rosa Santana barata
 49 anos 
data da última menstruação dia 3/05/2026
 método contraceptivo LT 
gestas 5 parto 5 aborto O
menarca aos 17 anos 
nega comorbidade 
nega uso de medicação ecirurgias prévias
 último preventivo mais de 5 anos 
 último a mamografia não realizou 
atividade física não realiza 
peso 71 kg e 500 g
 Pressão Arterial 146 x 81 mmHg 

queixa principal rotina ginecológica paciente refere sintomas climatéricos como fogachos e irregularidade menstrual

conduta
- EXAMES LAB
-USG TV
-USG DE MAMAS
-MMG
-PREVENTIVO
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989422, '162', 'Rosana Cardoso Dos Santos', 2, 2, '81486871291', NULL, NULL, '1986-05-16', 3, 'ao exame dor a mobilização ao colo dip.
ceftriaxona, azitromicina,  gynotran, usgtv, secnidazol.
06/09/22 usgtv indentificado mioma intramural+ dip.
Conduta:metronidazol+ doxiciclina.
orientações, procurar upa, caso não tenha melhora em 48 horas.


-------------------- //
10/09
paciente refere dor em baixo ventre e dispareunia 
conduta; usg tv preventivo 

RETORNO 13/10/2025
UPCCU: 23/08/2024: NEGATIVO PARA NEOPLASIA 
DUM: 10/10/2025
USG TV 11/09/2025: UTERO DE 154, MIOMA SUBSEROSO ANTERIOR/LATERAL ESQUERDO 33 X 24 E CPRPORAL POSTERIOR 17 X 16 E MIOMA INTRAMURAL 21X 14 MM. ENDOMETRIO 7,6MM/ OD 5,9/ OE 5,6= MIOMATOSE UTERINA INTRAMURAL E SUBSEROSO 
EXAMES LAB 16/09: ANEMIA, HIPOVITAMINOSE B12 E D, HIPOTIREOIDISMO  
HB 10
HT 32
GLICOSE 105
TRG 207
COLE 224
FEERO 25
TSH 7,32 T4 LIVRE 0,65
FERRITINA 6,8
VIT B 12 384
VIT D 26 

VALOR DO INJETAVEL 705, 00 EM 3 VEZES 

AO EXAME: COLO CENTRALIZADO, PRESENCA DE SECRECAO ESBRANQUICADA FLUIDA, COM GRUMOS E ODOR 

CONDUTA: ORIENTACOES, REPOSICAO INJETAVEL, COLETADO PREVENTIVO, 
PURAN 50 MCG/DIA , AUMENTAR 25 MCG A CADA 2 OU 3 SEMANAS 

1.	Secnidazol 1 g______________________04 comprimidos 
Tomar 02 comprimidos via oral dose única para o casal 
2.	Fluconazol 150 mg __________________02 comprimidos 
Tomar 01 comprimido via oral e repetir com 7 dias
3.	Puran T4 50 mcg________________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia 
 


Uso vaginal

1.	TERICIN AT _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.




------------------------------------------------------------

40 ANOS 

G3 P3C A0
MENARCA AOS 12 ANOS 

MC: LT
DUM: 10/08/2026 - BORRA 
COMORBIDADE: DEPRESSAO

QP: PACIENTE ACOMPANHADA DO ESPOSO, VEM DEVIDO A IRREGULARIDADE MENSTRUAL, INSONIA, FOGACHO, MUITA SEDE 

ao exame
colo centralizado, puntiforme, presença de nevosos e colo coloração tipo framboesa

NOME: Rosana Cardoso Dos Santos
USO ORAL
1.	Vita E ciclos _____________________________ 01 caixa
Tomar 2 comprimidos via oral, por 3 meses. 

2.	Azitromicina 500 mg __________________04 comprimidos 
Tomar 02 comprimidos via oral dose única, para o casal.

3.	Zaila _________________________________01 caixa
Tomar o1 comprimido via oral, 1 vez ao dia, por 3 meses.

Uso vaginal

1.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.
 

Porto Velho, 08/09/2026

CONDUTA: 
ORIENTACOES 
VIDEOCOLPOSCOPIO
EXAMES LAB
USG TV
SUG DE MAMAS
MMG 
coletado preventivo em meio convencional 
----------------------
08/09

NOME:   Rosana Cardoso Dos Santos
DATA: 08/09/2026


ULTRASSONOGRAFIA MAMÁRIA

TÉCNICA:
Realizado estudo ecográfico das mamas com transdutor setorial multifrequencial (5,0 a 10,0 Mhz).
 
INDICAÇÃO: 
Rastreio.
 
DESCRIÇÃO DO EXAME:
MAMA DIREITA 
Pele e tecido adiposo subcutâneo com espessura e ecogenicidade normais.
Fáscia e planos musculares retromamários anatômicos.
Ductos lactíferos retroareolares de trajeto e calibre normais.
Parênquima mamário com ecotextura fibroglandular usual e adequada lipossubstituição.
Presença de císticos simples, anecoicos, de paredes finas, com reforço acústico posterior e sem componentes sólidos, um cisto de 2,6 mm e outro de 1,6 mm, localizadas no quadrante superior, a aproximadamente 2,0 cm do complexo aréolo-papilar
Prolongamentos axilares anatômicos.

 DESCRIÇÃO DO EXAME:
MAMA DIREITA 
Pele e tecido adiposo subcutâneo com espessura e ecogenicidade normais.
Fáscia e planos musculares retromamários anatômicos.
Ductos lactíferos retroareolares de trajeto e calibre normais.
Parênquima mamário com ecotextura fibroglandular usual e adequada lipossubstituição.
Ausência  de císticos ou nódulos.
Prolongamentos axilares anatômicos.


AVALIAÇÃO:
Achados benignos.
BI-RADS® US 2.
 
Laudo padronizado conforme o método BI-RADS® 5ª edição do American College of Radiology (ACR) para imagem da mama.
OBSERVAÇÕES:
1. A ultrassonografia como método isolado não é indicada para rastreamento de neoplasia mamária. É necessária correlação com mamografia atual.
2. Através de normativa do Colégio Brasileiro de Radiologia, a ultrassonografia axilar não engloba avaliação mamária, sendo necessário seu pedido, para sua devida avaliação.


NOME: Rosana Cardoso Dos Santos

DATA: 08/09/2026


ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 5,13 x 8,87 x 5,06 cm (volume:  119,4 cm³).
Ecotextura miometrial homogênea, apresentando imagem nodular hipoecogênica, com contornos definidos, sugestivo de mioma, localizado a seguir:

	Localização	Parede	Medidas	Figo
1	Intramural 	Posterior 	2,1 cm	4

Endométrio: centrado, ecogênico e com espessura de 2,3 mm de basal a basal.

Ovário direito: tópico, volume de 5,4 cm³, de forma habitual, contorno preservado e textura normal.

Ovário esquerdo tópico: volume de 7,0 cm³, de forma habitual, contorno preservado e textura normal.

Ausência de  líquido livre patológico em fundo de saco.

IMPRESSÃO: 
Nódulo miometrial hipoecogênico, bem delimitado, em parede posterior, intramural, medindo 2,1 cm, compatível com leiomioma uterino (FIGO 4).
 Ovários de dimensões e morfologia preservadas, sem alterações ultrassonográficas significativas.


OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.


DRA CHRISTIANE ALVES CALIXTO 
CRM 3316/RO


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61873718, '935', 'Rosana Costa de Souza', 2, 0, '02396520296', NULL, '(97) 98415-5508', '1992-02-22', 1, 'Aguardar a paciente receber os resultados dos exames e marcar um Retorno On-Line ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60079820, '598', 'ROSANGELA APARECIDA DA SILVA', 2, 2, '59325097249', NULL, NULL, '1976-05-02', 1, 'HISTERECTOMIA
TRH: COENZIMA Q 10, PROGESTERONA 100 MG,  ....
APRESENTOU ITU, 
EXAMES LAB:  RECENTE COLESTEROL ALTO, EM USO DE ROSUVASTATINA, 
MMG - MAMA ESQUERDA NÓDULO?
 LIBIDO BOA, PACIENTE REFRE PERDA DE URINA AOS PEQUENOS ESFORCOS  ( APOS TOSSE DE  PNM)

SESSAO DE LASER INTIMO 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60478011, '639', 'Rosângela Gonzaga Teixeira', 2, 2, '00860340228', NULL, NULL, '1989-10-22', 1, 'paciente pos cesarea há 1 ano e 3 meses

vem para rotina ginecologica 
ao exame

colo posterior, secreção muco hialina 
hipertrofia de pequenos labios e flacidez clitoriana 
flacidez de canal vaginal

conduta; coletado preventivi=o em meio liquido 
ninfoplastia e capusplasta 11.500,00
laser intimo 1800
----------------------------------------------------
15/07/2026
IDADE: 36 ANOS 
DUM:  05 /07
MC: PRESERVATIVO
G2 P2
UPCCU: 10/2025

QP: PACIENTE REFERE DURACAO DE CICLO 3 DIAS, POREM NOS ÚLTIMOS TEMPO A DURAÇÃO AUMENTOU PARA 5 DIAS, ALEGA DISMENORREIA APÓS 2 º DIA DA MENSTRUAÇÃO, NEGA SECRECAO VAGINAL, NEGA DISPAREUNIA, NEGA DISURIA 

AO EXAME;
 COLO CENTRALIZADO, PUNTIFORME, SANGRANTE A COLETA 
PRESENCA DE MUCO HIALINO 

CONDUTA: 
ORIENTACOES 
USG TV COM PREPARO INTESTINAL 
EXAMES LAB
COLETADO PREVENTIVO  EM MEIO LIQUIDO E ENTREGUE A PACIENTE ( VAI LEVAR NO DNA LAB ) 

ninfoplastia e capusplasta 11.500,00
laser intimo 1800
-----------------

1. Ultrassonografia transvaginal com preparo intestinal
Data: 30/07/2026
Útero
Útero anteversofletido.
Volume uterino: 157 cm³.
Endométrio: 11 mm, compatível com fase secretora.
Istmocele
Presença de istmocele medindo 0,34 × 0,47 cm.
Miométrio residual: 0,20 cm.
Achados sugestivos de endometriose
Imagem nodular hipoecogênica, regular, localizada no compartimento anterior, podendo estar relacionada a:
processo cicatricial; ou
foco de endometriose.
Sinais de endometriose no compartimento posterior, envolvendo:
torus uterino;
ligamento útero-sacral direito;
ligamento útero-sacral esquerdo;
peritônio vesicouterino;
ligamento redondo esquerdo.
Outros achados
Hérnia umbilical, sem sinais de encarceramento.

2. Ultrassonografia das mamas
Data: 13/08/2026
Cisto simples na mama direita, medindo aproximadamente 0,5 cm.
Classificação: BI-RADS 2, achado benigno.

3. Exames laboratoriais
Data: 23/07/2026
Exame	Resultado
Hemoglobina	11,2 g/dL
Hematócrito	35,7%
Leucócitos	4.720/mm³
Eosinófilos	87% (conforme informado)
Plaquetas	171.000/mm³
Vitamina D	28,8
Vitamina B12	402
TGO	16 U/L
Colesterol total	181 mg/dL
HDL	50 mg/dL
LDL	111 mg/dL
Triglicérides	97 mg/dL
Ferro	93
Ureia	24 mg/dL
Creatinina	0,6 mg/dL
Hemoglobina glicada	5,4%
Progesterona	1,3
TSH	1,52
Estradiol	123
FSH	7,1
LH	16,3
Cortisol	5,3
T4 livre	1,14
Ferritina	129
Glicemia de jejum	104 mg/dL
EAS	Sem sinais de infecção
Suplementação/medicações informadas
Vitamina D
Vitamina B12
Endofer
Anitta (nome informado; vale confirmar o medicamento/princípio ativo)
Felix
belamy

NOME: Rosângela Gonzaga Teixeira

Uso oral

1.	ENDOFER _________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia. 

2.	Anita____________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas

3.	Doss + zinco 2000 ui ______________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia 

4.	Zelix 150 mg ____________________01 comprimido
Tomar 01 comprimido via oral dose única 

Uso vaginal 

1.	Belamy ____________________________01 caixa
Aplicar via vaginal, a cada 3 dias ( 2 aplicações)

Rosângela Gonzaga Teixeira

23/07/2026 
Vitamina D	28,8
Vitamina B12	402


Vitamina B12 + coenzima Q10





Vitamina D3 +  coenzima Q10 






', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61824566, '923', 'ROSANGELA LIMA SOUZA', 2, 0, '93094310249', 'rosasouza4224@mail.com', '(69) 99224-4560', '1977-03-21', 3, 'DUM: + 1 ANO
G5 P5N A0
COMORBIDADES NEGA 
CIRURGIA : URETROLIPOTRIPSIA
UPCCU: HA 6 ANOS 
UMMG HÁ 6 ANOS 
QP: MENOPAUSA

SINAIS VITAIS  130 X 80 PESO 51.500G

CONDUTA: EXAMES LAB, IMAGEM , PREVENTIVO', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61554844, '871', 'Rosanira Capistrano Luz', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60062911, '586', 'Rosemilda Do Carmo Maia Braga', 2, 2, '77337867204', NULL, '(69) 99272-6851', '1976-05-15', 3, 'IDADE: 49 ANOS
DUM: MAIO DE 2025
G6 P5 A1

QP:PACIENTE PASSOU POR HISTERECTOMIA, COLPOPLASTIA ANT E POST + CULDOPLASTIA DE MAC MALL + SLIG DIA 22/05/2025, NO MOMENTO REFERE DESCONFORTO QUANDO LEVANTA 
ALEGA DISPAREUNIA 
EXAME 17/06/25HB 11,1 HT 33,8, LEUCO 8600, PLQ 580.000, FERRO 76, FERRITINA 355
PREVENTIVO 23/12/2024: NEG PARA NEOPLASIA 

CONDUTA: 
ORIENTACOES 
SULFATO FERROSO, DIGO HEMOLIP
KY
BIOVAGIN
QLQ INTERCORRENCIA RETORNAR NA POC
E SOLICITAR EXAMES LAB PELO SUS 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61502581, '853', 'ROSENIR DA SILVA DO NASCIMENTO', 2, 0, '83066861287', NULL, '(69) 99361-4324', '1979-06-27', 3, 'DUM 07/05/26
G 6 P6N A 0 
ACO CICLO 21
HAC - LOSARTANA 
UPPCU: HÁ 2 ANOS 
SECRECAO VAGINAL MAIS 5 MESES,  AMARELADO COM ODOR 

PESO 81800G
PA 159 X 100 MMHG

CONDUTA: SECNIDAZOL
GYNOTRAN 
NOME: ROSENIR DA SILVA DO NASCIMENTO 


Uso oral

1.	Secnidazol 1 g __________________________04 comprimidos 
Tomar 02 comprimidos via oral, dose única, para o casal.


Uso vaginal

2.	Gynotran _________________________________01 caixa
Aplicar 01 óvulo via vaginal, á noite, durante 7 dias.

NOME: ROSENIR DA SILVA DO NASCIMENTO

SOLICITO

HEMOGRAMA  
HIV I E II
VDRL
HBSAG
ANTI HCV
HERPES I E II 
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
ESTRADIOL
PROGESTERONA
FSH
LH


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60471301, '636', 'ROSETE', 2, 0, NULL, NULL, '(69) 9945-4555', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60731989, '704', 'ROSIANE ALVES DE PAULA', 2, 0, '62487590220', NULL, '(69) 99253-0793', '1978-09-01', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58977272, '137', 'Rosiane Aparecida Botelho De Lima', 2, 2, '05038914284', NULL, NULL, '1986-04-08', 3, 'Q.P: preventivo 04/03/24 negativo neoplasia.
Conduta: usgtv, exames lab.

28/05/2024
dum:12/05/24
exames 14/05/24: glicose 88,3/ trigl 140/ colesterol 194/ tsh 8,65/ lh 5,2/ tsh 116/ th livre 1,40/ hb 12,30/ leuco 7960/ eas normal.
usg 20/05/24 : útero 80,03, end 4mm, od 7,7, oe 9,6 normal.
Conduta: atn fol por 3 meses.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58936617, '796', 'Rosianne Mansilha Macedo', 2, 2, '05038914284', NULL, '(69) 9948-0085', '1999-11-19', 1, 'Paciente refere quadro virotico, com tosse seca, observou perda de urina 
vem para fazer laser intimo 
ato sem intercorrência 

06/03/2026:
Paciente refere que permanece com escape de urina durante a micção ( fica fazendo xixi de pouquinho e pouquinho)  
conduta laser intimo 
90 
belamy
em dh', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58976794, '134', 'Rosicleia Alves Chagas Monteiro', 2, 2, '05038914284', NULL, NULL, '1978-09-23', 3, 'Q.P: secura  vaginal, irregularidade menstrual.
Conduta: exames lab, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60045410, '579', 'Rosicleide Morais Feitosa', 2, 2, '64251187253', NULL, '(97) 8440-9246', '1976-12-30', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60190393, '602', 'Rosilda de Souza Arruda Ferreira', 2, 2, '11377208249', NULL, '(69) 8408-0306', '1957-04-17', 1, 'IDADE 68 ANOS 
MENOPAUSA: 54 ANOS 
G2 P2 
LT
UPCCU: 2 ANOS
ATIVIDADE SEXUAL ATIVA

QP: PACIENTE REFERE RESSECAMENTO VAGINAL, 
USG DO APRELHO URINARIO 26/06/25: SINAIS QUALITATIVO DE AFECCAO/ DEPLECAO DA FUNCAO RENAL, NAO QUANTIFICASO PELO METODO, SEM CARACTERIZAR DRC OU INSUFICIENCIAS 
EAS 16 PIOCITOS POR CAMPO 
CIPRO UROCULTURA SENSIVEL 
FISSSURAS ENTRE PEQUENOS LABIOS 
BELAVIE, BEPANTOL DERMA PELE SECA
no dia do laser avaliar uso de antrofi 

05/08: 
PACIENTE REFERE ACIDENTE COM O FILHO, E NO MOMENTO POR CONDICOES FINANCEIRA NAO VAI PODER REALIZAR O LASER
PACIENTE NAO ACHOU BELAVIE , PRESCREVO BELAMY , AINDA NAO  REALIZOU A FORMULA MANIPULADA QUE EU PRESCREVI ANTERIORMENTE
EXAMES LAB  01/09/25; UREIA 48,9, VIT D 30,6
REPOSICAO DE VIT D E ENCAMINHAMENTO AO UROLOGISTA 
280 ,00 VIT D 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58976753, '133', 'Rosilene Alves De Souza Sales', 2, 2, '91160162204', NULL, '(69) 99335-0310', '1980-12-10', 3, 'Candidiase de repetição, fez uso de flucunazol.
Conduta: orientações de dieta e hogiene, flucunazol , larotadina, secnidazol, crevagin 7 dias, após realizar gynotram, trok flogorosa.

29/07
idade: 43 anos
DUM:  15/07
G2 P A ECTOPICA
UPCCU:  + 3 ANOS 
mc: -----

PACIENTE REFERE DIMINUICAO DA LIBIDO 
EXAMES LAB 26/06/2025 GLICOSE 94, SNR, COL TOTAL 244, TRIG 241 EAS NORMAL HB 13,3/ HT 38 / LEUCO 9830/ PLQ 292 MIL 


CONDUTA: USG TV, EXAMES LAB HORMONAIS, MMG , USG DE MAMAS, PROGRAMAR PREVENTIVO 

18/08/2025
colo centralizado, presença de secercao atrelada, com odor, presença de pólipo endocervical

retirada de polipo 1500,00pix 1800,00 credito 

metronidazol , triplo a,  secnidazol,  teracii at 

20/08/2025
APCIENTE RETORNA COM RESULTADO DE EXAMES 
USG TV 29/07: HIDROSSALPINGE 
USG DE MAMAS 29/07: BI RADS 2 , CISTO MAMARIO SIMPLES 

METRONIDAZOL POR 7 DIAS, EMAMA

paciente em posição de litotomia 
inserção de especulo
assepsia
visualizo polipo
retirada de polipo
entrego pedido de ap
conduta: orientações, ibuprofeno 

16/10/2025:
DUM: 31/09/2025
PREVENTIVO AGOSTO/2025: Negativo para lesão intra-epitelial e malignidade
paciente retorna com resultado de AP: 29/09/2025:"lesão benigna- pólipo endometrial 

CONDUTA: RETORNO EM DEZZEMBRO: REALIZAR USG TV EM DEZEMBRO E REPETIR EXMAES LAB 
----------------------------- // ------------------

conduta: usg tv
exames lab 




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58988790, '156', 'Rosilene da S Olivera Monteiro', 2, 0, '80508588200', NULL, NULL, '1985-04-14', 3, 'Q.P: dor em baixo do ventre, acompanhada de secreção com melhora com flucunazol, mas atualmete sem queixas. apresenta exames complementares.
preventivo 22/02/23 negativo para neoplasia
usgtv 08/03/23 ovario micropolicisticos.
Conduta: repetir usg em set 2023.

11/04/24
usgtv 08/03/24
utero 101 cm, end 8mm, od 6,3, oe 9,7/ exame normal
aguardo preventivo coletado h.a
usg de região inginal direita 08/03/24
pequeno  foco de proc inflamatorio em região inginal d.
ao exame, saida de pus em região inguinal.
Conduta: aguardo do preventivo, azitromicina, ibuprofeno, metronidazol+miconazol.

----------------  // --------------
10/09
PACIENTE REFERE SANGRMANTO VAGINAL FORA DO PERIODO MENSTRUAL
AGENDAR COLETA DE PREVENTIVO COM VIDEO PARA OUTUBRO
SOLITAR EXAMES LAB 

22/10/2025
g3 p3 a0
paciente refer DuM: 05/10/2025, porém dia 15/10 apresentou SUA com duração de 3 dias, com dismenorreia 
colo centralizado, esbranquiçada fluido 
crevagina', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60547284, '655', 'Rosilene da Silva Oliveira Monteiro', 2, 0, NULL, NULL, '(69) 9221-3646', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989368, '161', 'Rosimeire Da Silva Lacerda', 2, 2, '05038914284', NULL, NULL, '1982-06-07', 3, 'Fogacho, irritabilidade, dor nas articulações, mestruação irregular.
exames lab 18/08/23.
eas normal, ths 2,43, t4 livre 0,98, trig 72, t6 23, tgp 31, glicose 79, col 167, hb 13,42.
Conduta:  usg de mamas, mmg, usgtv, antrofi, tibolona.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59486872, '495', 'Rosineia Santos Do Nascimento', 2, 0, '00180922254', NULL, '(69) 99368-3021', '1987-05-25', 3, 'paciente vem para mostrar resultado de preventivo do dia 20/01/2025: candida + negativo para neoplasia 
paciente refer que após mesntruacao apresenta secreção amarelada com odor 

secnidazol e gynotran ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58989061, '157', 'Rosineide Furtado Cardoso', 2, 5, '05038914284', NULL, NULL, '1980-06-29', 3, 'paciente refere purido vaginal com secreção vaginal, nega odor, apresenta mamografia 05/05/23 bi-rads2, preventivo 10/08/23 negativo para neoplasia.
Conduta: flucunazol, miconazol, exames lab, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58981764, '143', 'Rosineide Gomes De Souza', 2, 2, '05038914284', NULL, NULL, '1977-12-25', 3, 'Q.P: desde nascimento do filho ( 6 anos) alega diminuição da libido, alega saida de secreção amarelada digo incolor, com odor, refere atraso mesntrual.
Conduta: usgtv, exames lab, programar preventivo.

20/06/24
exames lab.
hb 14/ ht 39,66/ vit d 33,3/ tsh 3,23/ tsh 3,23/ trig 170/ colo 165/ eas normal/ bhcg-/ glicemia 92/ ureuia 27/ creat 1,12.
usgtv 05/06/24
utero 145,3/ end 10mm, od 15,2, oe 18,9 cisto em ovario esquerdo.
Conduta: triplo a ou ibuprofeno 600mg, preventivo, mmg.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61451172, '845', 'Rozenilda Alves de Souza Feitosa', 2, 2, '70803250215', NULL, '(69) 9904-3407', '1978-11-01', 1, 'INIDICAÇÃO DA GLAUCE
IDADE47 ANOS 
DUM: 03/05/26 
G2P2 
LT
UPCCU: 2025
CONSTIPACAO 3/4 DIAS 


--------
04/06

preventivo 07/05: Negativo para células neoplásicas; coco inflamação compatível com bactéria 

Exames laboratorial do dia 29/05/2026 

Testosterona total 19 tsh 1,21 t 4 livre 1,22 fsh 5,2 LH 6,6 sorologia não reagente anti h bs reagente insulina 6,9 cortisol 8,2 omo cisteína 9,9 vitamina A zero ponto 39 vitamina D 35,9 vitamina B12 752 Vitamina E 6,78 estradiol 277 progesterona 0,39 zinco 83 cobre 90,2 selênio 66,5 ácido úrico 2 desde o 21 tgp 23 gama GT 30 glicose 84 entre eles serem de 43 colesterol 139 uréia 29 creatinina 0,7 ferritina 75 ferro 95 magnésio 1,7 PCR não reagente hemoglobina 13,2 hematócrito 38,6 leuco 5430 plaqueta 220000 pura cultura não houve crescimento EAS não infeccioso Vitamina C 2,3 indicam pesquisa negativo herpes imune 

desitometria óssea densitometria mineral óssea normal 
ultrassonografia transvaginal do dia 29/05/2026 útero anti verso fletido volume 71 e 6 ovário direito 2,4 ovário esquerdo 1,7 exame normal 
ultrassonografia de mamas do dia 29/05/2026 bi rads 3  devido nódulo em mama direita às 10:00 em 1/3 médio medindo 0,5 x 0,3 x x 0,4 
mamografia do dia 29/05/2026 – sem laudo 

conduta: 
orientações 
repor vitamina d ( ja esta em acompanhamento mensal) 
crevagin
repetir exames lab com 3 meses para observar queda hormonal - fazer TRH
repetir usg de mamas com 6 meses 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58977572, '140', 'Rozineide Mota Prestes', 2, 2, '05038914284', NULL, NULL, '1976-08-01', 3, 'Dor em baixo do ventre, esquerda, não disuria, refere dispareunia, refere secura vaginal.
Conduta:usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58977204, '136', 'Rozineide Torres Gil', 2, 4, '71027661220', NULL, '(69) 99290-2675', '1976-11-03', 3, 'Insonia + 3 dias, sem motivo sic parou por conta propria, atenolo e losartana 30/05/24.
Solicito exames lab, neozine 3 gotas.

Retorno 11/11/24
estradiol 127, fsh 6,22, hb 12,9, ht 38,6, leuco 5880, plq 277,00, eas normal, glicose 109, colesterol 222, ferretina 134.
vitb12:569, vitd 30.
Paciente refere que continua com insonia, mesmo em uso de neozine, apresenta mapa normal.
Conduta: exercico fisico e dieta alimentar.

18/11/2025
49 ANOS 
DUM: HISTERECTOMIA COM 37 ANOS 
PACIENTE REFERE INSONIA, CEFALEIA, ONDAS DE CALOR EM USO DE SONIC E FLUOXETINA 

CONDUTA: EXAMES LAB, USG DE MAMAS E MMG, USG TV 

27/01/2026
Exames laboratoriais do dia 2/12/2025 hemoglobina 12,3 hematócrito 35,7 leuco 5200 plaqueta 237000 
EAS não infeccioso 
glicose 100 
ureia 29 creatinina 0.9 
colesterol 210 ferritina 146 hemoglobina glicada 6,17% 
 TGO 17 tgp 17 
ferro serico 59,6 
estradiol 55,2 
fsh 27,1 LH 28,8 t 4 livre 1,19 
progesterona inferior a 0,05 tsh 2,27 vitamina D 23.6
MMG 28/11 bi rads 2 

conduta
progesterona 
vitaminas
retorno com 1 mes 
NOME: Rozineide Torres Gil



Uso oral

1.	UTROGESTAN 100MG ____________________01 CAIXA 
Tomar 01 comprimido via oral á noite 

     3.VITERGAN COG  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, durante 30 dias. 

4.	Caldê max __________________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia.

5.	Pasalix PI 1000_________________________________01 caixa
Tomar 01 comprimido ás 20 horas 

-------- 
30/03
paciente refere que parou uso da medicação e esta com insônia 

Uso oral


1.	UTROGESTAN 100MG ______________01 CAIXA
Tomar 01 comprimido via oral á noite 


2.	Pasalix PI 1000________________________01 caixa
Tomar 01 comprimido ás 20 horas 

3.	MELATONUN COMPLETE _____________01 CAIXA
Tomar 01 comprimido ás 20 horas 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61039625, '752', 'Rozineide. Aguiar. Pereira', 2, 0, NULL, NULL, '(69) 9234-5318', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59349743, '455', 'Rute Arrás', 2, 0, '35090570230', NULL, '(69) 9268-6578', '1971-02-19', 1, 'IDADE: 54 ANOS
G3 P2 N1 C A 0
LT
UPCCU: MAIO DE 2024
UMMG: MAIO DE 2024
COMORBIDADES: NEGA
ALERGIA A MEDICACAO: NEGA
CIRURGIAS PREVIAS: HISTERECTOMIA (2020), CESAREA, LT, 
2021; REALIZOU LASER INTIMO 

QP: PACIENTE REFERE FOGACHO, IRRITABILIDADE, INSONIA, ACORDA AS 3H DA MANHA, CEFALEIA, SECURA VAGINAL,SECURA DOS OLHOS, DIMINUICAO DA LIBIDO, ALEGA IUE

AO EXAME
AUSENCIA DE COLO UTERINO, PAREDE VAGINAL DELGASSADA, FISSURAS NO INTROITO VAGINAL
EXAMES LAB E IMAGEM 

CONDUTA:  


FRAX 1500,00 A VISTA

03/06/2025
Exame laboratorial do dia 13/05/2025 hemoglobina 11,9 e HT 35,5 leucócitos 7310 plaquetas 301000 hemoglobina glicada vocês tsh 1,74 ter 4 livros 1,19  FSH 57,66 LH 30,93 sorologia não reagente anti h bs 743 insulina 16,4 cortisol 8,8 Vitamina B12 287 estradiol 19 progesterona zero ponto 21 Vitamina C 0,24 ácido úrico 5,4 TGU 17 tgp 22 gama glutamil transferase 47 GLICOSE87 triglicerídeos 71 colesterol total 197 HDL 53 ldl 130 28 creatina 0, 80 ferritina 274 ferro 55 magnésio 1,9 urocultura não houve crescimento bacteriano

DENSITOMETRIA OSSEA 27/05/25: NORMAL 
USG DE ABDOME Total do dia 27/05/2025 colelitíase sem sinais de colecistite demais estruturas sem alterações
Ultrassonografia de mamas mamografia do dia 27 de maio: BI RADS  2
ultrassonografia transvaginal status pós histerectomia total ou vários usuais para a faixa etária ( ovário direito 2,3 ovário esquerdo 3,7)
CONDUTA: 
REPOSICA DE VITAMINA ADEK,  C ( 780,00)
B12, 250,00
INICIO TRH 
AGUARDO LAUDO DA USG DE TIREOIDE - AVALIAR PAFF 

Uso oral

1.	Pasalix PI 1000_________________________________01 caixa
Tomar 01 comprimido ás 20 horas 
2.	Vitergan cog ____________________________01 caixa
Tomar 2 comprimido via oral, 1 vez ao dia 

Uso sublingual 
3.	Melatonina fast __________________________01 caixa
01 comprimido SL até total absorção, 1 vez ao dia, ás 20h 

Uso transdérmico 
1.	ESTROGEL 0,6 MG/G __________________01 TUBO
Aplicar 01 pump, atrás do joelho ou na parte interna da coxa, após o banho com a pele seca
------------------------------------------
18/05/2026
idade 55 anos 
UPCCU: MAIO DE 2024
UMMG: MAIO DE 2024
COMORBIDADES: NEGA
ALERGIA A MEDICACAO: NEGA
CIRURGIAS PREVIAS: HISTERECTOMIA (2020), CESAREA, LT, 
2021; REALIZOU LASER INTIMO
vem para laser intimo
no momento parou TRH

conduta: orientações 
exames lab
usg tv
usg de mamas
mmg 
densitometria ossea 
AGENDAR CONSULTA PARA JUNHO
AGENDAR 2º SESSAO DE LASER 
PRECISA DE NOTA FISCAL 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59087134, '327', 'Rute Arrás Brito', 2, 0, NULL, NULL, NULL, NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61397318, '838', 'Sabrina Laura Queiroz Santiago', 2, 0, '02825296244', NULL, '(97) 8116-7786', '2004-01-15', 1, 'PACIENTE PROVENIENTE DE HUMAITA, FOI ATENDIDA MEDSAUDE, DEVIDO CANDIDIASE E QUEDA CAPILAR, ACNE 
VEM PARA MOSTRAR RESULTADO DE EXAMES: ALTERADO VIT B E D, EAS APRESENTANDO INFECCAO E FUNGO, PREVENTIVO NEG PARA NEOPLASIA, POREM APRESENTA CANDIDA 
USG TV 
03/04/2026: UTERO RVF, 34,9 CM , OD 8,7 OE 4,6 EXAME NORMAL 
HIGICALM
PANTOGAR RESIST
REPOSICA DE VITAMINA D E B12 
VALIDADE DE IMPLANON PARA MAIO DE 2026


--------------------
13/08

retirada de implanon

PACIENTE: Sabrina Laura Queiroz Santiago


USO ORAL
1.	Cefadroxila 500mg -----------------------------------14 cp
        Tomar 01 comprimido via oral 12/12 horas por 7 dias


Retirar os pontos dia 18/08 /2026, no consultório 

13.08.26

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59122953, '356', 'Sabrina Silva De Aguiar', 2, 1, '05038914284', NULL, NULL, '2003-05-06', 3, 'Dor em baixo do ventre, corrimento esbranquiçado, com odor.
conduta: usgtv, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60857116, '720', 'Sally Teles do Nascimento', 2, 1, '86998250215', NULL, '(69) 9207-2258', '1984-03-27', 1, 'idade: 41 anos 
DUM: 14/12 ( DURACAO DE 3 DIAS, FLUXO POUCO)
MC: PRESERVATIVO
G 0 P0 
COMORBIDADES: NEGA
MEDICACAO: NEGA
UPCCU: 2023
ALIMENTACAO: IRREGULAR
EXERCICIO FISICO: TREINANDO HÁ 2 MESES
ATUALMENTE ESTÁ MORANDO EM ARIQUEMES 

QP: PACIENTE REFERE PRESENCA DE SECRECAO HILAINA HÁ MAIS OU MESNOS 2 MESES, SME PRURIDO, SEM ODOR 
REFERE DESEJO DE CLAREAMENTO NA REGIAO INTIMA E NINFOPLASTIA 
AO EXAME
HIPERCROMIA EM REGIAO INTIMA
PRESENCA DE HIPERTOFIA DE PEQUENOS LABIOS 6 CM E HIPERTROFIA DE CLITORIS 
COLO CENTRALIZADO, PRESENCA DE ECTOPIA, SANGRANTE A COLETA 

CONDUTA
ORIENTACOES
COLETADO PREVENTIVO EM MEIO LIQUIDO
SOLICITO USG TV, USG DE MAMAS 
NINFOPLASTIA 7850,00
CAPUZPLASTIA 3650

preventivo: 02/01/2026
CONCLUSÃO
· Negativo para células neoplásicas;
· Compatível com Inflamação Bacteriana;
· Metaplasia Escamosa Imatura.
----------------
REPARACAO DA NINFOPLASTIA 08/05/26
FOTO EM ANEXO 

Paciente em decúbito dorsal, em posição ginecológica. Realizada antissepsia da região genital com solução degermante e colocação de campos estéreis.
Procedeu-se à infiltração anestésica local com lidocaína 2% associada a vasoconstrictor em pequenos lábios bilateralmente, promovendo adequado bloqueio anestésico.
Demarcada previamente a área de ressecção do excesso cutâneo-mucoso dos pequenos lábios, respeitando simetria anatômica e preservação das bordas naturais.
Realizada ressecção do excesso tecidual bilateral com adiofrequência, seguida de criteriosa hemostasia com eletrocautério bipolar.
Efetuada síntese por planos com pontos separados contínuos utilizando fio absorvível 4-0, obtendo adequada coaptação das bordas e bom resultado estético imediato.
Revisada hemostasia, sem sangramentos ativos. Curativo local realizado.
Paciente tolerou bem o procedimento, sem intercorrências, sendo encaminhada à recuperação em bom estado geral.
Procedimento: Ninfoplastia bilateral.
Anestesia: Local.
Intercorrências: Ausentes.
Perda sanguínea estimada: Mínima.


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60032972, '572', 'Samanta Elzirene Olivera Da Silva', 2, 0, '04906095208', NULL, '(69) 99282-3827', '2002-11-06', 3, 'idade: 22 anos 
DUM: 25/07
MC: CODON
UPCCU: NUNCA REALIZOU

PACIENTE PLANEJAMENTO FAMILIAR E ALEGA TAMBEM DISMENORREIA 

CONDUTA: USG TV, EXAMES LAB, PROGRAMAR PREVENTIVO 180, 00 PIX E 250 CARTAO 
PACIENTE CONVERA SOBRE DIU DE COBRE MINI 
GUIADO 
1200,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59101886, '339', 'Samara Caroline Pereira Da Silva', 2, 3, '05038914284', NULL, NULL, '1987-03-28', 3, 'Q.P: dor em baixo do ventre, secreção amarelada/ esverdeada, com odor.
apresenta exames
usgtv 04/07/23
utero 84 cm, end 12mm, ovarios normais.

bacterioscopia 05/09/24 leuc numeroso f.b aumentada, levedura ausente, trichomonas ausente.
usgtv 05/09/24 
utero 66,18, end 5,7mm, presença de mioma subseroso parede anterior, od 2,93, oe 4,35.
conduta: ceftriaxona, azitromicina, secnidazol, ibuprofeno, hetradizol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58908465, '6', 'Samara Laís Maia Bonfim', 2, 0, '03916397222', NULL, '(69) 9203-5611', '2000-08-12', 1, 'SESSAO DE LASER PARA CLAREAMENTO
AO EXAME ESPECULAR: SECRECAO ESBRANQUICADA COM GRUMOS 
1 DOSE DE VACINA PARA CANDIDA 
CONDUTA: CREVAGIN


2 dose de vacina de candida
orientações 


05/01/2026
25 ANOS 
DUM: 22/11/2025
UPCCU: 2025
PLANO DE SAUDE: NEGA 

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA, ALEGA IRREGULARIDADE DA MENSTRUACAO APOS USO DE IMPLANON 

AO EXAME

CONDUTA: 
ORIENTACOES
EXAMES LAB
USG TV E USG DE MAMAS 
--------------- 27/01/2026
paciente apresentar resultados lab com alteração de vitamina b 12 e d
preventivo normal
usg tv com preparo intestinal: 23/01:  foco de endometriose profunda  com acometimento do sigmoide 
conduta:
dieta alimentar 
mantem implanon
reposição de vit d e b12 
Vitergan master
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59190742, '418', 'Samia Silva De Souza Braga', 2, 0, '96142367287', NULL, '(69) 99310-7447', '1990-11-21', 3, 'IDADE: 34 ANOS 
DUM: 29/02
MC: LT
G4 P2 A2
UPCCU: 4 ANOS 

PACIENTE SEM QUEIXAS, VEM PARA ROTINA GINECOLOGICA

CONDUTA: ORIENTACOES, EXAMES LAB, USG TV E USG DE MAMAS

07/04/2025
PACIENTE VEM PARA COLETA DE PREVENTIVO
AO EXAME
HIPERTROFIA E ASSIMETRIA DE PEQUENOS LABIOS 
PRESENCA DE VERRUGAS EM PEQUENO LABIO ESQUERDO E INTROITO VAGINAL ( CONDILOMA?)
COLO CONTRALIZADO, PUNTIFORME 
CONDUTA: COLETADO PREVENTIVO
ORIENTO QUANTO AO EXERESE DE VERRUGAS ( VALOR 650, 00 Á VISTA) - 800,00 CREDITO EM 3 VEZES
NINFOPLASTIA ( VALOR 7 MIL  Á VISTA )  8.500,00 EM 6 VEZES

28/04/2025
IDADE: 34 ANOS 
MC: LT
G4 P2 A2
preventivo 08/04/2025 - negativo para neoplasia 
Paciente vem para exerese de verrugas
procedimento
paciente em posição ginecologica
assepsia
anestesia
exegese de verrugas 
conduta: trok, retorno com 15 dias, avaliar resultados de exames 

21/05/2025

IDADE: 34 ANOS 
MC: LT
G4 P2 A2
DUM: 09/05/25
Vem para mostrar resultado de exames do dia 06/05 

EXAMES LAB:  colesterol 205 /HLD 87 / LDL 103/ GLICEMIA 82 / EAS NAO INFECCIOSO/ HB 12,70/ HT 42/ LEUCO 5650/ PLQ 174 MIL/ VITAMINA B12 491 / T4 LIVRE 1,07 / TSH 2,92 VITAMINA D 89,1 
USG TV 06/05/25: UTERO AVF, 112,9, END 10MM/ OD 18,1 / OE 8,3 EXAME NORMAL 
USG DE MAMAS 06/05/25: BI RADS 2
USG DE AXILARES 06/05: NORMAL 
preventivo 08/04/2025 - negativo para neoplasia


CONDUTA: 
ORIENTACOES,: QUANTO A RESTRICAO DE GORDURA TRANS 
REPOSICAO DE VITAMINA B 12 INJETAVEL COM REFORCO MENSAL E MANUTENCAO COM VITAMINA B 12 SL POR 60 DIAS   

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60307840, '630', 'Sandra dos Santos', 2, 1, '63708310268', NULL, '(97) 8414-7411', '1976-12-01', 1, 'ENCAMINHAMENTO


PACIENTE COM 48 ANOS, G2 P1 A1, DUM 15/09/2025, APRESENTA USG TV DO DIA 08/09/2025 ÚTERO 116,6 CM3 APRESENTANDO NA INTERIOR DA CAVIDADE ENDOMETRIAL UMA IMAGEM 1,2 X 0,9 X 0,4 CM, SUGESTIVO DE POLIPO ENDOMETRIAL 

SOLICITO HISTEROSCOPIA 

OMEGA
COLAGENO, PROPOLIS, VIT B 12, 

PRESCREVO: VITERGAN COG, CALDE MAX 
RAIO X DE OMBRO D, LOMBOSACRA

VALOR COBRADO DA RETIRADA DO POLIPO:
4770,00
VALOR COBRADO DIU MIRENA: 
3200,00
 VALOR TOTAL: 
7.790,00 - 200,00 ( CONFIRMAÇÃO DO DIU, COMPROVANTE ESTÁ ANEXADO NO PRONTUARIO).
 VALOR A SER PAGO : 7770,00





26/12/2025

48 ANOS,
G2 P1 A1, 
DUM 15/09/2025, 
USG TV DO DIA 08/09/2025 ÚTERO 116,6 CM3 APRESENTANDO NA INTERIOR DA CAVIDADE ENDOMETRIAL UMA IMAGEM 1,2 X 0,9 X 0,4 CM, SUGESTIVO DE POLIPO ENDOMETRIAL 

Paciente, refere escape ontem, nega algia, 

conduta: orientações, 
aguardo anatomopatologico 
nova consulta em fevereiro  
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58936750, '88', 'Sandra Pino Ledezma', 2, 1, '05038914284', NULL, '(69) 9948-0085', '1969-09-18', 1, 'PACIENTE COM QUEIXA DE IUE
1º SESSAO FRAXX DIA 07/03/25
2º SESSAO DE FRAXX DIA 19/03 - CONDUTA: ANTROF E  LOCAO CALMANTE = 1500,00 + 160,00 = 1660,00', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58937472, '89', 'Sandra Regiania Souza Carretta', 2, 0, NULL, NULL, '(65) 9608-3335', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59169262, '402', 'Sandra Regina Cunha De Araujo Lima', 2, 0, '40907953204', NULL, '(69) 99347-5454', '1972-06-29', 3, 'IDADE 52 ANOS 
G3 P2 A1
DUM: CLIMATERIO EM 2023
BARIATRICA/ MASTOPLEXIA/ CIRURGIA DE COLUNA LOMBAR COM TITANEO/ COLECISTECTOMIA
UPCCU: JULHO DE 2024  NEGATIVO PARA NEOPLASIA 
MMG JULHO DE 2024 

QP: PACIENTE VEM DEVIDO SECRE CAO VAGINAL AMARELADA COM  ÓDOR, REALIZOU TRATAMENTO COM SECNIDAZOL PARA O CASAL, NAO USO CREME VAGINAL
APRESENTA EXAMES DO DIA 21/03/25
EAS NAO INFECCIOSO / GLICOSE 91 / TRIGLICERIDEO 78 / COL 167 / LH 36 / FSH 30 / TSH 3,89 / T4 LIVRE 1,12 / B 12 793 / VITAMINA D 26/ ESTRADIOL 125/ PROGESTERONA 0,05 / HB 13,8/ HT 40 / LEUCO 9590 / P,LQ 262.000

CONDUTA: REPOSICA DE VITAMINA D 50 MIL UI 


05/09/2025

DUM: 2023
PACIENTE REFERE FOGACHO, 
entrega de exames lab 07/08/2025
glicose 90
trig 56
colesterol 153
vitamina b 12 426
estradiol 13,4 
fsh 63
LH 44
TSH 2,93
T 4 LIVRE 1.01
PROLACTINA 4,60
VIT D 42 
HB 13/ HT 37/ LEUCO 4900/PLQ 211.000
EAS: NORMAL

conduta: 
Uso transdérmico 

1.	ESTROGEL 0,6 MG/G __________________01 TUBO
Aplicar 01 pump, atrás do joelho ou na parte interna da coxa, após o banho com a pele seca

Uso oral

2.	UTROGESTAN 100MG ____________________01 CAIXA 
Tomar 01 comprimido via oral á noite 

     3.VITERGAN COG  ____________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia, durante 30 dias. 

4.	Caldê max __________________________01 caixa
Tomar 01 comprimido via oral 1 vez ao dia.

retorno com 1 mes 

08/07
PACIENTE REFERE SECRECAO AMARELAADA COM ODOR FETIDO
SECNIDAZOL CASAL
FLUCONAZOL
METRONIDAZOL
MICONAZOL

-------------------
02/09

PACIENTE NAO FEZ USO DE HORMÔNIO ATE O MOMENTO, 

Exames laboratoriais no dia 19/08/2026 hemoglobina 12,8 hemato 40 leucum 4230 plaqueta 196  exame de urina não infecioso glicose 92 colesterol 156 triglicerídeos 61 a hemoglobina glicada 5,6 tgo 29 tgp Vitamina B12 632 sorologias não reagente tsh 3,9 t 4 livre 1,01 vitamina D30

CONDUTA: ORIENTACOES 
SOLICITO HORMONIO 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62161943, '985', 'SARA CRISTINA PIRES BEZERRA', 2, 0, '02647294208', NULL, '(69) 99323-3323', '1996-12-16', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61656980, '892', 'SARA GEOVANA DA SILVA', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61671390, '898', 'SARA GEOVANA DA SILVA GONÇALVES', 2, 1, '04168656233', NULL, '(69) 99911-9353', '2009-01-06', 3, '**Data:** 12/08/2026

**Paciente:** Sara Geovana da Silva Gonçalves
**Idade:** 17 anos
**Acompanhante:** avó
**DUM:** 29/07/2026
**Menarca:** 12 anos
**Método contraceptivo:** Noregina
**Sexarca:** 16 anos

**Antecedentes:**
Nega comorbidades. Nega alergias medicamentosas. Nega cirurgias prévias. Nega realização prévia de exame preventivo. Refere prática de atividade física em academia.

**Queixa principal/HDA:**
Paciente acompanhada da avó, refere secreção vaginal de coloração esverdeada, associada a disúria. Refere dor em pequeno lábio esquerdo após relação sexual.

**Exame físico:**
Ao exame da genitália externa, observa-se alteração compatível com abscesso de glândula de Bartholin à direita.
Ao exame especular, presença de secreção vaginal esverdeada, bolhosa, com odor característico.

**Hipóteses diagnósticas:**

* Vulvovaginite, a esclarecer etiologia.
* Cervicite, a esclarecer.
* Suspeita de tricomoníase/vaginose bacteriana.
* Necessário afastar infecção por Chlamydia trachomatis e Neisseria gonorrhoeae.
* Abscesso de glândula de Bartholin à direita.
* Disúria — avaliar infecção urinária associada.

**Conduta:**

* Solicito investigação laboratorial para infecções sexualmente transmissíveis, incluindo HIV 1 e 2, HBsAg, anti-HCV e VDRL.
* Orientada sobre uso de preservativo e prevenção de IST.
* 
USO ORAL
Ciprofloxacina 500 MG_______________ 14 comprimidos
Tomar 1 comprimido via oral de 12/12 horas por 7 dias
Secnidazol 1 g______________________04 comprimidos
Tomar 02 comprimidos via oral dose única para o casal.
Zaila ___________________________________01 caixa
Tomar o1 comprimido via oral, 1 vez ao dia, por 30 dias.
Uso vaginal
Trivagel N _____________________________01 tubo
Aplicar via vaginal, á noite, durante 10 dias.
USO TÓPICO
HIGI CALM __________________________01 frasco
HIGIENIZAR-SE 2 VEZES AO DIA.
Porto Velho, 12/08/2026

NOME: SARA GEOVANA DA SILVA GONÇALVES
SOLICITO
HEMOGRAMA
HIV I E II
HBSAG
ANTI HCV
VDRL
UREIA
CREATININA
TGO
TGP
FERRO
FERRITINA
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61027827, '750', 'SARA GIOVANA DA SILVA GONÇALVES', 2, 0, '04168656233', NULL, '(69) 99911-9353', '2009-01-06', 3, 'IDADE 17 ANOS 
DUM: 23/01/2026
MENARCA: 13 ANOS
SEXARCA: 16 ANOS 
PARCEIROS 1
MC: PRESERVATIVO 

PACIENTE DESEJA CONTRACEPTIVO INJETAVEL. 

CONDUTA: NOREGYNA 
-------- /// --------
dum: 21/03/26
paciente deseja congtracepcao
Exame laboratorial do dia 26 de fevereiro hemoglobina glicada 5 vitamina B12 363 vitamina D 32,5 ferritina 32
exames laboratoriais do dia 6 de fevereiro hemoglobina de 3,8 hematócrito de 40 leuco de 9600 plaqueta de 301000 sorologia não reagente colesterol de 150 DJ 3,3 triglicerídeos 74 glicose de 91 uréia de 21 desde o 17 creatinina de 0,7 ferro sérico 56 ter 4 livros de um ponto 36 tsh de 3 EAS π ó sito 12 e Márcia 13 bactéria discreta

conduta: noregyna 
ciprofloxacin ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58984034, '153', 'Sara Regiane Tavares Lopes', 2, 0, '03751555200', NULL, '(69) 99398-9258', '1999-04-23', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58970811, '123', 'Selma Fernandes Santana Alves', 2, 0, '31274188253', NULL, '(69) 9262-4486', '1967-05-19', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62216348, '1003', 'SHEILA DA ROCHA BUHRING', 2, 0, '81465416234', 'sheila_rsilva@yahoo.com.br', '(97) 98118-4573', '1983-01-28', 1, 'Paciente: SHEILA DA ROCHA BUHRING. Idade 42 Anos
MC: Diu de Cobre
PCCU: 2025
Data 12/09/26 Solicito Citologia oncótica em Meio Líquido ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60941527, '731', 'Sheila Rosa Guaitolini', 2, 2, '35087617204', NULL, '(69) 9981-0123', '1972-09-27', 1, 'INDICAÇÃO DA WALDELITA 
53 ANOS 
DUM: SET DE 2025
G2 P2 C A0
MC: LT
UPCCU: JULHO DE 2025
COMORBIDADE: NEGA
MEDICACAO: ITU DE REPETICAO: TRATURIL SACHE DOSE UNICA / MACRODANTINA POR 3 MESES / URO - VAXOM / ELLURA 200 MG / PYRIDIUM 

QP: PACIENTE REFERE USO DE NATIFA PRO UBD POR 1 ANO, PAROU PARA MUDANCA DE MEDICACAO:
PROGESTERONA E ESTRADIOL BIOIDENTICO MANIPULADO, FERROE VIT C , OMEGA 3 , VIT D 1000 UI K2MK7, MAGNESIO

EXAMES LAB 

Preventivo do dia 8/07/2025 negativo para neoplasia exames laboratoriais do dia junho 8/07/2025 hemoglobina 12 hematócrito 36,7 leuco 5440 plaqueta 217000 VHS 43 glicose 95 hemoglobina glicada 5,6 colesterol total 201 colesterol ldl 134 pura é 21,6 creatinina 0,6 ácido 4,6 c é ferro 68 PCR 5,9 tgo 16 tgp 16 bilirrubinas totais infrações normais amilase 52 fosfatase alcalina 58 Gamma GT 18 cálcio 8,4 lipase 15 insulina 10,1 cortisol 11 ferritina 151 tsh 1,9 t 4 livre 0,98 antes de ter pior 0,68 fsh 60 LH 26,6 estradiol 18 progesterona inferior a 0,1 para o ator mono 43 fibrinogênio 314 e Aécio não infeccioso pesquisa de sangue oculto negativo omo cisteína 11 Vitamina B12 406 vitamina C 2,4 vitamina E 12,4 vitamina D 37,8 zinco 105 cobre 81 selênio 73 SDA 13 testosterona total 10 vitamina A 0,4 pesquisa indicam teste de disbiose material urina traços

exame de imagem ultrassom da tireóide do dia 30/06/2025 nódulo de tireóide bilateral te hás 4
ultrassom de mama nódulo de minutos nas mamas com características benignas birras 3
ultrassom de abdômen total esteatose hepática leve grau um ausência cirúrgica de vesícula biliar cisto simples renal esquerda
ultrassonografia transvaginal o tirou mantivesse o fletido 109,4 sugestivo de leiomioma ovário direito 1,5 ovário esquerdo 1,4
tomografia computadorizada de abdômen total do dia 11/12/2025 colecistectomia com clips esteatose hepática cisto renal simples no texto médio do rim esquerdo útero de aspecto 1000 matoso alterações degenerativas OSSEAS
MAMOGRAFIA 30/06/2025: BI RADS 1 
----------------------- /// ================================

Exames laboratoriais do dia 12/02/2026 
hemoglobina de 13,2 hematócrito de 34,9 leuco 7630 plaqueta 275000 ureia de 33 creatinina de 0,7 tgo de 16 tgp de 21 fé série com 94 glicose 98 hemoglobina glicada 5,1 colesterol total 253 triglicerídeos 132 magnésio 2,1 Gamma GT 22 ácido úrico 5,2 PCR 4,2 ferritina 205 insulina 14 cortisol 12,9 estradiol 19 progesterona 0.3 fsh 68 LH 20 tsh 2,55 t 4 livre 0,93 sorologia não reagente DAS não infeccioso urocultura negativa homocisteína 15 vitamina A 0,4 vitamina D 39 Vitamina C 0,09 Vitamina B12 362 Vitamina E 12 testosterona 10 SHBG 21 anti h bs 2 zinco 95 cobre 92 selênio 101

Ultrassom de tireóide do dia 21/01/2026 nódulos tiroidianos bilaterais n um ti rads 3 n 2 te hartz 3
Ultrassonografia de mamas e axilas nódulo mamá às 12:00 na mama direita 0,3 x 0,2 centímetros às 3:00 mama esquerda 0,4 x 0,3 cm bits 3 
ultrasonografia transvaginal útero amp tivesse refletido volume 72 presença de mioma sub seroso 2,5 x 1,7 cm endométrio 3 mm ovário direito 2,7 ovário esquerdo 3,1 
densitometria óssea do dia 21/01/2026 osteopenia 
mamografia do dia 21/01/2026 birra de 2

Conduta:
Orientações
Vit d, vit b12, vit c 
Oestrogel
Progesterone 
Solicito colonoscopia 
vit b e d 460,00 vit c 240,00
 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61075486, '764', 'SHIRLE SOUZA DAMASCENO', 2, 0, '77259939249', NULL, '(69) 99238-9782', '1981-10-02', 3, 'IDADE: 44 ANOS 
DUM: HISTERECTOMIA 2020 - CA DE COLO DE UTERO 
UPCCU: NOV DE 2025 ( HA)
G0 P0 
COMORBIDADES - DEPRESSAO  (ESCITALOPRAN)

PACIENTE FAZ ACOMPANHAMENTO NO H.A DEVIDO CA DE COLO DE UTERO,  

EXAMES LAB 06/01/26 
COLESTEROL 206/ COLESTEROL LDL 123 HBGLICADA 6/ TGO 62/ TGP 75/ VIT B 12 430/ VIT D 29/ESTRADIOL < 5 / FSH 129/ LH 60/
PROGESTERON < 0,05 

CONDUTA: 
ORIENTACOES
US TV 
USG DE MAMAS 
USG DE ABDOME TOTAL 
VITMINA B 12 E D 460,00
PRESCREVO ALTA D 50.000 UI DOZEMAST E VITERGAN MASTER N 
ENTREGO AMOSTRA DE DOZEMAST E VITERGAN MASTER N 

----------
08/04
PACIENTE REFERE LABILIDADE EMOCIONAL, ALEGA FOACHO, REFERE ALTA HOSPITALAR DO HOSPITAL DO AMOR - ACOMPANHAMENTO DO CA DE UTERO  5 ANOS 
EM ACOMPANHAMENTO COM PSIQUIATRA RETORNO EM MAIO 
ALEGA QUE VAI FAZER ACOMPNHAMENTO COM DERMATOLOGISTA DEVIDO MANCHAS HIPOCROMICAS DE 0,2 CM DIFUSA EM BRACOS, FEZ RASPAGEM NEGATIVA SIC ( DR MACARIO), BARRIGA E COSTA 

Ultrassonografia das mamas do dia 21/03/2023 26 beatz um ultrassonografia da glândula tireóide do dia 21/03/2026 exames sem alterações ultrassonografia de abdômen total dia 21/03/2026 achados sugestivos de doença hepática existia totka esteatose hepática grau 2 demais estruturas sem alterações ao métodos ultrassonografia transvaginal do dia 21/03/2026 útero ausente ou vários não visualizados é exame sem alterações evidente ao metODO
CONDUTA: 
AGUARDO PREVENTIVO
RETORNO COM 3 MESES PARA AVALIAR PERFIL HEPATICO
DIETA ALIMENTAR  
PACIENTE DESEJA REPOSIAO HORMONAL
FAZER EXAME COM 3 MESES APOS TTO DE ESTEATOSE HEPATICA E PSQUIATRA 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60635234, '693', 'SILANEIDE MARIA DA SILVA', 2, 0, '27234495215', NULL, '(69) 99299-2383', '1967-04-06', 3, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59102670, '341', 'Silene silva santos', 2, 2, '05038914284', NULL, NULL, '1970-02-26', 3, 'sem queixas, deseja exames.
06/09/24
 entrega de exames 15/08/24 paciente refere dor em baixo do ventre, sem secreção vaginal.
vit 19, t4 livre 0,93, hb 14,8, ht 41,9, leuc 6,200, plq 363,000, eas: epiocito, col 209, trig 110, glicose 104.

conduta: dieta, vit d, triplo a.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59123038, '357', 'Silmara Rodrigues Lopes De Assis', 2, 1, '05038914284', NULL, NULL, '1995-01-21', 3, 'Gestante  32 sem e 4 dias pelo usg 18/01/22 8 sem.
No momento assitomatica, refere boa movimentação fetal, nega perda vaginal.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59123664, '358', 'Silva Andreia C de munoz', 2, 1, '05038914284', NULL, NULL, '1981-03-25', 3, 'Q.P: rotina ginecologica, ardencia na região intima.
Ao exame genitalia hiperemiada, grumo em parede.
Conduta: crevagin, flogorosa, flucunazol, trok.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61300036, '807', 'Silvana Maria Muniz Andre', 2, 2, '22787216234', NULL, '(69) 9238-4334', '1965-12-09', 1, 'IDADE 60 ANOS 
G3P 3 A 0
MC VASECTOMIA 
CIRURGIAS: CESAREA /HISTERECTOMIA 2001 DEVIDO MIOMATOSE UTERINA E SUA /OOFORECTOMIA A DIREITA 
UPCCU: 2022
COMORBIDADES: HAC
QP:  paciente encaminhado pela era Giselle Almeida para investigação devido irmãs  com câncer de lingual e outra Irma câncer de mieloma múltiplo.

AO EXAME




NOME: Silvana Maria Muniz Andre
DATA: 06/04/2026
Aparelho: Colposcopia Medpej com Sistema de Vídeo

VULVOSCOPIA 

Vulvoscopia revestida por pele apropriada para a idade, superfície áspera e descamativa.
Região vulvar com anatomia preservada, sem alterações estruturais evidentes.
Epitélio de coloração rósea, homogêneo, sem áreas acetobrancas, sem pontilhado, mosaico ou lesões suspeitas. Foi evidenciado na região de grande lábio esquerdo pápula de mais ou menos 0,3 cm de coloração hipercrômico, castanho-escuro, delimitado 
Região perineal e perianal sem alterações.
Ausência de anormalidade à vulvoscopia simples com uso de ácido acético a 5%

Conclusão: Exame dentro dos padrões de normalidade.

  

___________________________
Dra Christiane Alves Calixto
CRM 3316 RQE 1250

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61375486, '824', 'SILVANIA PEREIRA DOS SANTOS', 2, 0, '72038420297', NULL, '(69) 99271-2037', '1980-11-10', 3, '45 anos 
DUM: JANEIRO DE 2026
G 3 P2 A1 
MC: PRESERVATIVO
UPCCU: ABRIL DE 2025
UMMG: OUT 2025
USG DE MAMAS 09/10/2025: BI RADS 3 NODULO EM MAMA ESQUERDA 11 H 14X 8 MM E 3 H 21 X 10 MM
USG TIREODE 22/04/25: NODULO EM TIREODE A DIREITA 7,2 X 6 MM

QP: PACIENTE ALEGA ALGIA MAMARIA, ALEGA SER EX TABAGISTA ( PAROU EM DEZ 2025)

CONDUTA: 
SOLICITO USG DE MAMAS 
TRAZER MMG DO ANO PASSADO 
SOLICTO PREVENTIVO ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61075610, '765', 'SIMONE FERREIRA DA SILVA', 2, 0, '89385071220', NULL, '(69) 99316-2076', '1987-12-22', 3, 'IDADE: 38 ANOS 
DUM: 05 DE JANEIRO DE 2026 
CIRURGIAS: APENDICECTOMIA EM 2023
UPCCU: 2025
MC: PRESERVATIVO
G2 P2 A0 

QP: PACIENTE REFERE IRREGULARIDADE MENSTUAL, DOR EM BAIXO VENTRE, ALEGA DISURIA 

CONDUTA: 
ORIENTACOES 
SOLICITO EAS
USG TV 

------------
17/04

usg tv 06/03/26: utero 138,8 / end 8 mm/ od 9,9 oe 9,4 exame normal 
paciente refere dispareunia 
conduta:
orientações 
aguardo preventivo 
entrego 2 amostra de elane ciclo
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59407764, '478', 'Simone marques de Menezes', 2, 0, NULL, NULL, '(69) 9911-1841', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59537059, '508', 'Simone ramos dos santos', 2, 0, '80396020259', NULL, '(69) 8133-0224', '1985-02-24', 1, 'IDADE; 40 ANOS 
G 1 P1C (DCP)
DUM; 09/06/25 PROFISSAO AUTONOMA ( ESTETICA) 
UPCCU:  2024?
MC: PRESERVATIVO  NO PERIODO FERTIL 
CASADA HÁ 2 ANOS, RELACAO SEXUAL FREQUENTE,  5 VEZES NA SEMANA 
PARCEIRO INDIANO 
PACIENTE REFERE TER MEDO DE ENGRAVIDAR, FEZ USO DIU DE MIRENA POR 4  ANOS, DEPOIS TROCOU POR DIU DE PRATA, EXPULSOU DIU , CICLO 21 
ATUALMENTE NEGA DISPAREUNIA, NEGA SECRECAO VAGAINAL, NEGA SECURA VAGINAL, NEGA DISURIA, FLUXO  MESTRUAL DE 5 DIAS, MODERADO / INTENSO ( AS VEZES NECESSITA DE USO DE ABSORVENTE NOTURNO), NEGA NÓDULO NA MAMA, NEGA ALGIA 

AO EXAME:
COLO CILINDRICO, PUNTIFORME, MUCO HIALINO 

CONDUTA: COLETADO PREVENTIVO, SOLICITO USG TV, EXAMES LAB, MMG , USG DE MAMAS E AXILARES, ORIENTACOES GERAIS 
REALIZOU LASER INTIMO E LASER PARA CLAREAR 2100,00
HOME CARE 480,00
PAGAMENTO A VISTA 2580,00 PIX


NINFOPLASTIA 7500,00 A VISTA
8900, 00 EM 4 VEZES

----------  /// --------
RETORNO ON LINE 01/07
PACIENTE REFERE DESEJO DE INSERCAO DE GESTRINONA , NADH, TESTO - IMPLANTE 6 - 7 MIL 
EXAMES LAB PROGESTERONA INFERIOR 5, INSULINA E GLICOSE TOCADA
RETORNA PARA O BRASIL 3 - 4 MESES - REPETIR EXAMES 
PROGESTERONA 100 MG 1 VEZ AO DIA 
INICIAR HOME CARE PARA CLAREAMENTO ANTES DE DORMIR 
-----------------------------------------------------------------

17/02/2026

dum: 23/01/2026
MC: NENHUM 
IDADE: 40 ANOS 

QP: PACIENTE REFERE DIMINUICAO DA LIBIDO, CANSACO EXCESSIVO, FALTA DE DISPOSICAO,  ( TRABALHO?/ HORMONAL? / VITAMINAS?) 
PACIENTE REFERE CANAL VAGINAL RESSECADO 

CONDUTA: 
ORIENTACOES 
EXAMES LAB 
USG TV 
USG DE MAMAS 

----------- 07/03
PACIENTE RETORNA 
 RESULTADO DE EXAMES LAB: VIT D BAIXA 
---------------
09/04
MAMAS 24/02/26 BI RADS 2
USG TV 24/02/26: ADENOMIOSE 
PACIENTE REFERE QUE NAS ULTIMAS MENSTRUACAO QUEIXOU SE DE DISMENORREIA E AUMENTO DO FLUXO 
PACIENTE REFERE USO DE DIU E EXPULSAO DO MESMO ]
CONDUTA; CONVERSO SOBRE A POSSIBILIDADE DE DIU DE MIRENA ( PACIENTE REFERE QUEE FEZ USO MAS EXPULSOU )
BAIXAR APP FLO PARA MARCAR MENSTRUACAO 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60807261, '710', 'Simone Vinhork Nogueira', 2, 0, NULL, NULL, '(92) 8198-5705', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61889408, '938', 'Soleni Rosa de Amorim', 2, 0, '80046584234', NULL, '(69) 99262-6147', '1982-05-15', 1, 'Paciente tem interesse em uma consulta On-Line Valor 300,00

mc: diu de mirena 
comorbidades mioma 

Em geral, recomenda-se iniciar levotiroxina quando:
TSH ≥ 10 mUI/L.
Gestação ou planejamento gestacional.
Sintomas compatíveis com hipotireoidismo.
Presença de bócio.
Anti-TPO positivo.
Doença cardiovascular ou fatores de risco selecionados, após avaliação individual.
Para TSH entre 4,5 e 10 mUI/L (como neste caso):
Se a paciente for assintomática e não houver fatores de risco, é razoável 
conduta: repetir TSH e T4 livre em 2–3 meses para confirmar a persistência da alteração antes de iniciar tratamento.

pregabalin e voric e matem diu de mirena 
nova consulta em outubro 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61903288, '940', 'Sônia Angela Martins', 2, 0, '00640404103', 'sfolo63@gmail.com', '(69) 98124-8414', '1974-07-26', 1, 'Paciente Sonia 52 anos 
Relato da paciente: Refere que passou a apresentar alterações na saúde íntima e sintomas que anteriormente não sentia. Relata que acredita que a consulta poderá ajudar a identificar a causa dessas mudanças. Não especificou os sintomas no momento do agendamento.

05/08/2026
VENDEDORA DE MEDICACAO PARA HOSPITAL PUBLICO ( VIAJANTE) 
52 anos
G3 P3cA0 - HISTORIA DE ECLAMPSIA COM NECESSIDADE DE HISTERECTOMIA PARCIAL ???
DUM: 22 ANOS 
SEPARACAO AOS 26 ANOS  - NAMOROU POR 6 ANOS, POREM TERMINOU A POUCO TEMPO
UMMG 2020
UUSG TV 2020
DENSITOMETRIA OSSEA NUNCA REALIZOU
PREVENTIVO 2026 
MEDICACAO EM USO - SISTEN ADESIVO, TESTOSTERONA/ DEKADORABOLIN/ 

PACIENTE REFERE QUE DESCOBRIU TRAICAO DO NAMORADO, FEZ  PREVENTIVO EM 2026 RESULRTADO NEGATIVO E POSITIVO  GARDNERELLA, TRATOU COM CREME VAGINAL, MAS NOA MELHOROU, NAO LEMBRA O NOME DA MEDICACAO 
ALEM MENCIONA QUE ESTA NO USO DE SISTEM ADESIVO, POREM PALPITACAO\\, NEGA FOGACHO  

AO EXAME
COLO CENTRALIZADO, PUNTIFORME, SECRECAO FLUIDA, COM ODOR, PRESENCA DE COLORACAO FRANBOEZA
COLO ATROFICO 
CONDUTA:
SOLICITO USG TV
USG DE MAMAS E AXILARES
EXAMES LAB
MMG 
AZITROMICINA
TRIVAGEL N 
SECNIDAZOL 
NOME: Sônia Angela Martins


Uso oral

1.	Azitromicina 500 mg  _________________02 comprimidos 
Tomar 02 comprimidos via oral, dose única.

2.	Secnidazol 1 g _______________________02 comprimidos
    Tomar 02 comprimidos via oral, dose única.

Uso vaginal

3.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 10 dias.



05/08/2026
Exames laboratoriais do dia 2/09/2026 hemoglobina glicada 5,7% hemoglobina 13,1 hematopo 37,2 leuco 4010 plaqueta 176000 glicemia e jejum 80,4 colesterol total 227 ldh 139 hdl e 37 triglicerídeo 253 creatinina zero ponto 65 ureia 40 tgo 68 tgp 113 ferro sérico 148 de dímero 780 t 3 3,91 t 4 livre 1,19 TSH 0,01 esterdiol 123 LH 12 FSH 9,7 progesterona 1,3 testosterona total 121 s hbg 184 testosterona total 121 shp g e 84 fã não reagente ferritina 1557 homocisteína 20,6 herpes imune Vitamina B12 593 vitamina D41 
conduta 
orientações 
reposição de vitamina B12 injetável paciente traz ampola 
protocolo de vacina  para herpes
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62116451, '980', 'SONIA MARIA DOS SANTOS', 2, 0, '84062193272', NULL, '(69) 99372-2039', '1984-10-23', 3, 'Kauane Thais faria de Queiroz data da última menstruação 5/08/2026 peso 78 kg altura 1 e 70 PA 120 x 80 mmhj método contracetivo implant gesta 00 aborto zero menarca aos 13 anos comorbidade nega cirurgia prévia nega o último preventivo há mais de 1 ano queixa principal retorno para A Entrega de exames faz uso de implano com sangramento uterina normal

Exames laboratoriais do dia 12/08/2026 hemoglobina 13,1 hematox 41 Leo 8190 plaqueta 246000 glicose 93 ure 25 creatinina 0.7 colesterol 160 triglicerídeos 113 TGO 26 TGP 36 t 4 1,05 tsh 2,47 exame de urina não infecioso presença de oxalato de cálcio 
USG transvaginal do dia 1/09/2026 útero 33,4 cm³ ovário direito 2,4 ovário esquerdo 4 cm³ exame ecográfico sem alteração

----------------------------------------------------

02/09/2026


USG TV do dia 24/06/2026 útero 73,2 ovário direito ovário esquerdo para parênquima habitual pólipo endometrial 
preventivo negativo para neoplasia gardenerela vaginal data 20/10/2025
Exames laboratoriais no dia 26/05/2026 hemoglobina 10,5 hematocton 33 leucos 6000 plaqueta 359 coglograma normal as do úrico 3,3 glicose 86 ure 24 creatinina 0.7 o colesterol 185 triglicerídeo 104 só de 141 potássio 4 cálcio 9 magnésio 2 tgo 23 tgp 29 estradiol 89 fsh 8,2 lh 8,7 tsh 3,1 t 4 livre 1,1 progesterona 0,1 sorologias não reagentes 

CONDUTA:
 ORIENTACOES 
paciente encaminhada para exército de pólio endometrial em rede SUS
TTO DE GARDNERELA JA REALIZADA


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61396781, '837', 'Sophia clara dos santos pereira', 2, 0, NULL, NULL, '(69) 8148-7320', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59102629, '340', 'Sophia Ribeiro Pinheiro', 2, 1, '05038914284', NULL, NULL, '2008-11-28', 3, 'Q.P: paciente refere dor em baixo do ventre, há 5  meses.
realizou usg de abdome total 21/09
presença de formação cistica hemorragica 4,3x4,0x3,5 vol 31cm.
conduta: triplo a.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61204702, '792', 'SORAYA SOUZA DAMASCENO', 2, 0, '87088789272', NULL, '(69) 99323-2510', '1977-01-11', 3, 'IDADE: 49 ANOS 
DUM: 38 ANOS 
G 0 P0
ANSIEDADE - SERTRALINA 
ESTUDANTE DE ESTETICA NO SENAC Á TARDE
SEM ATIVIDADE SEXUAL NO MOMENTO HÁ MAIS DE 5 ANOS 
UPCCU: +3 ANOS 
MES RETRASADO 46
PESO 44 400G

QP; PACIENTE CEFALEIA ( MAIS DE 3 MESES) REFERE EMAGRECIMENTO INTENSO, ESTRESSE, ANSIEDADE, SONO INTENSO 
REFERE ALGIA LOMBAR, ALGIA NAS ARTICULACOES 
REFERE CONSTIPACAO 

CONDUTA: ORIENTACOES 
EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58926319, '55', 'Stefany Thalia  Ferreira Liberato', 2, 0, '03525432216', NULL, '(69) 8444-7165', '1997-10-31', 1, 'IDADE 27 ANOS
DUM; 02/02
PROFISSAO: CONTABILIDADE, POREM NO MOMENTO NAO ESTA TRABALHANDO 
G 2 P 0 A 2 ABORTOS
1 ECTOPICA, ABORTO 
PACIENTE USUARIA DE DIU DE MIRENA  (INSERIU JANEIRO DE 2024), MARCO RECOLOCOU O DIU, 
UPCCU JUNHO 2024
DIA 20/01/24 APRESENTOU SANGRAMENTO VAGINAL COM  DOR PELVICA, ENCAMINHEI A MMME, DEVIDO ABORTO, REALIZOU USG TV 20/01, EXAME NORMAL, UTERO 45, ENDOMETRIO 3,5 MM, OD 7,1 E OE 7,8 

ORIENTA QUANTO A GESTACAO E CONTRACEPCAO, DESEJA MENSTRUAR, NAO DESEJA GESTAR NO MOMEWNTO ANTES DE FAZER OS EXAMES, APRESENTA SE INSEGURA COM A PERDA DO BEBE, 

COLO PUNTIFORME, PRESENCA DE SECRECAO AMARELADA COM BOLHASAS
CONDUTA: ORIENTACOES 
ESCOLHE ACO  - amora 
GYNOTRAN, SECNIDAZOL
uso tv, exames lab
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61914820, '928', 'Stefhany Luana Fontinele de Cristo', 2, 0, '06653627225', 'stefhanydecristo@gmail.com', '(69) 99328-2775', '2011-06-14', 3, 'idade 15 anos 
DUM: 10/07/26
SEXARCA AUSENTE 
MENARCA: 11 ANOS 
COMORBIDADES: NEGA 

QP: HIPERTROFIA E ASSIMETRIA DE PEQUENO LABIOS LADO ESQUERDO 
SECRECAO ESBRANQUICADAS SEM PRURIDO 
ALEGA FOLICULITE 

CONDUTA NINFOPLASTIA E TROK 

6 mil em 6 vezes 
5500,00 a vista 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61445909, '843', 'Stephane Lauany Souza Silva', 2, 0, NULL, NULL, '(69) 9287-3144', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60464765, '635', 'Suelen Cristalino Bonfim', 2, 1, '07453394171', NULL, '(69) 9225-3102', '2001-01-17', 1, 'IDADE: 24 ANOS
DUM------
MC: DIU DE MIRENA 2021
HIPOTIREOIDEISMO - PURAN 112 MG

QP
; PACIENTE VEM PARA CLAREAMENTO INTIMO , ( JA FE PEEELING COM DERMATOLOGISTA - AC RETINOICO 3 SESSOES - KATIA BOTELHO)
LASER PARA CLAREAMENTO INTIMO
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59174270, '410', 'Suelen de Lima Santos', 2, 0, '02305761252', NULL, '(69) 9387-8181', '1995-11-14', 1, 'PACIENTE REFERE PICO DE FREBRE NAO AFERIDA SABADO E SEGUNDA, ALEGA DISMENORREIA E SECRECO COM RAIA DE SANGUE 

AO EXAME 
COLO POSTERIOR, PRESENCA DE SECRECA VAGINAL ESRANQUICADA, SEM ODOR 
CORTO UM POUCO MAIS O FIO DO DIU

CONDUTA: METRONIDAZOL, TRIPLOA E CREVAGIN, SOLICITO EXAMES LAB ( HEMOGRAMA, PCR, EAS E UROCULTURA ) 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59122862, '355', 'Sueli Loma Da Silva Flores', 2, 2, '05038914284', NULL, NULL, '1975-11-06', 3, 'Paciente alega algia mamaria, refere histerectomia em 2021, parou propria o uso de eutrox 75 mg.
Conduta: usgtv, mama, abdome total, mmg, densitrometria ossea, exmaes lab.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60879636, '724', 'Suellen Ketllen Costa Pinheiro', 2, 2, '01967140286', NULL, '(97) 9166-6419', '1994-08-27', 1, 'IDADE: 31 ANOS 
DUM: 02/01/2026
MC: VASECTOMIA 

Exame laboratorial dia 27/10/2025 hemoglobina 13,6 hematócrito 40,10 leu postos 6600 plaqueta 260000 ácido úrico 1,8 colesterol total 194 ldl 135 HDL 43 creatinina 0,6 glicemia em jejum 81,5 to 30,7 TGP 23,4 triglyceride 80 ureia 28,2 ferro sérico 144 tsh 1,3 t 4 livre 0,95 estradiol 248 FCH 3,5 LH 4,4 prolactina 18,4 testosterona livre 55,6 testosterona total 52,1 Vitamina B12 854 Vitamina D 43,3 Vitamina A 0,42 Vitamina C 3,1 urocultura negativo para crescimento bacteriano

ultrassonografia mamária do dia 6/11/2025 bi rads um
ultrassonografia transvaginal do dia 6/11/2025 útero ante verso fletido 92,3 cm³ endométrio 5,8 mm ovário direito 9,8 ovário esquerdo 9,5 conclusão exame normal
Preventivo do dia 22/11/2025 negativo para células neoplásicas compatível com inflamação inespecífica
10/11/2025: POSITIVO Ureaplasma urealyticum

CONDUTA: CONDUTA: AZITOMICINA 1 G PARA O CASAL 
VITAMINA D IM 240,00 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61838760, '931', 'Suely Dourado da Silva', 2, 0, '43798527253', 'sulaejoao4@gmail.com', '(69) 9250-5120', '1974-04-18', 3, 'MAMOGRAFIA 27/11/25; BI RADS 1 
PREVENTIVO 30/10/2025: NEGATIVO PARA NEOPLASIA 

QP: PACIENTE REFERE ALGIA E EDEMA EM REGIAO CERVICAL, QUE IRRADIA PARA BRACO ESQUERDO, ALEGA AMENORREIA HÁ 8 MESES .
---------------------------------------------------------------------------------------------------------------------------------------
Paciente: Suely Dourado de Silva
Data: 15/07/2026
Idade: 50 anos
Data de nascimento: 18/04/1974
D.U.M.: Há 8 meses
Estado civil: Viúva
M.C.: Não
G.P.A.: G2 P2N A0
Menarca: 15 anos
Comorbidades: Não
Medicação em uso: Puran
Cirurgia prévia: Ooforectomia direita (anotação indica retirada de cisto)
Último preventivo: Janeiro/2026
Última mamografia (UMMG): Janeiro/2026
Atividade física: Não
Q.P.: Hipotireoidismo
Peso: 65,4 kg
P.A.: 108 × 90 mmHg
Conduta
Orientações
Triplo A
Exames laboratoriais
USG transvaginal (USG TV)
USG de mamas


CONDUTA; 
ORIENTACOES
EXAMES LAB
 USG TIREOIDE 
Uso oral 



1.	Triplo A _______________________________01 Caixa

Tomar 01 comprimido via oral de 12/12 horas, por 3 dias 





', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59123701, '359', 'Sula Miranda Ferreira', 2, 1, '94833907291', NULL, NULL, '1986-10-15', 3, 'Secreção amarelada, com odor, nega dispareunia.
Conduta: exames lab, gynotran.
-----------
05/11/2025
DUM: 05/11/2025
MC: LT
UPCCU: + 3 ANOS 
PACIENTE REFERE SECRECAO AMARELADA COM ODOR, 
SECNIDAZOL, FLUCONAZOL, GYNOTRAN, 
Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos via oral dose única para o casal.
2.	Fluconazol 150 mg _________________02 comprimidos
Tomar 01 comprimido via oral e repetir com 7 dias 

Uso vaginal 

3.	Gynotran ___________________________01 caixa 
Aplicar 01 óvulo via vaginal, à noite, por 7 dias 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59102895, '343', 'Sulaneri De Souza Paiva', 2, 1, '05038914284', NULL, NULL, '1985-12-06', 3, 'Paciente sem  queixas.
bhcg +
conduta: exames lab, usgtv, dtn fol, retorno.

25/10/23
13  sem e 5 dias.
Assitomatica, alega que não consegue fazer o uso din-fol, alega que apareceu lesões bolhosas +- 1 mês, sem queixas, desaparecendo sem medicação.
1 usg 11/10/23 11 sem e 5 dias.
Conduta: feminis, teste herps, bacterioscopia, usg morofologica 1 trim, aguardo eas e urocultura.

22/11/23
paciente não conseguiu realizar usg morofologica 1 trim.
ig 17 sem e 5 dias ( usg 11/10/23 11 sem e 5 dias)
glicose 87, hb 12,05, ht 35,6, snr, anti hbs 5,75, rubeola imune, toxo suceptivel, em uso de feminis.
Conduta: morfo 2 trim.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60306625, '629', 'Suyanne Assunção De Oliveira Leite', 2, 0, '03878609248', NULL, '(69) 9328-8998', '2005-11-05', 1, '19 ANOS 
DUM: 12/08
MC: PRESERVATIVO
GO PO 
SEXARCA 19 ANOS ( +/- 4 MESES)
COMORBIDADES: SOP/ ENDOMETRIOSE 
VACINA : NAO SABE INFORMAR 

PACIENTE REFERE COM DIAGNOSTICO DE SOP E ENDOMETRIOSE AOS 14 ANOS, FEX USO IMI ES, POREM PAROU POR CONTA PROPRIA E NO MOME NTO FAZENDO USP DE PRESERVATIVO, ALEGA DISMENORREIA INCAPACITANTE 
REALIZOU  EXAMES DE IMAGEM, POREM NAO GUARDOU.
PACIENTE REFERE SECRECAO ESBRANQUICADA, COM PRURIDO, NEGA ODOR, NEGA DISURIA 
COLO ANTERIOR, PRESENCA DE SECRECAO ESBRANQUICADA, ECTOPIA

CONDUTA": ORIENTACOES, 
COLETADO PREVENTIVO
USG TV, EXAMES LAB, 
 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59102726, '342', 'Suzane Melo Texeira', 2, 2, '05038914284', NULL, '(69) 99366-6296', '1988-07-02', 3, 'usg obst 28/07/23
13 sem e 3 dias embrião não vizualizado.
bhcg + 27/07/23
conduta: repetir usgtv, retornar, gastrol.

21/02/24
ig 35 semas e 3 dias.
peso 75,400
pa 110x70
au 35 cm, bcf 151bpm mf+
usg morfol 1 trim e 2 trim ok
vacina ok
totg 15/01/24  82/120/111
18/12/23 100/01/14
anti hbs negativo
ts=  o+ 
cultura streptococus irá coletar.
ecocardiograma fetal.
perfil glicemico, apresentando hipoglicemia em jejum.
mobilograma 3x 1 dia.

conduta: mobilograma 3x 1 dia, alimentar- se a cada 3 horas, evitar hipoglicemia, solicito eco, aguardo cult streptococus, oriento sobre sinais de alarme , perfil 4 pontos, atestado 2 dias t 78,4, entrego licença maternidade.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61335824, '811', 'SUZANE MELO TEXEIRA', 2, 0, '95324178268', NULL, '(69) 99366-6296', '1988-07-02', 3, 'usg obst 28/07/23
13 sem e 3 dias embrião não vizualizado.
bhcg + 27/07/23
conduta: repetir usgtv, retornar, gastrol.

21/02/24
ig 35 semas e 3 dias.
peso 75,400
pa 110x70
au 35 cm, bcf 151bpm mf+
usg morfol 1 trim e 2 trim ok
vacina ok
totg 15/01/24  82/120/111
18/12/23 100/01/14
anti hbs negativo
ts=  o+ 
cultura streptococus irá coletar.
ecocardiograma fetal.
perfil glicemico, apresentando hipoglicemia em jejum.
mobilograma 3x 1 dia.

conduta: mobilograma 3x 1 dia, alimentar- se a cada 3 horas, evitar hipoglicemia, solicito eco, aguardo cult streptococus, oriento sobre sinais de alarme , perfil 4 pontos, atestado 2 dias t 78,4, entrego licença maternidade.
-----------------------
10/04
DUM: 05/02/26
USG OBSTETRICA 10/04/26: 9 SEM E 1 DIA
CONDUTA; SOLICITO EXAMES DE PRE N ATAL

ORÇAMENTO MÉDICO

Paciente: Suzane Melo Teixeira
Procedimento: Cesariana + Laqueadura Tubária (LT) + Laser pós parto 
Descrição dos serviços:
Realização de procedimento cirúrgico obstétrico (cesariana) associado à laqueadura tubária, incluindo assistência médica completa durante o ato cirúrgico.
Honorários Médicos:
R$ 12.000,00 (doze mil reais)
Condições:
•	Valor referente exclusivamente aos honorários médicos.
•	Não inclui despesas hospitalares, materiais, medicamentos ou equipe adicional.
•	Forma de pagamento a combinar.
Validade do orçamento: 30 dias

--------------------------------
08/05/2026
PACIENTE REFERE ABORTO COM CURETAGEM UTERINA 9 17/04/2026
USG TV 14/05/2026
USG TV SUGESTIVO DE ABORTO RETIDO 8 SEMANAS E 6 DIAS 
INSERCAO DE DIU DE COBRE 
USG TV 02/05/2026
UTERO 75, ENDO4,9 MM OD 14,3
OE 8,4 
DIU NORMOPOSICIONADO 

CONDUTA: ORIENTACOES 
NINFOPLASTIA 7 MIL
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61229721, '800', 'Taciane dos Santos Martins', 2, 0, NULL, NULL, '(69) 9341-9640', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59580257, '521', 'Taina Luzia Moura Ramos', 2, 2, '00893638250', NULL, '(69) 9952-5464', '1994-02-19', 1, 'idade: 31 anos
g4 p2 a2 ( CURETAGEM UTERINA 04/04/25)
MC: ----
DUM: 12/06
UPCCU: 12/06 

QP; PACIENTE REFERE QUE ABRIL APRESENTOU ABORTO INCOMPLETO, NECESSITANDO DE CURETAGEM UTERINA ( 8 SEM ) EM G. MIRIM, AOS 10 DIAS DO ABORTO, 
AO EXAME
COLO ANTERIOR, EM FENDA PRESENCA DE MUCO (PERIODO FERTIL), SECRECAO ESBRANQUICADA BLOLHOSA, 
TV; DOR A MOBILIZACAO DO COLO

CONDUTA: COLETADO PREVENTIVO
EXAME LAB 
SOLICITO USG TV
REALIZAR TT PARA DIP E VER RESULTADO DE USG 

USG TV 25/06: UTERO 66CC, ENDOMETRIO 4,5 MM, OD 8,1 OE 6,7 
TTO DE DIPAGUARDO EXAMES 

Protocolo ev e im
1130,00 a vista.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61509166, '858', 'TAINARA DA SILVA HOLANDA', 2, 0, '02428718282', NULL, '(69) 99245-9180', '1995-07-07', 3, 'Thaynara da Silva Holanda 
data da última menstruação dia 6 de maio 
idade 30 
gesta zero parto zero 
método contraceptivo anticoncepcional oral selene n
Nega alergia 
MASTOPEXIA 
nega Uso de medicação 
preventivo há 1 ano 
paciente vem para a rotina ginecológica 
conduta exames laboratoriais ultrassonografia transvaginal e preventiva
_______________________

10/06/2026

PRESENÇA DE HIPERTROFIA ASSIMETRIA DE PEQUENOS LABIOS ESQUERDO, PREGA ACESSÓRIA 
NINFOPLASTIA + PREGA ACESSORIA DE 7500,00

COLETADO PREVENTIVO
COLO CENTRALIZADO, PUNTIFORME, SECRECAO ESBRANQUICADA COM GRUMOS 

REALIZADO PREVENTIVO E USG TV 

NOME: TAINARA DA SILVA HOLANDA
DATA: 10/06/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 7,46 x 3,06 x 3,70 cm (volume: 43,92cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.
. 
Endométrio: centrado, ecogênico e com espessura de 1,5 mm de basal a basal.

Ovário direito: tópico, volume de 3,27 cm³, de forma habitual, contorno preservado e textura normal.

Ovário esquerdo tópico: volume de 5,05 cm³, de forma habitual, contorno preservado e textura normal.

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Exame de ultrassonografia dentro dos limites da normalidade normalidade.


OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.






___________________________________
DRA CHRISTIANE ALVES CALIXTO 
CRM 3316/RO


--------------------------
480,00 vitaminas 


', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124375, '365', 'Tais Bispo Magalhães', 2, 2, '05038914284', NULL, NULL, '1996-08-22', 3, 'Apresenta glandula na região  intima, glandula de bartholin, drenagem.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124695, '366', 'Taline Leuano Silva', 2, 1, '05038914284', NULL, NULL, '1999-11-06', 3, 'Apresentar resultado de exames, sem queixas no momento.
preventivo 10/06 negativo
exames lab 10/06 colesterol 211 
usg de mamas bi-rads1  10/06
usgtv 10/06 utero 43,3, end 3,2mm, od 7,2, oe 3,2, ovario direito aspcto policistico.
conduta: diane 35.
retornar com 1 mes, 3 meses, 6 meses, 1 ano.
redução alimentar, perfil lipidico, 1 mes adaptação aco, colesterol, nutricionista.

20/03/23
dum 
em uso de diane 35, alega aumento de fluxo, já está em acompanhamento com o nutricionista.
solicito: usgtv, exames lab, troco aco diane 35 por molieri.

19/01/24
iniciou academia hoje, retorno para mostrar exames.
14/11/23 col 196, trig 214, glicemia 105, hb 13,5,
usgtv 07/12/23 exame normal, utero 33,4, od 4,1, oe 2,8.
conduta: dieta + exercicio, retorno 4 meses.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59470864, '493', 'Talita Yasmin Gouvea De Olivera', 2, 0, '07420807221', NULL, '(97) 98426-3343', '2006-04-12', 3, 'IDADE: 19 ANOS 
DESEJA INSERCAO DDE DIU DE COBRE PELO SUS, ALEGA POS PARTO VAGINAL HÁ MAIS OU MENOS 35 DIAS  
ENCAMINHO PARA CIMI ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60229935, '611', 'Tamara Barreto Lopes', 2, 2, '02165000289', NULL, '(97) 8400-1777', '1994-01-01', 1, '31 ANOS 
DUM: 23/08/2025
G0 P0
MC: NENHUM
PREVENTIVO 25/04/2025: NEGATIVO PARA NEOPLASIA 
COMORBIDADE: NEGA 
QP; DOR EM BAIXO VENTRE, DIAPREUNIA NO INTROITO VAGINAL 
REFERE CANDIDIASE DE REPETICAO  
ALEGA TAMBEM UMA MANCHA HIPERCROMICA 

AO EXAME:
VITILIGO
MANCHA HIRPECROMICA EM PEQUENO LABIO DIREITO 
ECTOPIA 


CONDUTA: ORIENTACOES 
\\ANATOMOPATOLOGICO

1.	Exerese de macha hipercomica em pequeno labio lado direito 

2.	Biopsia de colo de útero as 11 horas 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124114, '362', 'Tania Ramos sofré Rodrigues', 2, 2, '05038914284', NULL, NULL, '1979-03-29', 3, 'apresenta:
usg mamas 30/04 bi-rads1
exames lab 19/10/23 hb 12,6, 38, 11,800, glicose 124, eas normal, tgo 20, tgp 21, creat 0,91.
conduta: solicito dosagem hormonal, avaliar possibiliade de t.h.r, mmg.

13/08/24
glicose 145, col 266, trig 216, tsh 5,01, t4 0,88, tsh 5,37, lh 0,32, estradiol 15,9, vitb12 547, vitd 18,4.
conduta: reposição vit b12 e d, melhorar padrão anabolico, encaminnho endocrino.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62212501, '1000', 'Tatiana figueira aloy losekann', 2, 0, '98891340049', 'Tatialoy@gmail.com', '(92) 98133-6163', '1979-08-01', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61666261, '897', 'Tatiana Nolêto Neves', 2, 0, '81486596215', NULL, '(69) 99201-2835', '1985-06-16', 1, 'IDADE 41 ANOS
DUM: 23 /05/2026
MC: VASECTOMIA 
G 1 PN A0
UPCCU: JULHO DE 2025

QP: PACIENTE REFERE POLIURIA, PRECISA LEVANTAR PARA IR AO BANHEIRO, REFERE QUE TEM A SENSACAO QUE NAO ESVAZIOU COMPLETAMENTE A BEXIGA, ESSE QUADRO INICIOU NA INFANCIA, POREM PIOROU AO QUADRO DESDE 2026, RELACIONADO AO EMPREGO QEU TEVE UM QUADRO EMOCIONAL SIGNIFICATIVO( ENXAQUECA E ROSACEA) 

06/12/2026: IUE, INSUFICIENCIA ESFICTERIANA INTRISECA
27/03/2023 - IUE TIPO II
03/072025: EXAME NORMAL, RESIDUO POS MICCIONAL 90 ML 
26/06/2025: USG DE ABDOME TOTAL, RESIDUOL POS MICCIONAL DE 85 ML 

Exames laboratoriais do dia 12/05/2026 hemoglobina glicada 5,8 glicose 102,8 glicemia pós prandial 113 colesterol total 163 triglicerídeos 53 UREIA 21 CREATININA 0.7 TGO 28 tgp 30
CONDUTA: SUGIRO 4 SESSOES DE LASER INTIMO
SOLICITO EXAMES LAB 
TERAPIA 
20/06: AS 9H 

------------------------------------
1) SESSAO DO LASER

----------------------------------
13/07

PACIENTE REFERE QUE 07/07/2026: APRESENTOU ITU, ONDE FOI PRESCRITO TRATURIL ( EAS 35 PIOCITOS POR CAMPO 07/07/2026



CONDUTA: ORIENTACOES 
UROCULTURA 
REPOSICAO DE VITAMINAS B 12 E D 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60564130, '663', 'Tatiana Vicentin', 2, 0, '68265891253', NULL, '(69) 9977-7399', '1977-07-08', 1, 'IDADE 48 ANOS 
DUM: 17/10
MC: --------
G 2 P2 A0
UPCCU: 04/06: NEG PARA NEOPLASIA 

QP: PACIENTE COM queixa de flacidez e alargamento do períneo e diminuição da sensibilidade durante a relação sexual e NEGA sensação de frouxidão vaginal

AO EXAME
TOQUE VAGINAL PRESENCA DE DEPRESSAO DO PERINEO POSTERIOR MAIS OU MENOS 3 CM DE PROFUNDIDADE

CONDUTA: CORRECAO DE PERINEO POSTERIOR 9500,00
LASE INTIMO NECESSITA DE 3 SESSOES 1800,00
NINFOPLASTIA E CORRECWO DE CICATRIZ DA EPSIO 7200,00

DAR DESCONTO PARA PACIENTE SE INDICAR FILHA E AMIGA PARA NINFOPLASTIA 

___________________

Paciente vem para realizar o laser para preparação para menopausa, nega IUE, PACIENTE COM queixa de flacidez e alargamento do períneo e diminuição da sensibilidade durante a relação sexual e NEGA sensação de frouxidão vaginal
devido a depressão do períneo posterior apresenta fissura e constipação, essa depressão foi depois do parto vaginal, nao deseja realizar a ninfoplastia porque nao se incomoda com os pequeno lábios 

ao exame

conduta: realizo assepsia, realizo 1 sessao  do laser intimo, receita provagin, zelix, ginobiotta, entrego termo de consentimento 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60236599, '613', 'Tatiane Garcia de Castro', 2, 0, NULL, NULL, '(97) 8444-1596', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124210, '363', 'Tatiane Pereira  De Araujo', 2, 2, '05038914284', NULL, NULL, '1983-05-09', 3, 'Irregularidade menstrual, dor pelvica, dispareunia.
conduta:  exames lab, preventivo, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59529233, '503', 'Tatiane Pereira De Araujo', 2, 2, '78442222200', NULL, '(69) 99369-4133', '1983-05-09', 3, 'PREVENTIVO AGENDADO PARA SEGUNDA- FEIRA DIA 15/06,
PAGO 180,00 REAIS NO PIX

223/06/ 25: emito solicitação de uso tv 

18/8/2025:
PREVENTIVO DO DIA 18/06; NEGATIVO PARA NEOPLASIA E GARDNERELLA
EXAMES DE NAIO VIT D 21,7, VIT BB 12 284
CONDUTA: SECNIDAZOL E GYNOTRAN 
SOLICITO EXAMES LAB VITAMINA D E B 12, AGUARDO USG TV 
decalracao de comparecimento perito vespertino 

-----------------------
03/09/2026

idade: 43 anos
DUM: 19/08/2026
MC: LT
ummg 2024

QP: paciente vem para rotina ginecológica, sem queixas no momento da consulta 

conduta; orientacoes
USG TV 
Exames lab 
preventivo 
usg de mamas 
NOME: Tatiane Pereira De Araujo

SOLICITO

HEMOGRAMA   
UREIA                                           
CREATININA                               
TGO                                                
TGP                                                
FERRO
FERRITINA                                      
GLICOSE
HEMOGLOBINAGLICADA
LIPIDOGRAMA
VITAMINA D3
VITAMINA B12
TSH
T4 LIVRE 
EAS

---------------------------------------
04/09/2026
NOME: TATIANE PEREIRA DE ARAÚJO


DATA: 04/09/2026



ULTRASSONOGRAFIA PÉLVICA TRANSVAGINAL 
TÉCNICA:
Realizado estudo com transdutor endocavitário multifrequencial na modalidade bidimensional.

RELATÓRIO:
Bexiga vazia.

Vagina: com eco central normorrefrigente.

Colo uterino : anatômico

Útero:  em anteversoflexão, centralizado medindo 8,41 X 4,76 X 5,78cm (volume: 111,5 cm³).
Ecotextura miometrial homogênea, sem definição de nódulos.

Endométrio: centrado, ecogênico e com espessura de 5  mm de basal a basal.

Ovário direito: tópico, volume de 3,8 cm³, de forma habitual, contorno preservado e textura normal.

Ovário esquerdo: tópico, de forma habitual, contorno preservado e textura normal, volume de 22,1 cm³, dimensões aumentada ás custa de imagem cística, medindo 2,5 cm, compatível com folículo dominante. 

Ausência de  líquido livre patológico em fundo de saco.


IMPRESSÃO: 
Exame ultrassonográfico da pelve sem alterações significativas, evidenciando folículo dominante no ovário esquerdo, medindo 2,5 cm.



OBSERVAÇÕES IMPORTANTES: 
Este é um exame complementar à consulta clínica e deve ser interpretado em conjunto com dados clínicos e laboratoriais. O resultado é dirigido ao médico assistente solicitante. Na ausência de médico assistente, é sempre orientado agendamento com especialista para avaliação de resultados ou atendimento em emergência mais próxima para definição de conduta adequada.



___________________________________
DRA CHRISTIANE ALVES CALIXTO 
CRM 3316/RO
	RQE 1250
---------------------------------
ULTRASSONOGRAFIA MAMÁRIA

TÉCNICA:
Realizado estudo ecográfico das mamas com transdutor setorial multifrequencial (5,0 a 10,0 Mhz).
 
INDICAÇÃO: 
Rastreio.
 
DESCRIÇÃO DO EXAME 

MAMA DIREITA 
Pele e tecido adiposo subcutâneo com espessura e ecogenicidade normais.
Fáscia e planos musculares retromamários anatômicos.
Ductos lactíferos retroareolares de trajeto e calibre normais.
Parênquima mamário com ecotextura fibroglandular usual e adequada lipossubstituição.
Não se evidenciam formações nodulares sólidas ou císticas patológicas.
Prolongamentos axilares anatômicos.

  MAMA ESQUERDA
Pele e tecido adiposo subcutâneo com espessura e ecogenicidade normais.
Fáscia e planos musculares retromamários anatômicos.
Ductos lactíferos retroareolares de trajeto e calibre normais.
Parênquima mamário com ecotextura fibroglandular usual e adequada lipossubstituição.
Não se evidenciam formações nodulares sólidas ou císticas patológicas.
Prolongamentos axilares anatômicos.

AVALIAÇÃO:
 
Achados benignos.
BI-RADS® US 2.

Laudo padronizado conforme o método BI-RADS® 5ª edição do American College of Radiology (ACR) para imagem da mama.

OBSERVAÇÕES:
1. A ultrassonografia como método isolado não é indicada para rastreamento de neoplasia mamária. É necessária correlação com mamografia atual.
2. Através de normativa do Colégio Brasileiro de Radiologia, a ultrassonografia axilar não engloba avaliação mamária, sendo necessário seu pedido, para sua devida avaliação.
  




___________________________________
DRA CHRISTIANE ALVES CALIXTO 
CRM 3316/RO






', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61656989, '894', 'TATIANE SILVA RODRIGUES', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60826120, '712', 'TATIANI VIEIRA GOMES', 2, 2, '01774183200', NULL, '(68) 9603-0049', '1992-08-26', 1, 'idade: 33 anos
RIO BRANCO - AC ( PASSEIO)
DUM: 27/12/2025
G1 PN A0
MC: IMPLANON INSERIU JUNHO DE 2025
COMORBIDADES: --
MEDICACAO: ---
ALERGIA : NEGA 
ALIMENTACAO - ACOMPANHAMENTO COM NUTRICIONISTA 
UPCCU: 21/05/2025 NEGATIVO PARA NEOPLASIA
Ultrassonografia transvaginal do dia 21/05/2025 útero ante verso fletido com volume de 86 cm³ em do metro de 0,9 cm de espessura ovário direito 5,2 cm³ ovário esquerdo 11,7 cm ** i no exame normal ultrassonografia de mamas e axilares do dia 21/05/2025 nódulo na mama direita às 9:00 0,9 cm BI RADS 3  

QP: PACIENTE REFERE QUE DESDE 20222 APRESENTA PRURIDO VAGINAL QUE PIORA APSO MENSTRUACAO, FEZ USO DE VARIAS MEDICACOES SEM MELHORA, ALEGA IUE AOS PEQUENOS ESFORCOS, PACIENTE REFERE CONSTIPACAO E GAZES, ALEGA PADRAO DE SANGRAMENTO DESFAVORAVEL 
FEZ USO DE MEDICACAO DIA 13/12/2025: METRONIDAZOL 440 MG POR 14 DIAS, GYNOTRAN 7 DIAS 

AO EXAME; COLO CILINDRICO, GRANDE, EM FENDA, PRESENCA DE DISCRETA SECRECAO AMARELADA 

CONDUTA: ORIENTACOES 
LASER INTIMO 
ANITA
MICROBIOTTA - MULTI -BI, GINOBIOTTAPOR 3 MESES
DOXICICLINA 100 MG 12/12 HORAS POR 7 DIAS 
GYNOTRAN 1 VEZ POR SEMANA, após terrina AT( entrego amostra) 
EXAMES LAB 
USG DE ABDOME TOTAL 
PONSTAN
VACINA IMUESTIMULANTE - 27/12/2025



USO ORAL
1.	Doxiciclina 100 MG ____________________________14 comprimidos 
Tomar 01 comprimido via oral, 12/12 horas, por 7 dias 
2.	Ginobiotta _____________________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 3 meses.
3.	ANITTA _________________________________01 caixa
      Tomar 01 comprimido de 12/ 12 horas, por 3 dias 
4.	ESALERG 5 MG ____________________________01 Caixa
Tomar 01 comprimido via oral, 1 vez ao dia. 


USO VAGINAL 
1.	Gynotran  _____________________________ 1 caixa
Aplicar 01 óvulo via vaginal, 1 vez por semana.

USO TÓPICO
1.	Flogo – rosa__________________________1 caixa
Diluir um envelope em 1 litro de água, fazer banho de assto á noite, por 10 dias 
-------------
09/04
paciente retorna novamente,  apresenta exames 

anatomopatológico - 29/01 - biopsia da vulva liquen escleroso atrofio - fez uso de clobetasol propinado 0,05% 1 vez ao dia 
realizou uma sessao de laser e vacina de imunidade em Rio Branco em 07 de marco e piorou a candidíase, usou metronidazol via oral e gynotran tópico devido secreção esverdeada
hormonal 500 mg 1 vez ao dia 
vitamina d3 1500 vit a 2000 ui vit k2mk7 200 mcg 1 cp apos almoco
metilfolato 400 mcg,: bi rads 2 nódulo na mama direita 9h 11 x 5 mm
usg tv 02/02: utero 82, end 1mm, od 4,95/ oe 6,46  metilcobalamina 1000 mcg, riboflavina 50 mg, piridoxal 5 fosfato 50 mg após cafe da manha 
usg de mamas 02/02
ao exame:
COLO MUITO HIPEREMIADO, COM GRUMO, GRANDE QUANTIDADE DE SECRECAO ESVERDEADA, COM ODOR 

CONDUTA: 
VACINA PARA CANDIDIASE
FOTOBIOMODULACAO 
Uso oral

1.	Secnidazol 1 g______________________04 comprimidos 
Tomar 02 comprimidos via oral dose única para o casal 

2.	Fluconazol 150 mg _________________06 comprimidos 
Tomar 01 comprimido via oral e repetir com 3 dias e após 7 dias, durante 1 mês 

Uso vaginal

1.	Trivagel N _____________________________01 tubo 
Aplicar via vaginal, á noite, durante 7 dias.

      2. Gynotran ___________________________01 caixa
       Aplicar 01 óvulo, via vaginal, 1 vez por semana 

AGENDAR PARA PROXIMO ME DE PREFERENCIA NO SABADO 

ATESTO PARA OS DEVIDOS VINS QUE A SRA TATIANI VIEIRA GOMES, NECESSITA DE 02 (DOIS) DIAS DE AFASTAMENTO DE SUAS ATIVIDADES LABORAIS, APARTIR DESTA DATA.


CID Z01.4


CASO TENHA CRISE ENTRAR EM CONTATO E FAZER CONSULTA ON LINE 
RETORNO PRESENCIAL EM 30 DIAS 

VITAMINAS 

CANDIDA-------------- 480,00  3 A 4 PROTOCOLOS 
PROTECAO NEURAL ------- 430,00 MAIS 3 PROTOCOLOS 
COENZIMA Q 10 ------- 240,00 
REPETIR EXAMES 
-----MES DE JUNHO FAZER:
VACINA DA CANDIDA
PROTECAO NEURAL
COENZIMA Q 10 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62085841, '972', 'Taymara Marques da Costa', 2, 0, '02720551236', 'taymaramarques17@icloud.com', '(97) 98416-9291', '1997-02-08', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61075772, '768', 'Tereza de Freitas maia cotta', 2, 1, '08208601667', NULL, '(31) 8484-1693', '1987-07-04', 1, '38 anos
G1 PN 
MC: PRESERVATIVO
DUM: 26/03
UPCCU: AGOASTO DE 2025 
ALERGIA: NEGA 
QP: IUE E RESSECAMENTO VAGINAL, FRUXIDAO DE CANAL VAGINAL 
ao exame; presença de secreca esbranquiçada com grumos ( paciente refere prurido)

conduta:
NOME Tereza de Freitas maia cotta



USO ORAL


1.	Ginobiotta ___________________________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia, por 1 mês. 

2.	Zelix 150 mg ________________________________________02 comprimidos 
      Tomar 01 comprimido hoje e repetir com 7 dias 

USO TÓPICO
1.	Higi calm  ________________________________________01 Tubo 
Higienizar 2 vezes ao dia  

USO VAGINAL 

1.	CREVAGIN  _____________________________ 1 caixa
Aplicar 1 aplicador, via vaginal, por 7 dias.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60606874, '683', 'THAINA CRISTINA GALVÃO FLORESTA', 2, 0, '06188942250', NULL, '(69) 99973-1258', '2001-11-20', 3, '23 ANOS 
DUM: 20/10
G2P1A1
MC: PRE4SERVATIVO
UPCCU: NUNCA REALIZOU

QP: PACIENTE REFERE QUE DESDE 2024 APRESENTA DOR EM BAIXO VENTRE DURANTE O CICLO MENSTRUAL 
APRESENTA USG TV 05/08/2025: UTERO 63,4 , END 5 MM OD 7,5. OE 9,4 EXAME NORMAL 


CONDUTA: EXAMES LAB E PREVENTIVO 

ultrassom de abdômen total notas e imagem nodular de contorno e bordas bem definidas e por ecogênico sem fluxo ao doppler em região de fossa ilíaca direita medindo 2,1 distando 0,8 cm da pele de etiologia a esclarecer
Ultrassom transvaginal útero 37,5 cm³ endométrio 5,6 mm ovário direito 8,7 ovário esquerdo 10 exame sem anormalidade conduta solicito ressonância magnética da pelve

aguardo preventivo
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124783, '368', 'Thais  Cristina Galvão Floresta', 2, 1, '05038914284', NULL, NULL, '2001-11-20', 3, 'Q.P:  rotina ginecologica, metarrogia, após isso parou uso de aci, deseja inserção do implanon.

20/03/23
dum: 05/03/22 5 a 7 dias  de fluxo.
mc: preservativo
Q.P: iniciar método contraceptivo, sem queixas.
deseja: aco
conduta: iumi', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60019307, '565', 'Thais Barbosa do Nascimento Fernandes', 2, 0, '05350035282', NULL, '(69) 9231-0426', '1999-05-06', 1, 'CONSULTA ON - LINE - JARU 
idade: 26 anos
DUM: 05/05/2025
G1 P1 A0
MC: DIU DE COBRE 
UPCCU: SETEMBRO DE 2024

PACIENTE REFERE QUE DESDE DE MAIO ESTÁ MENSTRUADA, FLUXO DISCRETO ( USO PROTETOR DIARIO)
FEZ ULTRASSOM DIA 12/06: NORMOPOSICIONADO, POLICISTO EM OVARIO DIREITO
NO MOMENTO FAZENDO USO DE SELENE (INICIOU DIA 13/06) MESMO ASSIM A MENSTRUAÇÃO NÃO PAROU, ACOMPAHADA DE DISMENORREIA E DOR NOS MMII, ISSO ESTÁ ATRAPALHANDO A VIDA SEXUAL.
PACIENTE REFERE DISPAREUNIA, DISMENORREIA DESDE 19 ANOS, JA GASTOU MUITO EM PROUCURA DE AJUDA MÉDICA. 

CONDUTA: SOLICITO EXAMES LAB
TRANSAMIM
NEOVLAR
TENOXICAN
SOLICITAR PESQUISA DE ENDOMETRIOSE
DIETA ALIMENTAR
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60487106, '642', 'Thaís dos Santos reolon', 2, 0, '70013946293', NULL, '(69) 9929-2072', '1997-03-22', 1, 'idade: 28 anos 
MENARCA 13 ANOS 
SEXARCA: 15 ANOS 
UPCCU: 2 ANOS
DUM: AMENORREIA 7 ANOS 
G1 PC A 0 ( JULHO DE 2022)
MC: IMPLANON INSERIU DEZEMBRO DE 2022
COMORBIDADE: CONDILOMATOSE ( 17ANOS CANAL VAGINAL - TRATAMENTO COM LASER - ARIQUEMES) - 
INFLUENCIADORA E EMPRESARIA ( DIVINA CLOSET)

PACIENTE REFERE QUE AOS 17 ANOS SURGIU CONDILOMA NO CANAL VAGINAL COM TRATAMENTO LASER, E ENTAO REFERE SECURA VAGINAL, ATUALMENTE ESTÁ EM USO DE IMPLANON ( CISTO OVARIANO) MELHOROU APOS O  USO DO IMPLANON, REFERE QUE TINHA ESQUECIMENTO PARA TOMAR ANTICONCEPCIONAL, NEGA EFEITOS COLATERAIS, PORÉM REFERE DIMINUIÇÃO DA LIBIDO, REFERE AMAMENTACAO POR 10 MESES
AO EXAME
 MAMAS EM N DE 2 PRESENCA DE PROTESE MAMÁRIA 
REGIAO INTIMA 
PRESENCA DE ASSIMENTRIA ( LADO ESQUERDO MAIOR QUE O DIREITO) E HIPERTROFIA DOS PEQUENOS LABIOS 
PRESENCA DE PREGA ACESSORIA BILATERAL 
COLO POSTERIOR, PRESENCA SECRECAO AMARELADA COM RAIAS DE SANGUE TIPO BORRA DE CAFE
PRESENCA DE SECRECAO EM PAREDE VAGINAL EM GRUMOS 

CONDUTA: ORIENTACOES,
SOLICITO EXAMES LAB

----------------------------   /// -------------------
USG TV 20/10/2025
UTERO 53,5
END 2,7 MM,OD 10 OE 11
HÁ SINAIS DE ENDOMETRIOSE, SINAIS DE ADENOMIOSE FOCAL, OVARIOS POLICICSTICO 
PEQUENA QUANTIDADE DE LIQUIDO LIVRE NA ESCAVACAO PELVACA

USG DE MAMAS 20/10/2025 BI RADS 2 
USG TIREOIDE COM DOPPLER CISTO BILATERAIS 


19/11
reposição de vitamina e 2 sessao do laser 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124832, '369', 'Thais Olivera Silva', 2, 2, '05038914284', NULL, NULL, '1997-11-05', 3, 'Q.P:  dor na mama e descarga papilar.
10/08 usg mama, nodulo em ambas as mamas.
ao exame: presença de nodulo as 2 e 3 h em mama esquerda, descarga papilar negativa.
conduta: ao mastologista e mama.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60061281, '584', 'Thais Rodrigues Da silva', 2, 2, '02831169275', NULL, NULL, '1997-06-03', 1, 'idade: 28 anos
dum: 14/07
MC LT
G2 P2 A0 ( 04/05/25 CESAREA E LT )
COMORBIDADES: DIP / SOP
ALERGIA A PLASIL
UPCCU: JUNHO DE 2024

QP: PCIENTE REFERE 04/05/25 CESAREA E LT, ALTO RISCO DEVIDO LITIASE RENAL, PUERPERIO DOLOROSO, BUSCOU AJUDA NO SERVICO DE SAUDE ONDE FOI REALIZADO USG 
Ultrassonografia transvaginal do dia 2/07/2025 útero volume 208 cm³ endométrio com ecos amorfos sugestivos de coágulo espessura de 17 mm ovário direito e o vário esquerdo sem alterações hipótese diagnóstica especialmente endometrial a esclarecer exames laboratoriais do dia 2 do 7 leuco 12130 hemoglobina 13,3 hematócrito 39% beta hcg negativo psr 1,96 urina não infeccioso 
ultrassonografia transvaginal do dia 4/08/2025 útero volume de 128,6 em do metro de 8 mm ovário sem alterações hipótese diagnóstica exame normal 

ao exame físico colo uterino anterior presença de secreção esbranquiçada com grumos em parede presença de secreção bolhosa toque vaginal doura mobilização em fossa ilíaca direita

# DIP
CONDUTA:  ORIENTACOES, CEFTRIAXONA, AZITROMICINA, GYNOTRAN, TRIPLO A  
RETORNO 18 0U 19/08 PARA AVALIAR MELHORA DO QUADRO 
ESPECULAR: PRESENCA DE SANGRAMENTO VAGINAL COM ODOR
SECNIDAZOL, TERICIN AT, TRIPLO A 
terin so depois que a menstruação terminar
relação sexual com preservativo
retorno em setembro

-----------------  /// ----------------
10/09/2025
PACIENTE REFERE DOR EM BAIXO VENTRE
ao exame: colo centralizado, secrecaoesbranquicada 
dor a mobilizacao do colo

Uso Injetável
1.	Ceftriaxona 500 mg_______________________01 ampola
Aplicar meia ampola IM em região glútea.
 
Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos VO dose única, para o casal
2.	Azitromicina 500 mg _________________04 comprimidos
Tomar 02 comprimidos VO dose única para o casal
3.	Pantoprazol 40 mg ___________________01 caixa
Tomar 01 comprimido VO pela manhã
4.	Metronidazol 500 mg _________________ 21 comprimidos 
Tomar 01 comprimido via oral de 8/8 horas, por 7 dias 


15/10/2025

paciente refere que essa semana está com dor em baixo ventre, alega dispareunia, alega constipacao, nega flatos 

ao exame: colo centralizado, muco esbranquiçada, sem odor
abdome 
dor em fossa iliaca direita
solicito usg de abdome total 

PACIENTE VEM APRESENTA USG TV 20/10/25 UTERO 146, END 8 MM, OD CISTO HEMORRAGICO OE 7,06

CONDUTA: AMORA POR 3 MESES E TRIPLO A E VORIC  SOS, IBUPROFENO, RETORNO COM 3 MESES 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60473028, '637', 'THAIS SANTOS CASTRO', 2, 1, '01192460235', NULL, '(69) 9348-4836', '1992-07-31', 1, 'A Dra. Christiane realizou a reposição de vitamina D.
Paciente de labréa', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58966010, '121', 'Thalia Fernanda Ferreira Inácio', 2, 2, '02997528283', NULL, '(69) 9203-8305', '1997-10-20', 1, '27 anos
20/10/97
dum: diu de mirena 

PACIENTE REFERE CANDIDIASE DE REPETICAO, APOS O TERMINO DO USO DE GESTRINONA, ALEGA CANDIDIASE DE REPETICAO, COLICA DEVIDO ENDOMETRIOSE, 
APRESENTA EXAME SDO DIA 15/01/25
HB13 / HT 37,8/ LEUCO 4520 / PLQ 275 000 /TSH 2,77/  PROGESTERONA INFERIOR 0,15/ DHT 19,1 /SHBG 19,4 / VITAMINA B 12 411 / FSH 6,96 /LH 6,32 / PROLACTINA 15,6 /. VIT D 48,9 / TGO 33 TGP 26,78 / GLICEMIA JEJUM 103 / TRIG 34 / COESTEROL 143 / 
AO EXAME
COLO CILINDRO PRESENCA DE SECRECAO AMARELADA COM DISCRETO ODOR , GRUMOS EM PAREDE 

TRIVAGEL , PROGESTERONA E VITAMINA B 12, REALIZO VACINA CANDIDA ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59050109, '264', 'Thayani beatriz Queiroz da Silva', 2, 2, '03426651203', NULL, '(97) 8402-8667', '2000-06-10', 1, 'Consulta.
Reposição de vitamina B12 e D 460,00 reais pix.
Agendar dia 29/03/25  ninfoplastia+ Reposição de vitamina B12 e D.
Valores: 7000,00 a vista, 7500,00 em 5x, 7700 em 10x. + Vit 460,00 reias.

09/05/2024
PACIENTE POS OPERATORIO DE NINFOPLASTIA 

BOA CICATRIZACAO 
ASSEPSIA, RETIRO 1 PONTO QUE JA ESTAVA CAINDO 
MANTENHO MEDICACAO PARA VAGINOSE 
REPOSICAO DE VITAMINA D E B 12  
16/10
PACIENTE VEM PARA RETORNO 
APRESENTA EXCESSO DE PELE NA PREGA ACESSORIA ESQUERDA
EXSERESE DE PREGA ACESSORIA 
CEFALEXINA
CFTRIAXONA, LASER BIOFOTOMODULACAO 

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124258, '364', 'Thayna Ferreira Da Silva', 2, 0, '05038914284', NULL, NULL, '1995-06-13', 3, 'Q.P:  secreção vaginal esbranquiçada, faz uso de protetor diario.
conduta: exames lab, usgtv.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124753, '367', 'Tiele Souza Texeira Brito', 2, 2, '05038914284', NULL, NULL, '1992-03-09', 3, 'Q.P: candidiase de repetição.
conduta: exames lab, preventivo, multi-bi, flucunazol, crevagin.

Retorno
paciente em uso de absorvente com troca prolongadas.
hb 13,5, tgp 15, tgo 17, glicose 90.
Preventivo negativo para neoplasia+ candidiase 02/03/23.
conduta: flucunazol 6 semanas+ multi-bi, trocar absorvente no maximo por 4 horas.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59042934, '255', 'Tircianny De Souza Dos Santos Barbosa', 2, 0, '05503969260', NULL, '(69) 99344-1318', '2005-05-18', 3, 'IDADE 19 ANOS 
DUM: JANEIRO
MC: NENHUM
ATIVIDADE SEXUAL NEGA
UPCCU: NUNCA REALIZO
G1 P0 A 1  (9 SEM - AGOSTO DE 2024)

QP: PACIENTE REFERE SECRECAO VAGINAL ESBRANQUICADA, QUE PIORA NA MENSTRUACAO E ALEGA ODOR FETIDONE PRURIDO

CONDUTA: SECNIDAZOL E METRONIDAZOL CREME VAGINAL 
RETORNO PARA REALIZAR VIDEOCOLPOSCOPIO , SOLICITAR EXAMES E PLANEJAMENTO FAMILIAR ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59110658, '346', 'Tirzá Cristina da Silva Morais', 2, 2, '03036010270', NULL, '(69) 99254-5373', '1997-05-29', 1, 'IDADE: 27 ANOS
G0 P0
DUM: 24/03 - 
MC: PRESERVATIVO
COMORBIDADES: HERPES GENITAL CONTROLADA, DISBIOSE, CONSTIPADA, 
MEDICACAAO EM USO NEGA 
HISTORIA DE CANCER DE MAMA OU OVARIO NA FAMILIA ( MAE- ???)

PACIENTE REFER QUE FEZ TRATAMENTO COM CLINDAMICINA POR 10 DIAS, FLUCONAZOL 5 DIAS, INJECAO IM ( NAO SABE O NOME), PACIENTE RREFERE ALGIA MAMARA Á DIREITA, NAO OBSERVA NODULO, PACIENTE REFERE HIPERTROFIA DE PEQUENOS LABIOS ALEGA UMAS LESOES EM PERINIO ( ONDE APARECE AS HERPES)
AO EXAMES LAB 
EM ANEXO
AO EXAME
PRESENCA DE ASSIMETRIA A DIRETA E PREGA ACESSORIA 
PRESENCA DE ENCAPSULAMENTO DE LESSAO HERPETICA
PRESENCA DE HPV
COLO CENTRALIZADO, PRESENCA DE SANGRAMENTO VAGIANAL 
ROSTO ACNEICO 

CONDUTA: ORIENTACOES, USG DE MAMAS, CLEAN UP 
 

AVALIAÇÃO NINFOPLASTIA: 7500,00 REAIS
LASER: 1800,00 CADA SESSÃO.

---------------   /// ------------------------
1 º SESSAO DE LASER INTIMO 
COM SENSIBILIDADE EM PAREDE ANTERIOR
SENDO NECESSARIO ANESTESICO TOPICO EM SPRAY 

ATO SEM INTERCORRENCIA 
BELAMY

-------------------------  // -----------------------

13/05/2025
PACIENTE REFERE QUE FICOU COM A PAREDE ANTERIOR COM INCOMODO, POREM NO OUTRO DIA ASSINTOMATICA, ALEGA UMA MELHOR HIDRATACAO DA VAGINA E O PARCEIRO SENTIU UM POUCO MAIS APRTADA O CANAL VAGINAL 
HB 13,7 / HT 41,4/ LEUCO 8600/PLQ 279.000/ FERRO 62 / MAGNESIO 1,9/. FERRITINA 28,2 / VIT A 0,5/ VI T B 112 593/ VIT C 0,4 / CORTISOL 5,74/ VI D 19,9 

CONDUTA: 
ORIENTACOES 
SUPLEMENTACAO : ADEK (580) + C (250) + VITAMINA B12 (250)
SUPLEMENTACAO DE FERRO (180,00)
SOLICITO USG TV COM PREPARO INTESTINAL 
 


02/06/2025
PACIENTE VEM PARA NINFOPLASTIA, DEVIDO DESCONFORTO EM RELACAO A VESTIMENTA DE ROUPA, PRINCIPALMENTE SHORT
PACIENTE EM POSICAO DE LITOTOMIA 
ASSEPSIA
ANESTESIA 
MARCACAO
NINFOPLASTIA 

CONDUTA: REALIZADO LASER VULVAR, CALTERIZACAO, 
2460,00 

2º DOSE DE VITAMINA E FERRO 1260,00 ( 30 - 40 dias)

NINFOPLASTIA 7500,00
VITAMINA E FERRO 1260,00
VITAMINA E FERRO 2 DOSE 1260,00
LASER VULVAR 1200,00
LASER INTIMO 3 SESSOE 1800,00 CADA ( 1 º SESSAO 05/05/2025)
FALTA PAGAR 7320,00

____________________.  // _________________________

04/06/2025

paciente em posição ortostática, realizo assepsia, punção 
sf0,9 % 250 ml e 01 ampola de noripurum ev lento 



12/06/2025
reposição de vitamina b 12 

Ricardo 12/06/2025

ADEK (580) gluteo e + Coenzima q 10  (250) gluteo d =  830,00

_______________________
28/06: RETIRADA DE PONTOS 
3 DIAS DE RIFOCINA 


__________________________________________.  /// _____________________
28/07/2025

Paciente refere que ainda tem sensibilidade nos pequenos lábios 
realizado laser intimo
realizado vitaminas c e b 12 
---------------------------------  // ----------------------

26/01/2026
laser intimo 
balamy 
retorno em marco para rotina ginecologica 



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60063076, '588', 'Vaini Trombini Ferreira Brasileiro', 2, 0, '80241301220', NULL, '(69) 99285-7875', '1983-06-23', 3, 'IDADE: 42 ANOS
DUM; 
MC: IMPLANON 
OOFORECTOMIA 2018

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA 

SOLICITO EXAMES DE IMAGEM E LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59952184, '552', 'Valdeci ribeiro da Silva', 2, 0, NULL, NULL, '(69) 9203-5366', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59090090, '334', 'Valdejane Barbosa Magalhães Flores', 2, 0, '59333723234', NULL, '(69) 98402-2745', '1975-03-18', 1, 'EXAMES 20/03/25
HB13,8/ HT 43/ LEUCO 6050/ PLQ 207.000
UREIA 21,8/ CREAT 0,60/ TGO 31/ TGP 48/ GLICOSE 79/COLESTEROL 121/ TRIG 47/ MAGNESIO 2/ FERRITINA 163/CORTISOL 7,90, VITAMINA B 12 SUPERIOR 2000/ ESTRADIOL 26/ PROGESTEROMA 6,1 / FSH 61/ LH 55/ TSH 0,71/ T4 LIVRE 1,04PIOCITOS 20/ vit a 0,35/ vitamina c 0,50 / vit d 74 / testo 31,9/ 

osteo gel 
\\





16/06laser capilar
laser facial
aplicação de injetável capilar 

29/07
VACINA DE ITU 

08/08/2025
Exame laboratorial do dia mês passado 8 do 8 de 2025 hemoglobina 15,6 hematócrito 48,9 e eu gosto 6110 plaqueta 214000 glicose 89 colesterol 182 triglicerídio 88 tgp 51 tgo 34 pura é 15,7 tá bom creatinina 0,7 ácido úrico 5 cálcio ionizado 4,4 magnésio 1,7 ferro 149 ferritina 215 tsh 1,5 t 4 total 9,11 fsh 59 LH 22 estradiol menor que 10 realmente eu estava sem estar usando agora você usar selênio 89 b 12 1131 c 6,5 vitamina zero ponto 48 Vitamina D 110 estradiol livre 0,07 testosterona 26 testosterona livre 40,5 CA 15, 3 14.7 se a 19 traço 9 5,7 se é assim 7 2,4 aí 6,8 sCEA 1,2
UROCULTURA : NEGATIVO
USG DE ABDOME TOTAL 24/07: NORMAL 
USG DE MAMAS BI RADS 1 
USG DE TIREOIDE NORMAL

PREVENTIVO 11/06/2025: NEGATIVO PARA NEOPLASIA 
PIRIDUM , ANTROFI, COLETAR UROCULTURA 

---------------------------------
urocultura 
08/09
k.pneumoniae sensível a ciprofloxacin 
------------------------------
20/11/2025
laser capilar
vacina

-------------------------------------------
2026

23/01/2026
paciente vem para protocolo de imunidade (complexo ZMA) + vacina de imunidade 

18/02/2026
solicito urocultura ( pedido digital) + Enax tomar 01 comprimido 2 vezes ao dia 

23/02/2026
resultado de urocultura: e coli 
prescrevo amoxicilina + clavulanate ( receita digital)

02/03/2026
paciente refere melhora do quadro de Itu, porem alega enxaqueca e mau estar com uso da medicação
Paciente solicita receita de Pregabalina e Duloxetina ( receita digital)

08/05/2026
protocolo proteção neural

17/05/2026 
protocolo proteção neural + Vacina E coli 

14/07/2026
protocolo cabelo e unha
protocolo melhora da congnicao
vacina E coli 









', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61502393, '852', 'VALDENICE DE SOUZA MARTINS', 2, 0, '31562370278', NULL, '(69) 99432-0893', '1968-06-06', 3, 'IDADE: 57 ANOS 
DUM: 2017
MC: NAO
ALERGIA NEGA 
MEDICACAO EM USO NEGA 
UPCCU: 2024
UMMG 2024

PA 135 X 80 MMHG
PESO 67KG 

PACIENTE VEM PARA ROTINA GINECOLOGICA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59538146, '509', 'valdenira de freitas neves macedo', 2, 2, '22120483272', NULL, '(69) 9271-4330', '1965-07-10', 1, 'valdenira de freitas neves macedo

IDADE 59 ANOS 
PLANO DE SAUDE : UNIMED 
G5 P3 A2 
MENOPAUSA: 50 ANOS 
UPCCU: OUTUBRO
TRH: ESTRADIOL E TESTOTERONA 
CIRURGIA PREVIA COLECISTECTOMIA 

QP: PACIENTE REFERE FRAQUEZA CAPILAR, EM TRATAMENTO CAPILAR COM DUDA ALMEIDA (TRICOLOGISTA)

CONDUTA: USG TV, USG ABDOME TOTAL, USG DE MAMAS, AGUARDO RESULTADO DE MMG, DENSITOMETRIA OSSEA, PREVENTIVO 


07/07/2025
Ultrassonografia transvaginal do dia 3/07/2025 útero 109,4 cm³ endométrio 4 mm ovário direito 2 cm³ ovário esquerdo 2,3 cm³ biometria difusamente heterogêneo e consiste em meu metria e achados frequentemente associada a adenomiose

ultrassom de abdômen total do dia 3/07/2025 status pós colecistectomia exame
e normal 
ultrassom de mamas e regiões axilares do dia 3/07/2025 nódulo e foi com nas mamas com características o somente observada em lesões benignas em um estava em relação ao exame de 11 de 2024 n 2 achado novo se isto simples nas mamas, e que extasia do que tal bilateral, classificação de birra 3
Nova direita n um a 6 horas 0,9 centímetros nem 2 em mão esquerda 0,9 cm
Cisto de paredes simples 0,5 cm QIL 
PACIENTE REFERE ACOMPANHAMENTO DO CISTO, ALEGA QUE JÁ REALIZAOU PUNCAO E BIOSPSIA COM RESULYADO BENIGNO ( NÃO APRESENTOU NO MOMENTO DA CONSULTA)

Do dia 24/06/2025
Hemoglobina glicada 5% tsh 3,25 t 4 livre 1,25 FSH 1,58 LH 0,8 
sorologia não reagente 
anti h bs 2 
insulina 15,7 cortisol 10,7 
homocisteína 14,1/ gama GT 16
 Vitamina A 0,59 Vitamina C 0,6 Vitamina D 39,3 Vitamina B12 489 
estradiol 67,6 progesterona 0,21 
testosterona 238 ácido úrico 3,1 TGO 33 tgp 26, glicose 73 triglicerídeos 73 colesterol 123 ureia  24 creatinina 1,0,  ferritina 259 ferro 137 magnésio 1,7 hemoglobina 15,5 hematócrito 44, 6 leucose 6890 plaquetas 224000 
EAS 7 óbitos por Campos leucócitos positivos flora bacteriana modificada urocultura Escherichia coli Amoxicilina com clavulanato sensível ciprofloxacina sensível ampicilina sensível
MMG 06/11/24: BI RADS 3 NO DULO NA MAMA D 0,9 CM 

Pa120 x 79 mmhg
CONDUTA: ORIENTACOES
REPETIR EAS E UROCULTURA
VACINA DE HEPATITE B
REPOSICAO DE VITAMINA D E B 12 
OBS.: AVALIAR SE PACIENTE ESTÁ TENDO PROTECAO ENDOMETRIAL E ENVIAR RESULTADO DA DENSITOMETRIA OSSEA 

VITAMINA 480, 00 VITAMINAS
AGENDAR PARA LASER INTIMO

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61305729, '808', 'Valdilene Marques do Rosario dos Santos', 2, 2, '62913204287', NULL, NULL, '1978-06-04', 1, 'idade: 47 anos 
DUM: 28/03/2026
UPCCU: JANEIRO 
G5 P3 A2
LT
COMORBIDADE: ARTRITE REUMATOIDE
ALERGIA MEDICACAO: SALBUTAMOL
SONO: REPARADOR 
INTESTINO: REGULAR 
EXERCICIO FISICO CAMINHADA DIARIA E DANCA 
omg: 19/01/2024: bi rads 2 

QP: PACIENTE REFERE METRORRAGIA, IRREGULARIDADE MENSTRUAL, REFERE ODOR NO SANGRMANTO VAGINAL, NEGA ALGIA REFERE ODOR APOS RELACAO SEXUAL, NEGA IRRITABILIDADE, FOGACHO, ALEGA ALGIA MAMARA CICLICA, 
HISTORIA DE CAUTERIZAÇÃO UTERINA EM 2022


AO EXAME: MENSTRUADA NO MOMENTO DA CONSULTA 

CONDUTA: 
ORIENTACOES
TRANSAMIM, 
GYNOTRAN 
SECNIDAZOL
EXAMES LAB 
USG TRANSVAGINAL ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132585, '374', 'Valdileny De Olivera Costa', 2, 0, '05038914284', NULL, NULL, '1983-04-14', 3, 'Paciente refere cisto ovariano, em uso aco 3 meses, atualmente apresenta dor em baixo do ventre, algia mamaria.
Ao exame:  mamas n 02, sem nodulo, sem retração,
Abd: flacido, plano, sem visceromegalia.
Conduta: exames lab, usgtv e mamas.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59557078, '512', 'Valdineia Aparecida Soares Laia', 2, 0, '83015957287', NULL, NULL, '1981-06-02', 1, 'VANDINEIAAPARECIDA SOARES LAIA 
idade: 43 ANOS 
DUM: 22/05/25
EM USO DE IMPLANTE 

PACIENTE REFERE GASES INTENSO, IRRITABILIDADE, FOGACHO VOLTOU EM PEQUENA INTENSIDADE, FLUXO SANGÜÍNEA
IMPLANTE EM NOVEMBRO DE 2024
PESO 79,3KG
COLETADO SANGUE
REALIZO SESSAO DE LASER INTIMO
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59110229, '345', 'Valentina Barbosa Villar69 9964-4400', 2, 0, '02872091211', NULL, NULL, '2006-06-04', 1, 'IDADE: 18 ANOS
DN: 04/06/2006
DUM: 28/02/25
MC: PRESERVATIVO
MENARCA: 13 ANOS
SEXARCA: 15 ANOS
G0P0

QP: PACIENTE REFERE ARDENCIA EM REGIAO VULVAR, +/- 1 SEMANA, COM PIORA ONTEM , REALIZOU EXAMES DE URINA 18/03: LEUCOCITOS POSITIVO, 40 PIOCITOS POR CAMPO, FLORA BACTERIANA MODERADA, INIICOU MEDICACAO MACRODANTINA 100 MG DE 6/ 6 HORAS,  NEGA SECRECAO VAGINAL

CONDUTA: MANTER MACRODANTINA E PRESCREVO PIRYDIU, E TROK APLICAR EXTERNO

09/04/25
PACIENTE RETORNA COM MELHORA DO QUADRO CLINICO, PAROU PYRIDUM HÁ 3 DIAS
EXAMES: 01/04: HB 10,9, HT 33, LEUCO 4220, PLQ 238000, VITAMINA D 26,1, VITAMINA B 12 394 

CONDUTA: 
TRATAMENTO INJETAVEL 990,00  

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62107529, '977', 'Valneli Moura Lopes', 2, 0, '01580624260', 'valnelylopes@gmail.com', '(97) 98406-2688', '1991-10-31', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132738, '376', 'Valnira Lima Soares', 2, 2, '05038914284', NULL, NULL, '1985-06-19', 3, 'Q.P: paciente refere diminuição defluxo menstrual 3-4 dias como tipo de borra de café, alega secreção esbranquiçada , sem odor, sem purido.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132871, '379', 'Vaneide Gomes De Souza', 2, 2, '05038914284', NULL, NULL, '1977-08-07', 3, 'Paciente refere nervosismo, ansiedade, cefaleia, agitação, insonia, refere dor em baixo do ventre.
conduta: exames lab, usgtv mamas.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61055676, '754', 'VANESSA BARBOSA SANTOS', 2, 0, '03303745242', NULL, '(69) 99370-1614', '1997-07-18', 3, 'IDADE 28 ANOS 
G 4 P4 A0
DUM: AMENORREIA 
MC: LT
UPCCU: JAN 2025

QP: PACIENTE REFERE DOR EM BAIXO VENTRE, APRESENTA USG TV 29/01/2026 UTERO AVF, 43,7 END 3 MM, OD 21, DEVIDO CISTO UNILOCULAR 3 CM, OE 4 CM 
PACIENTE REFERE LABILIDADE EMOCIONAL, IRRITABILIDADE, 
paciente em uso de medicação para h pilora iniciou ontem 

AO EXAME
COLO ANTERIOR, PRESENCA DE SECRECAO ESBRANQUICADA COM ODO
TV: DOR A MOBILIZACAO DO COLO 

CONDUTA:
ORIENTACOES
parar o uso de medicação para h pilora, iniciar medição para DIP e retornar imediatamente para medicação do h pilory 
SOLICITOar EXAMES LAB  no retorno 
Uso Injetável
1.	Ceftriaxona 500 mg_______________________01 ampola
Aplicar meia ampola IM em região glútea.
 
Uso oral

1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos VO dose única, para o casal
2.	Azitromicina 500 mg _________________04 comprimidos
Tomar 02 comprimidos VO dose única para o casal
3.	Ibuprofeno 600 mg  __________________10 comprimidos Tomar 01 comprimido via oral de 8/8 horas por 3 dias.
uso vaginal: Tericin AT 9 entrego amostra 2 caixas) 
retorno em março 
--------------------------------- ///--------------------------------

28 anos 
dum: amenorreia ( 2023)
LT 
comorbidades: cisto unilocular 
medição: nega 
UPCCU: JAN 2025

paciente refere dor em fossa iliba esquerda, mantem habilidade emocional

conduta: orientações
exames lab
usg tv
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60000333, '561', 'Vanessa De Souza Lima', 2, 0, '02813993280', NULL, '(97) 8409-0447', '2001-11-22', 1, 'idade: 24 anos
G0 P0
MC: IMPLANON - JUNHO 2025
DESEJA RETIRAR IMPLANON, E FAZER USO DE ACO. ALEGA SUA, FEZ USO DE ACO CONJUNTO COM O IMPLANON COM MELLHORA SOMENTE DURANTE O USO

PACIENTE DEITADA NA MACA COM BFRACO ESQUERDO FLETIDO
ASSEPSIA
ANESTESIA
CORTE COM BISTURI NUMERO 11
RETIRADA DO BASTAO
PACIENTE E ACOMPANHANTE OBSERVA O BASTAO DO IMPLANON FORA DO BRACO 
CURATIVO COMPRESSIVOATO SEM INTERCORRENCIAS 

CONDUTA: ORIENTACOES 
NEXTELA 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124910, '370', 'vanessa dos santos fernandes', 2, 2, '05038914284', NULL, NULL, '1988-05-31', 3, 'Q.P:  disminorreia, alega aumento de fluxo  mesntrual com coagulo.
conduta: aguardo preventivo , exames lab, usgtv.

Retorno dum 20/10/24
preventivo 09/10/24 neg para neoplasia 
usgtv 09/10 utero 239, end 14mm, od 16,1, corpo luteo, oe 4,6cm.
usg de mamas 09/10/24 mama direita cisto simples 10h , 0,6 cm e outro 11 h 1 cm, Bi-RADS2
mama esquerda cisto simples 1 h, 1cm, e 12 horas 0,6 cm BI-RADS 2.
conduta: gamax, repetir usg de mamas 6 meses.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (60841278, '714', 'Vânia Ferreira Gomes', 2, 0, '69073821215', NULL, '(69) 9258-7461', '1983-01-29', 1, 'idade: 42 anos
DUM: 31/11/2025
MC: LT
G 3 P2 A1 
UPCCU: 06/2025
UMMG: 2025
COMORBIDADES: NEGA
MEDICACAO: MELATONINA
EXERCCIO FISICO IRREGULAR
SONO: INSONIA 
PLANO DE SAUDE: INOVA
PERINEO: 2015

PACIENTE REFERE MASTALGIA HÁ MAIS OU MENOS 10 DIAS, ALEGA FLACIDEZ DO CANAL VAGINAL, NEGA IUE, ESTUDO URODINAMICO MES DE JULHO  - NORMAL SIC,  ALEGA PUM VAGINAL, REFERE ORGASMO, 

COLO CENTRALIZADO, PRESENCA DE SECRECAO ESBRANQUICADA COM GRUMOS DISCRETOS 
HIPERTROFIA DE PEQUENOS LABIOS E PRESECA DE CAPS CLITORIANO

CONDUTA:
FLUCONAZOL PARA CASAL 1 /7 
CREVAGIN

LASER INTIMO 4 SESSOES 1880,00 CREDITO, 1600, 00 A VISTA 
NINFOPLASTIA 7, 2 MIL A VISTA OU 7500,00 CREDITO
CAPUZPLATIA 3000,00 CREDITO OU 2,800,00 A VISTA 

27/12
paciente realiza a primeira sessão do laser intimo na parte da manhã com a doutora as 11:30

NINFOPLASTIA 7, 2 MIL A VISTA OU 7500,00 CREDITO
CAPUZPLATIA 3000,00 CREDITO OU 2,800,00 A VISTA 
PERINEOPLASTIA 4800,00

obs.: coletar preventivo em meio liquido antes do procedimento 
15 mil a vista 
------
08/05
Paciente em posição ginecológica, realizada antissepsia da região perineal e vaginal com solução apropriada e colocação de campos estéreis.
Procedida marcação da área de ressecção em região perineal posterior e introito vaginal posterior, conforme planejamento cirúrgico.
Realizada anestesia local infiltrativa com lidocaína a ___% associada/adicionalmente a vasoconstrictor, com adequada analgesia da região.
Efetuada ressecção de excesso de mucosa vaginal posterior e tecido cicatricial/perineal redundante, com dissecção cuidadosa dos planos superficiais.
Realizada rafia e aproximação da musculatura perineal posterior (quando aplicável), promovendo reforço do corpo perineal e redução da frouxidão local.
Hemostasia rigorosa realizada por eletrocoagulação/compressão local, sem sangramentos ativos ao término.
Síntese da mucosa vaginal e pele perineal realizada com fios absorvíveis em planos anatômicos, com adequado afrontamento das bordas e bom resultado funcional e estético imediato.
Procedimento realizado em ambiente ambulatorial/consultório, sem intercorrências.
Paciente recebeu orientações pós-procedimento, prescrições pertinentes e sinais de alerta, deixando o consultório em bom estado geral.

Paciente em decúbito ginecológico, realizada antissepsia da região genital com solução apropriada e colocação de campos estéreis.
Procedida marcação prévia do excesso de tecido em pequenos lábios vaginais, com planejamento simétrico da ressecção.
Realizada anestesia local infiltrativa com lidocaína a ___% associada/adicionalmente a vasoconstrictor, em quantidade compatível com o procedimento, com adequada analgesia local.
Efetuada ressecção do excesso de tecido dos pequenos lábios por técnica linear/em cunha (adequar conforme técnica utilizada), preservando bordas anatômicas e simetria local.
Realizada hemostasia cuidadosa por eletrocoagulação/compressão local.
Síntese realizada com fios absorvíveis em planos apropriados, com adequado afrontamento das bordas e bom resultado estético imediato.
Procedimento realizado em ambiente ambulatorial/consultório, sem intercorrências.
Paciente recebeu orientações pós-procedimento, sinais de alerta e prescrição medicamentosa, deixando o consultório em bom estado geral.

conduta:
entrego receita
tcle
ceftriaxona ev 

------------------
11/05/2025

PRESENCA DE HEMATOMA EM REGIAO CLITORIANA , PRESENCA DE EDEMA EM PQUENO LABIO ESQUERDO 
REALIZO ASSEPSIS E LASER FOTOBIOMODULACAO 
FOTO EM ANEXO 
----------------------------
02/06/26 
CANAL VAGINAL EM PROCESSO DE CICATRIZACAO 
PRESENCA DE PONTOS 
SECRECAO SEM ODOR 
CEFTRIAXONA EV 
TRIVAGEL N 
-----------------
10/06
ninfoplastia - sem pontos visivel, 
paciente refere que pequeno labio esquerdo maior que o direito 
canal vaginal apresentando fio em absorção
solicito que aguarde mais 5 dias para relação sexual 
retornar na segunda 
-------------
15/06
retorno
canal vaginal bem cicatrizado
coletado preventivo meio liquido 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58928063, '73', 'Vanilza Custodio', 2, 2, '73920843215', NULL, '(69) 99221-8789', '1983-07-15', 3, 'idade 42 anos
DUM: 07/02/2025
MC: VASECTOMIA
G 4 P 2 A 2 ( 1 ABORTO GEMELAR)

QP: PACIENTE VEM DEVIDO SECRECAO VAGINAL AMARELADO COM ODOR, APOS USO DO ANITTA APRESENTOU PRURIDO, FEZ USO DE VARIA MEDICACOES ( CREME VAGINAL, AZITROMICINA, FLUCONAZOL, METRONIDAZOL) 
APRESENTA USG TV 05/02/25 UTERO 88,10, ENDOMETRIO 2,5, MIOMATOSE UTERINA PAREDE PSTERIOR NA SEROSA MM, OD 5,14, OE 10,33, 
URODINAMICA 12/11/24: COMPLACENCIA DIMINUIDA, DETRUSOR NORMOATIVO E HIPERSENSIVEL

CONDUTA:
SECNIDAZOL PARA O CASAL
METRONIDAZOL VIA ORAL
CEFTRIAXONA 
AZITROMICINA 
TRIPLO A
ZINA
RETORNO COM 15 DIAS 


------------   /// ----------
paciente refere que continua com quadro de secreção vaginal amarelada com prurido, refere que consegui encaminhamento para o SUS para histerectomia 
apresenta exames 
21/02/25
glicose 91/ calcio 8,85/ hbglicsda 5,22 / tao 26,9/ 29,9/ vitamina b 12 395/ hbsag/ anti ccv/ hiv / snr/ tsh 1,30 / t4 livre 1,77 / vit d 32,3 / hb 15, 5/ ht 39.8/ leuco 5930/ pls 244.000/eas normal
mmmm 09/09/24 bi rads 1
preventivo 16/11/24: negativo para neoplasia
conduta: 
orientações
bacterioscopia
trivagel N
no aguardo da cirurgia de sus
retorno 6 meses
-------------------------------  // -----------------
paciente refere que nao fez o uso de trivagel, vem apresentar resultado de 
Bacterioscopia do dia 03/03/25: cocos gram positivo e leveduras 
preventivo 07/03: negativo para neoplasia, cocos e leveduras 
conduta: mantida trivagel 
-----------------------------------------------------------------------------------
13/05/2025
15 DIAS PÓS HISTERECTOMIA PARCIAL ABDOMINAL, ALEGA SECREÇÃO AMARELADA.
AO EXAME: FO EM CICATRIZAÇÃO, ESPECULAR GRANDE QUANTIDADE DE SECREÇÃO AMARELADA COM GRUMO.
CONDUTA: SECNIDAZOL, METRONIDAZOL, MICONIDAZOL, FLUCONAZOL 7/ 14 DIAS . 
RETORNO 14 DIAS.

30/05/2025 

MEDICACAO: BIOFORMULA 

23/06/25
Amoxicilina 875mg + Clavulanato de Potássio 125mg 
crevagin por 8 dias 

07/07/2025
CULTURA DE FUNGOS 
ANFOTERICINA B, FLUCONAZOL SENSIVEL

CONDUTA: FLUCONAZOL E TERACIN AT 
-----------------//-----------------------
paciente com urocultura e coli sensível a ciprofloxacin
alega secreção amarelada com prurido
colo centralizado, presença de secreção acinzentada bolhosa 
NOME: Vanilza Custodio 

Uso oral


1.	Ciprofloxacina 500 mg _______________14 comprimidos 
Tomar o1 comprimido via oral, 12/12 horas, por 7 dias  

2.	Ginobiotta _________________________ 90 caps
Tomar 01 cap 1 vez ao dia, por 3 meses.


Uso vaginal

1.	Gynotran _______________________________01 caixa
Aplicar 01 óvulo via vaginal, 1 vez por semana 

entrego uma amostra de colpistatin por 5 dias 
------------------------------------
12/08/2026
PROFISSAO VIGILANTE 
upccu: 20/02/2026 neg para neoplasia 
DUM: 24/04/2025
COMORBIDADES: FIBROMIALGIA
CIRURGIAS PREVIAS COLECISTECTOMIA E HISTERECTOMIA PARCIAL ABDOMINAL

QP PACIENTE VEM DEVIDO SECRECAO AMARELADA, ESPESSA, NEGA ODOR, REFERE QUE JA ESAT COM CIRURGIA DE PERINEO AGENDANDA DEVIDO IUE 

APRESENTA USG TV HISTERECTOMIA PARCIAL, COLO MEDIANIZADO COM FORMA NORMA, OD 13.8 OE 2,8 = HISTERECTOMIA PARCIAL PREVIA 

AO EXAME:
 COLO CENTRALIZADO, PRESENCA DE SECRECAO ESVERDEADA, BOLHOSA

CONDUTA: 
ORIENTACOES 
EXAMES LAB - ALEGA QUE FOI REALIZADA A POUCO TEMPO, POREM NAO TROUXE NO MOMENTO DA CONSULTA 
GINOBIOTTA
FAZENDO USO DE METRONIDAZOL VIA ORAL 7 DIAS
METRONIDAZOL + MICONAZOL + BENZALCONICO CREME VAGINAL POR 7 DIAS, PROLONGO POR 14 DIAS 
SECNIDAZOL 1 G 1 POR SEMANA, ORIENTO DOSE UNICA PARA CASAL 
ITRACONAZOL 12/12 HORAS POR 5 DIAS 
PROBIOTICO 
-----------------------------------------------
BACTERIOSCOPIA LEUCO 8 PIOCITOS, BACILOS GRAM POSITIVO MODERADO
PCCU: 14/08 NEG PARA NEOPLASIA + GARDNERELLA 

PCR PARA INFECCOES SEXUAL TRANSMISSIVEIS 14/08 UREAPLASMA PARVUM: TRATADO COM DOXICLINA POR 7 DIAS 
SNR 31/08

SO EXAME: SECRECAO ESBRANQUICADA ESPESSA, SEM ODOR 
CONDUTA: UNYCA 






', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61607513, '876', 'Vera da Silva Rabello Gonçalves', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132540, '373', 'Vera Lucia N Lopes', 2, 1, '05038914284', NULL, NULL, '1983-05-28', 3, 'Q.P: paciente refere purido vaginal e anal, nega secreção vaginal, nega  nodulo mamario.
conduta: exames lab, usgtv e mamas, mmg.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132456, '372', 'Veronica Chaves Texeira', 2, 2, '05038914284', NULL, NULL, '1977-11-12', 3, 'Paciente vem para rotina.
alega que morava em Guajará mirim, mas atualmente está em pvh, deseja engravidar, paciente não deseja coletar preventivo no momento.
conduta:; solicito exames, usgtv, mamas, mmg, preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59123751, '360', 'Veronica Gomes Da Silva Dias', 2, 2, '05038914284', NULL, NULL, '1974-02-09', 3, 'Q.P: apresentar exames de sangue.
glicemia 158, col 123, vit b12 431, tsh 7,67, vitd 21.
Conduta: solicito rotina menopausa  ao endocrino tsh 7,67
programar reposição vitd e hormonio
--------------------------------------------------------------------
15/08/2024
 
Queixa climatério.
hipotireodismo subclinico assitomatico, em acompanhamento com endocrino.

exames 05/08
progesterona 0,14, glicose 95,2, vitd 44,10, trigl 152, hb 13/ht 41,8, col 131, eas normal, tgo 14, tgp 19, estradiol 30, tsh 2,30, lh 13,10.
Conduta: natifa, ciprofloxana, fluoxctina, retorno 30 dias.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59470591, '492', 'Verônica Gomes Da Silva Dias', 2, 2, '45731713200', NULL, '(69) 8117-7899', '1974-02-09', 3, 'IDADE: 51 ANOS
G 4 P 3 A1
DUM: HISTERECTOMIA 2021
QP: PACIENYTE EM USO DE NATIFA E FLUOXETINA, ALEGA QUE MANTEM QUADRO DE IRRITABILIDADE, INSONIA, FOGACHO, RESSECAMENTO VAGINAL, QUEDA CAPILAR, ALEGA PERDA DE URINA AOS PEQUENOS ESFORCOS 

CONDUTA: EXAMES LAB, MMG, USG DE MAMAS, USG TV, PREVENTIVO, DENSITOMETRIA OSSEA 

EXAMES DE SANGUE FICARAM DE 442,00 POR 340,00 REAIS

Exames laboratoriais do dia 9/07/2025 glicose 102 triglicerídeos 139 colesterol 128 ferritina 136 tgo 18,2 TGP 30,7 ferro sérico 60 anti h bs reagente anti tpo 9,5 Vitamina B12 389 estradiol 21,2 fsh 36,6 LH 23,3 tsh 3,9 t 4 livre 1,16 progesterona 0,11 Vitamina D 24,70 hemoglobina 13,8 hematócrito 40 leuco 6180 plaqueta 333000 EAS não infeccioso

conduta: reposição de vitamina b 12 e d via oral 
aguardo uso tv e mmg', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132825, '378', 'Veronica Viana Alperi', 2, 1, '05038914284', NULL, NULL, '1980-03-06', 3, 'Mostrar exames, alega irregularidade menstrual.
usgtv 13/10/22 utero 88,5, mioma submucoso+ intramural.
preventivo: negativo para neoplasia e gardnerella. (lamina coberta de hcm)
Conduta: gynotran, exames lab, programar preventivo.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59402248, '477', 'Victória Maria Pimentel Neves Costa', 2, 1, '92718485272', NULL, '(69) 9265-1221', '1997-09-04', 1, 'IDADE: 27 ANOS
DUM: 25/04/25 4-5 DIAS DE FLUXO / MODERADO NOS 2 PRIMEIROS DIAS/ NEGA DISPAREUNIA
MENARCA: 12 ANOS
SEXRACA : 22 anos 
MC: ---- / 3 PARCEIROS
UPPCCU: NINCA REALIZOU
ALERGIA MEDICCAO: NEGA 

PACIENTE VEM PELA PRIMEIRA VEZ NO GINECOLOGISTA, NEGA SECRECAO VAGINLA, NEGA NODULO NA MAMA
AO EXAMES

ACNE EM TORSO E LOMBAR 2/3 GRAU 
FURUNCULOS DISPERSO PELO CORPO, INCLUSIVE REGIAO INTIMA
MAMAS 2 GIGANTOMASTIA, SEM NODULO
ABDOME GLOBOSO, SEM VISCEROMEGALIA
ESPELULAR: NDN - DOR PARA PASSAR O ESPECULO

CONDUTA: CEFALEXINA, SABONETE EM ESPUMA, ESFOLIANTE, TROK 
COLETADO PREVENTIVO
SOLICITO USG PELVICA, USG DE MAMAS, EXAMES LAB ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61006198, '736', 'Vilcileide Gil Caetano', 2, 0, '74107828204', NULL, '(69) 9997-3636', '2026-01-01', 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132762, '377', 'Vitoria Caiane Olivera Ribeiro', 2, 1, '05038914284', NULL, NULL, '2001-04-23', 3, 'Preventivo 09/10 negativo para neoplasia.
Usgtv 30/07/22 normal.
exames 28/09 snr (hiv e vdrl)
No momento secreção esverdeado e com odor.
Conduta: metronidazol, miconazol creme vaginal, secnidazol.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59132649, '375', 'Vitoria De Souza Paz', 2, 0, '05038914284', NULL, NULL, '2000-07-02', 3, 'Constipação, aminorreia, nega  corrimento, nega  algia mamaria.
Paciente em bom estado geral, acompanhada da irmã.
Abd: sem globoso, sem dor a palpação.
Conduta: orientações gerais, exercicios fisicos, dieta alimentar, nutricionista, exames lab, usg pelvica, usg de abdome total.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59119067, '349', 'Vitoria Olivera Barbosa', 2, 0, '04771669201', NULL, '(69) 99314-7411', '2002-03-04', 3, '23 ANOS
DUM: 26/02
G1 PC
MC: DIU DE COBRE - INSERIU 27/07/2021 - 
UPPCU : NUNCA REALIZOU 

QP: PACIENTE REFERE SECRECAO VAGINAL COM PRURIDO, ALGIA MAMARIA ACICLICA,PACIENTE REFERE MANCHA HIPOCROMICA COM DIMINUICAO DA SENSIBILIDADE, DOR EM BAIXO VENTRE,

CONDUTA: E MAMA,EXAMES LAB, USG TV , PROGRAMAR COLETA DE PREVENTIVO, USG DE MAMAS 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (58953452, '106', 'Vitória Perez Graças', 2, 2, '03417035244', NULL, '(69) 9324-2044', '2000-07-15', 1, 'DUM: 23/12/24

COMORBIDADES NEGA
ALERGICA A NIMESULIDA E LACTOSE 
VACINA: OK
PROFISSAO PSICOLOGA 
FAZIA USO DE DIU E RETIROU PARA ENGRAVIDAR, 
APRESENTA USG TV 17/09: OD FOLICULO DOMINANTE E CISTO UNILOCULAR EM OE
USG DE MAMAS 17/09: BI RADS 2 
HISTORIA DE MAMA NA FAMILIA ( AVO MATERNA)  

IG 
DUM: 23/12:                                     IG 7 SEM E 5 DIAS
USG 11/02/25 (6 SEM E 6 DIAS ) IG  7 SEM E 3 DIAS. FAZ SEMANA TODAS AS QUARTAS  

TIPAGEM SANGUINEA B NEGATIVO / ESPOSO  A POSITIVO / SNR / CMR IMUNE / RUBELO IMUNE/ ANTI HBS REAGENTE / VIT B12 420/ VIT D 33,1 / TOXO IMUNE / PREVENTIVO NEGATIVO PARA NEOPLASIA 

CONDUTA: SOLICITO EXAMES DE PRE NATAL
SOLICITO MOFOLOGIA DO 1 TRIM  COM MEDIDA DO COLO DO UTERO NO RETORNO 
REGENEGIS 

--------------------  /////   -----------------------

IG 10 SEM E 5 DIAS PELO USG DE 7 SEM E 3 DIAS 
EXAMES LAB 19/02/25
TSH 1,56
T 4 LIVRE 1,02
UROCULTURA: NEG
SNR 
TS B RH NEGATIVO
CI NEGATIVO
EAS 03 A 4 PIOCITOS
HB 14,2 /HT 40,9 / LEUCO 7600/GLICOSE 72

15/04/2025

IG 15 SEM E 6 DIAS USG DO DIA 11/02/2025 - 6 SEM E 6 DIAS 
FAZ  SEMANA TODAS AS QUARTAS

PACIENTE REFERE MASTALGIA, ALEGA TONTURA SEM CAUSA, ALEGA DIMINUICAO DA MENORIA DE CURTO PRAZO

NEGA PERDAS VAGINAL
APRESENTA USG MORFOLOGICA DO 1 TRIM
13 SEM E 1 DIA, COLO 40 MM, SEM ALTERACAO MORFOLOGICA, RASTREIO NEGATIVO PARA ESPINHA BIFIDA ABRERTA, BAIXO RISCO PARA PE 

AO EXAME
 
PA 100 X60 MMHG / BCF: 142/ AU 16 CM/ 
SOLICITO EXAMES LAB E VITAMINAS


--------------- // -------------
05/05/2025
PACIENTE ASSINTOMATICA NO MOMENTO 
APRESENTA RESULTADO DE EXMAES:
02/05
HB 11,4 / 33,1/ LEUCO 6500/ PLQ 165000 / SNR/ TSH 1,62 / MAGNESIO 1,89/ GLICEMIA 74 / ANTI HBS REAGENTE / VITAMINA B 12 291 / VITAMNIA D 34, 5
EAS NITRITO POSITIVO , PIOCITOS 2-3 POR CAMPO

CONDUTA: ORIENTACOES, VITAMINA D, VITAMINA B12 INJETAVEL 
CEFALEXINA, 

22 SEM E 5 DIAS 
PACIENTE REFERE MAIS DISPOSICAO DEPOIS DAS VITAMINAS 
PESO
PA 11 X 60
BCF151
AU: 22 CM
MF PRESENTE
CONDUTA: SOLICITO EXAMES PRE NATAL E USG MORFOLOGICA DO 2 TRIM 
MANTER REGENESIS 
 _____________
16/06
24 sem 5 dias 
PACIENTE SEM QUEIXAS, ALEGA BOA MOVIMENTACAO FETAL, REFERE QUE ESAT SENTINDO MUITA FOME 
PESO 84,900G
exames lab 03/06: vit d 46,8
cultura negativa, anti hbs reagente, vit b 12 687, SNR, TOTG 77/98/8120
CONDUTA: 
OBSERVAR GANHO EXCESSO DE PESO, AVALIAR PLACENTA NO 3º TRIMESTRE ( PLACENTA BAIXA)
PACIENTE DESEJA PARTO VAGINAL 
REALIZADA VITAMINA B 12 
VACINA DTA E INFLUENZA 

04/08
IG: 31 SEM E 5 DIAS 
PACIENTE REFRE PRESSAO NA REGIAO CANAL VAGINAL 
BCF 138 
CONDUTA: ORIENTACOES, PESQUISA DE ESTREPTOCOCOS 
GRUPO B  E ECOCARDIOGRAMA FETAL 
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59191865, '424', 'Vitória Ramos de Queiroz', 2, 0, NULL, NULL, '(69) 9380-0681', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59191839, '423', 'Vitória Ramos de Queiroz', 2, 0, '05043113286', NULL, '(69) 9380-0681', '2001-03-13', 1, 'IDADE 24 ANOS
DUM: ???
MC:  ----
GP0
UPCCU: JAN 2024
COMORBIDADES: NEGA
ALERGIA: NEGA 

QP: PACIENTE REFERE IRREGULARIDADE MENSTRUAL, ALEGA QUE PAROU USO DE CONTRACEP EM NOVEMBRO E APOS ESTA TENDO ESCAPE, FEZ USO DE CONTRACEP POR 9 MESES ( 3 CICLOS) ANTERIOR FAZIA USO DE ACO 
NEGA SECRECAO VAGINAL 
AO EXAME
COLO CENTRALIZADO, PUNTIFORME, PRESENCA DE DISCRETA SECRECAO EM PAREDE ANTERIOR ESBRANQUICADA E OBSERVO GRUMOS EM PAREDE, ODOR, SANGRAMENTO TIPO BORRA DE CAFE 
CONDUTA: SOLICITO EXAMES LAB
SOLICTO USG TV
GYNOTRAN

MANDEI MENSAGEM PARA A APCIENTE PARA O RETORNO E ELA AGENDOU E DEPOIS DISSE QUE NÃO PODIA COMPARECER POR CONTA DE UMA CIRUGIA E A DRA OLHOU OS EXAMES DELA.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59131980, '371', 'Viviane nascimento lopes', 2, 1, '05038914284', NULL, NULL, '2000-05-08', 3, 'Q.P: secreção vaginal esbranquiçada com odor, há 2 meses que ocorre próximo a menstruação.
Conduta:secnidazol, gynotran.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59927540, '549', 'Viviane Nogueira de Oliveira', 2, 2, '02325893219', NULL, '(69) 9944-0044', '1992-12-02', 1, 'IDADE: 32 ANOS
DUM: 27/06
MC: LT
G3 P3C A 0 
UPCCU:  NUNCA REALIZOU

QP: MENSTRUCAO COM DURACAO DE 4 -5 DIAS, E NOS ULTIMOS DIAS APRESENTA DISMENORREIA
NEGA SECRECAO VAGINAL 
AOEXAME
COLO CI=ENTRALIZADO, SECRECAO AMARELADA COM GRUMOS E ODOR 
COLETADO PREVENTIVO, COLO SANGRANTE A COLETA
TV: AUSENCIA DE DOR A MOBILIZACAO 
CONDUTA: 
GYNOTRAN, SECNIDAZOL 
USG TV, USG DE MAMAS
NINFOPLASTIA 7000,00 CREDITO 3 X
A VISTA 6500,00
CLAREAMENTO 400,00
LASER INTIMO 1800,00 OU AVISTA 1600,00

20/08/2025
PACIENTE REALIZOU A PRIMEIRA SESSÃO DE PEELING COM  A DONA NEIVA.
POTENCILAIZADOR AGENDANDO PARA 15 DIAS', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59170428, '408', 'Waldelita Magalhães de Morais', 2, 0, '04014030253', NULL, '(69) 9983-5533', '1999-11-19', 1, '
WALDELITA MAGALHAES DE MORAES 
27/12/2024
PLANO DE SAUDE FUXEC 
IDADE 69 ANOS
DN 29/11/55
DUM: MENOPAUSA 32ANOS 
HISTERECTOMIA E OOFORECTOMIA UNILATERAL AOS 32 ANOS 
40MQNOW REPOSICAO COM ESTREVA, 
MEDICACAO EM USO ESC E RETARD,
MC: LT 
G3 P2 NFORCEPS A 1 
MENARCA 11ANOS
COMORBIDADES: DM – GLIFAGE , JARDINANCE 
CIRURGIAS PREVIAS: HISTERECTOMIA, PERINEO, LIPOASPIRACAO (28 ANOS)
OMEGA3 EPA -DHA_ VITAFOR, ESSENTIAL, PURAVIDA
ÚLTIMO PREVENTIVO: 2019
MMG 2024

QP: PACIENTE REFERE CEFALEIA, CABECA PESADA, PERDA DE MEMÓRIA, IRRITABILIDADE,  

QUESTIONARIO
FALTA DE AR, SOURES, CALORES = SIM -SUOR NOTURNO  MODERADO
MAU ESTAR NO CORACAO  = APÓS MEDICAO ESC DIMINUIU
SONO= INSONIA AS VEZES ESTADO DE ANIMO = NÃO – DORME MELHOR APÓS MEDICACAO, COM SONO PICADO
ANSIEDADE = GRAVISSIMA
IRRITABILIDADE= LEVE
SECURA VAGINAL = EXTREMAMENTE GRAVE 
IUE = NÃO  - PESO NA BEXIGA, QUE DIFICULTA URINAR 
DORES MUSCULARES= NÃO 


EXAMES LAB: 


AO EXAME: 




CONDUTA: 
ORIENTACOES 
SOLICITO DENSITOMETRIA OSSEA, USG TRANSVAGINAL
SOLICITO EXAMES LAB 
AGUARDO MAMOGRAFIA , USG DE TIREOIDE, USG DE MAMAS

15/10/2024
PACIENTE REFERE QUADRO GRIPAL E CIALTALGIA, FEZ TRATAMENTO PARA SINUSITE COM AMOXICILINA COM CLAVULANATO 

USG DE MAMAS 10/12/24: BI RADS 2 – CISTO EM MAMA DIREITAUSG DE TIREOIDE COM DOPPLER 10/10/24: CISTO DE LOBO TIREOIDEANO ESQUERDO 
USG DE APARELHO URINARIO 02/01/25: SEM CALCULA, PRESENCA DE ANGIOMIOLIPOMA 
USG DE TV 02/01/25 STATUS POS HISTERECTOMIA 
UROCULTURA: SENSÍVEL A AMOXICILINA COM CLAVULANATO
VITAMINA A 0,71
VITAMINA C 0,50
HB 13,7
HT 41,5
LEUCO 8.050
PLQ 238.000
ESTRADIOL INFERIOR 5
GLICOSE 129
HEMOGLOBINAGLICADA 6,2
MAGNESIO 1,9
TSH 1,30
T4 LIVRE 13
VITAMINA B 12 837,9
FERRO 87
FERRITINA 40,1
PROGESTERONA 0,098
FSH 68,1 
LH 34,74
VITAMINA D 59,32
CORTISOL 13
EAS NITRITO +, 20-30 PIOCITOS POR CAMPO
02/01/25 DENSITOMETRIA OSSEA: NORMAL 
06/01 URODINAMICA: NORMAL

AO EXAME: 
OCO AXILAR ESQUERDO LIVRE

CONDUTA
SOLICITO USG DE MAMAS  (NODULO AXILA A ESQUERDA? – VISTA EM RAIO -X DE TORAX )


FERROPOLIMALTOSE 100 MG  DESFER POR 60 DIAS 
VITAMINA C 1G 
OESTROGEL A NOITE 
MAGNESIO 
VITAMINA C – APÓS 5 DIAS DA APLICACAO DE MAGNESIO 
260,00 PIX 

17/01 WHATSAPP
USG DE MAMAS: BI RADS 2 
MMG BIRADS 2 ( 01/11/2024) 



22/04 
2º SESSAO DO LASER NO ROSTO

APRESENTA RESULTADO DE EXAMES
21/04
HB 14,1
HT42,7
LEUCO: 5460
PLQ 220 000
FERRO 83
FERRITINA 63 
VITAMINA B 12 738,4
VITAMINA D 52,72 

MANTER COENZIMA Q 10, OMEGA 3 VITA FARMA, OESTRADIOL, ROSA 40 MG, GLIFAGE E JARDIANCE (DM)
INICIO MELATONINA E PROGESTERONA 100 MG 
REPETIR EXAMES COM 30 DIAS APOS USO DA MEDICACAO 

4 SESSAO DE LASER FACIAL
PACIENTE REFERE QUE A MEDICACAO PARA DORMIR ACABOU, NECESSITA DA MEDICACAO, MAS NAO LEMBRA O NOME 

ALEGA QUE NO MOMENTO ESTA FAZENDO USO 
MANTER COENZIMA Q 10, OMEGA 3 VITA FARMA, OESTRADIOL, ROSA 40 MG, GLIFAGE E JARDIANCE (DM)
INICIO MELATONINA E PROGESTERONA 100 MG 

VEM PARA FAZER O LASER. NO ROSTO 
JATO DE PLASMA NO ROSTO PERIOCULAR DIREITO 
TROK - N 
20/10/2025
VEM PARA O LASER PARA O ROSTO 

20/11/2025

PACIENTE REFERE DORES NAS ARTICULACOES 
Exames laboratoriais do dia 11/11/2025 hemoglobina 14,7 hematócrito 43,6 leuco 6140 plaqueta 245000 
glicose 110 hemoglobina glicada 6,2 UREIA  42,8 creatinina 0,9 
triglicerídeos 118 colesterol total 186 
TGP 12 tsh 2,35 t4 livRE 16
 Vitamina B12 958 
ferro 87 permitindo a 58,5 fsh 31,4 LH 18 progesterona 3, 75 vitamina D 58,55 sódio 139 potássio 5 colloredo 104 ácido úrico 4 bilirrubina total zero ponto 69 bilirrubina direta zero ponto 27 bilirrubina indireta zero ponto 42 PCR 0,9 estradiol 52,8 testosterona 0,52 testosterona livre 1.0 71% Vitamina A O,69 Vitamina C 5,9

CONDUTA: MANTENHO DOSE HORMONAL, PROGESTERONA100 MG, COENZIMA Q 10, MELATONINA, OMEGA 3, AUMENTO A DOSE OESTROGEL 2 PUMP ( DEVIDO DORES ATRICULARES

', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59124024, '361', 'Waldirene Cardoso Da Silva', 2, 2, '05038914284', NULL, NULL, '1973-08-19', 3, 'Q.P: irregularidade mesntrual, irritabilidade, fogacho.
Conduta: pondera xr, tibolona.
paciente com queixas de ansiedade, pensamento negativo e suicida, paciente fez uso de pondera por 4 dias.
Conduta: exames lab, encamin psiquiatra, retiro podera xr.

22/11/23
Paciente acompanhada pelo psiquiatra, em uso de clonazepan, pondera 20mg, em uso de ceci.
conduta: exames lab.
', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59032956, '217', 'Yanara  Alves Noteno', 2, 1, '05038914284', NULL, NULL, '1997-09-25', 3, 'Q.P: metarrogia, dor em baixo do ventre, alergia ao absorvente.
Apresenta usgtv 21/09/24
utero 82,18, endometrio 12,4, od 22, oe 17,01
utero sem alteração ecografica, ovarios micropolicisticos bilateral.
Conduta: exames lab, piroxican,  gestinol, transamin.', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61055951, '757', 'YARA CLEANIS LINS COSTA', 2, 0, '03601270293', NULL, '(69) 98495-7506', '2000-09-17', 3, 'IDADE; 25 ANOS 
DUM: 05/02/26

MC: DIU DE COBRE - INSERIU 2021

QP: PACIENTE VEM PARA ROTINA GINECOLOGICA 

CONDUTA: ORIENTACOES 
USG TV 
EXAMES LAB 
PROGRAMAR PREVENTIVO
USG TV ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61369875, '822', 'YASMIN AGUIAR MAGALHÃES', 2, 0, '62100584340', NULL, '(69) 8402-2745', '1999-06-05', 1, 'UTERO ANTEVERSOFLEXÃO, MEDIDAS 7,5X3,4X4,25 VOLUME 56,7 CM , COLO UTERINO E O CANAL CERVICAL TEM ASPECTO HABITUAL, NODULO MIOMETRAL HIPOGENICO DE CONTORNOS REGULARES, INTRAMURAL LOCALIZADO NA PAREDE CORPORAL ANTERRIOR 0,5X0,5X0,6 CM, ENDO LINEAR  E HOMOGENEO  2,0MM, DIU NORMOPOSICIONADO,  OVARIO DIREITO 2,3X 2,0X 1,6 CM, VOLUME 3,8CM, OVARIO ESQUERDO 2,0X2,3X1,8  CM, VOLUME 4,3.

IMPRESSÃO DIAGNOSTICA : NODULO MIOMETRAL, MAIS COMUMENTE RELACIONADO A LEIOMIOMA.
DUM: 25/03/2026
Uso Injetável
1.	Ceftriaxona 500 mg_______________________01 ampola
Aplicar meia ampola IM em região glútea.
 
Uso oral
1.	Secnidazol 1 g ______________________04 comprimidos
Tomar 02 comprimidos VO dose única, para o casal
2.	Pantoprazol 40 mg ___________________01 caixa
Tomar 01 comprimido VO pela manhã
3.	Triplo A ___________________________01 caixa
Tomar 01 comprimido via oral de 12/12 horas por 3 dias.

Uso vaginal

1.	Gynotran  _____________________________01caixa 
Aplicar 01 óvulo VV, á noite, durante 7 dias.

AO EXAME
COLO CENTRALIZADO, PRESENCA DO FIO DO DIU, SEVRECAO AMARELADA, 
TV DOR A MOBILIZACAO DO COLO DE UTERO 
RETIRO DIU 
------------
11/05

Exames laboratoriais do dia 23 de abril magnésio 1,9 porea 20 creatinina zero ponto 32 ferro 38 tgp 16 tgo 16 glicose 76 tsh 3,16 t 4 livre 1,02 estradiol inferior a 20 ferritina 34 fsh 5,1 LH 3,8 progesterona 0,8 vitamina B12 418 hemoglobina 12,4 hematócrito 36,6 leuco 6600 plaqueta 218000 Vitamina A 0.2 vitamina C 2 vitamina B3 12,29

CONDUTA:
ORIENTACOES
REPOr VITAMINAS - B12, CoeNZIMA Q 10, VITAMINA C,  VITAMINA ADEK
-----------------------------------
NOME: YASMIN AGUIAR MAGALHÃES

Uso oral
1.	ALTA D 50.000UI  ____________________01 caixa
Tomar 01 comprimido via oral por SEMANA, durante 30 dias. 

2.	Quelatus mulher _________________________01 caixa
Tomar 01 comprimido via oral, 1 vez ao dia 

Uso sublingual 

1.	Dozemast 1000mcg _________________________01 caixa
01 comprimido SL 1 vez ao dia, por 30 dias 


reposição de vitamina ades, b12 
proximo mes - B12, COENZIMA Q 10, VITAMINA C, 
-------------------------------------
14/07/2026

NOME: YASMIN AGUIAR MAGALHÃES



USO ORAL


1.	Genova cabelo e unha  _____________________________  01 caixa  
Tomar 2 comprimidos via oral , 1 vez ao dia 

reposição de b 12 e coenzima q 10 ', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61493306, '850', 'Yeda Cunha Sales', 2, 0, NULL, NULL, '(69) 8482-7748', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59353242, '457', 'Yvana Maria Di Araújo Lopes', 2, 0, NULL, NULL, '(69) 9284-2131', NULL, 1, NULL, CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (59081695, '312', 'Zahara Duarte', 2, 0, '01253022232', NULL, '(69) 8114-1731', '2007-04-10', 1, 'IDADE: 17 ANOS
DN: 10/04/2007
MENARCA: 11 ANOS
SEXARCA: SIM 16 ANOS
MC: PRESERVATIVO 
DUM: FEVEREIRO - DURACAO 5 DIAS, 3 PRIMEIRO DIAS GRANDE QUANTIDADE E APOS QUANTIDADE MODERADA
QP: PACIENTE NEGA DISURIA, NEGA DISPAREUNIA, DISMENORREIA NOS PRIMEIRO 2 DIAS 

CONDUTA:
ORIENTACOES 
 METODO CONTRACEPTIVO - IMPLANON
EXAMES LAB
USG TV COM PREPARO INTESTINAL 

25/06/2025
PACIENTE ACOMPANHADA DA MAE, APRESENTA RESULTADO DE EXAMES LAB 
APRESENTANDO DIMINUICAO DE VITAMINAS A, D, B 12
USG YV PARA PESQUISA DE ENDOMETRIOSE - 14/05: PRESENCA DE ENDOMETRIOSE INCIPIENTE SUBPERITONEAL EM OVARIO ESQUERDO 




', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (61660219, '896', 'Zélia Wietzikoski Ulkowski', 2, 0, '90620504099', NULL, NULL, '2000-12-15', 1, 'ESCRIVÃ DE POLICIA 
idade: 65 anos 
G4 P3 (2N 1 C ) A1
HISTERECTOMIA E OOFORECTOMIA  AOS 28 ANOS ( DEVIDO MIOMATOSE E ENDOMETRIOSE) - NAO FOI REALIZADO ANATOMOPATOLOGICO 
2023: ABDOMINOPLASTIA 

QP:  PACIENTE REFERE IUE, COMO URGÊNCIA MICCIONAL, PERDE URINA DURANTE O SONO, PRECISA USAR ABSORVENTE QUANDO PRECISA SAIR DE CASA, ESSE QUADRO INICIOU APOS ABDOMINOPLASTIA, 

AO EXAME: CUPLULA SEM ALTERACAO, CANAL VAGINAL ATROFICO


CONDUTA:
ESTUDO URODINAMICO 
COLETADO PREVENTIVO EM MEIO LIQUIDO 

---------------------  // -------------------------

07/07/2026
ESTUDO URODINÂMICO 02/07/2026: INCONTINÊNCIA URINARIA DE ESFORÇO 
PREVENTIVO: 16/06/2026: NEGATIVO PARA NEOPLASIA 

ENCAMINHO PARA CIRURGIA 






LAUDO MÉDICO PARA ENCAMINHAMENTO CIRÚRGICO – UROGINECOLOGIA

Paciente: ZELIA WIETZZIKOSKI 
Idade: 65 anos
História Clínica:
Paciente, G4P3 (2 partos normais, 1 cesariana), A1, com antecedente de histerectomia total associada à ooforectomia bilateral aos 28 anos por miomatose uterina e endometriose, sem exame anatomopatológico disponível. Realizou abdominoplastia em 2023.
Paciente refere sintomas urinários que se agravaram após a abdominoplastia, caracterizados por incontinência urinária aos esforços, urgência miccional, perdas urinárias durante o sono e necessidade do uso de absorventes para atividades fora do domicílio, com importante impacto na qualidade de vida e nas atividades diárias.
Exame Ginecológico:
         Cúpula vaginal sem alterações. Canal vaginal atrófico.
Exames Complementares:
•	Estudo urodinâmico (02/07/2026): compatível com incontinência urinária de esforço.


•	Citologia oncótica em meio líquido (16/06/2026): negativa para neoplasia.
Conclusão:
Considerando o quadro clínico, o impacto funcional e social dos sintomas, bem como a confirmação diagnóstica por estudo urodinâmico, a paciente apresenta indicação de tratamento cirúrgico para correção da incontinência urinária de esforço.
Porto Velho, 07 de Julho de 2026



', CURRENT_TIMESTAMP(3));
INSERT INTO `patients` (`source_code`, `record_number`, `full_name`, `sex`, `marital_status`, `cpf`, `email`, `phone`, `birth_date`, `insurance_code`, `notes`, `updated_at`) VALUES (62097308, '975', 'Zemma Ochoa', 2, 0, '67040934000', NULL, '(69) 99243-9380', '1960-03-14', 1, 'IDADE: 66 ANOS 
DUM: + 10 ANOS 
MEDICACAO EM USO:
COMORBIDADES: DISLIPIDEMIA  
ALERGIA: VASOCONSTRITOR
HISTERECTOMIA EM 2024
PROFISSAO PROFESSORA
OBSERVAÇÃO PACIENTE NAO PODE USAR ANESTÉSICO COM VASOCONSTRITOR 

paciente refere secura vaginal, alega incomodo durante o ato sexual, refere que quando a bexiga esta cheia ( discreto)
alega também flacidez na vulva 

CONDUTA: 
REALIZO PRIMIERA SESSAO DE LASER INTIMO, ENTREGO TCLE

NOME: Zemma Ochoa


USO VAGINAL


1.	BELAMY ________________________________01 caixa

Aplicar via vaginal, á noite  a cada 3 dias ( 2 aplicações)


2.	FLUCONAZOL 150 mg ______________________01 comprimido

Tomar 01 comprimido via oral dose única 



', CURRENT_TIMESTAMP(3));
