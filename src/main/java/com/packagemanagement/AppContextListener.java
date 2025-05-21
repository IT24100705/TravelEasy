package com.packagemanagement;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Step 1: Get the path to the file
        String filePath = sce.getServletContext().getRealPath("/packages.txt");
        PackageFileHandler.setFilePath(filePath);

        // Step 2: Read packages from the file
        List<TravelPackage> packages = PackageFileHandler.readPackageFromFile();

        // Step 3: Create and populate the BST
        PackageBST bst = new PackageBST();
        for (TravelPackage pkg : packages) {
            bst.insert(pkg);
        }

        // Step 4: Store BST in ServletContext
        sce.getServletContext().setAttribute("packageBST", bst);
        System.out.println("[AppContextListener] Loaded " + packages.size() + " packages into BST.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Optional: Clean up resources if needed
    }
}
