import SwiftUI

struct StatusView: View {
    @ObservedObject var game: GameModel

    var body: some View {
        Text(statusText)
            .font(.system(size: 22, weight: .semibold, design: .rounded))
            .foregroundStyle(statusColor)
            .multilineTextAlignment(.center)
            .animation(.easeInOut(duration: 0.2), value: statusText)
    }

    private var statusText: String {
        switch game.state {
        case .playing:
            return "\(game.name(for: game.currentPlayer))'s turn"
        case .won(let player):
            return "\(game.name(for: player)) wins! 🎉"
        case .draw:
            return "It's a draw!"
        }
    }

    private var statusColor: Color {
        switch game.state {
        case .playing:
            return game.currentPlayer == .x ? .xColor : .oColor
        case .won(let player):
            return player == .x ? .xColor : .oColor
        case .draw:
            return .secondary
        }
    }
}
