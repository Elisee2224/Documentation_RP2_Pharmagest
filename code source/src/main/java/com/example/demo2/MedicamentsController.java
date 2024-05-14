package com.example.demo2;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MedicamentsController {


    @FXML
    private Label medicamentName;
    public Label nameLabel;

    private Scene scene;
    private Parent root;

    public void setCancelButtonOnAction(ActionEvent event) {
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.close();
    }

    public void displayName(String username) {
        nameLabel.setText(username);
    }

    public void displayMedicament(String medicament) {
        medicamentName.setText(medicament);
    }


    @FXML
    private void setDashboardButton(ActionEvent event) throws IOException {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("dashboard.fxml"));
            root = loader.load();
            DashboardController dashboardController = loader.getController();
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            scene = new Scene(root, 800, 500);
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            // Handle the exception (log or display an error message)
            e.printStackTrace();
        }
    }

}
