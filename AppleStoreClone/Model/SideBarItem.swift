//
//  SideBarItem.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 20/11/23.
//

import Foundation
import SwiftUI

//Model for the SideBarItems
struct SideBarItem: Identifiable{
    var id = UUID()
    var text: String
    var icon: String
}
