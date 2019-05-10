/* TODO list
 Add touch to start on main top
 Kill and breed launcher children
 Detect screen to place items
 create table method
 clean up
 finish building and sizing table
 
 REQUEST LIST
 Joint paddles
 Detect Touch
 Kill And Breed Children
 
 */

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
    var ballShadow: SKSpriteNode!
    var leftFlipper: SKSpriteNode!
    var rightFlipper: SKSpriteNode!
    var rightTouch: Bool = false
    var leftTouch: Bool = false
    var gameOver: Bool = false
    var rNumber: Int = 2
    var ballNumber: Int = 0 {
        didSet {
            ballLabel.text = "Ball: \(ballNumber)"
            
        }
    }
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
            rNumber = Int(arc4random_uniform(5))
            print(rNumber)
        }
        
        
    }
    
    var rightLabel: SKLabelNode!
    var leftLabel: SKLabelNode!
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
        
        
      //  makeSlot(at: CGPoint(x: 450, y: 0), isGood: false)
        
      //  makeBouncer(at: CGPoint(x:500, y: 650))
      //  makeBouncer(at: CGPoint(x:250, y: 650))
       // makeBouncer(at: CGPoint(x:375, y: 800))
        
        
      //  rightFlipperCreate()
      //  leftFlipperCreate()
      //  makeBouder(at: CGPoint(x:675, y: 295))
//        makeLauncher(at: CGPoint(x:0, y: 0))
//        makeLauncher(at: CGPoint(x:0, y: 1024))
//         makeSideLauncher(at: CGPoint(x:0, y: 500))
//        makeSideLauncher(at: CGPoint(x:768, y: 500))
      //  makeSlopeRight(at: CGPoint(x:700, y: 890))
      //  makeSlopeLeft(at: CGPoint(x:100, y: 890))
     //   makeRectangle(at: CGPoint(x: 400, y: 1045))
        // makeGuardLeft(at: CGPoint(x:100, y: 300))
        // makeGuardRight(at: CGPoint(x:400, y: 300))
     //   makeOuterGuardRight(at: CGPoint(x:660, y: 260))
      //  makeOuterGuardLeft(at: CGPoint(x:30, y: 260))
        
        
        
        
        //
        //   Create Score
        //
        //
        scoreLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: 430, y: 900)
        addChild(scoreLabel)
        
        //
        //   Create Ball Count
        //
        //
        ballLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
        ballLabel.text = "Ball: 0"
        ballLabel.horizontalAlignmentMode = .right
        ballLabel.position = CGPoint(x: 425, y: 960)
        addChild(ballLabel)
        
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
        //   Flipper Buttons
        //
        //
//        rightLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
//        rightLabel.text = ("Right Flipper")
//        rightLabel.position = CGPoint(x: 640, y: 50)
//        rightLabel.zPosition = 1000
//        addChild(rightLabel)
//        leftLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
//        leftLabel.text = "Left Flipper"
//        leftLabel.position = CGPoint(x: 150, y: 50)
//        leftLabel.zPosition = 1000
//        addChild(leftLabel)
        
    }
    
    //
    //  Deal with later
    //
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            // if location.contains(CGPoint(x: 300, y: 300)) {
            //  let box = SKSpriteNode(color: UIColor.black, size: CGSize(width: 64, height: 64))
            //  box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
            //  box.position = location
            //  addChild(box)
            let objects = nodes(at: location)
