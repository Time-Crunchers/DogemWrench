

// "If I take on the job, I complete it. And everyone in the galexy knows that"



//
//  GameScene.swift
//  DogemWrench
//
//  Created by Time Crunchers on 4/8/19.
//  Copyright © 2019 Time Crunchers. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    

    
    var scoreLabel: SKLabelNode!
    var gameOverLabel: SKLabelNode!
    var startLabel: SKLabelNode!
    var ballLabel: SKLabelNode!
    var rightPeg: SKSpriteNode!
    var leftPeg: SKSpriteNode!
    var spin: SKAction!
    var back: SKAction!
    var hit: SKAction!
    var backHit: SKAction!
    var wrench: SKSpriteNode!
    var person: SKSpriteNode!
    var ballShadow: SKSpriteNode!
    var leftFlipper: SKSpriteNode!
    var rightFlipper: SKSpriteNode!
    var rightTouch: Bool = false
    var leftTouch: Bool = false
    var gameOver: Bool = false
    var rNumber: Int = 2
    var ballNumber: Int = 0 {
        didSet {
           
            
        }
    }
    var score: Int = 0 {
        didSet {
          
            rNumber = Int(arc4random_uniform(5))
            print(rNumber)
        }
        
        
    }
    
    var rightLabel: SKLabelNode!
    var leftLabel: SKLabelNode!
    var upLabel: SKLabelNode!
    var downLabel: SKLabelNode!
    var editingMode: Bool = false {
        didSet {
            if editingMode {
                rightLabel.text = "Done"
            } else {
                rightLabel.text = "Edit"
            }
        }
    }
    
    //
    //   Background
    //
    //
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        //
        //   Create Start
        //
        //
        startLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
        startLabel.text = "Press to Start"
        startLabel.horizontalAlignmentMode = .right
        startLabel.position = CGPoint(x: 475, y: 500)
        addChild(startLabel)
        
        //
        //   Buttons
        //
        //
        rightLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
        rightLabel.text = "Right"
        rightLabel.position = CGPoint(x: 250, y: 75)
        rightLabel.zPosition = 1000
        addChild(rightLabel)
        leftLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
        leftLabel.text = "Left"
        leftLabel.position = CGPoint(x: 100, y: 75)
        leftLabel.zPosition = 1000
        addChild(leftLabel)
        upLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
        upLabel.text = "Up"
        upLabel.position = CGPoint(x: 175, y: 125)
        upLabel.zPosition = 1000
        addChild(upLabel)
        downLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
        downLabel.text = "Down"
        downLabel.position = CGPoint(x: 175, y: 25)
        downLabel.zPosition = 1000
        addChild(downLabel)
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
          
            let objects = nodes(at: location)
            if objects.contains(rightLabel) {
                   spin = SKAction.move(by: CGVector (dx: 30, dy: 0), duration: 0.1)
                hit = SKAction.repeat(spin, count: 3)
                   person.run(hit)
            } else if objects.contains(leftLabel) {
                spin = SKAction.move(by: CGVector (dx: -20, dy: 0), duration: 0.1)
                hit = SKAction.repeat(spin, count: 3)
                person.run(hit)
                
            } else if objects.contains(upLabel) {
                spin = SKAction.move(by: CGVector (dx: 0, dy: 20), duration: 0.1)
                hit = SKAction.repeat(spin, count: 3)
                person.run(hit)
                
            } else if objects.contains(downLabel) {
                spin = SKAction.move(by: CGVector (dx: 0, dy: -20), duration: 0.1)
                hit = SKAction.repeat(spin, count: 3)
                person.run(hit)
            } else if objects.contains(startLabel) {
                ballNumber += 1
                wrench = SKSpriteNode(imageNamed: "Wrench-PNG-Transparent-Image")
                wrench.physicsBody = SKPhysicsBody(texture: wrench.texture!, size: wrench.texture!.size())
                wrench.physicsBody!.contactTestBitMask = wrench.physicsBody!.collisionBitMask
                wrench.physicsBody!.restitution = 1
                wrench.physicsBody!.affectedByGravity = false
                wrench.physicsBody!.friction = 0
                wrench.physicsBody!.linearDamping = 0
                wrench.physicsBody!.mass = 0
                
                wrench.position = CGPoint(x: 675, y: 400)
                wrench.name = "wrench"
                
                addChild(wrench)
              
                  wrench.physicsBody!.applyForce(CGVector (dx: -60000, dy: -60000))
                
                startLabel.removeFromParent()
                if (gameOver == true) {
                    gameOverLabel.removeFromParent()
                    gameOver = false
                }
                
                person = SKSpriteNode(imageNamed: "robot_3Dyellow")
                person.physicsBody = SKPhysicsBody(texture: person.texture!, size: person.texture!.size())
                person.physicsBody!.contactTestBitMask = wrench.physicsBody!.collisionBitMask
                person.physicsBody!.restitution = 1
                person.physicsBody!.affectedByGravity = false
                person.physicsBody!.friction = 0
                person.physicsBody!.linearDamping = 0
                person.physicsBody!.mass = 0
                
                person.position = CGPoint(x: 500, y: 500)
                person.name = "person"
                
                addChild(person)
               
            }
        }
    }
    
    
    //
    //  Create Bottom Item
    //  Create more points
    //
    func makeSlot(at position: CGPoint, isGood: Bool) {
        var slotBase: SKSpriteNode
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotBase.name = "good"
        } else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotBase.name = "bad"
        }
        slotBase.position = position
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody!.isDynamic = false
        addChild(slotBase)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "wrench" {
            collisionBetween(ball: contact.bodyA.node!, object: contact.bodyB.node!)
            
        } else if contact.bodyB.node?.name == "wrench" {
            collisionBetween(ball: contact.bodyB.node!, object: contact.bodyA.node!)
            
        }
    }
    //
    //  Score System
    //
    //
    func collisionBetween(ball: SKNode, object: SKNode) {
        if object.name == "person" {
            destroy(ball: ball)
            
        } else if object.name == "bad" {
            destroy(ball: ball)
            
        } else if object.name == "rightFlipper" {
            rightTouch = true
            print("Agatha")
        } else if object.name == "leftFlipper" {
            leftTouch = true
            print("LAgatha")
        } else {
           wrench.physicsBody!.applyForce(CGVector (dx: 100000, dy: 500000))
            print("tract")
        }
    }
    func boxCollision(box: SKNode, object: SKNode) {
        if object.name == "box" {
            removeBarrier(box: box)
            
        }
    }
    
    //
    //  Ball Dies
    //
    //
    func destroy(ball: SKNode) {
        if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
            fireParticles.position = ball.position
            addChild(fireParticles)
        }
        ball.removeFromParent()
        person.removeFromParent()
        
            gameOverLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
            gameOverLabel.text = "Game Over"
            gameOverLabel.horizontalAlignmentMode = .right
            gameOverLabel.position = CGPoint(x: 475, y: 500)
            addChild(gameOverLabel)
            startLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
            startLabel.text = "Press to Play Again"
            startLabel.horizontalAlignmentMode = .right
            startLabel.position = CGPoint(x: 525, y: 400)
            addChild(startLabel)
            ballNumber = 0
            score = 0
            gameOver = true
        
    }
    
    
    func removeBarrier(box: SKNode) {
        if let magicParticles = SKEmitterNode(fileNamed: "MagicParticles") {
            magicParticles.position = box.position
            addChild(magicParticles)
        }
        box.removeFromParent()
    }
    //
    //  Bouder System
    //
    //
    func makeBouder (at position: CGPoint) {
        let bouder = SKSpriteNode(imageNamed: "barLong")
        bouder.position = position
        bouder.physicsBody = SKPhysicsBody(texture: bouder.texture!, size: bouder.texture!.size())
        
        bouder.physicsBody!.isDynamic = false
        bouder.zPosition = 2
        addChild(bouder)
    }
    
    
    
    
    //
    //  Launcher
    //
    //
    func makeLauncher (at position: CGPoint) {
        
        let launcher = SKSpriteNode(imageNamed: "slotBaseGood")
        launcher.position = position
        launcher.physicsBody = SKPhysicsBody(texture: launcher.texture!, size: launcher.texture!.size())
        launcher.physicsBody!.isDynamic = false
        launcher.physicsBody!.restitution = 4
        launcher.zPosition = 1
        launcher.name = "launch"
        addChild(launcher)
    }
    
    func makeSideLauncher (at position: CGPoint) {
        
        let launcher = SKSpriteNode(imageNamed: "slotBaseGoodUp")
        launcher.position = position
        launcher.physicsBody = SKPhysicsBody(texture: launcher.texture!, size: launcher.texture!.size())
        launcher.physicsBody!.isDynamic = false
        launcher.physicsBody!.restitution = 4
        launcher.zPosition = 1
        launcher.name = "launch"
        addChild(launcher)
    }
    
    func killLauncher(launcher: SKNode) {
        launcher.removeFromParent()
        print("I'm sorry for your loss")
        
    }
}



