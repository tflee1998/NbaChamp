//
//  Feedback.swift
//  Ios3
//
//  Created by User08 on 2019/11/11.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct Feedback: View {
    @State var name=""
    @State var selectChamp=0
    @State var Point=0.0
    let champs = ["Lakers","Warriors","Cleveland","Spurs","Raptors"]
    var body: some View {
       VStack
        {
           
            Form{
                TextField("Name",text: $name)
            
            Picker("選擇最喜愛的冠軍球隊", selection: self.$selectChamp) {
                
                ForEach(self.champs, id: \.self) { (champ) in
                    Text(champ)
                }
            }.pickerStyle(WheelPickerStyle())
                PointSlider(Point:$Point)
            }
            if Point>=5
            {
                Image("thankyou")
            }
            else if Point>=1 && Point < 5
            {
                Image("sorry")
            }
        }
    }
}

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        Feedback()
    }
}
struct PointSlider: View {
    
    @Binding var Point: Double
    
    var body: some View {
        HStack {
            Text("App 滿意度")
            Slider(value: self.$Point, in: 0...10,step: 1, minimumValueLabel: Image(systemName: "star.fill").imageScale(.small), maximumValueLabel: Image(systemName: "star.fill").imageScale(.large)) {
                Text("")
            }
        }
    }
}
