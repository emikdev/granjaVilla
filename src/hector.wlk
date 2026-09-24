import wollok.game.*
import src.cultivos.*

object hector {

	var property position = game.center()
	const property image = "player.png"

	var plantasParaVender = []
	var oro = 0

	// Metodos para sembrar

	method sembrarMaiz() {

		game.addVisual(new Maiz(posicion = self.position()))

	}

	method sembrarTrigo() {

		game.addVisual(new Trigo(posicion = self.position()))

	}

	method sembrarTomaco() {

		game.addVisual(new Tomaco(posicion = self.position()))

	}

	// Plantas en la misma posicion que Hector

	method plantasEnMiPosicion() {

		return game.allVisuals().filter { objeto => objeto != self && objeto.position() == self.position()}

	}

	// Regar plantas en la posicion de HEctor

	method regar() {

		const plantas = self.plantasEnMiPosicion()

		if (plantas.isEmpty()) {

			self.error("no tengo nada para regar")

		}

		plantas.forEach { planta => planta.regar()}

	}

	// Cosechar la plantas que estan en la posicion de Hector

	method cosechar() {

		const plantas = self.plantasEnMiPosicion()

		if (plantas.isEmpty()) {

			self.error("no tengo nada para cosechar")

		}

		plantas.filter { planta => planta.estaListaParaCosechar() }.forEach { planta => plantasParaVender.add(planta) game.removeVisual(planta)}

	}

	// Vender las plantas que se cosecharon

	method vender() {

		oro = oro + plantasParaVender.sum { planta => planta.precioVenta() }

		plantasParaVender.clear()

	}

	// Informacion del inventario de Hector

	method cantidadPlantasParaVender() {

		return plantasParaVender.size()

	}

	method cantidadOro() {

		return oro

	}

	method informar() {

		game.say(self, "tengo " + oro + " monedas, y " + plantasParaVender.size() + " plantas para vender")

	}

}