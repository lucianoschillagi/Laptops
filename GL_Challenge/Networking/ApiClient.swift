//
//  ApiClient.swift
//  GL_Challenge
//
//  Created by Luciano Schillagi on 08/10/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation
import Alamofire

/* Abstract
Un objeto que contiene los métodos para interactuar con la API.
*/

class LaptopApiClient: NSObject {
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	override init() { super.init() }
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// shared session
	var session = URLSession.shared
	
	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************
	
	/*
	1- Get Laptops
	2- Get Laptop Images
	*/
	
	/// Get Laptops
	// task: obtener una serie de laptops
	static func getLaptops(completionHandlerForGetLaptops: @escaping (_ success: Bool, _ result: [Laptop]?, _ error: String?) -> Void)  {
		
		let laptopEndpoint = LaptopApiClient.Constants.EndPoint
		
		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request(laptopEndpoint).responseJSON { response in
			
			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForGetLaptops(false, nil, errorMessage)
				}
			}
			// end response status code
			
			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'jsonObjectResult' 📦 */
			if let jsonObjectResult: Any = response.result.value {
				_ = jsonObjectResult as! [[String:AnyObject]]
				let resultLaptops = Laptop.laptopFromResults(jsonObjectResult as! [[String: AnyObject]])
				completionHandlerForGetLaptops(true, resultLaptops, nil)
			}
		}
	}
	
	/// Get Images
	// task: obtener las imágenes de las laptops
	static func getLaptopImages(_ imageUrl: String, _ completionHandlerForLaptopImage: @escaping ( _ imageData: Data?, _ error: String?) -> Void) {

		/* 1. 📞 Realiza la llamada a la API, a través de la función request() de Alamofire 🚀 */
		Alamofire.request(imageUrl).responseData { response in

			// response status code
			if let status = response.response?.statusCode {
				switch(status){
				case 200:
					print("example success")
				default:
					let errorMessage = "error with response status: \(status)"
					completionHandlerForLaptopImage(nil, errorMessage)
				}
			}
			// end status response

			/* 2. Almacena la respuesta del servidor (response.result.value) en la constante 'dataObjectResult' 📦 */
			if let dataObjectResult: Any = response.result.value {

				let dataObjectResult = dataObjectResult as! Data
				completionHandlerForLaptopImage(dataObjectResult, nil)
			}
		}
	}
	
	
} // end class
