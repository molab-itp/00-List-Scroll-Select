//
// From SwiftUI by Example by Paul Hudson (@twostraws)
// https://www.hackingwithswift.com/quick-start/swiftui
// License: https://www.hackingwithswift.com/license
//

import SwiftUI

struct ContentView: View {
    @State var selection : Int?
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                HStack() {
                    Button("#0") {
                        proxy.scrollTo(0)
                    }
                    Button("#99") {
//                        proxy.scrollTo(99, anchor: .top)
                        proxy.scrollTo(99)
                    }
                    Button("Selection") {
                        if let index = selection {
                            proxy.scrollTo(index, anchor: .top)
                        }
                    }

                }
                List(0..<200, id: \.self, selection: $selection) 
                { index in
                    Text("Example \(index)")
                    .id(index)
                }
                .onChange(of: selection) {
                    print("selection", selection as Any)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
