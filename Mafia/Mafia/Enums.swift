//
//  Enums.swift
//  Mafia
//
//  Created by Максим Нурутдинов on 29.04.2023.
//

import UIKit

enum DayNightState {
    case Day
    case Night
}

enum AliveState {
    case Live
    case Dead
}

enum Role: Int, CustomStringConvertible {
    
    case Citizen = 0
    case Mafia = 1
    case Sherif = 2
    case Doctor = 3
    case Prostitute = 4
    case Maniac = 5
    case Lawyer = 6
    
    static var count: Int { return Role.Lawyer.hashValue + 1}
    
    var description: String {
        switch self {
        case .Citizen:
            return "Мирный игрок  ищит мафию"
        case .Mafia:
            return "убивает всех кто не мафия ночью"
        case .Sherif:
            return "стреляет или проверяет роли"
        case .Doctor:
            return "Лечит не больше 2 раз за ночь одну цель"
        case .Prostitute:
            return "Првоеряет роли, если находит активную роль отменяет ее ход"
        case .Maniac:
            return "Играет сам за себя  задачу убить всех и выйграть игру"
        case .Lawyer:
            return "Защищает мафию на дневном голосовании"
        }
    }
    
    var title: String {
        switch self {
        case .Citizen:
            return "Мирный"
        case .Mafia:
            return "Мафия"
        case .Sherif:
            return "Комиссар"
        case .Doctor:
            return "Доктор"
        case .Prostitute:
            return "Путана"
        case .Maniac:
            return "Моньяк"
        case .Lawyer:
            return "Адвокат"
        }
    }
    
    var roleNightActions: [ActionType] {
        switch self {
        case .Citizen:
            return []
        case .Mafia:
            return [ActionType.MafiaKill]
        case .Sherif:
            return [ActionType.SherifCheck]
        case .Doctor:
            return [ActionType.Heal]
        case .Prostitute:
            return [ActionType.ProstituteSilence]
        case .Maniac:
            return [ActionType.ManiacKill, ActionType.ManiacSilence]
        case .Lawyer:
            return [ActionType.LawyerGet]
        }
    }
    
}

enum ActionType:Int, CustomStringConvertible {
    case MafiaKill = 0
    case SherifCheck = 1
    case Heal = 2
    case CitizenKill = 3
    case ProstituteSilence = 4
    case ManiacKill = 5
    case ManiacSilence = 6
    case LawyerGet = 7
    
    

    var description: String {
        switch self {
        case .MafiaKill:
            return "убивает Мафия"
        case .SherifCheck:
            return "проверяет Комиссар"
        case .Heal:
            return "лечит Доктор"
        case .CitizenKill:
            return "убивают Мирные"
        case .ProstituteSilence:
            return "затыкает Путана"
        case .ManiacKill:
            return "убивает Маньяк"
        case .ManiacSilence:
            return "затыкает Маньяк"
        case .LawyerGet:
            return "защищает Адвокат"
       
        }
    }
    
    var correspondingRole:Role{
        switch self {
        case .MafiaKill:
            return Role.Mafia
        case .SherifCheck:
            return Role.Sherif
        case .Heal:
            return Role.Doctor
        case .CitizenKill:
            return Role.Citizen
        case .ProstituteSilence:
            return Role.Prostitute
        case .ManiacKill:
            return Role.Maniac
        case .LawyerGet:
            return Role.Lawyer
        case .ManiacSilence:
            return Role.Maniac
        }
    }
}
