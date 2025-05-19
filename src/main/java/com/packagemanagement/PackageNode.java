package com.packagemanagement;

public class PackageNode {
    // Create the attributes.
    public TravelPackage travelPackage;
    public PackageNode leftChild, rightChild;

    // Create the constructor.
    public PackageNode(TravelPackage travelPackage) {
        this.travelPackage = travelPackage;
        this.leftChild = null;
        this.rightChild = null;
    }

    // Create the displayNode method.
    public void displayNode() {
        System.out.println(travelPackage.toString());
    }

}
