import wollok.game.*
import pepita.*

object fondo{
    var property image = "fondo.jpg"
    const property position = game.at(-1,-1)

    method cambiar(){
        if(image == "fondo.jpg"){
            image = "fondo2.jpg"
        } else { image = "fondo.jpg" }
    }

    method chocar(ave){

    }
}

object nido{
    const property position = game.at(7, 7)

    method image() = "nido.png"

    
    method chocar(ave){
        ave.ganar()

        //## Esto noe staría muy bueno porque no delega en pepita y se adjudica responsabilidades, 
        //## el code smell se llama "feature envy" (envídia de funcionalidad), 
        //## porque envía varios mensajes al objeto y el que se los manda practicamente no ahce nada.
        //ave.estado("grande")
        //game.say(ave, "gané!")
    }

    method esAtravesable(){
        return true
    }
}

object silvestre{
    const presa = pepita

    method image() = "silvestre.png"

    method position() = game.at(self.x(), 0)

    method x() = 3.max(presa.position().x()) //presa.position().x().max(3)
    //if(presa.position().x() >= 3) { presa.position().x()} else { 3 }

    method chocar(ave){
        ave.perder()
    }

    method esAtravesable(){
        return true
    }
}

class Comida {
    const property image 
    const property position 

    const property energia  

    method chocar(ave){ 
    }

    method esComidoPor(ave){
        ave.comer(self)
        game.removeVisual(self)
    }

    method esAtravesable(){
        return true
    }
}
// manzana = game.at(5, 5)
// alpiste = game.at(8, 3)

const  manzana = new Comida (image = "manzana.png", position = game.at(5, 5), energia = 100)

const alpiste = new Comida(image = "alpiste.png", position = game.at(8, 3), energia = 50)


class Muro {
  const property image 
 const position  

    method esAtravesable(){
        return false 
    }

    method chocar(ave){ 
    }
}

const muro1 = new Muro(image = "muro.png", position = game.at(4, 3))
object muro {
    const property image = "muro.png"
    const property position = game.at(4, 3)

    method esAtravesable(){
        return false 
    }

    method chocar(ave){ 
    }
}

object muro2 {
  const property image = "muro.png"
    const property position = game.at(2, 8)

    method esAtravesable(){
        return false 
    }

    method chocar(ave){ 
    }
}

object muro3 {
  const property image = "muro.png"
    const property position = game.at(7, 9)

    method esAtravesable(){
        return false 
    }

    method chocar(ave){ 
    }
}