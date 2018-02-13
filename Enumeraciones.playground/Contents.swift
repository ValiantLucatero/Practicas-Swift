
import UIKit

enum Clima //inician en uno
{
    case soleado, lluvioso, templado, nublado
}

func estatus(clima: Clima) -> String?
{
    if clima == Clima.soleado
    {
        return ":D"
    }
    else if clima == Clima.lluvioso
    {
        return ">:v"
    }
    else
    {
        return nil
    }
}

if let aux = estatus(clima: .soleado)
{
    print(aux)
}
else
{
    print("Opcion que no me gusta >:v")
}

enum Velocidad //Debe comenzar con mayusculas
{
    case primera
    case segunda
    case tercera
    case cuarta
    case reversa
}

func auto(vel: Velocidad)
{
    switch vel //no necesitas default
    {
    case .primera:
        print("Iniciando viaje")
    case .segunda:
        print("Vas encaminado")
    case .tercera:
        print("Pisale")
    case .cuarta:
        print("Vas muy rapido")
    case .reversa:
        print("De reversa...")
    }
}

auto(vel: .tercera)

enum Curso
{
    case swift(asistentes: Int)
    case android
    case c
}

func proteco(curso: Curso)
{
    switch curso
    {
    case .swift(let asistentes) where asistentes > 8: // el orden importa, primero entra aqui y luego abajo
        print("Record de asistentes en Swift!") 
    case .android:
        print("Team android")
    case .c:
        print("Team c")
    case .swift:
        print("Team iOS")
    }
}

proteco(curso: .swift(asistentes: 11))
