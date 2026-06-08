import SwiftUI

struct ScoreView: View {
    @ObservedObject var game: GameModel

    var body: some View {
        HStack(spacing: 0) {
            scoreCard(label: game.nameX, score: game.scoreX, color: .xColor, isActive: isActive(.x))
            Spacer()
            scoreCard(label: game.nameO, score: game.scoreO, color: .oColor, isActive: isActive(.o))
        }
        .padding(.horizontal, 8)
    }

    private func isActive(_ player: Player) -> Bool {
        if case .playing = game.state { return game.currentPlayer == player }
        return false
    }

    private func scoreCard(label: String, score: Int, color: Color, isActive: Bool) -> some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundStyle(color)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text("\(score)")
                .font(.system(size: 42, weight: .heavy, design: .rounded))
                .foregroundStyle(.primary)
            Text("wins")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .frame(width: 110)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isActive ? color.opacity(0.12) : Color(.systemGray6))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(isActive ? color : .clear, lineWidth: 2)
                )
        )
        .scaleEffect(isActive ? 1.04 : 1.0)
        .animation(.spring(response: 0.3), value: isActive)
    }
}
