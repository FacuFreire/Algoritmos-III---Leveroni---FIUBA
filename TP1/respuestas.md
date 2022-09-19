\documentstyle[12pt,double]{article};
\section{Preguntas}
\subsection{Pregunta 1}
El mensaje estaHerido está implementado de la siguiente manera:
\begin{lstlisting}[language=smalltalk, caption=Código con Listings, captionpos=b]
estaHerido
(20*pv > puntosDeVida and: [0*pv < puntosDeVida]) ifTrue:[^true] ifFalse:[^false]
\end{lstlisting}
Se chequean los puntos de vida de los combatientes. Es decir, si los puntos de vida son menor a 20 y mayores a 0, el combatientes reicibió daño, por lo tanto está herido.
Mientras que el mensaje noEstaHerido está implementado como se muestra a continuación:
\begin{lstlisting}[language=smalltalk, caption=Código con Listings, captionpos=b]
noEstaHerido
(20\*pv = puntosDeVida) ifTrue:[^true] ifFalse:[^false]
\end{lstlisting}
En este mensaje se chequea si los puntos de vida son igual a 20. De esta manera se comprueba si el combatiente no recibió daño.
Se podría usar un solo mensaje, por ejemplo, estaHerido. Y para corroborar si no está herido, como devuelve un objeto booleano, se podría negar el resultado y así implementar un solo mensaje.
