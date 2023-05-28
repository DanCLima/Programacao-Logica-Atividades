/* Exercício 1)
Quais são os resultados das consultas abaixo?
?- forall(member(X,[1,2,3]),write(X)). 
R: 123

?- forall(between(1,5,I),(write(I*I),write(' '))).
R: 1*1 2*2 3*3 4*4 5*5

?- forall(between(10,20,I),write(I: ' ')). 
R: 10: 11: 12 : 13 : 14 : 15 : 16 : 17 : 18 : 19 : 20: */

/* Exercício 2)
a:-a(0).
a(X):- X>10,!.
a(X):- write(X),write(’ ’), X1 is X+1,a(X1).

Qual será o resultado da seguinte consulta Prolog:
?- a.
R: 0 1 2 3 4 5 6 7 8 9 10 */

% Exercício 3)
wN(0) :- write(0), !.
wN(N) :- write(N),N1 is N-1, wN(N1),write(N).

espaco(0) :- !.
espaco(X) :- write(' '), X1 is X - 1, espaco(X1). % faltou usar esse predicado

repete(X,Y) :- espaco(Y), wN(0), !.
repete(X,Y) :- X1 is X - 1, Y1 is Y - X, 
    repete(X1,Y1), nl, espaco(Y1), wN(X).