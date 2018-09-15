//
//  ViewController.swift
//  AR My Home
//
//  Created by Denis Zubkov on 14/09/2018.
//  Copyright © 2018 Denis Zubkov. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/myHome.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    func createMyHome() {
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/myHome.scn")!
        sceneView.scene = scene
    }
    
    func loadTreeByCode() {
        // Create trunc for tree in code
        let codeTrunc = SCNNode()
        codeTrunc.name = "CodeTrunc"
        codeTrunc.position = SCNVector3(0, 1.509, 0)
        let trunc = SCNCylinder(radius: 0.1, height: 3)
        trunc.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/trunc.jpeg")
        codeTrunc.geometry = trunc
        if let lawnNode = sceneView.scene.rootNode.childNode(withName: "Lawn", recursively: true) {
            lawnNode.addChildNode(codeTrunc)
        }
        let codeCrown = SCNNode()
        codeCrown.name = "CodeCrown"
        codeCrown.position = SCNVector3(0, 1, 0)
        let crown = SCNSphere(radius: 1.5)
        trunc.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/crown02.jpeg")
        codeCrown.geometry = crown
        if let codeTruncNode = sceneView.scene.rootNode.childNode(withName: "CodeTrunc", recursively: true) {
            codeTruncNode.addChildNode(codeCrown)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
