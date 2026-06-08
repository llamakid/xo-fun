import SwiftUI

struct CellView: View {
    let player: Player?
    let isWinning: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(backgroundColor)
                .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)

            if let player {
                Text(player.rawValue)
                    .font(.system(size: 56, weight: .bold, design: .rounded))
                    .foregroundStyle(player == .x ? Color.xColor : Color.oColor)
                    .transition(.scale.combined(with: .opacity))
            }
        }
    }

    private var backgroundColor: Color {
        if isWinning { return .winHighlight }
        return Color(.systemBackground)
    }
}
