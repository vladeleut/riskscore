/* libname lib "/folders/myfolders/riskscore"; */

/* importando todas as bases: */
/* cadastro */
proc import datafile="/folders/myfolders/base_cadastro.txt" 
	replace 
	dbms=csv 
	out=lib.base_cadastro;
	getnames=yes;
	delimiter=';';
run;

/* fatura */
proc import datafile="/folders/myfolders/base_fatura.txt" 
	replace 
	dbms=csv 
	out=lib.base_fatura;
	getnames=yes;
	delimiter=';';
run;

/* fatura 100k */
proc import datafile="/folders/myfolders/base_fatura_100k.txt" 
	replace 
	dbms=csv 
	out=lib.base_fatura_100k;
	getnames=yes;
	delimiter=';';
run;

/* movimentação */
proc import datafile="/folders/myfolders/base_movimentacao.txt" 
	replace 
	dbms=csv 
	out=lib.base_movimentacao;
	getnames=yes;
	delimiter=';';
run;

/* movimentação 100k */
proc import datafile="/folders/myfolders/riskscore/base_movimentacao_100k.txt" 
	replace 
	dbms=csv 
	out=lib.base_movimentacao_100k;
	getnames=yes;
	delimiter=';';
run;
