//
//  main.swift
//  classLesson
//
//  Created by Арген on 16.03.2021.
//

import Foundation

protocol Speed {
    var speed:Int { get }
    func move()
}

enum ViewCar {
    case NissanSkyline
    case Bugatti
    case Lamborghini
    case Ferari
    case RollsRoyce
}

enum Transmission {
    case auto
    case manual
}

enum Color:String {
    case red    = "красный"
    case blue   = "синий"
    case black  = "черный"
    case yellow = "желтый"
}



class Car:Speed {
    var speed: Int = 300
    
    func move() {
        print("SportCar едет со скоростью \(speed)")
    }
    
    var view: String
    var carBrand: ViewCar
    var year: Int
    var color: Color

    init(view:String, carBrand:ViewCar, year:Int, color:Color) {
        self.view = view
        self.carBrand = carBrand
        self.year = year
        self.color = color

    }

    func carInfo(_ car: Car) {
        print("\(self.view) car")

        switch car.carBrand {
        case .Bugatti:
            print("На автосалоне есть Спорткар \(car.carBrand)")
        case .Ferari:
            print("На автосалоне есть Спорткар \(car.carBrand)")
        case .Lamborghini:
            print("На автосалоне есть Спорткар \(car.carBrand)")
        case .NissanSkyline:
            print("На автосалоне есть Спорткар \(car.carBrand)")
        default:
            print("На автосалоне есть Спорткар \(car.carBrand)")
        }


        switch car.year {
        case 2000...2010:
            print("У нас нет старых машин в автосалоне.")
        case 2010...2015:
            print("Можно найти машину, которую вы хотите.")
        case 2015...2021:
            print("У нас только новые машины в автосалоне.")
        default:
            print("Вы можете поискать в другом автосалоне.")
        }

        if car.color == .black {
            print("Завадской \(color.rawValue) цвет.")
        } else if car.color == .blue {
            print("Завадской \(color.rawValue) цвет.")
        } else if car.color == .red {
            print("Завадской \(color.rawValue) цвет.")
        } else if car.color == .yellow {
            print("Завадской \(color.rawValue) цвет.")
        }

    }

    func changeColor() {
        print("SportCar перекрасили на \(color.rawValue) цвет ")
    }

}

var someCar = Car(view: "SportCar", carBrand: .Bugatti, year: 2020, color: .black)
var somCar1 = Car(view: "Luxury", carBrand: .RollsRoyce, year: 2021, color: .red)

someCar.changeColor()
someCar.color = .red
someCar.changeColor()

print("--------------------------")

somCar1.carInfo(somCar1)
print()

someCar.move()

print("--------------------------")


class InheritCar:Car {
    var transmission: Transmission

    init(transmission:Transmission) {
        self.transmission = transmission
        super.init(view: "SporCar", carBrand: .Bugatti, year: 2021, color: .blue)
    }

    func changeStateTranmission() {
        print("Коробка передачи \(self.transmission)")
    }

    override func changeColor() {
        print("SportCar перекрасили на \(color.rawValue) цвет ")
    }
}

let inheritCar = InheritCar(transmission: .auto)
inheritCar.changeStateTranmission()

inheritCar.changeColor()

inheritCar.color = .blue
print("--------------------------")

inheritCar.changeColor()

print("------------------------------------------")

typealias ViewCargo = String


enum Luggage:ViewCargo {
    case Volvo = "Hа Volvo можно грузить до 5 тон"
    case Hyundai = "Hа Volvo можно грузить до 10 тон"
    case Mercedes = "Hа Volvo можно грузить до 15 тон"
}

enum MarkTrack {
    case Volvo
    case Hyundai
    case Mercedes
}

class Track:Speed {
    var speed: Int = 180
    
    func move() {
        print("Грузовая машина едет со скоростью \(speed)")
    }
    
    var year:Int
    var country:String
    var seats:Int
    var mark:MarkTrack
    
    static var carCount = 0
    
    init(year:Int, country:String, seats:Int,mark:MarkTrack) {
        self.year = year
        self.country = country
        self.seats = seats
        self.mark = mark
        
        Track.carCount  += 1
    }
    
    deinit {
        Track.carCount -= 1
    }
    
    func carCount() {
        print("В автосалоне \(Track.carCount) машин")
    }
    
   static func removCar() {
        print("Продана одна грузовая машина")
        Track.carCount -= 1
    }
    

    convenience init(country:String) {
        self.init(year:2018, country:"Germany", seats:4,mark:.Hyundai)
    }
    
    func greeting() {
        print("Представляю вам грузовую машину!")
    }
    
    func infoTrack(_ track:Track) {
        
        switch track.mark {
        case .Hyundai:
            print("Марка: Hyundai")
        case .Mercedes:
            print("Марка: Mercedes")
        default:
            print("Марка: Volvo")
        }
        
        print("Год выпуска: \(track.year)")
        print("Производство: \(track.country)")
        print("Seats of number: \(track.seats) местная.")
        
    }
}

let trackCar = Track(year: 2010, country: "Kyrgyzstan", seats: 4,mark: .Hyundai)
let trackCar1 = Track(country: "Germany")

trackCar.greeting()
trackCar.infoTrack(trackCar)

print()

trackCar.move()

print()

trackCar.carCount()

Track.removCar()

trackCar.carCount()

print("------------------------------------------")

enum DoorState:String {
    case open = "открыто"
    case close = "закрыто"
}

class InheritTrack:Track {
    var door:DoorState
    
    init(door:DoorState) {
        self.door = door
        super.init(year: 2021, country: "Russia", seats: 5, mark: .Volvo)
        
    }
    
    override func greeting() {
        print("Представляю вам новую грузовую машину!")
    }
    
    override func infoTrack(_ track:Track) {
        
        switch track.mark {
        case .Hyundai:
            print("Марка: Hyundai 2021")
        case .Mercedes:
            print("Марка: Mercedes 2021")
        default:
            print("Марка: Volvo 2021")
        }
        
        print("Год выпуска: \(track.year)")
        print("Производство: \(track.country)")
        print("Seats of number: \(track.seats) местный.")
        
    }

    
    func doorOpen() {
        print("Дверь открыто")
    }
    
    func doorClose() {
        print("Дверь закрыто")
    }
}

let inheritTrack = InheritTrack(door: .close)

inheritTrack.greeting()

inheritTrack.infoTrack(inheritTrack)

inheritTrack.door = .open

inheritTrack.doorOpen()


