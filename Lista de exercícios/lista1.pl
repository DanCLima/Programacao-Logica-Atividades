% Exercício 1)
analisa_lista([]) :- write('A lista esta vazia'), !.
analisa_lista([A|B]) :- 
    write('A cabeca da lista eh: '(A)), nl,
    write('A cauda da lista eh: '(B)).

% Exercício 2)
ap([],L,L).
ap([A|B],C,[A|D]) :- ap(B,C,D).

remove_duplicados([A|B],C) :- member(A,B), remove_duplicados(B,C), !.
remove_duplicados([A|B],[A|C]) :- remove_duplicados(B,C), !.
remove_duplicados([],[]).

% Exercício 3)
troca([X|B],X,Y,[Y|C]) :- troca(B,X,Y,C), !.
troca([A|B],X,Y,[A|C]) :- A \== X, troca(B,X,Y,C), !.
troca([],_,_,[]).

% Exercício 4)
subconjunto([],[]).
subconjunto([A|B],[A|C]) :- subconjunto(B,C).
subconjunto([_|B],C) :- subconjunto(B,C).

potencia(X,Y) :- findall(L, subconjunto(X,L), Y).

% Exercício 5)
mais_longa([],[_|_]).
mais_longa([_|B], [_|D]) :- mais_longa(B,D).

% Exercício 6)
distancia((A,B),(C,D), X) :- 
S is (A - C) * (A - C) + (B - D) * (B - D),
X is sqrt(S).

% Exercício 7)
linha(0,_) :- nl, !.
linha(X,Y) :- write(Y), write(' '), N1 is X - 1, linha(N1,Y), !.

quadrado2(0,_,_) :- nl, !.
quadrado2(Z,X,Y) :- linha(X,Y), Z1 is Z - 1, quadrado2(Z1,X,Y), !.

quadrado(X,Y) :- quadrado2(X,X,Y), !.

% Exercício 8)
elemento_n([A|_],1,A) :- !.
elemento_n([_|B],X,Y) :- X1 is X - 1, elemento_n(B,X1,Y).

% Exercício 9)
somaLista([],0).
somaLista([A|B],X) :- somaLista(B,X1), X is X1 + A.

tamLista([],0).
tamLista([_|B],X) :- tamLista(B,X1), X is X1 + 1.

media([A|B],X) :- 
    somaLista([A|B],S), tamLista([A|B],T), 
    X is (S / T).

% Exercício 10)
minimo([A],A) :- !.
minimo([A|B],A) :- minimo(B,X1), A =< X1.
minimo([_|B],X) :- minimo(B,X).

% Exercício 11)
intervalo(X,X,[X]) :- !.
intervalo(X,Y,[X|B]) :- X < Y, X1 is X + 1, intervalo(X1,Y,B).
intervalo(X,Y,[X|B]) :- X > Y, X1 is X - 1, intervalo(X1,Y,B).

% Exercício 12)
% mdc(X,X,X).

% Exercício 13)
ocorrencias(_,[],0) :- !.
ocorrencias(X,[X|B],C) :- ocorrencias(X,B,C1), C is C1 + 1, !.
ocorrencias(X,[_|B],C) :- ocorrencias(X,B,C). 

% Exercício 14)
divisores(X,Y) :- findall(Y1,(between(1,X,Y1),X mod Y1 =:= 0), Y).