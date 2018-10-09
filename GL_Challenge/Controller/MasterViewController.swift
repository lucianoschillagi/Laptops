//
//  MasterViewController.swift
//  GL_Challenge
//
//  Created by Luciano Schillagi on 08/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
La pantalla inicial que muestra un listado de laptops.
*/

class MasterViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// Model
	var laptop: Laptop?
	var laptopArray = [Laptop]()
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var laptopTableView: UITableView!
	@IBOutlet weak var networkActivitiy: UIActivityIndicatorView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// setup UI elements
		navigationItem.title = "Laptops"
		// networking
		networkingRequest()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	//*****************************************************************
	// MARK: - Netwoking Methods
	//*****************************************************************
	
	// task: solicita el listado de laptops a la API
	func networkingRequest() {
		
		// Networking ⬇ : Laptops
		LaptopApiClient.getLaptops { (success, resultLaptops, error) in
			
			DispatchQueue.main.async {
				
				if success {
					// comprueba si el 'resultLaptops' recibido contiene algún valor
					if let resultLaptops = resultLaptops {
						self.laptopArray = resultLaptops // 🔌 👏
						debugPrint("😅\(resultLaptops)")
						self.networkActivitiy.stopAnimating()
						self.laptopTableView.reloadData()
					}
					
				} else {
					// si devuelve un error
					self.displayAlertView("Error Request", error)
				}
			}
		}
	}
	
	
	//*****************************************************************
	// MARK: - Alert View
	//*****************************************************************
	
	/**
	Muestra al usuario un mensaje acerca de porqué la solicitud falló.
	
	- Parameter title: El título del error.
	- Parameter message: El mensaje acerca del error.
	
	*/
	func displayAlertView(_ title: String?, _ error: String?) {
		
		// si ocurre un error en la solicitud, mostrar una vista de alerta!
		if error != nil {
			
			let alertController = UIAlertController(title: title, message: error, preferredStyle: .alert)
			let OKAction = UIAlertAction(title: "OK", style: .default) { action in
				
			}
			
			alertController.addAction(OKAction)
			self.present(alertController, animated: true) {}
		}
	}


} // end class





