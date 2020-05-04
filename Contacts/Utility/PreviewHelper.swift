//
//  ViewPreviewHelper.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 05.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

enum PreviewHelper<T: View> {
    // MARK: - All
    
    static func iPhonesAll(_ preview: T) -> some View {
        return Group(content: {
            iPhone11ProMax(preview)
            iPhone11(preview)
            iPhone11Pro(preview)
            iPhone8Plus(preview)
            iPhoneSE2ndGeneration(preview)
            iPhoneSE1stGeneration(preview)
        })
    }
    
    static func iPadsAll(_ preview: T) -> some View {
        return Group(content: {
            iPadPro12_9Inch3rdGeneration(preview)
            iPadPro12_9Inch(preview)
            iPadPro10_5Inch(preview)
            iPadPro9_7Inch(preview)
        })
    }
    
    static func devicesAll(_ preview: T) -> some View {
        return Group(content: {
            iPhonesAll(preview)
            iPadsAll(preview)
        })
    }
    
    
    // MARK: - iPhone
    
    static func iPhone11ProMax(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPhone 11 Pro Max")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    static func iPhone11Pro(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPhone 11 Pro")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    static func iPhone11(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPhone 11")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    static func iPhone8Plus(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPhone 8 Plus")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    static func iPhoneSE2ndGeneration(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPhone SE (2nd generation)")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    static func iPhoneSE1stGeneration(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPhone SE (1st generation)")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    // MARK: - iPad
    
    static func iPadPro12_9Inch3rdGeneration(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (3rd generation)")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    static func iPadPro12_9Inch(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPad Pro (12.9-inch)")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    static func iPadPro10_5Inch(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPad Pro (10.5-inch)")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
    
    static func iPadPro9_7Inch(_ preview: T) -> some View {
        let previewDevice = PreviewDevice(rawValue: "iPad Pro (9.7-inch)")
        return preview.previewDevice(previewDevice).previewDisplayName(previewDevice.rawValue)
    }
}
