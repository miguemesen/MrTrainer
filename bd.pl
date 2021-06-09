
existe_deporte(Deporte):-deporte(Deporte).


existe_padecimiento(Padecimiento):- padecimiento(Padecimiento).


%deportes
deporte(correr).
deporte(ciclimo).
deporte(natacion).
deporte(triatlon).
deporte(yoga).
deporte(funcional).



%padecimientos
padecimiento(cardeopata).
padecimiento(problema_de_articulacion).
padecimiento(afectacion_columna).
padecimiento(asma).
padecimiento(sin_padecimiento).

%Niveles
nivel(inicial,1,2).
nivel(intermedio,3,4).
nivel(avanzado,5,7).

%rutinas
rutina(correr, asma,inicial, ['lunes: Corre 5km','martes: descanso alimentarse bien','miercoles: estirar 10 minutos','jueves: Corre 7km','viernes:estirar 10 minutos']).

rutina(correr, asma,intermedio, ['lunes: Corre 5km','martes: descanso alimentarse bien','miercoles: Corre 10km','jueves: Corre 7km','viernes:estirar 10 minutos','sabado: descanso, hidratese y alimentese bien']).

rutina(correr,asma, ['lunes descanso','martes 2km']).
rutina(correr, cardeopata, ['lunes 6km','martes 3km']).


consulta(Depo,Pade,Niv,Rutina):-deporte(Depo), padecimiento(Pade), nivel(Niv,_,_), rutina(Depo,Pade,Niv,Rutina).
consulta(Depo,Pade,Niv,Rutina):-deporte(Depo), padecimiento(Pade), nivel(_,Niv,_), rutina(Depo,Pade,Niv,Rutina).
consulta(Depo,Pade,Niv,Rutina):-deporte(Depo), padecimiento(Pade), nivel(_,_,Niv_), rutina(Depo,Pade,Niv,Rutina).