import SwiftUI

struct BoardView: View {
    @ObservedObject var game: GameModel

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(0..<9, id: \.self) { index in
                CellView(
                    player: game.board[index],
                    isWinning: game.winningCells.contains(index)
                )
                .aspectRatio(1, contentMode: .fit)
                .onTapGesture {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        game.tap(cell: index)
                    }
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }
            }
        }
        .padding(16)
        .background(Color(.systemGray5), in: RoundedRectangle(cornerRadius: 20))
    }
}
