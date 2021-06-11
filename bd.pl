
existe_deporte(Deporte):-deporte(Deporte,_).


existe_padecimiento(Padecimiento):- padecimiento(Padecimiento,_).


%deportes
deporte(correr,p1).
deporte(ciclismo,p1).
deporte(gimnasia,p2).
deporte(crossfit,p2).
deporte(funcional,p2).


%padecimientos
padecimiento(cardiopata,p1).
padecimiento(problema_de_articulacion,p2).
padecimiento(afectacion_columna,p2).
padecimiento(asma,p1).
padecimiento(ninguno,p3).
padecimiento(no,p3).

%Niveles
nivel('Esta rutina es de un Nivel avanzado',1,2).
nivel('Esta rutina es de un Nivel intermedio',3,4).
nivel('Esta rutina es de un Nivel inicial',5,7).


% rutinas. Depende del deporte y padecimiento que tenga se da la rutina
% adecuada
rutina(p1, p1 ,6, ['Miercoles: Recorre 7km','Recuerda estirar 5 minutos antes y despues de correr, los demas dias alimentarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 2 semanas y subir de nivel']).
rutina(p1, p1,5, ['Lunes: Recorre 5km','Jueves: Recorre 7km','Para ambos dias de ejercicio estirar 5 minutos antes y despues de correr, los demas dias alimentarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 3 semanas para subir de nivel']).

rutina(p1, p1,4, ['Lunes: Recorre 5km','Miercoles: Recorre 7km','Viernes: Recorre 10km con una mayor intensidad','Recuerda estirar 5 minutos antes y despues de correr, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 5 semanas para subir de nivel']).

rutina(p1, p1,3, ['Lunes: Recorre 5km','Miercoles: Recorre 10km','Vierne: Recorre 7km con una mayor intensidad','Sabado: Recuperacion.Recorre 5km','Recuerda estirar 5 minutos antes y despues de correr, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 5 semanas para subir de nivel']).

rutina(p1, p1,2, ['Lunes: Recorre 5km','Martes: Recorre 5km','Miercoles: Recorre 5km','Viernes: Recorre 5km con una mayor intensidad','Sabado: Recuperacion.Recorre 3km','Recuerda estirar 5 minutos antes y despues de correr, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada.']).

rutina(_, _,1,'Como norma general se recomienda descansar minimo 2 dias por semana.').
rutina(_, _,0,'Como norma general se recomienda descansar minimo 2 dias por semana.').

%-------
rutina(p2,_,6, ['Miercoles: 3 series de: 10 flexiones, 15 abdominales y 10 sentadillas','Recuerda estirar 5 minutos antes y despues de realizar los ejercicios, los demas dias alimentarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 2 semanas y subir de nivel']).
rutina(p2,_,5, ['Lunes: 4 series de: 20 burpees, 20 saltos dobles y 10 abdominales','Jueves:3 series de: 20 burpees, 20 sentadillas y 10 abdominales','Para ambos dias de ejercicio estirar 5 minutos antes y despues, los demas dias alimentarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 3 semanas para subir de nivel']).

rutina(p2,_,4, ['Lunes: 4 series de: 20 burpees, 20 saltos dobles y 10 abdominales ','Miercoles: 5 series de: 15 burpees, 20 flexiones y 30 abdominales  ','Viernes: 3 series de: 20 dominadas, 20 sentadillas y 30 abdominales','Recuerda estirar 5 minutos antes y despues de realizar los ejecicios, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 5 semanas para subir de nivel']).

rutina(p2,_,3, ['Lunes: 4 series de: 20 dominadas, 20 saltos dobles y 30 abdominales ','Miercoles: 4 series de: 20 flexiones, 20 sentadillas y 30 abdominales ','Viernes: 4 series de: 20 burpees, 20 dominadas y 25 abdominales ','Sabado:Recuperacion. 3 series de: 10 burpees, 15 saltos dobles y 20 abdominales ','Recuerda estirar 5 minutos antes y despues de realizar los ejercicios, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 5 semanas para subir de nivel']).

rutina(p2,_,2, ['Lunes, martes, miercoles: 4 series de: 20 dominadas, 20 saltos dobles y 30 abdominales','Viernes: 5 series de: 20 flexiones, 20 burpees y 30 abdominales ','Sabado: Recuperacion. 3 series de: 12 flexiones, 15 dominadas y 20 abdominales ','Recuerda estirar 5 minutos antes y despues de realizar los ejercicios, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada.']).

%-------

rutina(p1, p3 ,6, ['Miercoles: Recorre 7km','Recuerda estirar 5 minutos antes y despues de correr, los demas dias alimentarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 2 semanas y subir de nivel']).
rutina(p1, p3,5, ['Lunes: Recorre 10km','Jueves: Recorre 10km','Para ambos dias de ejercicio estirar 5 minutos antes y despues de correr, los demas dias alimentarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 3 semanas para subir de nivel']).

rutina(p1, p3,4, ['Lunes y miercoles: Recorre 10km','Viernes: Recorre 13km con una mayor intensidad','Recuerda estirar 5 minutos antes y despues de correr, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 5 semanas para subir de nivel']).

rutina(p1, p3,3, ['Lunes, miercoles y viernes: Recorre 11km','Sabado: Recuperacion.Recorre 5km','Recuerda estirar 5 minutos antes y despues de correr, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada. Realizar esta rutina durante 5 semanas para subir de nivel']).

rutina(p1, p3,2, ['Lunes, martes, miercoles: Recorre 12km','Viernes: Recorre 14km con una mayor intensidad','Sabado: Recuperacion.Recorre 8km','Recuerda estirar 5 minutos antes y despues de correr, los demas dias alimentarse e hidratarse bien, respetando las 5 comidas diarias con una dieta adecuada.']).

%ver el nivel segun los dias de descanso
vernivel(Niv,Dias):-nivel(Niv,D1,D2),D1=<Dias,D2>=Dias,!.

% consulta. En esta regla se verifica que tanto el deporte como el
% padecimiento se encuentren en la BD, la idea es retornar el nivel y la
% rutina del usuario.
consulta(Depo,Pade,Dias,Nivel,Rutina):-deporte(Depo,Pd), padecimiento(Pade,Pp),rutina(Pd,Pp,Dias,Rutina),vernivel(Nivel,Dias),!.



