import Kitura
import LoggerAPI
import HeliumLogger
import KituraStencil

HeliumLogger.use(.info)

Log.info("Información extra :v")

let router = Router()

//Utilizar plantillas
router.setDefault(templateEngine: StencilTemplateEngine())

//Sustituir página por defecto
router.get("/")
{
	request, response, next in

	/*html feo
	response.send("<html lang=\"es\">")
	response.send("<body>")
	response.send("<h1>Bienvenidos a mi página web</h1>")
	response.send("</body>")
	response.send("</html>")*/
	//response.send("Hola, Kitura")
	//try response.send("Hola, Kitura").end()  esto hace que termine de mandar cosas, aunque le pongas el next

	//este next encadena con el metodo siguiente
	//next()

	defer { next() }
	try response.render("home", context: [:])
}

router.get("/staff/:name")
{
	request, response, next in

	defer { next() }

	//acorta los if-else
	//obtenemos la url
	guard let name = request.parameters["name"]
		else { return }

	let bios = [
		"angel": "Mi nombre es Ángel :v",
		"jordy": "Es el prebe del mes",
		"josue": "Te acuerdas de el?",
		"barcenas": "El que llegó el lunes"
	]

	var context = [String: Any]()

	//si el nombre existe mete info
	if let bio = bios[name]
	{
		context["name"] = name
		context["bio"] = bio
		context["people"] = bios.keys.sorted()
	}
	try response.render("staff", context: context)
}

router.get("/contact")
{
	request, response, next in

	defer { next() }

	try response.render("contact", context: [:])
}

/*router.all("/")
{
	request, response, next in

	response.send("Aquí hay más texto")

	next()
}*/

//Rutas
router.get("/staff")
{
	request, response, next in

	response.send("Conoce a nuestro equipo")

	next()
}

router.get("/contact")
{
	request, response, next in

	response.send("Ponte en contacto con nosotros")

	next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)

Kitura.run()
