INSERT INTO TB_Especialidade (Nome_Especialidade)

	VALUES 
	('Cl�nica M�dica'),
	('Dermatologia'),
	('Gastroenterologia'),
	('Geriatria'),
	('Ginecologia'),
	('Infectologia'), 
	('Oftamologia'),
	('Pediatria'),
	('Urologia'),
	('Neurologia'),
	('Ortop�dia')

INSERT INTO TB_Status_Pagamento (Descricao)

	VALUES 
	('Completo'),
	('Aprovado'),
	('Em An�lise'),
	('Estornado'),
	('Cancelado')

INSERT INTO TB_Forma_Pagamento (Descricao)

	VALUES
	('Particular'),
	('Conv�nio')

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