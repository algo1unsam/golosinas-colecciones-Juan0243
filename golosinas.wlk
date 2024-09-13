
object bombon {
  const property precio = 5
  var property peso = 15
  const property gusto = "frutilla"
  const property libreGluten = true
  
  method mordisco() {
    peso = (peso * 0.8) - 1
  }
}

object alfajor {
  const property precio = 12
  var property peso = 300
  const property gusto = "chocolate"
  const property libreGluten = false
  
  method mordisco() {
    peso *= 0.8
  }
}

object caramelo {
  const property precio = 1
  var property peso = 5
  const property gusto = "frutilla"
  const property libreGluten = true
  
  method mordisco() {
    peso -= 1
  }
}

object chupetin {
  const property precio = 2
  var property peso = 7
  const property gusto = "naranja"
  const property libreGluten = true
  
  method mordisco() {
    if (peso < 2) {
      peso += 0
    } else {
      peso *= 0.9
    }
  }
}

object oblea {
  const property precio = 5
  var property peso = 250
  const property gusto = "vainilla"
  const property libreGluten = false
  
  method mordisco() {
    if (peso > 70) {
      peso *= 0.5
    } else {
      peso *= 0.75
    }
  }
}

object chocolatin {
  var property pesoInicial = 0
  var property peso = 0
  const property gusto = "chocolate"
  const property libreGluten = false

  method precio() = (0.5 * pesoInicial)

  method mordisco() {
    peso -= 2
  }
  
  method pesoIn(_valor) {
    pesoInicial = _valor
    peso = _valor
  }
}

object golosinaBaniada {
  var property golosina_base = null
  var banioChocolate = 4
  
  method peso() = golosina_base.peso() + banioChocolate
  
  method precio() = golosina_base.precio() + 2
  
  method gusto() = golosina_base.gusto()
  
  method libreGluten() = golosina_base.libreGluten()
  
  method golosina_base(_golosina,_pesoInicial) {
    golosina_base = _golosina

    //en caso de que la golosina elegida sea un chocolatin pido el valor del peso inicial, si es otra golosina es omitido este pedido
    if (golosina_base == chocolatin && _pesoInicial != null) { 
            golosina_base.pesoIn(_pesoInicial) // asigna el peso inicial del chocolatin para calcular el precio de la golosina bañada
        }
  }
  
  method mordisco() {
    golosina_base.mordisco()

    if (banioChocolate > 0) {
      banioChocolate -= 2
    } 
  }
}

object tuti {
  const property peso = 5
  var property libreGluten = 0 //0 para no; 1 para sí
  var property gustos = ["frutilla", "chocolate", "naranja"]
  
  method libreGluten(_valor) {
    libreGluten = _valor
  }
  
  method precio() {
    if (libreGluten > 0) {
      return 7
    } else {
        return  10
    }
  }
  
  method mordisco() {
    gustos.add(gustos.first())
    gustos.remove(gustos.first())
  }
  
  method gusto() = gustos.first()
} 

//parte 2

object mariano {
  var property bolsa = []
  var property golosinasDeseadas = #{}
  var property gustosDeseados =  #{}
  
  method comprar(unaGolosina) {
    bolsa.add(unaGolosina)
  }
  
  method desechar(unaGolosina) {
    bolsa.remove(unaGolosina)
  }
  
  method probarGolosinas() {
    bolsa.forEach({ golosina => golosina.mordisco() })
  }
  
  method hayGolosinasSinTACC() = bolsa.any(
    { golosina => golosina.libreGluten() }
  )
  
  method preciosCuidados() = bolsa.all({ golosina => golosina.precio() <= 10 })
  
  method golosinaDeSabor(unSabor) = bolsa.find( { golosina => golosina.gusto() == unSabor } )
  
  method golosinasDeSabor(unSabor) = bolsa.filter( { golosina => golosina.gusto() == unSabor } )
  
  method sabores() = bolsa.map({ golosina => golosina.gusto() }).asSet()
  
  method golosinaMasCara() = bolsa.max({ golosina => golosina.precio() })
  
  method pesoGolosinas() = bolsa.sum({ golosina => golosina.peso() })
  
  method golosinasFaltantes() = golosinasDeseadas.filter( { golosina => !bolsa.contains(golosina) } )

  method agregarGolosinaDeseada(_golosina) {
    golosinasDeseadas.add(_golosina)
  }
  method gustosFaltantes() = gustosDeseados.filter({gusto => !bolsa.any({golosina => golosina.gusto() == gusto})}) .asSet()

  method agregarGustosDeseada(_gusto) {
    gustosDeseados.add(_gusto)
  }
}