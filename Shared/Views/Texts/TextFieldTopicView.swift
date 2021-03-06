import SwiftUI

struct TextFieldTopicView: View {
    @State var username = ""
    @State var isEditing = false

    @State private var nameComponents = PersonNameComponents()
    let nameFormatter = PersonNameComponentsFormatter()

    static func make() -> AnyView {
        AnyView(erasing: self.init())
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Plain text field")
                    .font(.headline)
                TextField("Enter your username", text: $username)
                    .textFieldStyle(PlainTextFieldStyle())

            }
            VStack {
                Text("Round text field")
                    .font(.headline)
                TextField("Enter your username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack {
                Text("Custom text field")
                    .font(.headline)
                TextField("Enter your username", text: $username) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {

                }
                .padding(.all, 10)

                //                .autocapitalization(.none)e
                .disableAutocorrection(true)
                .border(Color.secondary)
                .background(isEditing ? Color.yellow.opacity(0.25) : Color.clear)

                Text(username)
                    .foregroundColor(.secondary)
                    .font(.footnote)

            }
            VStack {
                Text("Formatted text field")
                    .font(.headline)
                TextField("Enter your name", value: $nameComponents, formatter: nameFormatter)
                    .padding(.all, 10)
                    .border(Color.secondary)

                Text(nameComponents.debugDescription)
                    .foregroundColor(.secondary)
                    .font(.footnote)

            }
            Spacer()
        }
        .padding()
    }
}

struct TextFieldTopicView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextFieldTopicView()
                .navigationTitle("Texts")
                
        }
    }
}
