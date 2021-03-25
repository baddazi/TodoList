import  SwiftUI

struct Throw {
    var handleError: (Error) -> () = { error in
        print(error)
    }
}

extension Throw: EnvironmentKey {
    static var defaultValue: Self = .init()
   
    func `try`(_ work: () throws -> Void) {
        do {
            try work()
        } catch {
            handleError(error)
        }
    }
        
    func callAsFunction(_ error: Error) {
        handleError(error)
    }
}
