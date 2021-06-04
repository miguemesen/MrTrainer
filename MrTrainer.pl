:-consult(gramatica).
:-consult(bd).

% Mensaje de bienvenida cuando inicia el programa
%
bienvenida:- write("MrTrainer: Bienvenido a MrTrainer\n").


% Mensaje de error cuando el programa no entiende la consulta
%
mensajeError:- write("Disculpe, no te he entendido.").


% Recolecta el ejercio dentro de una oracion
%
respuesta_usuario_ejercicios(Respuesta,Ejercicio):- oracion(Respuesta,[Ejercicio|_]).


% Pregunta cual ejercicio desea realizar el usuario
%
pregunta_ejercicio(Ejercicio):- write("Que actividad fisica desea realizar?\n"),
                                write("Usuario: "),readln(Respuesta),
                                respuesta_usuario_ejercicios(Respuesta,Ejercicio).

pregunta_ejercicio(Ejercicio):- mensajeError, nl, pregunta_ejercicio(Ejercicio).


% Pregunta con cuanta frecuencia el usuario desea realizar ejercicios
%
pregunta_frecuencia_realiza_AF(Frecuencia):-
                                            write("Con que frecuencia realiza actividad fisica?\n"),
                                            write("Usuario: "),readln(Respuesta).
                                            


% Funcion principarl que inicia el programa
%
mrTrainer:- bienvenida,
            pregunta_ejercicio(Ejercicio),
            pregunta_frecuencia_realiza_AF(Frecuencia).