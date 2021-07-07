//
//  RecipeModel.swift
//  recipe
//
//  Created by Stox on 2021-07-06.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        self.recipes = DataService.getLocalData()
    }
    
    func addRecipe() {
//        recipes.append(Recipe(name: "burger", cuisine: "American"))
    }
}
