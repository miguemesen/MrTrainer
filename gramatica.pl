:-consult(bd).

% Palabras de entrada
%
palabra_entrada([hola|S],S).
palabra_entrada([buenos|S],S).
palabra_entrada([dias|S],S).
palabra_entrada([buenas|S],S).
palabra_entrada([tardes|S],S).
palabra_entrada([noches|S],S).
palabra_entrada([mr|S],S).
palabra_entrada([trainer|S],S).


% Palabras de salida
%
palabra_salida([adios|S],S).
palabra_salida([hasta|S],S).
palabra_salida([luego|S],S).
palabra_salida([muchas|S],S).
palabra_salida([gracias|S],S).
palabra_salida([mr|S],S).
palabra_salida([trainer|S],S).

% Pronombres
% 
pronombre([yo|S],S).
pronombre([se|S], S).
pronombre([el|S],S).
pronombre([ellos|S],S).
pronombre([ella|S],S).
pronombre([ellas|S],S).
pronombre([me|S],S).
pronombre([mi|S],S).
pronombre([nosotros|S],S).
pronombre([nos|S],S).


pronombre_reflexivo([se|S], S).
pronombre_relativo([que|S], S).


% Articulos
%
articulo([el|S],S).
articulo([la|S],S).
articulo([los|S],S).
articulo([las|S],S).


% Preposiciones
%
preposicion([a|S],S).
preposicion([ante|S],S).
preposicion([bajo|S],S).
preposicion([cabe|S],S).
preposicion([con|S],S).
preposicion([contra|S],S).
preposicion([de|S],S).
preposicion([desde|S],S).
preposicion([durante|S],S).
preposicion([en|S],S).
preposicion([entre|S],S).
preposicion([hacia|S],S).
preposicion([hasta|S],S).
preposicion([mediante|S],S).
preposicion([para|S],S).
preposicion([por|S],S).
preposicion([segun|S],S).
preposicion([son|S],S).
preposicion([sobre|S],S).
preposicion([tras|S],S).
preposicion([versus|S],S).
preposicion([via|S],S).


% Verbos
% 
verbo([tengo|S],S).
verbo([estoy|S],S).
verbo([empezar|S],S).
verbo([quiero|S],S).
verbo([hacer|S],S).
verbo([ir|S],S).
verbo([deseo|S],S).
verbo([puedo|S],S).
verbo([practicar|S],S).
verbo([gustaria|S],S).
verbo([padezco|S],S).
verbo([padecer|S],S).
verbo([ganas|S],S).
verbo([salir|S],S).


existeDeporte([Deporte|[]]):- existe_deporte(Deporte).

existePadecimiento([Padecimiento|[]]):- existe_padecimiento(Padecimiento).




% Negacion
%
negacion([no|[]],[]).
negacion([no|_]).



% Confirmacion
%
confirmacion([si|[]],[]).
confirmacion([si|_]).


% Oraciones de deporte
%
oracion([X|_],X):-existe_deporte(X).
oracion(Oracion,S):-entrada(Oracion,Oracion1), sintagma_nominal(Oracion1,Oracion2),sintagma_verbal(Oracion2,S),existeDeporte(S).
oracion(Oracion,S):-entrada(Oracion,Oracion1), sintagma_verbal(Oracion1,S),existeDeporte(S).

oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),existeDeporte(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),existeDeporte(S).






% Oraciones de padecimiento
%
oracion([X|_],X):-existe_padecimiento(X).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),preposicion(Oracion2,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),preposicion(Oracion1,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,S),existePadecimiento(S).







% Sintagma nominal
%
sintagma_nominal(Oracion,S):-pronombre(Oracion,S).



% Sintagma verbal
%
sintagma_verbal(Oracion,S):- verbo(Oracion,Oracion1),verbo(Oracion1,Oracion2),preposicion(Oracion2,S).
sintagma_verbal(Oracion,S):- verbo(Oracion,Oracion1),verbo(Oracion1,S).
sintagma_verbal(Oracion,S):- verbo(Oracion,S).



% Entradas
%
entrada(Oracion,S):-palabra_entrada(Oracion,Oracion1),palabra_entrada(Oracion1,Oracion2),palabra_entrada(Oracion2,Oracion3),palabra_entrada(Oracion3,Oracion4),palabra_entrada(Oracion4,S).
entrada(Oracion,S):-palabra_entrada(Oracion,Oracion1),palabra_entrada(Oracion1,Oracion2),palabra_entrada(Oracion2,Oracion3),palabra_entrada(Oracion3,S).
entrada(Oracion,S):-palabra_entrada(Oracion,Oracion1),palabra_entrada(Oracion1,Oracion2),palabra_entrada(Oracion2,S).
entrada(Oracion,S):-palabra_entrada(Oracion,Oracion1),palabra_entrada(Oracion1,S).
entrada(Oracion,S):-palabra_entrada(Oracion,S).



% Salidas
%
salida(Oracion,S):-palabra_salida(Oracion,Oracion1),palabra_salida(Oracion1,Oracion2),palabra_salida(Oracion2,Oracion3),palabra_salida(Oracion3,S).
salida(Oracion,S):-palabra_salida(Oracion,Oracion1),palabra_salida(Oracion1,Oracion2),palabra_salida(Oracion2,S).
salida(Oracion,S):-palabra_salida(Oracion,Oracion1),palabra_salida(Oracion1,S).
salida(Oracion,S):-palabra_salida(Oracion,S).



