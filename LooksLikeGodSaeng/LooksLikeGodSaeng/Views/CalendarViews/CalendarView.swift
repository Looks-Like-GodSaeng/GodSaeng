//
//  CalendarView.swift
//  LooksLikeGodSaeng
//
//  Created by HanGyeongjun on 2023/07/23.
//

import SwiftUI

struct CalendarView: View {
    @State var stack = NavigationPath()
    
    @State var month: Date
    @State var offset: CGSize = CGSize()
    @State var clickedDates: Set<Date> = []
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                headerSection
                calendarSection
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.offset = gesture.translation
                    }
                    .onEnded { gesture in
                        if gesture.translation.height < -100 {
                            changeMonth(by: 1)
                        } else if gesture.translation.height > 100 {
                            changeMonth(by: -1)
                        }
                        self.offset = CGSize()
                    }
            )
        }
    }
    
    //MARK: - headerSection
    var headerSection: some View {
        VStack(alignment: .leading, spacing: 22) {
            HStack(alignment: .center) {
                Image("godSaengLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 28)
                Spacer()
                Button {
                    //button action
                    //move to SettingView
                } label: {
                    Image(systemName: "gearshape.fill")
                        .godSaengTitle2Medium()
                        .foregroundStyle(Color.godSaengPrimary)
                }
            }
            .frame(height: 42)
            Text(month, formatter: Self.dateFormatterMonthDisplay)
                .godSaengTitle1Heavy()
                .foregroundStyle(Color.godSaengWhite)
                .onTapGesture(count: 2) {
                    let calendar = Calendar.current
                    let today = Date()
                    let todayComponents = calendar.dateComponents([.year, .month], from: today)
                    
                    if let todayMonth = calendar.date(from: todayComponents) {
                        self.month = todayMonth
                    }
                }
        }
        .padding(.horizontal, 16)
        .background(Color.gray8)
    }
    //MARK: - calendarSection
    var calendarSection: some View {
        ZStack(alignment: .top) {
            //MARK: - 캘린더 Grid
            calendarGrid
                .padding(.top, 44)

            //MARK: - 요일 표시 HStack
            HStack(alignment: .center, spacing: 8) {
                ForEach(Self.weekdaySymbols, id: \.self) { weekday in
                    Text(weekday)
                        .godSaengSubtextRegular()
                        .foregroundStyle(Color.godSaengWhite)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(.top, 12)
            .padding(.bottom, 16)
            .background(
                LinearGradient(
                    stops: [Gradient.Stop(color: Color.godSaengBackground, location: 0.74),
                            Gradient.Stop(color: Color.godSaengBackground.opacity(0), location: 1.00)],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
        }
        .padding(.horizontal, 16)
        .background(Color.godSaengBackground)
    }
    //MARK: - calendarGrid
    private var calendarGrid: some View {
        let daysInMonth: Int = numberOfDays(in: month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
        
        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(Color.clear)
                    } else {
                        let date = getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        let clicked = clickedDates.contains(date)
                        CalendarDateCell(day: day, statusSelection: clicked, isToday: false)
                            .onTapGesture {
                                if clicked {
                                    clickedDates.remove(date)
                                } else {
                                    clickedDates.insert(date)
                                }
                            }
                    }
                }
            }
            Spacer()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(month: Date())
    }
}
