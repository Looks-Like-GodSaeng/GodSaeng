//
//  TimeTableView.swift
//  LooksLikeGodSaeng
//
//  Created by HanGyeongjun on 2023/08/06.
//

import SwiftUI

struct TimeTableView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var date: Date
    
    var body: some View {
        Text("Display detailed schedule for \(date, formatter: dateFormatter)") // Customize this view as needed
        
        // Swipe gesture handling
            .gesture(
                DragGesture()
                    .onEnded { gesture in
                        let offset = gesture.translation.width
                        if offset < -100 {
                            // Swipe to show tomorrow's schedule
                            // Update the 'date' variable with tomorrow's date
                        } else if offset > 100 {
                            // Swipe to show yesterday's schedule
                            // Update the 'date' variable with yesterday's date
                        }
                    }
            )
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
}


//struct TimeTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeTableView()
//    }
//}
