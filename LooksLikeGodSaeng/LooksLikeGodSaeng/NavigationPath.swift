//
//  NavigationPath.swift
//  LooksLikeGodSaeng
//
//  Created by HanGyeongjun on 2023/08/24.
//

import SwiftUI

struct NavigationPath {
    var currentView: AnyView? = nil
}

extension NavigationPath {
    mutating func push<Content: View>(_ view: Content) {
        currentView = AnyView(view)
    }
    
    mutating func pop() {
        currentView = nil
    }
}
