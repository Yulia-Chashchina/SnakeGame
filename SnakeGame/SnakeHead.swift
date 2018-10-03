//
//  SnakeHead.swift
//  SnakeGame
//
//  Created by Юлия Чащина on 06.06.2018.
//  Copyright © 2018 Юлия Чащина. All rights reserved.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    override init(atPoint point: CGPoint){
        super.init(atPoint: point)
        
     // категория - голова
        self.physicsBody?.categoryBitMask = CollisionCategiries.SnakeHead
      // пересекается с телом, яблоком и границей экрана
        self.physicsBody?.contactTestBitMask = CollisionCategiries.EdgeBody | CollisionCategiries.Apple | CollisionCategiries.Snake
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
