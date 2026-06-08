import SwiftUI

struct PlayerNamesSheet: View {
    @Binding var nameX: String
    @Binding var nameO: String
    @Environment(\.dismiss) private var dismiss

    @State private var draftX: String = ""
    @State private var draftO: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("X")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundStyle(Color.xColor)
                            .frame(width: 24)
                        TextField("Player name", text: $draftX)
                    }
                    HStack {
                        Text("O")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundStyle(Color.oColor)
                            .frame(width: 24)
                        TextField("Player name", text: $draftO)
                    }
                } header: {
                    Text("Player Names")
                }
            }
            .navigationTitle("Edit Players")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        nameX = draftX.trimmingCharacters(in: .whitespaces).isEmpty ? "X" : draftX.trimmingCharacters(in: .whitespaces)
                        nameO = draftO.trimmingCharacters(in: .whitespaces).isEmpty ? "O" : draftO.trimmingCharacters(in: .whitespaces)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .onAppear {
                draftX = nameX
                draftO = nameO
            }
        }
    }
}
