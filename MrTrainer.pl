:-consult(gramatica).
:-consult(bd).

%________________________________________________________________________________________________

%                                         Mensajes
%________________________________________________________________________________________________

% Mensaje de bienvenida cuando inicia el programa
%
bienvenida:- write("MrTrainer: Bienvenido a MrTrainer\n").


% Mensaje de error cuando el programa no entiende la consulta
%
mensajeError:- write("Disculpe, no te he entendido.").

%________________________________________________________________________________________________
%________________________________________________________________________________________________



%________________________________________________________________________________________________

%                           Recolecta de las respuestas del usuario
%________________________________________________________________________________________________

% Recolecta el ejercio dentro de una oracion
%
respuesta_usuario_ejercicios(Respuesta,Ejercicio):- oracion(Respuesta,[Ejercicio|_]).

% Recolecta el padecimiento que tiene el usuario
%
respuesta_usuario_padecimiento(Respuesta,Padecimiento):- oracion(Respuesta,[Padecimiento|_]).

% Recolecta la frecuencia que el usuario realiza ejercicio a la semana
%
respuesta_usuario_frecuencia(Respuesta,Frecuencia):- getNumber(Respuesta,Frecuencia).


% Recolecta los dias de descanso que quiere el usuario
%
respuesta_usuario_descanso(Respuesta,DiasDescanso):-getNumber(Respuesta,DiasDescanso).

%________________________________________________________________________________________________
%________________________________________________________________________________________________


% Funcion que agarra el numero en una oracion
%
getNumber([X|Xs],X):-number(X).
getNumber([_|Xs],Y):-getNumber(Xs,Y).



%________________________________________________________________________________________________

%                   Preguntas que se le hacen al usuario desde wazitico
%________________________________________________________________________________________________


% Pregunta cual ejercicio desea realizar el usuario
%
pregunta_ejercicio(Ejercicio):- write("MrTrainer: Que actividad fisica desea realizar?\n"),
                                write("Usuario: "),readln(Respuesta),
                                respuesta_usuario_ejercicios(Respuesta,Ejercicio).

pregunta_ejercicio(Ejercicio):- mensajeError, nl, pregunta_ejercicio(Ejercicio).


% Pregunta cuantas veces a la semana el usuario realiza ejercicos
%
pregunta_frecuencia_realiza_AF(Frecuencia):-
                                            write("MrTrainer: Cuantas veces a la semana realiza algun ejercicio?\n"),
                                            write("Usuario: "),readln(Respuesta),
                                            respuesta_usuario_frecuencia(Respuesta,Frecuencia).

pregunta_frecuencia_realiza_AF(Frecuencia):- mensajeError,nl,pregunta_frecuencia_realiza_AF(Frecuencia).


% Pregunta cuantos dias de descanso quiere el usuario
%
pregunta_dias_descanso(DiasDescanso):-
                                    write("MrTrainer: Cuantos dias de descanso desea por semana?\n"),
                                    write("Usuario: "),readln(Respuesta),
                                    respuesta_usuario_descanso(Respuesta,DiasDescanso).

pregunta_dias_descanso(DiasDescanso):- mensajeError,nl,pregunta_dias_descanso(DiasDescanso).
                                            

% Pregunta por algun padecimiento
%
pregunta_padecimiento(Padecimiento):-
                                    write("MrTrainer: Usted tiene algun padecimiento que le podria afectar los ejercicios?\n"),
                                    write("Usuario: "),readln(Respuesta),
                                    respuesta_usuario_padecimiento(Respuesta,Padecimiento).

pregunta_padecimiento(Padecimiento):- mensajeError,nl,pregunta_padecimiento(Padecimiento).

%________________________________________________________________________________________________
%________________________________________________________________________________________________





% Funcion principarl que inicia el programa
%
mrTrainer:- bienvenida,
            pregunta_ejercicio(Ejercicio),
            pregunta_frecuencia_realiza_AF(Frecuencia),
            pregunta_padecimiento(Padecimiento),
            pregunta_dias_descanso(DiasDescanso),
            write("Ejercicios: "),write(Ejercicio),nl,
            write("Frecuencia: "),write(Frecuencia),nl,
            write("Padecimiento: "),write(Padecimiento),nl,
            write("Dias descanso: "),write(DiasDescanso),nl,
            consulta(Ejercicio,Padecimiento,Frecuencia,S).
