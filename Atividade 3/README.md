<h1>Atividade 3: Problema das N-Rainhas</h1>
<p>
<p>Complete o programa abaixo para resolver o problema das N-rainhas, conforme discutido em aula. Implemente os predicados criasup e criainf, usando os metapredicados findall e between.</p>

<p>Acrescente predicados para que o resultado seja apresentado na forma de texto (onde . representa um casa vazia e R a posição da rainha na linha).</p>

<p>A solucao: X = [2, 4, 1, 3], deverá ser apresentada como:<br>
.  R  .  .<br>
.  .  .  R<br>
R  .  .  .<br>
.  .  R  .</p>

<p>apaga(X,[X|Y],Y).<br>
apaga(A,[B|C],[B|D]) :- apaga(A,C,D).</p>

<p>solucao(N,S) :-<br>
     crialista(N,L),<br>
     criasup(N,DS),<br>
     criainf(N,DI),<br>
     resolve(S,L,L,DS,DI).</p>

<p>resolve([],[],_,_,_).<br>
resolve([C|LC],[L|LL],CO,DS,DI):-<br>
    apaga(C,CO,CO1),<br>
    NS is L - C,<br>
    NI is L + C,<br>
    apaga(NS,DS,DS1),<br>
    apaga(NI,DI,DI1),<br>
    resolve(LC,LL,CO1,DS1,DI1).</p>

<p>crialista(N,[N|L]):-N > 0, N1 is N-1, crialista(N1,L).<br>
crialista(0,[]).</p>
