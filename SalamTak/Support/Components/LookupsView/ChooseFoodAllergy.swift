//
//  ChooseFoodAllergy.swift
//  SalamTech
//
//  Created by Mostafa Morsy on 05/04/2022.
//

import SwiftUI

struct ChooseFoodAllergy: View {
    var language = LocalizationService.shared.language
    @StateObject var FoodAlgVM = ViewModelFoodAllergy()
    @Binding var IsPresented: Bool
    @Binding var selectedFoodAlgName : [String]
    @Binding var selectedFoodAlgId : [Int]
    @State var isTapped : Bool? = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40.0)
                .foregroundColor(.white)
                .shadow(radius: 15)
            
            VStack {
                    Capsule()
                        .frame(width: 50, height: 4)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                
                VStack {
                    Text("Food_Allergies".localized(language))
                        .font(.title2)
                        .bold()
                    ScrollView( showsIndicators: false) {
                        VStack {
                            ForEach(FoodAlgVM.publishedCountryModel,id:\.self){supspec in
                                ExtractedViewFoodAllergy( supspec: supspec, selectedServiceName: $selectedFoodAlgName, selectedServiceId: $selectedFoodAlgId)
                            }
                        }
                    }
                    
                    HStack {
                        ButtonView(text: "CompeleteProfile_Screen_ConfirmButton".localized(language), action: {
                            withAnimation(.easeIn(duration: 0.3)) {
                                print(self.selectedFoodAlgName)
                                IsPresented.toggle()
                            }
                        })
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                    Spacer()
                }
                .padding(.top,10)

                .padding(.bottom,hasNotch ? 300 : 230)

//                .frame(height: (UIScreen.main.bounds.size.height / 2) )
//                Spacer()
            }
        }
        .onAppear(perform: {
//            FoodAlgVM.startFetchFoodAllergy()
        })
//        .onDisappear{
//            FoodAlgVM.Id = selectedServiceId
//            FoodAlgVM.Name = selectedServiceName
//            medicalCreatedVM.PatientFoodAllergiesDto = FoodAlgVM.Id
//        }
        .offset(y: (UIScreen.main.bounds.size.height / 2) - 80)
    }
}

struct ChooseFoodAllergy_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFoodAllergy(IsPresented: .constant(true), selectedFoodAlgName: .constant([]), selectedFoodAlgId: .constant([]))
    }
}


struct ExtractedViewFoodAllergy: View {
    var language = LocalizationService.shared.language
    var supspec : FoodAllergy
    @Binding var selectedServiceName : [String]
    @Binding var selectedServiceId : [Int]
    @State var isTapped : Bool? = false
    
    var body: some View {
        
        Button(action: {
            isTapped?.toggle()
            
            if selectedServiceId == []{
                self.selectedServiceId.insert(supspec.id ?? 0, at: 0)
                self.selectedServiceName.insert(supspec.Name ?? "", at: 0)
            } else{
                
                if self.selectedServiceId.contains(supspec.id ?? 0) && self.selectedServiceName.contains(supspec.Name ?? "") {
                    self.selectedServiceId.removeAll(where: {$0 == supspec.id
                    })
                    self.selectedServiceName.removeAll(where: {$0 == supspec.Name
                    })
                }else{
                    self.selectedServiceId.append(supspec.id ?? 0)
                    self.selectedServiceName.append(supspec.Name ?? "")
                }
            }
        }, label: {
            if language.rawValue == "en" {
                HStack (spacing: 20 ){
                    Image(systemName: isTapped ?? false ? "checkmark.rectangle.fill": "checkmark.rectangle")
                        .foregroundColor( isTapped ?? false ? Color("blueColor") :Color("lightGray"))
                    Text(supspec.Name ?? "")
                        .font(.system(size: 20))
                        .foregroundColor( isTapped ?? false ? Color("blueColor") :Color("lightGray"))
                    
                    Spacer()
                }
                
                .padding([.top,.bottom],5)
                .padding([.leading,.trailing],10)
            } else if language.rawValue == "ar" {
                HStack (spacing: 20 ){
                    Spacer()
                    Text(supspec.Name ?? "")
                        .font(.system(size: 20))
                        .foregroundColor( isTapped ?? false ? Color("blueColor") :Color("lightGray"))
                    Image(systemName: isTapped ?? false ? "checkmark.rectangle.fill": "checkmark.rectangle")
                        .foregroundColor( isTapped ?? false ? Color("blueColor") :Color("lightGray"))
                }
                
                .padding([.top,.bottom],5)
                .padding([.leading,.trailing],10)
            }
            
        })
            .onAppear(perform: {
                for id  in selectedServiceId {
                    if supspec.id == id {
                        self.isTapped = true
                    }
                }
            })
    }
}
