package com.example.demo2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class FournisseurDAO {

    private Connection connection;

    public FournisseurDAO() {
        this.connection = DatabaseConnection.dbConnect();
    }

    public void addFournisseur(Fournisseur fournisseur) throws SQLException {
        String query = "INSERT INTO Fournisseur (nom_fournisseur, prenom_fournisseur, adresse_fournisseur, tel_fournisseur, email_fournisseur) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, fournisseur.getNomFournisseur());
            statement.setString(2, fournisseur.getPrenomFournisseur());
            statement.setString(3, fournisseur.getAdresseFournisseur());
            statement.setString(4, fournisseur.getTelFournisseur());
            statement.setString(5, fournisseur.getEmailFournisseur());
            statement.executeUpdate();
        }
    }

    public List<Fournisseur> getAllFournisseurs() throws SQLException {
        List<Fournisseur> fournisseurs = new ArrayList<>();
        String query = "SELECT * FROM Fournisseur";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Fournisseur fournisseur = new Fournisseur();
                fournisseur.setIdFournisseur(resultSet.getInt("id_fournisseur"));
                fournisseur.setNomFournisseur(resultSet.getString("nom_fournisseur"));
                fournisseur.setPrenomFournisseur(resultSet.getString("prenom_fournisseur"));
                fournisseur.setAdresseFournisseur(resultSet.getString("adresse_fournisseur"));
                fournisseur.setTelFournisseur(resultSet.getString("tel_fournisseur"));
                fournisseur.setEmailFournisseur(resultSet.getString("email_fournisseur"));
                fournisseurs.add(fournisseur);
            }
        }
        return fournisseurs;
    }

    // Implement other CRUD operations (update, delete) as needed

}
