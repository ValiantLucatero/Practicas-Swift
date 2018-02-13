import UIKit

//estructuras
struct Perro
{
    var nombre: String
    var edad: Int
    var raza: String
    var tamaño: Int
    
    init(nombre: String, edad: Int, raza: String)
    {
        self.nombre = nombre
        self.edad = edad
        self.raza = raza
        self.tamaño = 14
    }
    
    init(nombre: String, edad: Int, raza: String, tamaño: Int)
    {
        self.nombre = nombre
        self.edad = edad
        self.raza = raza
        self.tamaño = tamaño
    }
}

let doggo = Perro(nombre: "Luke", edad: 15, raza: "Chow Chow")
let doggo1 = Perro(nombre: "Nikko", edad: 2, raza: "Labrador", tamaño: 5)

struct Heroe
{
    var nombre: String
    var superPoder: String
    var edad: Int
    
    func ficha() -> String {
        return nombre + " " + superPoder + "" + " \(edad) año"
    }
}

let Jack = Heroe(nombre: "Jack", superPoder: "Heroe sin capa", edad: 1)
Jack.ficha()
