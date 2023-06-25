//
//  CustomNavBarView.swift
//  Music Player
//
//  Created by Tursunpulat Orolov on 6/22/23.
//

import SwiftUI

enum Tabs: String, CaseIterable{
    case house
    case plus
    case gearshape
}

struct CustomTabBarView: View {
    @Binding var selectedTab: Tabs
    var body: some View {
        VStack{
            HStack{
                Spacer()
                ForEach(Tabs.allCases, id: \.rawValue){ tab in
                    switch tab{
                    case .house:
                        Image(systemName: tab.rawValue + ".fill")
                            .foregroundColor(tab == selectedTab ? Color.teal : Color.black)
                            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                            .font(.system(size: 22))
                            .padding(.horizontal, 30)
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedTab = tab
                                }
                            }
                    case .plus:
                        Image(systemName: tab.rawValue + ".app.fill")
                            .foregroundColor(selectedTab == tab ? Color.teal : Color.black)
                            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                            .font(.system(size: 22))
                            .padding(.horizontal, 30)
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedTab = tab
                                }
                            }
                    case .gearshape:
                        Image(systemName: tab.rawValue + ".fill")
                            .foregroundColor(selectedTab == tab ? Color.teal : Color.black)
                            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                            .font(.system(size: 22))
                            .padding(.horizontal, 30)
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedTab = tab
                                }
                            }
                    }
                }
                Spacer()
            }
            .frame(height: 75)
            .background(.thinMaterial.opacity(0.7))
            .cornerRadius(10)
            .padding()
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(.house))
    }
}
