/*−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−---+
|           UNIFAL - Universidade Federal de Alfenas            |
|             BACHARELADO EM CIÊNCIA DA COMPUTAÇÃO              |
|                                                               |
|   Trabalho...........: Atividade 3 - Problema das N-Rainhas   |
|   Disciplina.........: Programação Lógica                     |
|   Professor..........: Luiz Eduardo da Silva                  |
|   Aluno..............: Daniel da Costa Lima - 2021.1.08.026   |
|   Data...............: 11/08/2022                             |
+--------------------------------------------------------------*/

/* Predicado responsável por criar a lista de diagonais superiores */
criasup(0,[]).
criasup(N,DS) :- 
    N1 is -1*(N-1), 
    N2 is N-1,
    findall(X,between(N1,N2,X),DS).

/* Predicado responsável por criar a lista de diagonais inferiores */
criainf(0,[]).
criainf(N,DI) :- 
    N3 is 2*N,
    findall(X,between(2,N3,X),DI).    

/* Recebe três parâmetros e imprime uma linha com N caracteres ("R" ou "."). "R" onde for indicado por X e "." nos outros N-1 caracteres.
    N: quantidade de Rainhas
    X: elemendo que indica a posição da Rainha 
    B: contador que servirá como condição de parada. */
tabula(N,_,B) :- 
    B>N, nl, !.
tabula(N,X,B) :- 
    B=<N, B==X, write('R '), 
    B1 is B+1, 
    tabula(N,X,B1).
tabula(N,X,B) :- 
    B=<N, write('. '), 
    B1 is B+1, 
    tabula(N,X,B1).

/* Verifica se um elemento pertence a uma lista */
pertence(A,[A|_]).
pertence(A,[_|B]) :- pertence(A,B).

/* Imprime a solução */
imprime(N,S) :- forall(pertence(X,S),tabula(N,X,1)).
    
apaga(X,[X|Y],Y).
apaga(A,[B|C],[B|D]) :- apaga(A,C,D).

solucao(N,S) :- 
     crialista(N,L),
     criasup(N,DS),
     criainf(N,DI),
     resolve(S,L,L,DS,DI),
   	 imprime(N,S).

resolve([],[],_,_,_).
resolve([C|LC],[L|LL],CO,DS,DI):-
    apaga(C,CO,CO1),
    NS is L - C,
    NI is L + C,
    apaga(NS,DS,DS1),
    apaga(NI,DI,DI1),
    resolve(LC,LL,CO1,DS1,DI1).

crialista(N,[N|L]):-N > 0, N1 is N-1, crialista(N1,L).
crialista(0,[]).
