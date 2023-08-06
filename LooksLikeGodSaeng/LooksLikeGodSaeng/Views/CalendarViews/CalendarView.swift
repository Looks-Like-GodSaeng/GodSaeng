//
//  CalendarView.swift
//  LooksLikeGodSaeng
//
//  Created by HanGyeongjun on 2023/07/23.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("CalendarView")
        }
        .padding()
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
