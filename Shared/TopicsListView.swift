import SwiftUI

enum ViewStyle: String, CaseIterable, Identifiable {
    case list
    case outline

    var id: String { self.rawValue }
}

struct Topic: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var children: [Topic]?
}

struct TopicsListView: View {
    @State var viewStyle = ViewStyle.list

    var topics = [
        Topic(
            title: "Texts", icon: "textformat.abc",
            children: [
                Topic(title: "Text", icon: "textformat.abc"),
                Topic(title: "Text Field", icon: "textbox"),
                Topic(title: "Text Editor", icon: "text.cursor"),
                Topic(title: "Secure Field", icon: "rectangle.and.pencil.and.ellipsis"),
            ]),
        Topic(title: "Images", icon: "photo"),
        Topic(title: "Buttons", icon: "plus.app.fill", children: [
            Topic(title: "Button", icon: "plus.app"),
            Topic(title: "Edit Button", icon: "square.and.pencil"),
            Topic(title: "Paste Button", icon: "doc.on.clipboard.fill")
        ]),
        Topic(title: "Controls", icon: "gamecontroller.fill", children: [
            Topic(title: "Menu", icon: "filemenu.and.selection"),
            Topic(title: "Link", icon: "link"),
            Topic(title: "Navigation Link", icon: "link.icloud.fill"),
        ]),
        Topic(title: "Value Selectors", icon: "hand.point.up.braille.fill", children: [
            Topic(title: "Toggle", icon: "switch.2"),
            Topic(title: "Picker", icon: "filemenu.and.cursorarrow"),
            Topic(title: "Date Picker", icon: "calendar"),
            Topic(title: "Slider", icon: "slider.horizontal.3"),
            Topic(title: "Stepper", icon: "minus.slash.plus"),
            Topic(title: "Color Picker", icon: "eyedropper.halffull"),
        ]),
        Topic(title: "Value Indicator", icon: "location", children: [
            Topic(title: "Label", icon: "tag.fill"),
            Topic(title: "Progress View", icon: "percent"),
            Topic(title: "Gauge", icon: "gauge"),
        ]),
    ]

    var body: some View {
        List(topics, children: \.children) { topic in
            Label(topic.title, systemImage: topic.icon)
        }
        .listStyle(SidebarListStyle())
    }
}

struct TopicsListView_Previews: PreviewProvider {
    static var previews: some View {
        TopicsListView()
    }
}
