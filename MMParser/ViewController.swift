//
//  ViewController.swift
//  MMParser
//
//  Created by Mahsa Mo on 5/6/1399 AP.
//  Copyright © 1399 Mahsa Mo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ViewModelProtocol {
  
    lazy var viewModel: ViewModel = {
          let viewModel = ViewModel()
          return viewModel
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewModelMDelegate = self
        viewModel.getCountryByCode(code: "57")
    }


    func DataReceived(result: Any) {
         print(result)
        //update view
      }
}

