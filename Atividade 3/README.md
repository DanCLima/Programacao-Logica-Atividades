<h1>Atividade 3: Problema das N-Rainhas</h1>

Complete o programa abaixo para resolver o problema das N-rainhas, conforme discutido em aula. Implemente os predicados criasup e criainf, usando os metapredicados findall e between.

Acrescente predicados para que o resultado seja apresentado na forma de texto (onde . representa um casa vazia e R a posição da rainha na linha).

A solucao: X = [2, 4, 1, 3], deverá ser apresentada como:
.R..
...R
R...
..R.

apaga(X,[X|Y],Y).
apaga(A,[B|C],[B|D]) :- apaga(A,C,D).

solucao(N,S) :- 
     crialista(N,L),
     criasup(N,DS),
     criainf(N,DI),
     resolve(S,L,L,DS,DI).

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