//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Tiago Henrique Piantavinha on 04/04/23.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    enum FieldTextFocus: Int, Hashable {
        case username
    }
    
    @FocusState private var focusedField: FieldTextFocus?
    
    var dataRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
                    .focused($focusedField, equals: .username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notification: ").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("aqui", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                        
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dataRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }.onAppear() {
            focusedField = .username
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
