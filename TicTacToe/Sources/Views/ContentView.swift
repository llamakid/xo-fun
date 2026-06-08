import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameModel()
    @State private var showResetAlert = false
    @State private var showWinOverlay = false
    @State private var showNameEdit = false
    @State private var adHeight: CGFloat = 50

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("XO Fun")
                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                Spacer()
                Button {
                    showNameEdit = true
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(.secondary)
                }
                Button {
                    showResetAlert = true
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            .padding(.bottom, 16)

            // Scores
            ScoreView(game: game)
                .padding(.horizontal, 24)
                .padding(.bottom, 24)

            // Status
            StatusView(game: game)
                .padding(.bottom, 20)

            // Board
            BoardView(game: game)
                .padding(.horizontal, 16)

            Spacer()

            // Play Again button — shown when game is over
            if case .playing = game.state {} else {
                Button {
                    withAnimation(.spring(response: 0.4)) {
                        game.reset()
                    }
                } label: {
                    Text("Play Again")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color.accentColor, in: RoundedRectangle(cornerRadius: 18))
                        .padding(.horizontal, 32)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .padding(.bottom, 16)
            }

            // Ad banner placeholder
            AdBannerView(adHeight: $adHeight)
                .frame(height: adHeight)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .alert("Reset Scores?", isPresented: $showResetAlert) {
            Button("Reset", role: .destructive) { game.resetAll() }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This will clear all wins and start fresh.")
        }
        .sheet(isPresented: $showNameEdit) {
            PlayerNamesSheet(nameX: $game.nameX, nameO: $game.nameO)
        }
    }
}
