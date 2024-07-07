//
//  SettingRowView.swift
//  Practice
//
//  Created by Ritik Raman on 04/07/24.
//

import SwiftUI

struct SettingRowView: View {
    let imagename :String
    let title: String
    let tintcolor:Color
    var body: some View {
        HStack(spacing:12){
            Image(systemName: imagename)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintcolor)
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    SettingRowView(imagename: "gear", title: "Version", tintcolor: .gray)
}
