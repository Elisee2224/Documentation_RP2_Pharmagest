package com.example.demo2;


import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DashboardController {

    @FXML
    public Label nameLabel;

    @FXML
    private Button cancelButton;


    private Stage stage;
    private Scene scene;
    private Parent root;

    public void displayName(String username) {
        nameLabel.setText("Bienvenue : " + username);
    }

    @FXML
    private void setCancelButtonOnAction(ActionEvent event) {
        Stage stage = (Stage) cancelButton.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void setMedicamentsButton(ActionEvent event) {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("medicaments.fxml"));
        try {
            root = loader.load();

            MedicamentsController medicamentsController = loader.getController();
            medicamentsController.displayName(nameLabel.getText());
            stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            scene = new Scene(root, 800, 500);
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to load medicaments.fxml");
        }
    }

    @FXML
    private void setVenteButton(ActionEvent event) {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("vente.fxml"));
        try {
            root = loader.load();

            VenteController venteController = loader.getController();
            stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            scene = new Scene(root, 800, 500);
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to load vente.fxml");
        }
    }

    @FXML
    private void setCrudButton(ActionEvent event) {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("EmployeeView.fxml"));
        try {
            root = loader.load();
            UserAccountController userAccountController = loader.getController();
            stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            scene = new Scene(root, 800, 500);
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to load EmployeeView.fxml");
        }
    }
}

