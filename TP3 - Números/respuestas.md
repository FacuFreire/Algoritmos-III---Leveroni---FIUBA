# Preguntas

## Aporte de los mensajes de DD

*En un double dispatch, ¿qué información aporta cada uno de los llamados?*

En este ejercicio se desea realizar operaciones aritméticas con números. Por ejemplo, se quiere sumar dos números. Esta operación aritmética se puede resolver de distintas formas dependiendo de la clase de los números que se van a sumar.

Inicialmente se envía un mensaje a uno de los números y, de esta manera, se conoce su clase. Luego, se envía un segundo mensaje al otro número y, de esta manera, se termina conociendo su clase. Se procede a ejecutar el método correspondiente a estas clases.

En resumen, en un double dispatch la información que aporta cada llamado es la relacionada a uno de los objetos variable.

## Lógica de instanciado

*Con lo que vieron y saben hasta ahora, ¿dónde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resulven?*

La lógica sobre cómo instanciar un objeto debería estar en un método de inicialización de la clase del objeto. Este método define los valores iniciales de los colaboradores del objeto y se ejecuta cada vez que creamos un objeto nuevo. Esto lo hacemos con el fin de no romper encapsulamiento, evitar crear setters y tener que usarlos cada vez que creamos un objeto.

Si se creara desde diferentes lugares y de diferentes formas, lo que haríamos sería realizar subclases por cada una de las diferentes formas en las que se crea el objeto, creando así objetos “polimórficos”.

## Nombre de las categorías de métodos

*Con lo que vieron y trabajaron hasta ahora ¿qué cirterio están usando para categorizar métodos?*

Los métodos que creamos los categorizamos dentro de arithmetic operations -private, ya que no queremos que el usuario interactúe de forma directa con estos métodos sino que lo haga a partir de la simbología conocida: -,+,\*,/.

Para llamar a los métodos lo pensamos como: operación a un número, es decir, la operación que se le aplica a ese número. Por ejemplo, contamos con un método que se llamada sumaAUnEntero. Esto lo realizamos de esta manera para que quede más claro, ya que varios métodos realizan una operación con el colaborador y el orden nos importa a la hora de implementar el método.

## Subclass Responsibility

*Si todos las subclases saben responder un mismo mensaje ¿por qué ponemos ese mensaje sólo con un self subclassResponsibility en la superclase? ¿Para qué sirve?*

Ponemos ese mensaje sólo con un self subclassResponsibility en la superclase por dos razones. La primera razón es para indicar que toda subclase debe obligatoriamente saber responder dicho mensaje. La segunda razón es que cada subclase sabe responder dicho mensaje de forma diferente (mensaje polimórfico) y, por ende, no tiene sentido implementar un mensaje de carácter general para todas las subclases.
Las subclases son casos particulares de la superclase, que es una clase abstracta. Al ser casos particulares tienen comportamientos diferentes. Si bien responden a los mismos mensajes, las implementaciones en cada sublcase son distintas. Con lo cual, utilizando subclassResponsibility, la responsabilidad recae en cada subclase y esta última define su comportamiento correctamente.

## No rompas

*¿Por qué está mal/ qué problemas trae romper encampsulamiento?*

Encapsulamiento es una buena práctica que nos ayuda a preservar el código, haciendo que este sea más sencillo de comprender, y en consecuencia, mantener. Asimismo, permite que el usuario, al usar los objetos, deje de tener en cuenta el “cómo” y se centre en el “qué”.

Por lo contrario, si rompieramos encapsulamiento, el estado de cada objeto se vuelve más impredecible haciéndolo vulnerable a cambios inesperados. Esto trae consecuencias en todo el código haciendo que no funcione correctamente. También, esto trae consigo una dificultad más elevada al debuggear ya que se hace más difícil seguirle el flujo al código.
