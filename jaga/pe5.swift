//
//  pe5.swift
//  InterviewAiGame
//
//  Created by 이한규 on 2021/08/09.
//

import SwiftUI

struct pe5: View {
    
    private var editButton: some View {
        if editMode == .inactive {
            return Button(action: {
                self.editMode = .active
                self.selection = Set<String>()
            }) {
                Text("Edit")
            }
        }
        else {
            return Button(action: {
                self.editMode = .inactive
                self.selection = Set<String>()
            }) {
                Text("Done")
            }
        }
    }
//    private var deleteButton: some View {
//        if editMode == .inactive {
//            return Button(action: {}) {
//                Image(systemName: "")
//            }
//        } else {
//            return Button(action: deleteNumbers) {
//                Image(systemName: "trash")
//            }
//        }
//    }
//    private func deleteNumbers() {
//        for id in selection {
//            if let index = numbers.lastIndex(where: { $0 == id })  {
//                numbers.remove(at: index)
//            }
//        }
//        selection = Set<String>()
//    }
    
    
    @State var numbers = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    @State var editMode = EditMode.inactive
    @State var selection = Set<String>()
    
    var body: some View {
        // 1.
        NavigationView {
            List(selection: $selection) {
                ForEach(numbers, id: \.self) { number in
                    Text(number)
                }
            }
             // 2.
            .navigationBarItems(trailing: editButton)
             // 3.
            .environment(\.editMode, self.$editMode)
        }
    }
}

struct pe5_Previews: PreviewProvider {
    static var previews: some View {
        pe5()
    }
}

