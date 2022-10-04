# Preguntas

## Aporte de los mensajes de DD

En un double dispatch, ¿qué información aporta cada uno de los llamados?

En este ejercicio a resolver se desea realizar operaciones aritméticas con números. Por ejemplo, se quiere sumar dos números. Esta operación aritmética se puede resolver de distintas formas dependiendo de la clase de los números que se van a sumar.

Inicialmente se envia un mensaje a uno de los números, de esta manera se conoce su clase. Luego se envia un segundo mensaje al otro número y de esta manera se termina conociendo su clase. Se procede a ejectur el método correspondiente a estas clases.

En resumen, en un double dispatch la información que aporta cada llamado es la relacionada a uno de los objetos variable.

## Lógica de instanciado

Con lo que vieron y saben hasta ahora, ¿dónde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resulven?

Un nuevo objeto es instanciado en el método de clase. Es decir, cuando queremos instanciar un objeto que pertenece a la clase Entero, la creación de la nueva instancia del objeto se realiza en with y lo mismo sucede para el caso de una fracción.

## Nombre de las categorías de métodos

Con lo que vieron y trabajaron hasta ahora ¿qué cirterio están usando para categorizar métodos?

Los métodos que creamos los categorizamos dentro de arithmetic operations -private, ya que no queremos que el usuario interactua de forma directa con estos métodos sino que lo haga a partir de la terminología conocida utilizando -,+,\*,/.

Para llamar a los métodos lo pensamos como: operacion a un número, es decir, la operación que se le aplica a ese número. Por ejemplo contamos con un método que se llamada sumaAUnEntero. Esto lo realizamos de esta manera para que quede más claro, ya que varios métodos realizan una operación con el colaborador y el orden nos importa a la hora de implementar el método.

## Subclass Responsibility

Si todos las subclases saben responder un mismo mensaje ¿por qué ponemos ese mensaje sólo con un self subclassResponsibility en la superclase? ¿Para qué sirve?

Este mensaje sirve para indicar que la responsabilidad de responder el mensaje que se envia es de cada subclase.
Las subclases son casos particulares de la superclase, que es una clase abstracta. Al ser casos particulares tienen comportamientos diferentes. Si bien responden a los mismos mensajes, las implementaciones de los mismos en cada sublcase es distinto.

Con lo cual, utilizando subclassResponsibility la responsabilidad recae en la subclase y cada subclase define su comportamiento correctamente.

## No rompas

¿Por qué está mal/ qué problemas trae romper encampsulamiento?
