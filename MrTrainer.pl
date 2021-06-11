:-consult(gramatica).
:-consult(bd).

%________________________________________________________________________________________________

%                                         Mensajes
%________________________________________________________________________________________________

% Mensaje de bienvenida cuando inicia el programa
%
bienvenida:- write("Mr Trainer: Bienvenido a MrTrainer\n").


% Mensaje de error cuando el programa no entiende la consulta
%
mensajeError:- write("Mr Trainer: Disculpe, no te he entendido.").


% Mensaje de error, no nota la despedida
%
mensajeErrorDespedida:- write("Mr Trainer: Disculpe, podrias repetir eso ultimo?"),nl,write("Si te estabas despidiendo, podrias hacerlo de nuevo"),nl.



% Mensaje de error, dias de realizar ejercicios son muchos
%
mensajeErrorFrecuenciaMucho:- write("Mr Trainer: Uy, tal vez te estas ejercitando mas de lo recomendado.").

% Mensaje de error, dias de realizar ejercicios son muy poco
%
mensajeErrorFrecuenciaPoco:- write("Mr Trainer: Uy, tal vez te hace falta ejercitarte mas."),nl,write("Mr Trainer: Por dicha aqui estoy para ayudarte con eso!"),nl.




% Mensaje de error, dias de descanso superan los dias de la semana
%
mensajeErrorDiasDescanso:- write("Mr Trainer: Tal vez ingresaste mas dias de descanso que los dias existentes en una semana"),nl,write("Mr Trainer: Ademas recomiendo que tengas al menos dos dias de descanso."),nl.

% Mensaje de error, posible deporte no existe
%
mensajeErrorDeporte:- write("Mr Trainer: Tal vez ingresaste un deporte que no conozco.").


% Mensaje de error, posible padecimiento no existe
%
mensajeErrorPadecimiento:- write("Mr Trainer: Tal vez ingresaste un padecimiento que no conozco.").

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
respuesta_usuario_padecimiento(Respuesta,Padecimiento):- oracion(Respuesta,[Padecimiento|_]),!.

respuesta_usuario_padecimiento(Respuesta,Padecimiento):- oracion(Respuesta,Padecimiento).



% Recolecta la frecuencia que el usuario realiza ejercicio a la semana
%
respuesta_usuario_frecuencia(Respuesta,Frecuencia):- getNumber(Respuesta,Frecuencia),1>Frecuencia,mensajeErrorFrecuenciaPoco.

respuesta_usuario_frecuencia(Respuesta,Frecuencia):- getNumber(Respuesta,Frecuencia),Frecuencia>6,mensajeErrorFrecuenciaMucho.

respuesta_usuario_frecuencia(Respuesta,Frecuencia):- getNumber(Respuesta,Frecuencia).


% Recolecta los dias de descanso que quiere el usuario
%
respuesta_usuario_descanso(Respuesta,DiasDescanso):-getNumber(Respuesta,DiasDescanso),!.

%________________________________________________________________________________________________
%________________________________________________________________________________________________


% Funcion que agarra el numero en una oracion
%
getNumber([X|Xs],X):-number(X).
getNumber([_|Xs],Y):-getNumber(Xs,Y).



%________________________________________________________________________________________________

%                   Preguntas que se le hacen al usuario desde mr trainer
%________________________________________________________________________________________________

% Espera la despedida del usuario
%
despedida_del_usuario(Despedida):-  write("Mr Trainer: Fue un gusto ayudarle"),nl,
                                    write("Usuario: "),readln(Respuesta),salida(Respuesta,Despedida).

despedida_del_usuario(Despedida):- mensajeError,nl,mensajeErrorDespedida.


% Pregunta cual ejercicio desea realizar el usuario
%
pregunta_ejercicio(Ejercicio):- write("Mr Trainer: Que actividad fisica desea realizar?\n"),
                                write("Usuario: "),readln(Respuesta),
                                respuesta_usuario_ejercicios(Respuesta,Ejercicio).

pregunta_ejercicio(Ejercicio):- mensajeError, nl, mensajeErrorDeporte, nl,pregunta_ejercicio(Ejercicio).


% Pregunta cuantas veces a la semana el usuario realiza ejercicos
%
pregunta_frecuencia_realiza_AF(Frecuencia):-
                                            write("Mr Trainer: Cuantas veces a la semana realiza algun ejercicio?\n"),
                                            write("Usuario: "),readln(Respuesta),
                                            respuesta_usuario_frecuencia(Respuesta,Frecuencia).

pregunta_frecuencia_realiza_AF(Frecuencia):- mensajeError,nl,pregunta_frecuencia_realiza_AF(Frecuencia).


% Pregunta cuantos dias de descanso quiere el usuario
%
pregunta_dias_descanso(DiasDescanso):-
                                    write("Mr Trainer: Cuantos dias de descanso desea por semana?\n"),
                                    write("Usuario: "),readln(Respuesta),
                                    respuesta_usuario_descanso(Respuesta,DiasDescanso),!.

pregunta_dias_descanso(DiasDescanso):- mensajeError,nl,mensajeErrorDiasDescanso,nl,pregunta_dias_descanso(DiasDescanso).
                                            

% Pregunta por algun padecimiento
%
pregunta_padecimiento(Padecimiento):-
                                    write("MrTrainer: Usted tiene algun padecimiento que le podria afectar los ejercicios?\n"),
                                    write("Usuario: "),readln(Respuesta),
                                    respuesta_usuario_padecimiento(Respuesta,Padecimiento),!.

pregunta_padecimiento(Padecimiento):- mensajeError,nl, mensajeErrorPadecimiento, nl, pregunta_padecimiento(Padecimiento).

%________________________________________________________________________________________________
%________________________________________________________________________________________________





% Funcion principarl que inicia el programa
%
mrTrainer:- bienvenida,
            pregunta_ejercicio(Ejercicio),
            write("Mr Trainer: Me parece muy buena su iniciativa"),nl,
            pregunta_frecuencia_realiza_AF(Frecuencia),
            pregunta_padecimiento(Padecimiento),
            pregunta_dias_descanso(DiasDescanso),
            consulta(Ejercicio,Padecimiento,DiasDescanso,Nivel,Rutina),
            write(Nivel),nl,write(Rutina),nl,nl,
            despedida_del_usuario(Despedida).

