import wollok.game.*

class Maiz {

	var posicion
	var esAdulto = false

	method position() {

		return posicion

	}

	method image() {

		if (esAdulto) {

			return "corn_adult.png"

		}

		return "corn_baby.png"

	}

	method regar() {

		esAdulto = true

	}

	method estaListaParaCosechar() {

		return esAdulto

	}

	method precioVenta() {

		return 150

	}

}


class Trigo {

	var posicion
	var etapa = 0

	method position() {

		return posicion

	}

	method image() {

		return "wheat_" + etapa + ".png"

	}

	method regar() {

		etapa = (etapa + 1) % 4

	}

	method estaListaParaCosechar() {

		return etapa >= 2

	}

	method precioVenta() {

		return (etapa - 1) * 100

	}

}


class Tomaco {

	var posicion

	method position() {

		return posicion

	}

	method image() {

		return "tomaco.png"

	}

	method regar() {

		if (posicion.y() == game.height() - 1) {

			posicion = game.at(posicion.x(), 0)

		} else {

			posicion = posicion.up(1)

		}

	}

	method estaListaParaCosechar() {

		return true

	}

	method precioVenta() {

		return 80

	}

}