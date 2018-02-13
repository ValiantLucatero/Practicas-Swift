//: Playground - noun: a place where people can play

import UIKit

//Clases
class Fantasma
{
    var vida: Int
    var ataque: Int
    var color: String
    
    init(vida: Int, ataque: Int, color: String)
    {
        self.vida = vida
        self.ataque = ataque
        self.color = color
    }
}

let rival = Fantasma(vida: 100, ataque: 60, color: "Gris")
print(rival.color)

//Herencia

class Deportista
{
    var edad: Int
    var nombre: String
    
    init(edad: Int, nombre: String)
    {
        self.edad = edad
        self.nombre = nombre
    }
    
    func entrenar()
    {
        print("Estoy entrenando")
    }
}

class Nadador: Deportista
{
    var record200libres: Double //Tienes que agregar un nuevo atributo, si no lo haces tienes que poner override antes del init
    init(record200libres: Double, edad: Int, nombre: String)
    {
        self.record200libres = record200libres
        super.init(edad: edad, nombre: nombre)
    }
}

class Fondista: Nadador
{
    var recordDistancia: Double
    init(recordDistancia: Double, record200libres: Double, edad: Int, nombre: String)
    {
        self.recordDistancia = recordDistancia
        super.init(record200libres: record200libres, edad: edad, nombre: nombre)
    }
}

var phelps = Nadador(record200libres: 40.0, edad: 27, nombre: "Michael Phelps")

print(phelps.record200libres)
print(phelps.entrenar())

var ledeki = Fondista(recordDistancia: 3000, record200libres: 44.2, edad: 22, nombre: "Ledeki")

print(ledeki.recordDistancia)

phelps = ledeki

phelps.edad = 20
print(ledeki.edad)

//----------------------------------------------------------------

class Transporte
{
    var velMax: Double
    var tipoVehiculo: String
    init(velMax: Double, tipoVehiculo: String)
    {
        self.velMax = velMax
        self.tipoVehiculo = tipoVehiculo
    }
    func hacerSonido()
    {
        print("Hago un sonido")
    }
}

class Coche: Transporte
{
    var numRuedas: Int
    init(numRuedas: Int, velMax: Double, tipoVehiculo: String)
    {
        self.numRuedas = numRuedas
        super.init(velMax: velMax, tipoVehiculo: tipoVehiculo)
    }
    override func hacerSonido()
    {
        print("Mic mic")
    }
}

class Avion: Transporte
{
    var numMotores: Int
    init(numMotores: Int, velMax: Double, tipoVehiculo: String)
    {
        self.numMotores = numMotores
        super.init(velMax: velMax, tipoVehiculo: tipoVehiculo)
    }
    override func hacerSonido()
    {
        print("Whoooooosh")
    }
}

class Barco: Transporte
{
    var bandera: String
    init(bandera: String, velMax: Double, tipoVehiculo: String)
    {
        self.bandera = bandera
        super.init(velMax: velMax, tipoVehiculo: tipoVehiculo)
    }
    override func hacerSonido()
    {
        print("Muuuuuuuu")
    }
}

//-----------------------------------------------------------------

class Persona
{
    var ropa : String
    {
        willSet
        {
            actualizar(msg: "Me estoy cambiando de \(ropa) a \(newValue)")
        }
        didSet
        {
            actualizar(msg: "Me acabo de cambiar de \(oldValue) a \(ropa)")
        }
    }
    init(ropa: String)
    {
        self.ropa = ropa
    }
}

func actualizar(msg: String)
{
    print(msg)
}

var iordi = Persona(ropa: "toxic")
iordi.ropa = "Monster"

//---------------------------------------------------

class Vehiculo
{
    let llantas: Int
    var velMaxima: Int
    var velocidades: Int
    {
        get
        {
            return llantas + 2
        }
    }
    init(llantas: Int, velMaxima: Int)
    {
        self.llantas = llantas
        self.velMaxima = velMaxima
    }
}

var moto = Vehiculo(llantas: 2, velMaxima: 120)

print(moto.velocidades)

//-----------------------------------------------------

class Musico
{
    var nacionalidad: String
    var hijos: Int
    
    init(nacionalidad: String, hijos: Int)
    {
        self.nacionalidad = nacionalidad
        self.hijos = hijos
    }
    func toca()
    {
        print("tururururu")
    }
}

class Rockero: Musico
{
    static var cancionFav: String = "Another brick in the wall"
    
    var nombre: String
    var banda: String
    private var edad: Int
    
    init(nombre: String, banda: String, edad: Int, nacionalidad: String, hijos: Int)
    {
        self.nombre = nombre
        self.banda = banda
        self.edad = edad
        super.init(nacionalidad: nacionalidad, hijos: hijos)
    }
    func getEdad() -> Int
    {
        return edad
    }
}

var roger = Rockero(nombre: "Roger Waters", banda: "Pink Floyd", edad: 55, nacionalidad: "Estadounidense", hijos: 2)

print(roger.banda) //atributo
print(roger.getEdad()) //necesitas un metodo para acceder a un private
print(Rockero.cancionFav) //no necesitas al objeto porque es un atributo de la clase en si

var bono = Rockero(nombre: "Bono", banda: "U2", edad: 42, nacionalidad: "Irlandes", hijos: 0)
var moz = Musico(nacionalidad: "Aleman", hijos: 0)

var arrMusic = [bono, moz] //este es un arreglo de musicos
print(arrMusic[1].nacionalidad)
//print(arrMusic[0].nombre) //como es musico no tiene nombre
for person in arrMusic
{
    if let rockero = person as? Rockero //downcasting
    {
        print(rockero.nombre)
    }
}
//--------------------------------------------------------



