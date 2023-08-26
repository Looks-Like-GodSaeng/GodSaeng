//
//  CalendarView+Extension.swift
//  LooksLikeGodSaeng
//
//  Created by HanGyeongjun on 2023/08/23.
//

import Foundation

extension CalendarView {
//    static let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM yyyy"
//        return formatter
//    }()
    
    static let dateFormatterMonthDisplay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter
    }()
    
    static let weekdaySymbols = Calendar.current.shortWeekdaySymbols
    
    
    //TODO: 해당 Extension들 자료형 별로 분리 필요.
    /// 특정 해당 날짜
    func getDate(for day: Int) -> Date {
      return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
      let components = Calendar.current.dateComponents([.year, .month], from: month)
      return Calendar.current.date(from: components)!
    }
    
    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
      return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
      let components = Calendar.current.dateComponents([.year, .month], from: date)
      let firstDayOfMonth = Calendar.current.date(from: components)!
      
      return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    /// 월 변경
    func changeMonth(by value: Int) {
      let calendar = Calendar.current
      if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
        self.month = newMonth
      }
    }

}
