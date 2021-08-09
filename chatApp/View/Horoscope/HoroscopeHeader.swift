//
//  HoroscopeHeader.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-05.
//

import SwiftUI

struct HoroscopeHeader: View {
    var body: some View {
        VStack {
            Text("July 8, 2021")
                .font(.system(size: 20, weight: .bold))
        }
    }
}

struct HoroscopeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HoroscopeHeader()
    }
}
