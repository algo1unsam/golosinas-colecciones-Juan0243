// golosinas.wlk
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
  const property precio = 0.5 * pesoInicial
  var property pesoInicial = 0
  var property peso = 0
  const property gusto = "chocolate"
  const property libreGluten = false
  
  method mordisco() {
    peso -= 2
  }
  
  method pesoInicial(_valor) {
    pesoInicial = _valor
    peso = _valor
  }
}

object golosinaBaniada {
  var property golosina_base = null
  var banioChocolate = 4
  
  method peso() = golosina_base.peso() + 4
  
  method precio() = golosina_base.precio() + 2
  
  method gusto() = golosina_base.gusto()
  
  method libreGluten() = golosina_base.libreGluten()
  
  method golosina_base(_golosina) {
    golosina_base = _golosina
  }
  
  method mordisco() {
    golosina_base.mordisco()
    if (banioChocolate == 4) {
      self.peso() - 2
      banioChocolate -= 2
    } else {
      if (banioChocolate == 2) {
        self.peso() - 2
        banioChocolate -= 2
      }
    }
  }
}

object tuti {
  const property peso = 5
  var property libreGluten = 0
  var property precio = 0
  var property gustos = ["frutilla", "chocolate", "naranja"]
  
  method libreGluten(_valor) {
    libreGluten = _valor
    
  }

  method precios() {

    if (libreGluten == 1) {
        precio = 7
    } else  if (libreGluten == 0){
        precio = 10 
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

    method comprar(unaGolosina) {
      bolsa.add(unaGolosina)
    }
    method desechar(unaGolosina) {
      bolsa.remove(unaGolosina)
    }
    method probarGolosinas() {
      bolsa.forEach({golosina => golosina.mordisco()})
    }
    method hayGolosinasSinTACC() {
        return bolsa.any({golosina => golosina.libreGluten()})
    }
    method preciosCuidados() {
        return bolsa.all({golosina => golosina.precio() <= 10})
    }
    method golosinaDeSabor(unSabor) {
        return bolsa.first({golosina => golosina.sabor(unSabor)})
    }
    method golosinasDeSabor(unSabor) {
        return bolsa.find({golosina => golosina.sabor(unSabor)}).asSet()
    }
    method sabores() {
        return bolsa.map({golosina => golosina.sabor()}).asSet()
    }
    method golosinaMasCara() {
        return bolsa.max({golosina => golosina.precio()})
    }
    method pesoGolosinas() {
        return bolsa.sum({golosina => golosina.peso()})
    }
}