CREATE PROCEDURE PR_Cadastro_Paciente

	@Nome					VARCHAR(50),
	@Telefone				VARCHAR(11),
	@Email					VARCHAR(50),
	@Endereco				VARCHAR(100),
	@CPF					VARCHAR(11),
	@Nascimento				VARCHAR(10)
	
	AS
		
		BEGIN
			
			INSERT INTO TB_Paciente
				(Nome_Paciente, Telefone,Email, Endereco, CPF, Nascimento)
			VALUES 
				(@NOme, @Telefone, @Endereco,@Email, @CPF, @Nascimento)
		
		END

GO 

EXEC PR_Cadastro_Paciente 'Rogerio', '11925326458','rogerio@gmail.com', 'Av. Paulista, 55', '45824698752', '01-01-1990'
EXEC PR_Cadastro_Paciente 'Flavia', '11958484876','flavia@gmail.com', 'Av. São João, 1558', '85496312547', '02-02-1991'
EXEC PR_Cadastro_Paciente 'Jairo', '11956489725','jairo@gmail.com', 'Av. Castro Alves, 154', '48756845878', '03-03-1992'
EXEC PR_Cadastro_Paciente 'Rodrigo', '11925325544','rodrigo@gmail.com', 'Rua Miguel Pereira, 254', '45879612575', '04-04-1993'
EXEC PR_Cadastro_Paciente 'Maria Rita', '11958486321','mariarita@gmail.com', 'Rua Ipiranga, 45', '75846878948', '05-05-1994'
EXEC PR_Cadastro_Paciente 'Meire', '159568487965','meire@gmail.com','Av Multinga, 1545', '65878921445', '06-06-1995'

CREATE PROCEDURE PR_Cadastro_Medico

	@Nome					VARCHAR(50),
	@IdEspecialidade		INT,
	@Telefone				VARCHAR(11),
	@Endereco				VARCHAR(100),
	@CRM					INT,
	@Email					VARCHAR(50)
	
	AS
		
		BEGIN
			
			INSERT INTO TB_Medico
				(Nome_Medico, IdEspecialidade, Telefone, Endereco, CRM, Email)
			VALUES 
				(@Nome, @IdEspecialidade, @Telefone, @Endereco, @CRM, @Email)
		
		END

GO 

EXEC PR_Cadastro_Medico 'Caio', 7, '11956894721', 'Rua Rio Branco, 21', 326586, 'caio@gmail.com'
EXEC PR_Cadastro_Medico 'Julia', 11, '11985478544', 'Av.Matarazzo, 48', 568947, 'julia@gmail.com'
EXEC PR_Cadastro_Medico 'Rosa', 10, '11947586235' , 'Av. Paulista, 1544',588789, 'rosa@gmail.com'
EXEC PR_Cadastro_Medico 'Carlos', 3, '11945783625', 'Av. Carlos Andrade, 78', 584788, 'carlos@gmail.com'
EXEC PR_Cadastro_Medico 'Roberto', 1, '11939457862', 'Av. Caruaru, 75', 758689, 'roberto@gmail.com'
EXEC PR_Cadastro_Medico 'Carina', 5, '11921567859', 'Rua 25 de Março, 45', 874698, 'carina@gmail.com'


CREATE PROCEDURE PR_Pedido_Exame

	@IdConsulta				INT,
	@IdExame				INT,
	@Valor_Exame			DECIMAL(18,2)
	
	AS
		
		BEGIN
			
			INSERT INTO TB_Pedido_Exame
				(IdConsulta, IdExame, Valor_Exame)
			VALUES 
				(@IdConsulta, @IdExame, @Valor_Exame)
		
		END

GO 

CREATE PROCEDURE PR_Cadastro_Tratamento_Medico

	@IdConsulta				INT,
	@Descricao_Tratamento			VARCHAR(200)
	
	AS
		
		BEGIN
			
			INSERT INTO TB_Tratamento_Medico
				(IdConsulta, Descricao_Tratamento)
			VALUES 
				(@IdConsulta, @Descricao_Tratamento)
		
		END


GO 

