//
//  faqs.swift
//  CityInformation
//
//  Created by Anam Khan on 08/03/19.
//  Copyright © 2019 UCC. All rights reserved.
//

import Foundation
class faqs{
    let faqsData : [faq] = [
      faq(question: "Things to do in London", answer: "Visit the tower bridge"),
      faq(question: "Things to do in Paris", answer: "Visit the tower bridge"),
      faq(question: "Things to do in Stockholm", answer: "Visit the tower bridge"),
      faq(question: "Things to do in Venice", answer: "Visit the tower bridge"),
      faq(question: "Things to do in Prague", answer: "Visit the tower bridge"),
      faq(question: "Things to do in Budapest", answer: "Visit the tower bridge"),
      faq(question: "Things to do in Barcelona", answer: "Visit the tower bridge"),
    ]
    
    
    func count()->Int{return faqsData.count}
    func faqData(index:Int)->faq{return faqsData[index]}
}
