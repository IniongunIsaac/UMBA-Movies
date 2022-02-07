//
//  MoviesViewController.swift
//  UMBA Movies
//
//  Created by Isaac Iniongun on 04/02/2022.
//

import UIKit

class MoviesViewController: BaseViewController<MoviesView, IMoviesViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar(title: "Movies", font: .avenirBold(18), barTextColor: .aLabel)
    }
    

}
