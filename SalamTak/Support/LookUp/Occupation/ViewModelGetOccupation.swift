//
//  ViewModelGetCountries.swift
//  SalamTech-DR
//
//  Created by wecancity on 16/01/2022.
//

import Foundation
import Combine

class ViewModelOccupation: ObservableObject {
    
    let passthroughSubject = PassthroughSubject<String, Error>()
    let passthroughModelSubject = PassthroughSubject<BaseResponse<[Occupation]>, Error>()
    private var cancellables: Set<AnyCancellable> = []
    
    //------- output
    @Published private(set) var publishedCountryModel: [Occupation] = []
    @Published var isLoading:Bool? = false
    @Published var isAlert = false
    @Published var activeAlert: ActiveAlert = .NetworkError
    @Published var message = ""
 
    init() {
        startFetchOccupation()
        passthroughModelSubject.sink { (completion) in
        } receiveValue: { (modeldata) in
            self.publishedCountryModel = modeldata.data ?? []
        }.store(in: &cancellables)
    }
}


extension ViewModelOccupation:TargetType{
    var url: String{
        return URLs().GetOccupation
    }
    
    var method: httpMethod{
        return .Get
    }
    
    var parameter: parameterType{
        return .plainRequest
    }
    
    var header: [String : String]? {
    let header = ["Authorization":Helper.getAccessToken()]
        return header
    }
    
    
    func startFetchOccupation() {
        if Helper.isConnectedToNetwork(){
            self.isLoading = true
            
            BaseNetwork.request(Target: self, responseModel: BaseResponse<[Occupation]>.self) { [self] (success, model, err) in
                if success{
                    //case of success
                    DispatchQueue.main.async {
                        self.passthroughModelSubject.send( model!  )
                    }
                    
                }else{
                    if model != nil{
                        //case of model with error
                        message = model?.message ?? "Bad Request"
                        activeAlert = .serverError
                    }else{
                        if err == "Unauthorized"{
                            //case of Empty model (unauthorized)
                            message = "Session_expired\nlogin_again".localized(language)
                            activeAlert = .unauthorized
                        }else{
                            message = err ?? "there is an error"
                            activeAlert = .serverError
                        }
                    }
                    isAlert = true
                }
                isLoading = false
            }
            
        }else{
            //case of no internet connection
            activeAlert = .NetworkError
            message = "Check_Your_Internet_Connection".localized(language)
            isAlert = true
        }
        
    }
}
