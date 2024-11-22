import eventos.*
import emociones.*

class Persona {
  var edad
  const property emociones = #{}

  method esAdolescente() = edad.between(12, 19)

  method agregarEmocion(nuevaEmocion) {
    emociones.add(nuevaEmocion)
    modificador.guardarEmocion(nuevaEmocion)
  }

  method estaPorExplotarEmocionalmente() = emociones.all({e => e.puedeLiberarse()})

  method vivirEvento(evento) {
    emociones.forEach({e => e.sufrirEvento(evento)})
  }
}

class Grupo {
    const personas = #{}

    method agregarPersonaAlGrupo(_persona) {
        personas.add(_persona)
    }

    method vivirEvento(evento) {
        personas.forEach({p => p.vivirEvento(evento)})
    }
}