//
//  SnakeBodyPart.swift
//  SnakeGame
//
//  Created by Юлия Чащина on 06.06.2018.
//  Copyright © 2018 Юлия Чащина. All rights reserved.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    let diametr = 10.0
    // добавляем конструктор
    init(atPoint point: CGPoint) {
        super.init()
        // рисуем круглый элемент
        path = UIBezierPath(ovalIn: CGRect(x:0, y:0, width:CGFloat(diametr),height: CGFloat(diametr))).cgPath
        
        // цвет рамки и заливки зеленый
        fillColor = UIColor.green
        strokeColor = UIColor.green
        //ширина рамки 5 поинтов
        lineWidth = 5
        //размещаем элемент в переданой точке
        self.position = point
        
        // Создаем физическое тело
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diametr - 4), center: CGPoint(x: 5, y: 5))
        
        // Может перемещаться в пространстве
        self.physicsBody?.isDynamic = true
        
        // Категория - змея
        self.physicsBody?.categoryBitMask = CollisionCategiries.Snake
        
        // пересекается с границами экрана и яблоком
        self.physicsBody?.contactTestBitMask = CollisionCategiries.EdgeBody | CollisionCategiries.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
