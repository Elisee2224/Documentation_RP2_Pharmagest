package com.example.demo2;

public class Fournisseur {


        private int idFournisseur;
        private String nomFournisseur;
        private String prenomFournisseur;
        private String adresseFournisseur;
        private String telFournisseur;
        private String emailFournisseur;

        public Fournisseur() {
        }

        public Fournisseur(int idFournisseur, String nomFournisseur, String prenomFournisseur, String adresseFournisseur, String telFournisseur, String emailFournisseur) {
            this.idFournisseur = idFournisseur;
            this.nomFournisseur = nomFournisseur;
            this.prenomFournisseur = prenomFournisseur;
            this.adresseFournisseur = adresseFournisseur;
            this.telFournisseur = telFournisseur;
            this.emailFournisseur = emailFournisseur;
        }

        public int getIdFournisseur() {
            return idFournisseur;
        }

        public void setIdFournisseur(int idFournisseur) {
            this.idFournisseur = idFournisseur;
        }

        public String getNomFournisseur() {
            return nomFournisseur;
        }

        public void setNomFournisseur(String nomFournisseur) {
            this.nomFournisseur = nomFournisseur;
        }

        public String getPrenomFournisseur() {
            return prenomFournisseur;
        }

        public void setPrenomFournisseur(String prenomFournisseur) {
            this.prenomFournisseur = prenomFournisseur;
        }

        public String getAdresseFournisseur() {
            return adresseFournisseur;
        }

        public void setAdresseFournisseur(String adresseFournisseur) {
            this.adresseFournisseur = adresseFournisseur;
        }

        public String getTelFournisseur() {
            return telFournisseur;
        }

        public void setTelFournisseur(String telFournisseur) {
            this.telFournisseur = telFournisseur;
        }

        public String getEmailFournisseur() {
            return emailFournisseur;
        }

        public void setEmailFournisseur(String emailFournisseur) {
            this.emailFournisseur = emailFournisseur;
        }

        @Override
        public String toString() {
            return "Fournisseur{" +
                    "idFournisseur=" + idFournisseur +
                    ", nomFournisseur='" + nomFournisseur + '\'' +
                    ", prenomFournisseur='" + prenomFournisseur + '\'' +
                    ", adresseFournisseur='" + adresseFournisseur + '\'' +
                    ", telFournisseur='" + telFournisseur + '\'' +
                    ", emailFournisseur='" + emailFournisseur + '\'' +
                    '}';
        }
    }


