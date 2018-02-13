//
//  GameScene.swift
//  Flappy Bird
//
//  Created by PROTECO on 23/01/18.
//  Copyright © 2018 curso proteco. All rights reserved.
//
// Agregar Flappy
// Flappy animado
// BG animado
//
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var flappy = SKSpriteNode()
    var bg = SKSpriteNode()
    var timer = Timer()

    var gameOver = false

    var puntaje = 0

    var puntajeLabel = SKLabelNode()
    var gameOverLabel = SKLabelNode()

    enum ColliderType: UInt32{

        case Flappy = 1
        case Objeto = 2
        //---Puntaje---
        case Espacio = 4

    }

    @objc func creaPipas(){

        // PIPAS
        let espacioAltura = flappy.size.height * 5

        let movimientoPipes = arc4random() % UInt32(self.size.height / 2) //Genera nuestras pipas de pantalla, nos da un numero entre o y el menor

        let pipaOffset = CGFloat(movimientoPipes) - self.frame.height / 4 //Obtenemos un número menos al cuarto de la pantalla

        let movimientoPipas = SKAction.move(by: CGVector(dx: -2 * self.frame.width,dy: 0), duration: TimeInterval(self.frame.width / 100))

        let eliminaPipas = SKAction.removeFromParent()

        let mueveYEliminaPipas = SKAction.sequence([movimientoPipas, eliminaPipas])

        //Pipas arriba
        let pipaTextura = SKTexture(imageNamed: "pipe1.png")
        let pipa1 = SKSpriteNode(texture: pipaTextura)

        pipa1.position = CGPoint(x: self.frame.midX + self.frame.width,y: self.frame.midY + self.frame.height / 2 + espacioAltura + pipaOffset)

        //Collaiders Pipa1

        pipa1.physicsBody = SKPhysicsBody(rectangleOf: pipaTextura.size())
        pipa1.physicsBody!.isDynamic = false
        pipa1.physicsBody!.contactTestBitMask = ColliderType.Objeto.rawValue
        pipa1.physicsBody!.categoryBitMask = ColliderType.Objeto.rawValue
        pipa1.physicsBody!.collisionBitMask = ColliderType.Objeto.rawValue

        pipa1.run(mueveYEliminaPipas)
        pipa1.zPosition = -2
        self.addChild(pipa1)

        //Pipas abajo
        let pipa2Textura = SKTexture(imageNamed: "pipe2.png")
        let pipa2 = SKSpriteNode(texture: pipa2Textura)

        pipa2.position = CGPoint(x: self.frame.midX + self.frame.width,y: self.frame.midY - self.frame.height / 2 - espacioAltura + pipaOffset)

        pipa2.run(mueveYEliminaPipas)

        //Collaiders Pipa2
        pipa2.physicsBody = SKPhysicsBody(rectangleOf: pipa2Textura.size())
        pipa2.physicsBody!.isDynamic = false
        pipa2.physicsBody!.contactTestBitMask = ColliderType.Objeto.rawValue
        pipa2.physicsBody!.categoryBitMask = ColliderType.Objeto.rawValue
        pipa2.physicsBody!.collisionBitMask = ColliderType.Objeto.rawValue

        pipa2.zPosition = -2
        self.addChild(pipa2)

        //Espacio entre pipas
        let espacio = SKNode()

        espacio.position = CGPoint(x: self.frame.midX + self.frame.width, y: self.frame.midY + pipaOffset)
        espacio.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: pipaTextura.size().width, height: espacioAltura))

        espacio.physicsBody?.isDynamic = false
        espacio.run(mueveYEliminaPipas)

        espacio.physicsBody!.contactTestBitMask = ColliderType.Flappy.rawValue
        espacio.physicsBody!.categoryBitMask = ColliderType.Espacio.rawValue
        espacio.physicsBody!.collisionBitMask = ColliderType.Espacio.rawValue

        self.addChild(espacio)
    }



    override func didMove(to view: SKView) {

        self.physicsWorld.contactDelegate = self


        inicio()





    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    

    
    func touchUp(atPoint pos : CGPoint) {

    }

    func inicio () {

        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.creaPipas), userInfo: nil, repeats: true)
        // --------->  Background  <---------
        let bgTexture = SKTexture(imageNamed: "bg.png")
        let animacionBG = SKAction.move(by: CGVector(dx: -bgTexture.size().width, dy: 0), duration: 7)

        bg.run(animacionBG)

        //bg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)

        let moverBG = SKAction.move(by: CGVector(dx: bgTexture.size().width,dy: 0), duration: 0)

        let repeatBG = SKAction.repeatForever(SKAction.sequence([animacionBG, moverBG]))
        var i: CGFloat = 0;

        while( i < 3 ) {

            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: bgTexture.size().width * i, y: self.frame.midY)
            bg.size.height = self.frame.height
            bg.run(repeatBG)
            self.addChild(bg)

            bg.zPosition = -3

            i += 1

        }

        // --------->  Flappy  <---------
        let flappyTextura = SKTexture(imageNamed: "flappy1.png")
        let flappy2Textura = SKTexture(imageNamed: "flappy2.png")

        let animacionFlappy = SKAction.animate(with: [flappyTextura, flappy2Textura], timePerFrame: 0.1)

        let hazloVolar = SKAction.repeatForever(animacionFlappy)

        flappy = SKSpriteNode(texture: flappyTextura)
        flappy.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        flappy.run(hazloVolar)

        flappy.physicsBody = SKPhysicsBody(circleOfRadius: flappyTextura.size().height / 2)

        //Colaiders Flapy

        flappy.physicsBody!.isDynamic = false
        flappy.physicsBody!.contactTestBitMask = ColliderType.Objeto.rawValue
        flappy.physicsBody!.categoryBitMask = ColliderType.Flappy.rawValue
        flappy.physicsBody!.collisionBitMask = ColliderType.Flappy.rawValue

        self.addChild(flappy)



        // --------->  ground  <---------
        let suelo = SKNode()


        suelo.position = CGPoint(x: self.frame.midX, y: -self.frame.height / 2)

        //Ground Collider

        suelo.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 1))
        suelo.physicsBody?.isDynamic = false

        suelo.physicsBody!.contactTestBitMask = ColliderType.Objeto.rawValue
        suelo.physicsBody!.categoryBitMask = ColliderType.Objeto.rawValue
        suelo.physicsBody!.collisionBitMask = ColliderType.Objeto.rawValue

        self.addChild(suelo)

        //CIELO
        let techo = SKNode()
        techo.position = CGPoint(x: self.frame.midX, y: self.frame.height / 2)
        techo.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 1))
        techo.physicsBody?.isDynamic = false
        techo.physicsBody!.contactTestBitMask = ColliderType.Objeto.rawValue
        techo.physicsBody!.categoryBitMask = ColliderType.Flappy.rawValue
        techo.physicsBody!.collisionBitMask = ColliderType.Flappy.rawValue

        self.addChild(techo)

        puntajeLabel.fontName = "Helvetica"
        puntajeLabel.fontSize = 64
        puntajeLabel.text = "0"

        puntajeLabel.position = CGPoint(x: self.frame.midX, y: self.frame.height / 2 - flappyTextura.size().height)


        puntajeLabel.zPosition = -1
        addChild(puntajeLabel)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        //
        if gameOver == false{

        // --------->  Tap flappy  <---------

            flappy.physicsBody!.isDynamic = true

            flappy.physicsBody!.velocity = (CGVector(dx: 0, dy: 0))

            flappy.physicsBody!.applyImpulse(CGVector(dx: 0,dy: 45))
        }else{
            gameOver = false
            puntaje = 0
            self.speed = 1
            self.removeAllChildren()

            inicio()

        }



    }

    func didBegin(_ contact: SKPhysicsContact) {


        //print("Tocó la pipa!!")
        //self.speed = 0
        //gameOver = true

        if gameOver == false{
            if contact.bodyA.categoryBitMask == ColliderType.Espacio.rawValue || contact.bodyB.categoryBitMask == ColliderType.Espacio.rawValue {

                print("Puntaje agregado")
                puntaje += 1

                puntajeLabel.text = String(puntaje)

            }else{

                print("YA VALISTE V**** CARNAL")
                self.speed = 0
                gameOver = true

                timer.invalidate()

                gameOverLabel.fontName = "Helvetica"
                gameOverLabel.fontSize = 30
                gameOverLabel.text = "Fin del juego, presiona para volver a jugar..."
                gameOverLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)

                gameOverLabel.zPosition = 0

                self.addChild(gameOverLabel)
            }
        }

    }
    
    override func update(_ currentTime: TimeInterval) {


    }
}
