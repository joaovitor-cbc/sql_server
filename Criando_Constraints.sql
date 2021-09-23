USE Concessionaria;

CREATE TABLE tblEstoque
(
	idEstoque			int			identity
	Constraint PK_tblEstoque_idEstoque
	Primary Key (idEstoque),

	idModelo			int			not null
	Constraint FK_tblEstoque_tblModelos
	Foreign Key (idModelo)
	References tblModelos(idModelo),
	/*
	 * default é uma constrain(regra) que se nenhum valor
	 * for atribuido ao campo sera aquele valor
	 * que foi setado nele como por padrão
	 * estamos pegando a data atual do sistena
	 */
	dataEntrada			date		Default GETDATE(),

	precoEstoque		money		not null
	/*
	 * CHECK tambem é outra constrain(regar)
	 * que ira se a condição que determinamos
	 * para determinado campo se preenchido
	 * atende as nossas regras de negocios que criamos.
	 */
	Constraint CK_tblEstoque_precoEstoque
	CHECK (precoEstoque >= 10000 AND precoEstoque <= 200000)

);

SELECT * FROM tblEstoque;

-- Nova Coluna
ALTER TABLE tblEstoque
ADD placa nChar(8) not null;


-- Alterar o tamanho de uma coluna
ALTER TABLE tblEstoque
ALTER COLUMN placa nChar(7) Null;

EXEC sp_help tblEstoque;

-- Excluir Coluna
ALTER TABLE tblEstoque
DROP COLUMN placa;