CREATE PROCEDURE PR_Cadastro_Sala

	@IdEspecialidade		INT,				
	@Num_Sala				INT
	
	AS
		
		BEGIN
			
			INSERT INTO TB_Sala
				(IdEspecialidade, Num_Sala)
			VALUES 
				(@IdEspecialidade, @Num_Sala)
		
		END

GO 

CREATE PROCEDURE PR_Agendamento_Consulta

	@IdPaciente				INT,
	@IdMedico				INT,
	@IdSala					INT,
	@IdStatus_Pagamento		INT,
	@IdForma_Pagamento		INT,
	@Valor_Consulta			DECIMAL(18,2),
	@Data_Consulta			DATE,
	@Hora_Consulta			TIME	
AS		
		BEGIN			
			INSERT INTO TB_Consulta
				(IdPaciente, IdMedico, IdSala, IdStatus_Pagamento, IdForma_Pagamento, Valor_Consulta, Data_Consulta, Hora_Consulta)
			VALUES 
				(@IdPaciente, @IdMedico, @IdSala, @IdStatus_Pagamento, @IdForma_Pagamento, @Valor_Consulta, @Data_Consulta, @Hora_Consulta)
		END		
GO 
EXEC PR_Agendamento_Consulta 4, 5, 10 , 3, 2, 210.0, '20210813', '15:30'
SELECT * FROM TB_Consulta

EXEC PR_Agendamento_Consulta 1,3, 11, 3, 2, 150.35, '20210501', '13:30'
EXEC PR_Agendamento_Consulta 2, 6, 8, 1, 1, 80.50, '20201021', '15:40'
EXEC PR_Agendamento_Consulta 3, 3, 1, 3, 2, 100.20, '20200805', '10:20'
EXEC PR_Agendamento_Consulta 4, 5, 10, 2, 2, 140.50, '20200817', '08:50'


CREATE PROCEDURE PR_Relatorio_Mensal
	/*PARAMENTROS*/	
	@mes					INT,
	@ano					INT
AS
	BEGIN
		SELECT 
		/*SELECIONE TODOS ESSES CAMPOS*/			
			Nome_Paciente AS Paciente,
			Data_Consulta,
			Hora_Consulta			
		FROM	
		/*DADOS DE DUAS TABELAS*/			
			TB_Paciente INNER JOIN TB_Consulta 
		ON	TB_Paciente.IdPaciente = TB_Consulta.IdPaciente			
		WHERE 
		/*NO MES E ANO SELECIONADO PELO USUARIO*/
			MONTH(Data_Consulta) = @mes AND	YEAR(Data_Consulta) = @ano
		END
GO

EXEC PR_Relatorio_Mensal '08', '2020'



CREATE PROCEDURE PR_Atualizar_Paciente
	
	@IdPaciente				INT,	
	@Telefone				VARCHAR(11),
	@Email					VARCHAR(50),
	@Endereco				VARCHAR(100)	
AS		
	BEGIN			
		UPDATE	TB_Paciente 
		SET		
			Telefone = @Telefone,
			Email = @Email,	
			Endereco = @Endereco		
		WHERE				
			IdPaciente = @IdPaciente
		END
GO

EXEC PR_Atualizar_Paciente 2, '11998010236', 'FLAVIA@HOTMAIL.COM', 'RUA AUGUSTA, 307' 
SELECT * FROM TB_Paciente



CREATE PROCEDURE PR_FATURAMENTO_CONSULTA
	@MES INT,
	@ANO INT
AS
	BEGIN
		SELECT SUM(Valor_Consulta) AS TOTAL_CONSULTAS
		FROM TB_Consulta
		WHERE
			MONTH(Data_Consulta) = @MES AND YEAR(Data_Consulta) = @ANO		
	END
GO
EXEC PR_FATURAMENTO_CONSULTA '08', '2020'



CREATE PROCEDURE PR_EXCLUI_EXAME
	@IDEXAME INT,
	@Nome_Exame VARCHAR(50)
AS
	BEGIN
		DELETE FROM TB_Exame
		WHERE
			IdExame = @IDEXAME AND Nome_Exame = @Nome_Exame		
	END
GO

EXEC PR_EXCLUI_EXAME 3, 'Endoscopia'
SELECT * FROM TB_Exame