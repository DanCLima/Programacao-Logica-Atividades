/*--------------------------------------------------------------+
|           UNIFAL - Universidade Federal de Alfenas            | 
|             BACHARELADO EM CIÊNCIA DA COMPUTAÇÃO              |
|                                                               |
|   Trabalho...........: Atividade 4 - Missionários             |    
|   Disciplina.........: Programação Lógica                     |    
|   Professor..........: Luiz Eduardo da Silva                  |        
|   Aluno..............: Daniel da Costa Lima - 2021.1.08.026   |           
|   Data...............: 25/08/2022                             |    
+--------------------------------------------------------------*/

/* Predicado para concatenar listas */
ap([],X,X).
ap([A|B],C,[A|D]) :- ap(B,C,D).

/* Prediado que verifica se um elemento pertence a uma lista */
in(A,[A|_]) :- !.
in(A,[_|B]) :- in(A,B).

% Implementação do algoritmo de busca em largura ou profundidade
% 1 = largura
% 2 = profundidade
estrategia(1).

atingemeta([_-E|_]) :- meta(E).

busca([Caminho|_], Solucao) :- atingemeta(Caminho), !, Solucao = Caminho.
busca([Caminho|Lista], Solucao) :- 
   findall(UMAEXT, estende(Caminho,UMAEXT), EXT),
   estrategia(Tipo),
   estrategia(Tipo),
   (Tipo = 1 -> ap(Lista, EXT,  Lista1);
    Tipo = 2 -> ap(EXT, Lista, Lista1)),
   busca(Lista1, Solucao).

naorepete(_-E,C) :- not(in(_-E,C)).

estende([OperacaoX-EstadoA|Caminho], [OperacaoY-EstadoB,OperacaoX-EstadoA|Caminho]) :-
   oper(OperacaoY,EstadoA,EstadoB),
   naorepete(OperacaoY-EstadoB,Caminho).

margem([F,L,C,R], M) :-
   (F = M -> write('F'); write(' ')),
   (L = M -> write('L'); write(' ')),
   (C = M -> write('C'); write(' ')),
   (R = M -> write('R'); write(' ')). 

desenha(Estado) :-
     write('    '), margem(Estado, a), write('|    |'), margem(Estado,b). 

escreve([_-E]) :- nl, write('Estado Inicial: '), write(E), nl, !.
escreve([O-E|R]) :- 
    escreve(R), 
    write('Movimento: '), 
    traduz(O,T),
    write(T), /*desenha(E),*/ write(E), nl.

resolva :-
    inicial(X), 
    busca([[raiz-X]],S), 
    write(S), nl,
    escreve(S),
    write('Problema resolvido.').

/*--------------------------+
| Especificacao do problema |
+--------------------------*/

traduz(mb, 'Missionario vai sozinho pro lado B, obtemos:         ').
traduz(ma, 'Missionario vai sozinho pro lado A, obtemos:         ').
traduz(cb, 'Canibal vai sozinho pro lado A, obtemos:             ').
traduz(ca, 'Canibal vai sozinho pro lado A, obtemos:             ').
traduz(mcb, 'Missionario e canibal vao para o lado B, obtemos:    ').
traduz(mca, 'Missionario e canibal vao para o lado A, obtemos:    ').
traduz(mmb, 'Dois missionarios vao pro lado B, obtemos:           ').
traduz(mma, 'Dois missionarios vao pro lado A, obtemos:           ').
traduz(ccb, 'Dois canibais vao pro lado B, obtemos:               ').
traduz(cca, 'Dois canibais vao pro lado A, obtemos:               ').

/* [Missionário no lado A, Canibal no lado A, Missionário no lado B, Canibal no lado B, Posição da canoa (0 = A, 1 = B)] */
inicial([3,3,0,0,0]).
meta([0,0,3,3,1]).

/* Verifica se a quantidade de missionários é maior do que a quantidade de canibais. Outra possibilidade que deve ser considerada,
é a quantidade de missionários ser igual a zero de em algum lado do rio.*/
verifica([M,C,M1,C2]) :- (M >= C; M == 0), (M1 >= C2; M1 == 0). 

% L = 0, canoa no lado A
% L = 1, canoa no lado B
% mb - missionário vai sozinho pro lado B
oper(mb, [M,C,M1,C1,L], [M3,C,M4,C1,1]) :- 
    L == 0, M > 0, M3 is M - 1, M4 is M1 +1,
    verifica([M3,C,M4,C1]).
% ma - missionário vai sozinho pro lado A
oper(ma, [M,C,M1,C1,L], [M3,C,M4,C1,0]) :-
    L == 1, M1 > 0, M4 is M1 - 1, M3 is M + 1,
    verifica([M3,C,M4,C1]).
% cb - canibal vai sozinho pro lado B
oper(cb, [M,C,M1,C1,L], [M,C3,M1,C4,1]) :-
    L == 0, C > 0, C3 is C - 1, C4 is C1 + 1,
    verifica([M,C3,M1,C4]).
% ca - canibal vai sozinho pro lado A
oper(ca, [M,C,M1,C1,L], [M,C3,M1,C4,0]) :-
    L == 1, C1 > 0, C4 is C1 - 1, C3 is C + 1,
    verifica([M,C3,M1,C4]).
% mcb - missionário e canibal vão pro lado B
oper(mcb, [M,C,M1,C1,L], [M3,C3,M4,C4,1]) :-
    L == 0, M > 0, C > 0, M3 is M - 1, C3 is C - 1, M4 is M1 +1, C4 is C1 + 1,
    verifica([M3,C3,M4,C4]).
% mca - missionário e canibal vão pro lado A
oper(mca, [M,C,M1,C1,L], [M3,C3,M4,C4,0]) :-
    L == 1, M1 > 0, C1 > 0, M4 is M1 - 1, C4 is C1 - 1, M3 is M + 1, C3 is C + 1,
    verifica([M3,C3,M4,C4]).
% mmb - dois missionários vão pro lado B
oper(mmb, [M,C,M1,C1,L], [M3,C,M4,C1,1]) :-
    L == 0, M > 1, M3 is M - 2, M4 is M1 + 2,
    verifica([M3,C,M4,C1]).
% mma - dois missionários vão pro lado A
oper(mma, [M,C,M1,C1,L], [M3,C,M4,C1,0]) :-
    L == 1, M1 > 1, M4 is M1 - 2, M3 is M + 2,
    verifica([M3,C,M4,C1]).
% ccb - dois canibais vão pro lado B
oper(ccb, [M,C,M1,C1,L], [M,C3,M1,C4,1]) :-
    L == 0, C > 1, C3 is C - 2, C4 is C1 + 2,
    verifica([M,C3,M1,C4]).
% cca - dois canibais vão pro lado A
oper(cca, [M,C,M1,C1,L], [M,C3,M1,C4,0]) :-
    L == 1, C1 > 1, C4 is C1 - 2, C3 is C + 2,
    verifica([M,C3,M1,C4]).