//
//  View+UIFont.swift
//  LooksLikeGodSaeng
//
//  Created by HanGyeongjun on 2023/08/21.
//

import SwiftUI

extension View {
    //MARK: - Titles
    func godSaengTitle1Heavy() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengTitle1Heavy, lineHeight: 38))
    }
    func godSaengTitle2Bold() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengTitle2Bold, lineHeight: 32))
    }
    func godSaengTitle2Medium() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengTitle2Medium, lineHeight: 32))
    }
    func godSaengSubtitleBold() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengSubtitleBold, lineHeight: 28))
    }
    func godSaengSubtitleMedium() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengSubtitleMedium, lineHeight: 28))
    }
    
    //MARK: - Bodies
    func godSaengBody1Bold() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengBody1Bold, lineHeight: 22))
    }
    func godSaengBody1Medium() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengBody1Medium, lineHeight: 22))
    }
    func godSaengBody1Regular() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengBody1Regular, lineHeight: 22))
    }
    func godSaengBody2Heavy() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengBody2Heavy, lineHeight: 20))
    }
    func godSaengBody2Bold() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengBody2Bold, lineHeight: 20))
    }
    func godSaengBody2Medium() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengBody2Medium, lineHeight: 20))
    }
    func godSaengBody2Regular() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengBody2Regular, lineHeight: 20))
    }
    
    //MARK: - Sub
    func godSaengSubtextBold() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengSubtextBold, lineHeight: 18))
    }
    func godSaengSubtextMedium() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengSubtextMedium, lineHeight: 18))
    }
    func godSaengSubtextRegular() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .godSaengSubtextRegular, lineHeight: 18))
    }
}

//MARK: - View Modifier
//폰트 줄 간격 설정을 위한 View Modifier
struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}
