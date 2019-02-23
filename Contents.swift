import UIKit

class Board {
    
    var limit: Int
    var queens = [Queen]()
    
    init(_ limit: Int) {
        self.limit = limit
    }
    
    func validate(row: Int, col: Int) -> Bool {
        for queen in queens {

            if queen.row == row { return false }

            if queen.col == col { return false }

            if abs(queen.row-row) == abs(queen.col-col) { return false }
        }
        return true
    }
    func lookForQueens(row: Int) {
        if queens.count < limit {
            for col in 0...limit-1 {
                if validate(row: row, col: col) {
                    let queen = Queen(row: row, col: col)
                    queens.append(queen)
                    lookForQueens( row: row+1)
                    if queens.count == limit {
                        print(output())
                    }
                    queens.removeLast()
                }
            }
        }
    }
    
 
    
    func output() -> String {
        var s = ""
        for queen in queens {
            s += "(\(queen.row),\(queen.col))"
        }
        return s
    }
}

struct Queen {
    var row: Int
    var col:  Int
}

// Implementation：
let t = Board(4)
t.lookForQueens(row: 0)
