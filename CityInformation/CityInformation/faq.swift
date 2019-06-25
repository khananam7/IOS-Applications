//
//  faq.swift
//  CityInformation
//
//  Created by Anam Khan on 08/03/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import Foundation
class faq{
    
    var question    : String
    var answer   : String
    
    init(){
        
        self.question = "Things to do in Paris?"
        self.answer = "Visit Clubs"
    }
    init(question:String,answer:String){
        
        self.question = question
        self.answer = answer
       
    }
    
    //methods
    func setQuestion(question:String){self.question = question}
    func getQuestion()->String{return self.question}
    
    func setAnswer(answer:String){self.answer = answer}
    func getAnswer()->String{return self.answer}
}
