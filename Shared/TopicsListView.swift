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
    var destination: AnyView?
    
    init(_ title: String, icon: String, children: [Topic]? = nil, destination: AnyView? = nil){
        
        self.title = title
        self.icon = icon
        self.children = children
        self.destination = destination
        
    }
}

struct TopicLinkView: View {
    
    var topic: Topic
    
    var body: some View {
        if let destination = topic.destination {
            NavigationLink(destination: destination) {
                Label(topic.title, systemImage: topic.icon)
            }
        } else {
            Label(topic.title, systemImage: topic.icon)
        }
    }
}

struct TopicsListView: View {
    @State var viewStyle = ViewStyle.list

    var topics = [
        Topic(
            "Texts", icon: "textformat.abc",
            children: [
                Topic("Text", icon: "textformat.abc", destination: TextTopicView.make()),
                Topic("Text Field", icon: "textbox"),
                Topic("Text Editor", icon: "text.cursor"),
                Topic("Secure Field", icon: "rectangle.and.pencil.and.ellipsis"),
            ]),
        Topic("Images", icon: "photo"),
        Topic(
            "Buttons", icon: "plus.app.fill",
            children: [
                Topic("Button", icon: "plus.app"),
                Topic("Edit Button", icon: "square.and.pencil"),
                Topic("Paste Button", icon: "doc.on.clipboard.fill"),
            ]),
        Topic(
            "Controls", icon: "gamecontroller.fill",
            children: [
                Topic("Menu", icon: "filemenu.and.selection"),
                Topic("Link", icon: "link"),
                Topic("Navigation Link", icon: "link.icloud.fill"),
            ]),
        Topic(
            "Value Selectors", icon: "hand.point.up.braille.fill",
            children: [
                Topic("Toggle", icon: "switch.2"),
                Topic("Picker", icon: "filemenu.and.cursorarrow"),
                Topic("Date Picker", icon: "calendar"),
                Topic("Slider", icon: "slider.horizontal.3"),
                Topic("Stepper", icon: "minus.slash.plus"),
                Topic("Color Picker", icon: "eyedropper.halffull"),
            ]),
        Topic(
            "Value Indicator", icon: "location",
            children: [
                Topic("Label", icon: "tag.fill"),
                Topic("Progress View", icon: "percent"),
                Topic("Gauge", icon: "gauge"),
            ]),
    ]

    var body: some View {
        NavigationView {
            #if os(macOS)
                List(topics, children: \.children) { topic in
                    TopicLinkView(topic: topic)
                }
                .listStyle(SidebarListStyle())
                .navigationTitle("Cheatsheet")

            #else
                List(topics, children: \.children) { topic in
                    TopicLinkView(topic: topic)
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Cheatsheet")
            #endif

        }
    }
}

struct TopicsListView_Previews: PreviewProvider {
    static var previews: some View {
        TopicsListView()
    }
}
