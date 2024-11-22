import personas.*
import eventos.*

class Emocion {
    var intensidadElevada = 500
    var intensidad
    const eventosExperimentados = []
    //var intensidad
    method puedeLiberarse() {}

    method liberarse(evento) {
        intensidad -= evento.impacto()
    }

}

class Furia inherits Emocion {
    const palabrotas = []

    method initialize(){
        intensidad = 100
    }
    override method puedeLiberarse() = intensidad >= intensidadElevada and palabrotas.any({p => p.size() > 7})

    override method liberarse(evento) {
      
      const primerPalabrota = palabrotas.first()
      palabrotas.remove(primerPalabrota)
    }
}

class Alegria inherits Emocion {

    override method puedeLiberarse() = intensidad >= intensidadElevada and eventosExperimentados.size().even()

    method liberarse(evento) {
        intensidad = (intensidad - evento.impacto()).abs()
    }
}

class Tristeza inherits Emocion {
    override method puedeLiberarse() = intensidad >= intensidadElevada

    method liberarse(evento) {
      intensidad -= evento.impacto()
    }
}