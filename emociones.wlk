import personas.*
import eventos.*

class Emocion {
    var property intensidadElevada = 5
    var property intensidad
    var property causa =""
    const eventosExperimentados = []

    method puedeLiberarse() = intensidad >= intensidadElevada

    method liberarse(evento) {
        if (self.puedeLiberarse()) {
            intensidad -= evento.impacto()
        }
        
    }

    method sufrirEvento(evento) {
        eventosExperimentados.add(evento)
        self.liberarse(evento)
    }

    method cantidadEventosExperimentados() = eventosExperimentados.size()
}

class Furia inherits Emocion {
    const property palabrotas = []

    method initialize(){
        intensidad = 100
    }

    override method puedeLiberarse() = super() and palabrotas.any({p => p.size() > 7})

    override method liberarse(evento) {
      super(evento)
      if (self.puedeLiberarse()) {
        const primerPalabrota = palabrotas.first()
        palabrotas.remove(primerPalabrota)
      }
      
    }
}

class Alegria inherits Emocion {

    override method puedeLiberarse() = super() and eventosExperimentados.size().even()

    override method liberarse(evento) {
        super(evento)
        if (self.puedeLiberarse()) intensidad = intensidad.abs()
    }
}

class Tristeza inherits Emocion {
    method initialize() {
        causa = "Melancolía"
    }

    override method puedeLiberarse() = super() and causa != "Melancolía"
    
    override method liberarse(evento) {
        super(evento)
        causa = evento.descripcion()
    }

    // Si su causa es inicialmente la melancolía y no puede liberarse si su causa es Melancolía, entonces
    // nunca podría liberarse y no cambia su causa si tiene que liberarse para cambiar esa causa
}

class Desagrado inherits Emocion {
    override method puedeLiberarse() = super() and eventosExperimentados.size() > intensidad
}

class Temor inherits Desagrado {}

class Ansiedad inherits Emocion {

    override method puedeLiberarse() = intensidad > 0

    override method sufrirEvento(evento) {
        causa = evento.descripcion()
        super(evento)
    }


    // Utilicé Herencia para poder utilizar todos los atributos y métodos de la clase padre que en este caso es Emocion,
    // sin tener que escribirlos todos nuevamente en la clase Ansiedad
    // Utilicé Polimorfismo en los métodos que comparte con las demás emociones, para que el objeto que envía un mensaje,
    // pueda enviar el mismo mensaje a cualquier emoción pero que se comporte o no, de la misma manera, en este caso sufrirEvento
    // se comporta distinto y puedeLiberarse también

}

object modificador {
    const emociones = #{}

    method guardarEmocion(_emocion) {
        emociones.add(_emocion)
    }

    method modificarValorIntensidadElevada(_intensidad) {
      emociones.forEach({e => e.intensidadElevada(_intensidad)})
    }
}