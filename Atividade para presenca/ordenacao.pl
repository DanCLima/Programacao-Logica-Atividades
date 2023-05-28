/*−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−--------------------------------+
|           UNIFAL - Universidade Federal de Alfenas            | 
|             BACHARELADO EM CIÊNCIA DA COMPUTAÇÃO              |
|                                                               |
|   Trabalho...........: Atividade para presença - Ordenação    |    
|   Disciplina.........: Programação Lógica                     |    
|   Professor..........: Luiz Eduardo da Silva                  |        
|   Aluno..............: Daniel da Costa Lima - 2021.1.08.026   |           
|   Data...............: 14/08/2022                             |
+--------------------------------------------------------------*/

/* Predicado que concatena listas */
ap([],L,L).
ap([A|B],C,[A|D]) :- ap(B,C,D). 

/* Predicado que divide uma lista em duas a partir de uma referência. Uma lista contém valores da lista inicial
 que são maiores do que a referência passada e a outra lista contém os menores valores. */
particao([X|L], Pivo, [X|Menores], Maiores) :-
    X >= Pivo, !, particao(L,Pivo,Menores,Maiores).
particao([X|L], Pivo, Menores, [X|Maiores]) :-
    X < Pivo, !, particao(L,Pivo,Menores,Maiores).
particao([],_,[],[]).

/* Ordenando pelo método Quick Sort */
qSort([X|Xs], S):-
    particao(Xs, X, Me, Ma),
    qSort(Me, SMe),
    qSort(Ma, SMa),
    ap(SMe, [X|SMa], S).
qSort([],[]).

% Ordenando por troca
ordemTroca(L,S) :- 
    ap(X,[A,B|Ls],L), B > A, !,
    ap(X,[B,A|Ls],Li),
    ordemTroca(Li,S).
ordemTroca(L,L).	