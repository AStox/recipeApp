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
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.num ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            denominator *= recipeServings
            
            numerator *= targetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if numerator > denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        return portion
    }
    
    func addRecipe() {
//        recipes.append(Recipe(name: "burger", cuisine: "American"))
    }
}
