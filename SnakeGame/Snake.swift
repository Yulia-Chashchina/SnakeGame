//
//  Snake.swift
//  SnakeGame
//
//  Created by Юлия Чащина on 06.06.2018.
//  Copyright © 2018 Юлия Чащина. All rights reserved.
//

import UIKit
import SpriteKit

// сама змейка
class Snake: SKShapeNode{
    
   // массив где хранятся сегменты тела
    var body = [SnakeBodyPart]()
    
    // конструктор
    convenience init(atPoint point: CGPoint) {
        self.init()
      
      // змейка начинается с головы, создадим ее
       let head = SnakeHead(atPoint: point)
        
        // и добавим в массив
        body.append(head)
        
        // и сделаем ее дочерним объектом.
        addChild(head)
    }
    
    // метод добавляет еще один сегмент тела
    func addBodyPart() {
        // инстанцируем сегмент
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x:body[0].position.x, y:body[0].position.y))
        
        // добавляем его в массив
        body.append(newBodyPart)
        
        // делаем дочерним объектом
        addChild(newBodyPart)
    }
    // скорость перемещения
    let moveSpeed = 125.0
    
    // угол, необходимый для расчета направления
    var angle: CGFloat = 0.0
    
    // перемещаем змейку
    func move() {
     // если у змейки нет головы то ничего не перемещаем
        guard !body.isEmpty else{return}
        
       // перемещаем голову
        let head = body[0]
        moveHead(_head: head)
        
        // перемещаем все сегменты тела
        for index in (0..<body.count) where index > 0 {
            let previousBodyPart = body[index-1]
            let currentBodyPart = body[index]
            moveBodyPart(_p: previousBodyPart, c: currentBodyPart)
        }
    }
   // перемещаем голову
    func moveHead(_head: SnakeBodyPart) {
        
        // рассчитываем смещение точки
        let dx = CGFloat(moveSpeed) * sin(angle)
        let dy = CGFloat(moveSpeed) * cos(angle)
        
      // смещаем точку назначения головы
        let nextPosition = CGPoint(x: _head.position.x + dx, y: _head.position.y + dy)
        
       // действие перемещения головы
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
       
        // запуск действия перемещения
        _head.run(moveAction)
    }
//   перемещаем сегмента змеи
    func moveBodyPart(_p: SnakeBodyPart, c: SnakeBodyPart) {
//      перемещаем текущий элемент к предыдущему
        let moveAction = SKAction.move(to: CGPoint(x: _p.position.x, y: _p.position.y),duration: 0.1)
        
//         запуск действия перемещения
        c.run(moveAction)
    }
    
    // поворот по часовой стрелке
    func moveClockwise() {
      // смещаем угол на 45 градусов
        angle += CGFloat(Double.pi/2)
    }
    // поворот против часовой стрелки
    func moveCounterClockwise(){
        angle -= CGFloat(Double.pi/2)
    }
}

