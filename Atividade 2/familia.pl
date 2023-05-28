/*−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−---+
|           UNIFAL - Universidade Federal de Alfenas            |
|             BACHARELADO EM CIÊNCIA DA COMPUTAÇÃO              |
|                                                               |
|   Trabalho...........: Atividade 2 - Árvore Genealógica       |
|   Disciplina.........: Programação Lógica                     |
|   Professor..........: Luiz Eduardo da Silva                  |
|   Aluno..............: Daniel da Costa Lima - 2021.1.08.026   |
|   Data...............: 29/06/2022                             |
+--------------------------------------------------------------*/

pai(bruno,jorge).
pai(jorge,gustavo).
pai(jorge,jessica).
pai(moacir,leo).
pai(moacir,carmen).
pai(leo,vagner).
pai(leo,larissa).
pai(vagner,lucia).
pai(vagner,gilmar).
pai(vagner,kelvin).
pai(vladimir,neusa).
pai(vladimir,cleiton).

mae(lucinda,jorge).
mae(laura,carmen).
mae(laura,leo).
mae(telma,neusa).
mae(telma,cleiton).
mae(carmen,gustavo).
mae(carmen,jessica).
mae(neusa,vagner).
mae(neusa,larissa).
mae(jessica,lucia).
mae(jessica,gilmar).
mae(jessica,kelvin).

filho(X,Y) :- pai(Y,X); mae(Y,X).

irmao(X,Y) :- filho(X,A), filho(Y,A), X\==Y.

pais(X,Y) :- mae(X,Y); pai(X,Y).

tio(X,Y) :- pai(A,Y), irmao(A,X); mae(A,Y),irmao(A,X).

primo(X,Y) :- pai(A,Y), tio(A,X).

neto(X,Y) :- (mae(Y,A);pai(Y,A)),(mae(A,X);pai(A,X)).

avos(X,Y) :- neto(Y,X).

bisavos(X,Y) :- (pai(A,Y);mae(A,Y)), neto(A,X).

antecessor(X,Y) :- (pai(X,Y);mae(X,Y)).
antecessor(X,Y) :- (pai(X,Z);mae(X,Z)), antecessor(Z,Y).