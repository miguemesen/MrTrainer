:-consult(bd).

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
preposicion([sin|S],S).
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



% Sintagma nominal
%
sintagma_nominal(Oracion,S):-pronombre(Oracion,S).



% Sintagma verbal
%
sintagma_verbal(Oracion,S):- verbo(Oracion,S).
sintagma_verbal(Oracion,S):- verbo(Oracion,Oracion1),verbo(Oracion1,S).



% Oraciones de frecuencia en que realiza actividad fisica
%



% Oraciones de deporte
%
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),existeDeporte(S).


% Oraciones de padecimiento
%
oracion(Oracion,S):-sintagma_verbal(Oracion,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_verbal(Oracion,Oracion1),preposicion(Oracion1,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,Oracion2),preposicion(Oracion2,S),existePadecimiento(S).
oracion(Oracion,S):-sintagma_nominal(Oracion,Oracion1),sintagma_verbal(Oracion1,S),existePadecimiento(S).