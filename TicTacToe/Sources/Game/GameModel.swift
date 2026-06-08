import Foundation

enum Player: String {
    case x = "X"
    case o = "O"

    var next: Player { self == .x ? .o : .x }
}

enum GameState {
    case playing
    case won(Player)
    case draw
}

class GameModel: ObservableObject {
    @Published private(set) var board: [Player?] = Array(repeating: nil, count: 9)
    @Published private(set) var currentPlayer: Player = .x
    @Published private(set) var state: GameState = .playing
    @Published private(set) var winningCells: Set<Int> = []
    @Published var scoreX: Int = 0
    @Published var scoreO: Int = 0
    @Published var nameX: String = "X"
    @Published var nameO: String = "O"

    func name(for player: Player) -> String {
        player == .x ? nameX : nameO
    }

    private let winPatterns: [[Int]] = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    func tap(cell: Int) {
        guard board[cell] == nil, case .playing = state else { return }
        board[cell] = currentPlayer
        if let pattern = winPattern(for: currentPlayer) {
            winningCells = Set(pattern)
            state = .won(currentPlayer)
            if currentPlayer == .x { scoreX += 1 } else { scoreO += 1 }
        } else if board.allSatisfy({ $0 != nil }) {
            state = .draw
        } else {
            currentPlayer = currentPlayer.next
        }
    }

    func reset() {
        board = Array(repeating: nil, count: 9)
        currentPlayer = currentPlayer == .x ? .o : .x  // alternate who goes first
        state = .playing
        winningCells = []
    }

    func resetAll() {
        scoreX = 0
        scoreO = 0
        board = Array(repeating: nil, count: 9)
        currentPlayer = .x
        state = .playing
        winningCells = []
    }

    private func winPattern(for player: Player) -> [Int]? {
        winPatterns.first { pattern in
            pattern.allSatisfy { board[$0] == player }
        }
    }
}
