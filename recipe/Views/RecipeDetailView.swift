//
//  RecipeDetailView.swift
//  recipe
//
//  Created by Stox on 2021-07-07.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading) {
                
                Image(recipe.image).resizable().scaledToFill()
                
                // MARK: Recipe Name
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                    Picker(selection: $selectedServingSize, label: Text("")) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                    
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients").font(.headline).padding([.bottom, .top], 5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("· " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name)
                    }
                    
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading){
                    
                    Text("Directions").font(.headline).padding(.bottom, 5)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom, 5)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0]).environmentObject(RecipeModel())
    }
}
