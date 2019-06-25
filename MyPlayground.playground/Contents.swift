import UIKit

enum CarName {
    case renault_logan, peugeot_boxer
}

enum EngineStatus {
    case on, off
}

enum WindowStatus {
    case open, close
}

struct Car {
    let name: CarName
    let year: Int
    var engine: EngineStatus
    var windows: WindowStatus
    let trunkcapacity: Float
    var load: Float
    
    mutating func Windows(_ acion: String) {
        switch acion {
        case "open": if self.windows != .open {self.windows = .open}
        case "close": if self.windows != .close {self.windows = .close}
        default: break
        }
    }
    
    mutating func Engine (_ acion: String) {
        switch acion {
        case "start": if self.engine != .on {self.engine = .on}
        case "stop": if self.engine != .off { self.engine = .off}
        default: break
        }
    }
    
    mutating func Load (_ weight: Float) {
        self.load += weight
        if self.load > self.trunkcapacity {self.load = self.trunkcapacity}
        if self.load <= 0 {self.load = 0}
    }
}



var passcar = Car(name: .renault_logan, year: 2017, engine: .off, windows: .close, trunkcapacity: 450, load: 100)
var truck = Car(name: .peugeot_boxer, year: 2019, engine: .off, windows: .close, trunkcapacity: 1500, load: 50)

passcar.Windows("open"); passcar.Engine("start"); passcar.Load(-300)
truck.Windows ("open"); truck.Engine ("start"); truck.Load(3000)

print (passcar)
print (truck)
