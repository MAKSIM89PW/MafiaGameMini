//
//  Player.swift
//  Mafia
//
//  Created by Максим Нурутдинов on 29.04.2023.
//

import UIKit

class Player {
    
    var name: String//имя
    var id : Int
    var role: Role //роль в игре
    var stateAlive: AliveState // жив или мертв
    
    var actions:Dictionary<ActionType, Dictionary<Int,Bool>>

    
    init(name: String, id: Int, role: Role, stateAlive: AliveState) {
        self.name = ""
        self.id = 0
        self.role = Role.Citizen
        self.stateAlive = AliveState.Live
    }
    
    convenience init(name: String) {
        self.init(name: "-")
        self.name = name
    }
    
    convenience init?(id: Int, name:String) {
        self.init(name: "-")
        self.id = id
    }
    
    convenience init?(baseObject: UserAccount) {
        self.init(id: baseObject.id, name: baseObject.name!)
    }
    
    // MARK: - Методы управления Действиями(Action)

    // добавляем новое выполненное действие для пользователя
    func addAction(action: ActionType, turn: Int) {
        self.actions[action] = [turn:true]
    }
    
    //удаляем действие пользователя для текущего хода
    func removeAction(action: ActionType, turn: Int) {
        self.actions[action] = [turn:false]
    }
    
    // Переключаем новое выполненное действие для пользователя
    func toggleAction(action: ActionType, turn: Int) {
        if self.actionCheck(action: action) {
            self.removeAction(action: action, turn: turn)
        } else {
            self.addAction(action: action, turn: turn)
        }
    }
    
    // Проверяем выполнено ли указанное действие для пользователя на текущем ходу
    func actionCheck(action: ActionType) -> Bool{
        if self.actions[action] != nil {
            if self.actions[action]![game.getCurrentTurnNumber()] != nil {
                return self.actions[action]![game.getCurrentTurnNumber()]!
            }
        }
        return false
    }
    
}
    
