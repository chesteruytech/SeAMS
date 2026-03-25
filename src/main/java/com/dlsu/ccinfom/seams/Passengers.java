package com.dlsu.ccinfom.seams;

public class Passengers {
    public int pID, pPassport, pNumber;
    public String pLN, pFN, pUsername, pEmail, pPassword;

//    public ArrayList<Integer> pID_list = new ArrayList<>();
//    public ArrayList<Integer> pPassport_list = new ArrayList<>();
//    public ArrayList<String> pLN_list = new ArrayList<>();
//    public ArrayList<String> pFN_list = new ArrayList<>();
//    public ArrayList<Integer> pNumber_list = new ArrayList<>();
//    public ArrayList<String> pUsername_list = new ArrayList<>();
//    public ArrayList<String> pEmail_list = new ArrayList<>();
//    public ArrayList<String> pPassword_list = new ArrayList<>();

    public Passengers() {}

    public Passengers(int pID, int pPassport, int pNumber, String pLN, String pFN, String pUsername, String pEmail,
                      String pPassword) {
        this.pID = pID;
        this.pPassport = pPassport;
        this.pNumber = pNumber;
        this.pLN = pLN;
        this.pFN = pFN;
        this.pEmail = pEmail;
        this.pUsername = pUsername;
        this.pPassword = pPassword;
    }

    public int getpID() { return pID; }
    public void setpID(int pID) { this.pID = pID; }

    public int getpPassport() { return pPassport; }
    public void setpPassport(int pPassport) { this.pPassport = pPassport; }

    public int getpNumber() { return pNumber; }
    public void setpNumber(int pNumber) { this.pNumber = pNumber; }

    public String getpLN() { return pLN; }
    public void setpLN(String pLN) { this.pLN = pLN; }

    public String getpFN() { return pFN; }
    public void setpFN(String pFN) {this.pFN = pFN;}

    public String getpUsername() { return pUsername; }
    public void setpUsername(String pUsername) { this.pUsername = pUsername; }

    public String getpEmail() { return pEmail; }
    public void setpEmail(String pEmail) { this.pEmail = pEmail; }

    public String getpPassword() { return pPassword; }
    public void setpPassword(String pPassword) { this.pPassword = pPassword; }
}