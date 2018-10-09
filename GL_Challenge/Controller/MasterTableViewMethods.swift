//
//  MasterTableViewMethods.swift
//  GL_Challenge
//
//  Created by Luciano Schillagi on 08/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

/* Abstract:
Métodos asociados al funcionamiento de la tabla.
*/

//*****************************************************************
// MARK: - Table View Data Source Methods
//*****************************************************************

extension MasterViewController: UITableViewDataSource {
	
	// task: determinar la cantidad de filas que tendrá la tabla
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return laptopArray.count }
	
	// task: configurar la celda
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let preImage = UIImage(named: "preImage")
		let cellReuseId = "cell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
		laptop = laptopArray[(indexPath as NSIndexPath).row]
		cell.imageView?.image = preImage
		cell.textLabel?.text = laptop?.title
		cell.detailTextLabel?.text = laptop?.description
		
		// get laptop image
		if (laptop?.imageUrl) != nil {
			
			let _ = LaptopApiClient.getLaptopImages((laptop?.imageUrl)!) { (imageData, error) in
				
				if let image = UIImage(data: imageData!) {
					DispatchQueue.main.async {
						cell.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
						cell.imageView!.image = image
					}
				} else {
					print(error ?? "empty error")
				}
			}
			
		} // end get laptop image
		
		return cell
	}
	
}

//*****************************************************************
// MARK: - Table View Delegate Methods
//*****************************************************************

extension MasterViewController: UITableViewDelegate {
	
	// task: navegar hacia el detalle de la laptop según la fila seleccionada
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyboardId = "Detail"
		let controller = storyboard!.instantiateViewController(withIdentifier: storyboardId) as! DetailViewController
		controller.selectedLaptop = laptopArray[(indexPath as NSIndexPath).row]
		navigationController!.pushViewController(controller, animated: true)
	}
	
}
