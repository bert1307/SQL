/*BANCO DE DADOS*/
CREATE DATABASE CONSULTORIO
GO
USE CONSULTORIO

/*TABELAS*/

/*PACIENTE*/
CREATE TABLE TB_Paciente
(

	IdPaciente				INT IDENTITY(1,1),
	Nome_Paciente			VARCHAR(50) NOT NULL,
	Telefone				VARCHAR(11) NOT NULL,
	Email					VARCHAR(50) NOT NULL,
	Endereco				VARCHAR(100) NOT NULL,
	CPF						VARCHAR(11) NOT NULL, 
	Nascimento				VARCHAR(10) NOT NULL,
	Observacao				VARCHAR(100)

	CONSTRAINT PK_IdPaciente_TB_Paciente PRIMARY KEY (IdPaciente)
)
GO

/*ESPECIALIDADE*/
CREATE TABLE TB_Especialidade
(

	IdEspecialidade			INT IDENTITY(1,1),
	Nome_Especialidade		VARCHAR(50) NOT NULL

	CONSTRAINT PK_IdEspecialidade_TB_Especialidade PRIMARY KEY (IdEspecialidade)

)
GO

/*MEDICO*/
CREATE TABLE TB_Medico
(

	IdMedico				INT IDENTITY(1,1),
	IdEspecialidade			INT NOT NULL,
	Nome_Medico				VARCHAR(50) NOT NULL,
	CRM						INT NOT NULL, 
	Telefone				VARCHAR(11) NOT NULL,
	Endereco				VARCHAR(100) NOT NULL,
	Email					VARCHAR(50) NOT NULL

	CONSTRAINT PK_IdMedico_TB_Medico PRIMARY KEY (IdMedico),
	CONSTRAINT FK_IdEspecialidade_TB_Especialidade_TB_Medico FOREIGN KEY(IdEspecialidade) REFERENCES TB_Especialidade(IdEspecialidade)
	
)
GO

CREATE INDEX Lista_Medicos
ON TB_Medico(CRM)

GO


/*SALA*/
CREATE TABLE TB_Sala
(

	IdSala					INT IDENTITY(1,1),
	IdEspecialidade			INT NOT NULL,
	Num_Sala				INT NOT NULL

	CONSTRAINT PK_IdSala_TB_Sala PRIMARY KEY(IdSala),
	CONSTRAINT FK_IdEspecialidade_TB_Especialidade_TB_Sala FOREIGN KEY(IdEspecialidade) REFERENCES TB_Especialidade(IdEspecialidade)
	
)
GO

/*STATUS PAGAMENTO*/
CREATE TABLE TB_Status_Pagamento
(
	IdStatus_Pagamento		INT IDENTITY(1,1),
	Descricao				VARCHAR(50) NOT NULL

	CONSTRAINT PK_IdStatus_Pagamento_TB_Status_Pagamento PRIMARY KEY(IdStatus_Pagamento)

)
GO

/*FORMA PAGAMENTO*/
CREATE TABLE TB_Forma_Pagamento
(
	IdForma_Pagamento		INT IDENTITY(1,1),
	Descricao				VARCHAR(50) NOT NULL

	CONSTRAINT PK_IdForma_Pagamento_TB_Forma_Pagamento PRIMARY KEY(IdForma_Pagamento)

)
GO

/*CONSULTA*/
CREATE TABLE TB_Consulta
(

	IdConsulta				INT IDENTITY(1,1),
	IdPaciente				INT NOT NULL,
	IdMedico				INT NOT NULL,
	IdSala					INT NOT NULL,
	IdStatus_Pagamento		INT NOT NULL,
	IdForma_Pagamento		INT NOT NULL,
	Valor_Consulta			DECIMAL(18,2) NOT NULL,
	Data_Consulta			DATE NOT NULL,
	Hora_Consulta			TIME NOT NULL
	

	CONSTRAINT PK_IdConsulta_TB_Consulta PRIMARY KEY (IdConsulta),
	CONSTRAINT FK_IdPaciente_TB_Paciente_TB_Consulta FOREIGN KEY(IdPaciente) REFERENCES TB_Paciente(IdPaciente),
	CONSTRAINT FK_IdMedico_TB_Medico_TB_Consulta FOREIGN KEY(IdMedico) REFERENCES TB_Medico(IdMedico),
	CONSTRAINT FK_IdSala_TB_Sala_TB_Consulta FOREIGN KEY(IdSala) REFERENCES TB_Sala(IdSala),
	CONSTRAINT FK_IdStatus_Pagamento_TB_Status_Pagamento_TB_Consulta FOREIGN KEY(IdStatus_Pagamento) REFERENCES TB_Status_Pagamento(IdStatus_Pagamento),
	CONSTRAINT FK_IdForma_Pagamento_TB_Forma_Pagamento_TB_Consulta FOREIGN KEY(IdForma_Pagamento) REFERENCES TB_Forma_Pagamento(IdForma_Pagamento)

	
)
GO

/*EXAME*/
CREATE TABLE TB_Exame
(

	IdExame					INT IDENTITY(1,1),
	Nome_Exame				VARCHAR(50) NOT NULL,
	Descricao_Exame			VARCHAR(100) 

	CONSTRAINT PK_IdExame_TB_Exame PRIMARY KEY (IdExame)
	
)
GO

/*PEDIDO EXAME*/
CREATE TABLE TB_Pedido_Exame
(

	IdPedido_Exame			INT IDENTITY(1,1),
	IdConsulta				INT NOT NULL,
	IdExame					INT NOT NULL,
	Valor_Exame				DECIMAL(18,2) NOT NULL,
	Resultado 				VARCHAR(100)

	CONSTRAINT PK_IdPedido_Exame_TB_Pedido_Exame PRIMARY KEY (IdPedido_Exame),
	CONSTRAINT FK_IdConsulta_TB_Consulta_TB_Pedido_Exame FOREIGN KEY(IdConsulta) REFERENCES TB_Consulta(Idconsulta),
	CONSTRAINT FK_IdExame_TB_Exame_TB_Pedido_Exame FOREIGN KEY(IdExame) REFERENCES TB_Exame(IdExame)

)
GO

/*TRATAMENTO MEDICO*/
CREATE TABLE TB_Tratamento_Medico
(

	IdTratamento_Medico		INT IDENTITY(1,1),
	IdConsulta				INT NOT NULL,
	Descricao_Tratamento	VARCHAR(200)

	CONSTRAINT PK_IdTratamento_Medico_TB_Tratamento_Medico PRIMARY KEY (IdTratamento_Medico),
	CONSTRAINT FK_IdConsulta_TB_Consulta_TB_Tratamento_Medico FOREIGN KEY(IdConsulta) REFERENCES TB_Consulta(Idconsulta)	

)
GO