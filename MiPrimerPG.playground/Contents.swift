//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//TIPOS DE VARIABLES
//Enteros
var entero = 50
var entero1 = "SOY UN STRING" //es un valor variable

let enteroconst = 20 //es un valor constante

//enteroconst = 30 + 1 no se puede hacer porque es una constante

print("Hola, mi valor es \(entero) y " + entero1)
//Double y Float
var d: Double = 50.90
var x: Float = 86.0

var latitud: Float
latitud = -87.9033333
latitud = -887.9335555
latitud = -8771.9882222
latitud = -56222.9888112
latitud = -109993.8932221

var latitud2: Double
latitud2 = -87.9033333
latitud2 = -887.9335555
latitud2 = -8771.9882222
latitud2 = -56222.9888112
latitud2 = -109993.8932221

var op = latitud + Float(entero)
print(op)

//Booleano
var boolean: Bool

let nombre = "Andres"
let age = 19
let peso = 50
let estatura = 1.80
print("Hola \(nombre), tu IMC es de: \(Double(peso)/estatura), tienes una edad de: \(age) y una estatura de: \(estatura)")

//Operador de asignacion
var asignacion = 0
//Operadores aritmeticos
// + suma
// - resta
// * multiplicacion
// / division
// % residuo de una division

//Operadores Relacionales
// < menor que
// > mayor que
// <= menor o igual
// >= mayor o igual
// == comparaciones
// != diferentes
// === mismo dato y tipo de dato
// !== diferente dato y tipo de dato

//Operadores Logicos
// && AND
// || OR
// ! NOT

//Operador desbordamiento
// &+ ó &-
let y: Int8 = 120
var z = 10 &+ y

print(z)
//-128+2

//Statements

//if
let azucar: Bool = true

if azucar
{
    print ("No quiero, gracias") // llaves OBLIGATORIAS
}
else
{
    print ("Si quiero, gracias")
}

let name = "Andres"
let edad = 21

if name == "Andres" && edad >= 18
{
    print("Bienvenido \(name)")
}
else if name == "Andres"
{
    print("Todavia no puedes pasar chavo :v")
}
else if edad >= 18
{
    print("Quien eres?")
}

let user = "yo_merengues"
let password = "tutankamon"

if user == "yo_merengues" && password == "tutankamon"
{
    print("Bienvenido usuario")
}
else if password != "tutankamon" && user != "yo_merengues"
{
    print("Me quieres hackear?")
}
else if password != "tutankamon" && user == "yo_merengues"
{
    print("Olvidaste tu contraseña?")
}
else if password == "tutankamon" && user != "yo_merengues"
{
    print("Quien eres?")
}

//For
let nombres = ["Edgar", "Santiago", "Andres", "Carlos", "Martin"]
for nombre in nombres
{
    print("Hola \(nombre)")
}

//While
var i = 0
while i < 10
{
    print("Soy un while x10")
    i = i+1
}

//repeat-while
z = 0
repeat
{
    print("Soy un repeat-while")
    z = z+1
}
while z < 10

//Arreglos o arrays
var arr = [3, "hola", 8.0] as Any
var arr1 = [2.0, 30, 3.2]
var arr2 = [Int]()

arr1.append(20)
print(arr1[3])
arr1.remove(at:3)
//print(arr1[3])
print(arr1.count)

//Diccionario
var diccionario = ["computadoras": "Soy cul :3", "consolas": "Tambien soy cul :3"]

print(diccionario["computadoras"]!)
print(diccionario.count)
diccionario["coches"] = "Son rapidos"
print(diccionario["coches"]!)
print(diccionario)

var menu = ["enchiladas": 32, "chilaquiles": 23, "molletes": 10, "tamal": 29]
print("Consumiste enchiladas y chilaquiles, tu total es de \(menu["enchiladas"]! + menu["chilaquiles"]!)")

//Tuplas (son estaticas)

let jugador = ("Andres", 19) //let jugador = (nome: "Andres", años: 21)
let (nome, años) = jugador //Si usas esto ˆ ya no usas esto <-
print(nome) //print(jugador.0) print(jugador.nome) <-{solo si lo declaras como esta comentado}
print(años) //print(jugador.1)

//Set o conjuntos
let ingredientes: Set = ["peperoni", "piña", "queso", "jitomate"]
if ingredientes.contains("piña")
{
    print("Dame esa pizza :D")
}

var primos: Set = [1,3,5,7,9]
print(primos.isSubset(of: 0..<10))

