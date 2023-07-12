//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by User on 22/06/2023.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()

    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle().strokeBorder(lineWidth: 24, antialiased: true)
                HStack {
                    Text("Speaker of 3")
                    Spacer()
                    Button(action:{}) {
                        Image(systemName: "forward.fill")
                    }
                }
            }
                
            
        }
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
        .padding()
        
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