//            if objects.contains(rightLabel) {
//                //rightFlipper().run(hit)
//                //let move = SKAction.moveBy(x:0, y: 400, duration: 5)
//                spin = SKAction.rotate(byAngle: -0.3, duration: 0.01)
//                back = SKAction.rotate(byAngle: 0.3, duration: 0.1)
//                hit = SKAction.repeat(spin, count: 3)
//                backHit = SKAction.repeat(back, count: 3)
//                rightPeg.run(hit)
//                rightPeg.run(backHit)
//                if (rightTouch == true) {
//                    ball.physicsBody?.applyForce(CGVector (dx: 0, dy: 25000))
//                    // ball.physicsBody?.applyTorque(100)
//                    rightTouch = false
//                }
//                //  if objects.contains(paddles) {
//                //      editingMode = !editingMode
//
//            } else if objects.contains(leftLabel) {
//                //rightFlipper().run(hit)
//                //let move = SKAction.moveBy(x:0, y: 400, duration: 5)
//                spin = SKAction.rotate(byAngle: 0.3, duration: 0.01)
//                back = SKAction.rotate(byAngle: -0.3, duration: 0.1)
//                hit = SKAction.repeat(spin, count: 3)
//                backHit = SKAction.repeat(back, count: 3)
//                leftPeg.run(hit)
//                leftPeg.run(backHit)
//                if (leftTouch == true) {
//                    ball.physicsBody?.applyForce(CGVector (dx: 0, dy: 25000))
//                    // ball.physicsBody?.applyTorque(-100)
//                    leftTouch = false
//                }
//                //  if objects.contains(paddles) {
//                //      editingMode = !editingMode
//
//            } else
            if objects.contains(startLabel) {
                ballNumber += 1
                //  rNumber = Int(arc4random_uniform(5))
                wrench = SKSpriteNode(imageNamed: "Wrench-PNG-Transparent-Image")
                wrench.physicsBody = SKPhysicsBody(texture: wrench.texture!, size: wrench.texture!.size())
                wrench.physicsBody!.contactTestBitMask = wrench.physicsBody!.collisionBitMask
                wrench.physicsBody!.restitution = 1
                wrench.physicsBody!.affectedByGravity = false
                wrench.physicsBody!.friction = 0
                wrench.physicsBody!.linearDamping = 0
                wrench.physicsBody!.mass = 0
                //    ballShadow = SKSpriteNode(imageNamed: "ball")
                //    ballShadow.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0 + 10)
                //     ballShadow.physicsBody!.isDynamic = true
                
                wrench.position = CGPoint(x: 675, y: 400)
                wrench.name = "wrench"
                //     ballShadow.position = location
                //    ballShadow.name = "ballShadow"
                
                addChild(wrench)
              
                  wrench.physicsBody!.applyForce(CGVector (dx: -30000, dy: -30000))
                
                startLabel.removeFromParent()
                if (gameOver == true) {
                    gameOverLabel.removeFromParent()
                    gameOver = false
                }
                //   addChild(ballShadow)
                
                // }
                //                if editingMode {
                //                    currentBox = false
                //                    for object in objects {
                //                        if object.name == "box" {
                //                            currentBox = true
                //                            removeBarrier(box: object)
                //                        }
                //                    }
                //                    if !currentBox {
                //                        let size = CGSize(width: GKRandomDistribution(lowestValue: 16, highestValue: 128).nextInt(), height: 16)
                //                        let box = SKSpriteNode(color: RandomColor(), size: size)
                //                        box.zRotation = RandomCGFloat(min: 0, max: 3)
                //                        box.position = location
                //                        box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
                //                        box.physicsBody!.isDynamic = false
                //                        box.name = "box"
                //                        addChild(box)
                //                    }
                
                
            }
        }
    }
    
    //
    //  Middle pointers
    //
    //
    func makeBouncer (at position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bumperCircle1")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2)
        bouncer.physicsBody!.isDynamic = false
        bouncer.physicsBody!.restitution = 2
        bouncer.name = "good"
        addChild(bouncer)
    }
    
    //
    //  Create Bottom Item
    //  Create more points
    //
    func makeSlot(at position: CGPoint, isGood: Bool) {
        var slotBase: SKSpriteNode
        //var slotGlow: SKSpriteNode
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            // slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
            slotBase.name = "good"
        } else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            // slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            slotBase.name = "bad"
        }
        slotBase.position = position
        //slotGlow.position = position
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody!.isDynamic = false
        addChild(slotBase)
        //  addChild(slotGlow)
        
        // let spin = SKAction.rotate(byAngle: CGFloat.pi, duration: 10)
        // let spinForever = SKAction.repeatForever(spin)
        // slotGlow.run(spinForever)
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
        if object.name == "good" {
            score += 100
            
        } else if object.name == "bad" {
            // score -= 1
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
        
        if (ballNumber < 3) {
            startLabel = SKLabelNode(fontNamed: "DINCondensed-Bold ")
            startLabel.text = "Press to Start"
            startLabel.horizontalAlignmentMode = .right
            startLabel.position = CGPoint(x: 475, y: 500)
            addChild(startLabel)
        } else {
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
        //  paddles.physicsBody!.restitution = 2
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
    //
    //  Slope Right
    //
    //
    func makeSlopeRight (at position: CGPoint) {
        let slopeRight = SKSpriteNode(imageNamed: "shape_cornerCurvedRight")
        slopeRight.position = position
        slopeRight.physicsBody = SKPhysicsBody(texture: slopeRight.texture!, size: slopeRight.texture!.size())
        slopeRight.physicsBody!.isDynamic = false
        // slopeRight.physicsBody!.restitution = 5000
        //  launcher.name = "good"
        addChild(slopeRight)
    }
    
    //
    //  Slope Left
    //
    //
    func makeSlopeLeft (at position: CGPoint) {
        let slopeLeft = SKSpriteNode(imageNamed: "shape_cornerCurvedLeft")
        slopeLeft.position = position
        slopeLeft.physicsBody = SKPhysicsBody(texture: slopeLeft.texture!, size: slopeLeft.texture!.size())
        slopeLeft.physicsBody!.isDynamic = false
        // slopeRight.physicsBody!.restitution = 5000
        //  launcher.name = "good"
        addChild(slopeLeft)
    }
    
    //
    //  Block
    //
    //
    func makeRectangle (at position: CGPoint) {
        let rectangle = SKSpriteNode(imageNamed: "shape_rectangle")
        rectangle.position = position
        rectangle.physicsBody = SKPhysicsBody(texture: rectangle.texture!, size: rectangle.texture!.size())
        rectangle.physicsBody!.isDynamic = false
        addChild(rectangle)
    }
    
    //
    //  Guard Left
    //
    //
    func makeGuardLeft (at position: CGPoint) {
        let guardLeft = SKSpriteNode(imageNamed: "paddleHolder_innerLeft")
        guardLeft.position = position
        guardLeft.physicsBody = SKPhysicsBody(texture: guardLeft.texture!, size: guardLeft.texture!.size())
        guardLeft.physicsBody!.isDynamic = false
        guardLeft.physicsBody!.restitution = 2
        //  launcher.name = "good"
        addChild(guardLeft)
    }
    
    //
    //  Guard Right
    //
    //
    func makeGuardRight (at position: CGPoint) {
        let guardRight = SKSpriteNode(imageNamed: "paddleHolder_innerRight")
        guardRight.position = position
        guardRight.physicsBody = SKPhysicsBody(texture: guardRight.texture!, size: guardRight.texture!.size())
        guardRight.physicsBody!.isDynamic = false
        guardRight.physicsBody!.restitution = 2
        //  launcher.name = "good"
        addChild(guardRight)
    }
    //
    //  Outer Guard Left
    //
    //
    func makeOuterGuardLeft (at position: CGPoint) {
        let outerGuardLeft = SKSpriteNode(imageNamed: "paddleHolder_outerLeft")
        outerGuardLeft.position = position
        outerGuardLeft.physicsBody = SKPhysicsBody(texture: outerGuardLeft.texture!, size: outerGuardLeft.texture!.size())
        outerGuardLeft.physicsBody!.isDynamic = false
        // outerGuardRight.physicsBody!.restitution = 5
        //  launcher.name = "good"
        addChild(outerGuardLeft)
    }
    
    //
    //  Outer Guard Right
    //
    //
    func makeOuterGuardRight (at position: CGPoint) {
        let outerGuardRight = SKSpriteNode(imageNamed: "paddleHolder_outerRight")
        outerGuardRight.position = position
        outerGuardRight.physicsBody = SKPhysicsBody(texture: outerGuardRight.texture!, size: outerGuardRight.texture!.size())
        outerGuardRight.physicsBody!.isDynamic = false
        outerGuardRight.zPosition = 0
        // outerGuardRight.physicsBody!.restitution = 5
        //  launcher.name = "good"
        addChild(outerGuardRight)
    }
    
    //
    //  Paddles
    //
    //
    func rightFlipperCreate() {
        
        print("1")
        
        
        let size = CGSize(width: 20, height: 20)
        
        rightPeg = SKSpriteNode(color: .red,
                                size: size)
        rightPeg.zPosition = -5
        
        rightFlipper = SKSpriteNode(imageNamed: "flipperShortRight")
        
        rightPeg.physicsBody = SKPhysicsBody(rectangleOf: size)
        rightPeg.physicsBody?.isDynamic = false
        rightPeg.position = CGPoint(x: 547, y: 125)
        
        rightFlipper.physicsBody = SKPhysicsBody(texture: rightFlipper.texture!, size: rightFlipper.texture!.size())
        rightFlipper.position = CGPoint(x: 490, y: 125)
        rightFlipper.physicsBody!.mass = 999999
        
        rightFlipper.name = "rightFlipper"
        addChild(rightPeg)
        addChild(rightFlipper)
        
        let rightConection = SKPhysicsJointFixed.joint(withBodyA: rightPeg.physicsBody!, bodyB: rightFlipper.physicsBody!, anchor: rightPeg.position)
        
        // let rightFlipper = SKPhysicsJointPin.joint(withBodyA: rightPeg.physicsBody!, bodyB: dynamicNode.physicsBody!, anchor: rightPeg.position)
        
        // let rightFlipper = SKPhysicsJointSpring.joint(withBodyA: rightPeg.physicsBody!, bodyB: dynamicNode.physicsBody!, anchorA: rightPeg.position, anchorB: dynamicNode.position)
        
        // rightFlipper.frequency = 0.5
        // rightFlipper.damping = 0.2
        
        physicsWorld.add(rightConection)
        
        //        let move = SKAction.moveBy(x:0, y: 400,
        //                                   duration: 5)
        //        let spin = SKAction.rotate(byAngle: 0.3, duration: 0.3)
        //        let hit = SKAction.repeat(spin, count: 3)
        //        rightPeg.run(move)
        print("2")
        
    }
    
    func leftFlipperCreate() {
        
        print("1")
        
        
        let size = CGSize(width: 20, height: 20)
        
        leftPeg = SKSpriteNode(color: .red,
                               size: size)
        leftPeg.zPosition = -5
        
        leftFlipper = SKSpriteNode(imageNamed: "flipperShortLeft")
        
        leftPeg.physicsBody = SKPhysicsBody(rectangleOf: size)
        leftPeg.physicsBody?.isDynamic = false
        leftPeg.position = CGPoint(x: 143, y: 125)
        
        leftFlipper.physicsBody = SKPhysicsBody(texture: leftFlipper.texture!, size: leftFlipper.texture!.size())
        leftFlipper.position = CGPoint(x: 200, y: 125)
        leftFlipper.physicsBody!.mass = 999999
        
        leftFlipper.name = "leftFlipper"
        addChild(leftPeg)
        addChild(leftFlipper)
        
        let leftConection = SKPhysicsJointFixed.joint(withBodyA: leftPeg.physicsBody!, bodyB: leftFlipper.physicsBody!, anchor: leftPeg.position)
        
        // let rightFlipper = SKPhysicsJointPin.joint(withBodyA: rightPeg.physicsBody!, bodyB: dynamicNode.physicsBody!, anchor: rightPeg.position)
        
        // let rightFlipper = SKPhysicsJointSpring.joint(withBodyA: rightPeg.physicsBody!, bodyB: dynamicNode.physicsBody!, anchorA: rightPeg.position, anchorB: dynamicNode.position)
        
        // rightFlipper.frequency = 0.5
        // rightFlipper.damping = 0.2
        
        physicsWorld.add(leftConection)
        
        //        let move = SKAction.moveBy(x:0, y: 400,
        //                                   duration: 5)
        //        let spin = SKAction.rotate(byAngle: 0.3, duration: 0.3)
        //        let hit = SKAction.repeat(spin, count: 3)
        //        rightPeg.run(move)
        print("2")
        
    }
}



