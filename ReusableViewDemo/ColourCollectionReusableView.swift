//
//  ColourCollectionReusableView.swift
//  ReusableViewDemo
//
//  Created by Gillian Reynolds-Titko on 4/7/19.
//  Copyright © 2019 GRey-T-Programs. All rights reserved.
//

import UIKit
import SceneKit

class ColourCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var headerScene: SCNView!
    let scene = SCNScene(named:"Mesh update lit Wrlds demo sphere4.scn")!
    let objectName = "Mesh update lit Wrlds demo sphere4.scn"
    var blenderSphereNode = SCNNode()
    var materialSwapArray: [SCNMaterial]!
    let imageMaterial = SCNMaterial()
    var indexCounter = 0
    var returnedMaterials = [SCNMaterial]()
    
    func createBlenderSphere(){
        let scene = SCNScene(named:objectName)!
        //Lit Rendered Wrlds demo sphere; Rendered Wrlds demo sphere
        headerScene.scene = scene
        blenderSphereNode = scene.rootNode.childNode(withName: "Sphere", recursively: true)!
    }
    
    func swapInNewPosts(colors:[UIColor]){
         materialSwapArray = (blenderSphereNode.geometry?.materials)! //86 materials
        
        for color in colors {
            imageMaterial.diffuse.contents = colors[indexCounter]
            blenderSphereNode.geometry?.replaceMaterial(at: indexCounter, with: imageMaterial)
            //materialSwapArray[indexCounter] = imageMaterial
            indexCounter += 1
        }
        //print("Final array is \(materialSwapArray)") //first 4 materials are the same as the last material entered
    }
    
    func swapInNew(colors:[UIColor]){
        materialSwapArray = (blenderSphereNode.geometry?.materials)!
        let colorMaterialsArray = convert(colorArray: colors, toMaterial: imageMaterial)
        //print(colorMaterialsArray)
        for color in colorMaterialsArray {
            print("Colour being applied is: \(color)")
//            blenderSphereNode.geometry?.firstMaterial?.diffuse.contents = color
            materialSwapArray[indexCounter] = color
            //blenderSphereNode.geometry?.replaceMaterial(at: indexCounter, with: color)
            indexCounter += 1
        }
        blenderSphereNode.geometry?.materials = materialSwapArray
    }
    
    func convert(colorArray: [UIColor], toMaterial: SCNMaterial) -> [SCNMaterial] {
        
        for color in colorArray {
            //print("Colour being applied is: \(color)")
            toMaterial.diffuse.contents = color
            returnedMaterials.append(toMaterial)
        }
        print("Returned materials: \(returnedMaterials)")
        return returnedMaterials
    }
}
