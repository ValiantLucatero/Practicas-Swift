//
//  ViewController.swift
//  Demo de CoreData
//
//  Created by Angel Vázquez on 1/24/18.
//  Copyright © 2018 Angel Vázquez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {

    @IBOutlet var tabla: UITableView!
    var nombres: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath)
        
        let persona = nombres[indexPath.row]
        cell.textLabel?.text = persona.value(forKey: "nombre") as? String
        
        return cell
    }

    @IBAction func agregarNombre(_ sender: UIBarButtonItem) {
        let alerta = UIAlertController(title: "Nuevo nombre", message: "Escribe un nuevo nombre", preferredStyle: .alert)
        
        let guardar = UIAlertAction(title: "Guardar", style: .default)
        {
            action in
            
            guard let textfield = alerta.textFields?.first, let nombre = textfield.text, nombre != "" else { return }
            
            //self.nombres.append(nombre)
            
            self.guardar(nuevoNombre: nombre)
            
            self.tabla.reloadData()
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        //  Añadir un textfield a la alerta
        alerta.addTextField(configurationHandler: nil)
        
        alerta.addAction(guardar)
        alerta.addAction(cancelar)
        
        present(alerta, animated: true, completion: nil)
        
        
    }
    
    func guardar(nuevoNombre: String)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else { return }
        
        let contexto = appDelegate.persistentContainer.viewContext
        
        //  Insertar el nuevo dato en el contexto:
        let entidad = NSEntityDescription.entity(forEntityName: "Persona", in: contexto)!
        
        let nuevaPersona = NSManagedObject(entity: entidad, insertInto: contexto)
        nuevaPersona.setValue(nuevoNombre, forKey: "nombre")
        
        do
        {
            try contexto.save()
            nombres.append(nuevaPersona)
        }
        catch let error as NSError
        {
            print("No se pudo guardar", error, error.userInfo)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let contexto = appDelegate.persistentContainer.viewContext
        
        //  Petición (fetch)
        //  SELECT * FROM persona;
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Persona")
        
        //  select *
        //  from persona
        //  where nombre LIKE "C%"
        //  fetchRequest.predicate = NSPredicate(format: "nombre == %@", "Angel")
        
        do
        {
            nombres = try contexto.fetch(fetchRequest)
        }
        catch let error as NSError
        {
            print("Ocurrió un error al traer los datos.", error, error.userInfo)
        }
        
        
    }
    
    
}




















