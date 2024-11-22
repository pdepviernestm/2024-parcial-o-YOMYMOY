import eventos.*
import emociones.*

class Persona {
  var edad
  const emociones = #{}

  method esAdolescente() = edad.between(12, 19)

  method agregarEmocion(nuevaEmocion) {
    emociones.add(nuevaEmocion)
  }

  method estaPorExplotarEmocionalmente() = emociones.all({e => e.puedeLiberarse()})

  method vivirEvento() {

  }
}