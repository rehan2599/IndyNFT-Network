//
//  CalendarButtonView.swift
//  Tasks-macOS
//
//  Created by Mohammad Azam on 11/27/21.
//

import SwiftUI

struct CalendarButtonView: View {
    
    let title: String
    @Binding var showCalendar: Bool
    @State var selectedDate: Date = Date.today
    var onSelected: (Date) -> Void
    
    var body: some View {
        VStack {
            Button(title) {
                showCalendar = true
            }.popover(isPresented: $showCalendar) {
                DatePicker("Custom", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.graphical)
                    .onChange(of: selectedDate) { newValue in
                        onSelected(newValue)
                        showCalendar = false
                    }
            }
        }
    }
}

struct CalendarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarButtonView(title: "Custom", showCalendar: .constant(true), onSelected: { _ in })
    }
}
