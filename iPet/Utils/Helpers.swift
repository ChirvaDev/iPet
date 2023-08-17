//
//  Helpers.swift
//  iPet
//
//  Created by Pro on 06.07.2023.
//

import Foundation
import SwiftUI

func calculateTimeSince(data: Date) -> Int {
    let seconds = Int (-data.timeIntervalSinceNow)
    return seconds
}


extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
