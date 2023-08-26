//
//  CalendarDateCell.swift
//  LooksLikeGodSaeng
//
//  Created by HanGyeongjun on 2023/08/06.
//

import SwiftUI

struct CalendarDateCell: View {
    var day: Int
    var statusSelection: Bool
    
    var isToday: Bool = false
    
    init(day: Int, statusSelection: Bool, isToday: Bool) {
        self.day = day
        self.statusSelection = statusSelection
        self.isToday = isToday
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if (isToday) {
                Text("\(day)")
                    .godSaengBody1Bold()
                    .foregroundStyle(Color.godSaengPrimary)
            } else {
                Text("\(day)")
                    .godSaengBody1Medium()
                    .foregroundStyle(Color.godSaengWhite)
            }
            
            Image( statusSelection ? "iconSelectedSample" : "iconNonSelected")
                .resizable()
                .frame(width: 36, height: 36)
        }
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray6)
        .cornerRadius(8)
    }
}

struct CalendarDateCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDateCell(day: 11, statusSelection: true, isToday: false)
    }
}
