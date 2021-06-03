INSERT INTO TB_Especialidade (Nome_Especialidade)

	VALUES 
	('Clínica Médica'),
	('Dermatologia'),
	('Gastroenterologia'),
	('Geriatria'),
	('Ginecologia'),
	('Infectologia'), 
	('Oftamologia'),
	('Pediatria'),
	('Urologia'),
	('Neurologia'),
	('Ortopédia')

INSERT INTO TB_Status_Pagamento (Descricao)

	VALUES 
	('Completo'),
	('Aprovado'),
	('Em Análise'),
	('Estornado'),
	('Cancelado')

INSERT INTO TB_Forma_Pagamento (Descricao)

	VALUES
	('Particular'),
	('Convênio')

INSERT INTO TB_Exame (Nome_Exame)

	VALUES 
	('Hemograma'),
	('Glicemia em jejum'),
	('Endoscopia'),
	('Eletrocardiograma'),
	('Papanicolau'),
	('PSA')

INSERT INTO TB_Sala (Num_Sala, IdEspecialidade)

	VALUES 
	(01, 10),
	(02, 4),
	(03, 9),
	(04, 6),
	(05, 7),
	(06, 4),
	(07, 2),
	(08, 5),
	(09, 8),
	(10, 1),
	(11, 3)