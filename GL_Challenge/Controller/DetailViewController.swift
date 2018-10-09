//
//  DetailViewController.swift
//  GL_Challenge
//
//  Created by Luciano Schillagi on 08/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
Una pantalla que muestra el detalle de la laptop seleccionada en la pantalla inicial.
*/

class DetailViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var selectedLaptop: Laptop?
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var laptopImage: UIImageView!
	@IBOutlet weak var fullDescriptionText: UITextView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************

    override func viewDidLoad() {
        super.viewDidLoad()
			
				self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = selectedLaptop?.title
				fullDescriptionText.text = selectedLaptop?.description
				getLaptopImage()
    }
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	// task: solicitar los datos de la imagen de la laptop para crear la vista
	func getLaptopImage() {
		
		if (selectedLaptop?.imageUrl) != nil {
			
			let _ = LaptopApiClient.getLaptopImages((selectedLaptop?.imageUrl)!) { (imageData, error) in
				
				if let image = UIImage(data: imageData!) {
					DispatchQueue.main.async {
						self.laptopImage.contentMode = UIView.ContentMode.scaleAspectFit
						self.laptopImage.image = image
					}
				} else {
					print(error ?? "empty error")
				}
			}
			
		}
	}

} // end class
