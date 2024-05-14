package com.example.demo2;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class HelloApplication extends Application {
    @Override
    public void start(Stage primarystage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("hello-view.fxml"));
        primarystage.initStyle(StageStyle.UNDECORATED);
        primarystage.setScene(new Scene(root, 800, 500));
        primarystage.show();
    }

    public static void main(String[] args) {
        launch();
    }

}