var otrosNumeros = [9,13,11,15,3]
print(primos.intersection(otrosNumeros)) //hace operaciones de conjuntos entre un set y un arreglo
//substract
//equal

//Recorrido arreglos

let lista1: [String] = ["Huevos", "leche", "pan"]

for producto in lista1
{
    print(producto)
}

lista1.forEach
{
    producto in
    print(producto)
}

for (i, valor) in lista1.enumerated()
{
    print(" \(valor) es el numero: \(i) en la lista")

}

//Funciones

func first ()
{
    print("hola soy una funcion")
}

first()

func second (_ name: String) //con el _ se deja poner solo el dato sin el nombre del parametro
{
    print("Hola soy otra funcion y me llamo \(name) :3")
}

second("Andres") //Asi

func funcion (_ juego: String, _ año: Int, _ publisher: String)
{
    print("\(juego) se publicó en el año \(año) por \(publisher)")
}

funcion("COD 4", 2009, "Activision")

func devuelve (local: String) -> Bool
{
    if local == "Abierto"
    {
        return true
    }
    return false
}

devuelve(local: "Abierto")

func third (nombre name: String) //Etiquetas tu variable local name como nombre para usarla cuando la vayas a llamar
{
    print("\(name)")
}

third(nombre: "Andres")

func concat(_ string: String, with otherString: String) -> String
{
    return string + otherString
}

concat("Hello", with: "World") //Se usa para facilitar la lectura y comprension del codigo

//Como darle formato a los enteros

let e = 2.718281828459045

let numberFormatter = NumberFormatter()
numberFormatter.maximumFractionDigits = 3

print(numberFormatter.string(from: NSNumber(value: e))!)

//Mi funcion formateadora
func format (_ num: Double, only decimals: Int)
{
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = decimals
    
    print(numberFormatter.string(from: NSNumber(value: num))!)
}

format(3.57385, only: 4)

//Opcionales

var items = ["Ángel", "Josué", "Iordy"]

func position(of string: String, in array: [String]) -> Int? //con el signo de interrogacion hacemos que el entero que regrese se vuelva opcional, osea que puede o existir
{
    for i in 0 ..< array.count
    {
        if(array[i] == string)
        {
            return i
        }
    }
    return nil
}

let posicionAngel = position(of: "Ángel", in: items)
let posicionJosue = position(of: "Josué", in: items)
let posicionJordy = position(of: "Iordy", in: items)
let posicionEdgar = position(of: "Edgar", in: items) //Edgar no esta, por eso en vez de regresar un entero regresa nil (NULL)

// print(posicionEdgar!) Se muere si hace eso

//Optional Binding (Asignacion condicionada)
if let posicion = posicionAngel
{
    print(posicion)
}
else
{
    print("El opcional no tenía valor.")
}

//Checar mas de un opcional a la vez
let q: String? = "500"
let w: String? = "404" // nil

if let valor1 = q, let valor2 = w
{
    print(valor1, valor2)
}
else
{
    print("Alguno de los opcionales no tiene valor")
}

//Opcionales implícitamente desenvuelto
var opcionalDesenvuelto: Int! = nil

//print(opcionalDesenvuelto + 3) se muere porque estas forzando a que corra un null

//No opcionales (String) -> Necesitan un valor ("Hola, "3"). No pueden ser nil
//Opcionales (String?) -> Pueden tenero o no un valor, antes de poder usarlo, es necesario desenvolverlo (!, if let)
//Opcionales desenvueltos imlícitamente (String!) -> Pueden tener un valor (si lo tienen, se puede usar directamente) o no tenerlo (si se usa, la aplicacion mandará un error y se cierra

func albumReleased(year: Int) -> String?
{
    switch year
    {
    case 1972:
        return "Got to Be There"
    case 1973:
        return "Music and Me"
    case 1975:
        return "Forever Michael"
    case 1979:
        return "Off the Wall"
    case 1982:
        return "Thriller"
    default:
        return nil
    }
}

//uppercased()
let holaMundo = "hola mundo"
holaMundo.uppercased()

//Encadenamiento de opcionales (Optional chaining)
let thriller = albumReleased(year: 1982)?.uppercased()

//Nil coalescing operator (??)
let nume = 18
let condicion = nume >= 17 ? true : false //operador ternario, si el valor es mayor o igual a 17 la condicion será verdadera, si no, es falsa

// Si tenemos una variable opcional A y si tiene valor, ese valor se usa. Si fuera nil, se utiliza un valor por defecto (B)
let albumDesconocido = albumReleased(year: 1985) ?? "desconocido"
