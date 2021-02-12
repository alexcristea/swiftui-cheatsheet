import SwiftUI

struct TextTopicView: View {
    
    static func make() -> AnyView {
        AnyView(erasing: self.init())
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            InfoBox("Show case the system fonts large to small.")
            VStack(alignment: .leading) {
                Text("Large title")
                    .font(.largeTitle)
                Text("Title")
                    .font(.title)
                Text("Title 2")
                    .font(.title2)
                Text("Title 3")
                    .font(.title3)
                Divider()
            }
            VStack(alignment: .leading) {
                Text("Headline")
                    .font(.headline)
                Text("Subheadline")
                    .font(.subheadline)
                Divider()
            }
            VStack(alignment: .leading) {
                Text("Body")
                    .font(.body)
                Text("Callout")
                    .font(.callout)
                Text("Caption")
                    .font(.caption)
                Text("Caption 2")
                    .font(.caption2)
                Text("Footnote")
                    .font(.footnote)
            }
            Spacer()
        }
        .padding()
    }
}

struct TextTopicView_Previews: PreviewProvider {
    static var previews: some View {
        TextTopicView()
    }
}
