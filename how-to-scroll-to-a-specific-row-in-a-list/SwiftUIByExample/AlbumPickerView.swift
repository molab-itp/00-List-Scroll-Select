//
//  AlbumPickerView.swift
//  SwiftUIByExample
//
//  Created by jht2 on 12/18/24.
//

import SwiftUI

struct AlbumPickerView: View {
    @State var selection: Int?
    var albumNames: [String]
    
//    @EnvironmentObject var app: AppModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let _ = Self._printChanges()
        ScrollViewReader { proxy in
            VStack {
                Button("Jump to #50") {
                    proxy.scrollTo(50, anchor: .top)
                }
                Button("Jump to #1") {
                    proxy.scrollTo(1)
                }
                
                List(0..<200, id: \.self, selection: $selection)
                { index in
                    Text("Example \(index)")
                        .id(index)
                }
            }
            .onChange(of: selection) { newState in
                print("AlbumPickerView onChange", selection as Any)
                dismiss()
            }
        }
    }
}

struct AlbumPickerHost: View {
    @State var selection: Int = 0
    @State var albumNames = ["apple", "banana", "cherry"]
    var body: some View {
//        Text("Hello")
        AlbumPickerView(selection: selection, albumNames: albumNames)
    }
}
#Preview {
    AlbumPickerHost()
}
