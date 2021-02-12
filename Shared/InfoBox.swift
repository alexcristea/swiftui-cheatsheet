import SwiftUI

struct InfoBox: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        HStack {
            Text(LocalizedStringKey(text))
                .font(.body)
                .foregroundColor(.white)
                .padding()

            Spacer()
        }
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
    }
}

struct InfoBox_Previews: PreviewProvider {
    static var previews: some View {
        InfoBox("Hello is a very long text that has a tendency to go on the next line")
            .padding()
    }
}
