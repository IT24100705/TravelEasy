package com.packagemanagement;

import java.util.ArrayList;
import java.util.List;

public class PackageBST {
    private PackageNode root;

    public PackageBST() {
        this.root = null;
    }

    // Insert a package
    public void insert(TravelPackage pkg) {
        root = insertRec(root, pkg);
    }

    private PackageNode insertRec(PackageNode node, TravelPackage pkg) {
        if (node == null) {
            return new PackageNode(pkg);
        }

        int cmp = pkg.getPackageId().compareTo(node.travelPackage.getPackageId());
        if (cmp < 0) {
            node.leftChild = insertRec(node.leftChild, pkg);
        } else if (cmp > 0) {
            node.rightChild = insertRec(node.rightChild, pkg);
        }
        return node;
    }

    // Search by ID
    public TravelPackage searchById(String id) {
        return searchRec(root, id);
    }

    private TravelPackage searchRec(PackageNode node, String id) {
        if (node == null) return null;

        int cmp = id.compareTo(node.travelPackage.getPackageId());
        if (cmp == 0) {
            return node.travelPackage;
        } else if (cmp < 0) {
            return searchRec(node.leftChild, id);
        } else {
            return searchRec(node.rightChild, id);
        }
    }

    // In-order traversal
    public List<TravelPackage> inOrder() {
        List<TravelPackage> result = new ArrayList<>();
        inOrderRec(root, result);
        return result;
    }

    private void inOrderRec(PackageNode node, List<TravelPackage> result) {
        if (node != null) {
            inOrderRec(node.leftChild, result);
            result.add(node.travelPackage);
            inOrderRec(node.rightChild, result);
        }
    }

    // Pre-order traversal
    public List<TravelPackage> preOrder() {
        List<TravelPackage> result = new ArrayList<>();
        preOrderRec(root, result);
        return result;
    }

    private void preOrderRec(PackageNode node, List<TravelPackage> result) {
        if (node != null) {
            result.add(node.travelPackage);
            preOrderRec(node.leftChild, result);
            preOrderRec(node.rightChild, result);
        }
    }

    // Post-order traversal
    public List<TravelPackage> postOrder() {
        List<TravelPackage> result = new ArrayList<>();
        postOrderRec(root, result);
        return result;
    }

    private void postOrderRec(PackageNode node, List<TravelPackage> result) {
        if (node != null) {
            postOrderRec(node.leftChild, result);
            postOrderRec(node.rightChild, result);
            result.add(node.travelPackage);
        }
    }

    // Delete a node by ID
    public boolean delete(String id) {
        if (searchById(id) == null) return false; // ID not found
        root = deleteRec(root, id);
        return true;
    }

    private PackageNode deleteRec(PackageNode node, String id) {
        if (node == null) return null;

        int cmp = id.compareTo(node.travelPackage.getPackageId());

        if (cmp < 0) {
            node.leftChild = deleteRec(node.leftChild, id);
        } else if (cmp > 0) {
            node.rightChild = deleteRec(node.rightChild, id);
        } else {
            // Found node to delete
            if (node.leftChild == null) return node.rightChild;
            if (node.rightChild == null) return node.leftChild;

            // Node with two children: Get inorder successor
            PackageNode minNode = findMin(node.rightChild);
            node.travelPackage = minNode.travelPackage;
            node.rightChild = deleteRec(node.rightChild, minNode.travelPackage.getPackageId());
        }

        return node;
    }

    private PackageNode findMin(PackageNode node) {
        while (node.leftChild != null) node = node.leftChild;
        return node;
    }
}
