package com.pfong.userstack.dto;

public class MemberResp {
    private String memberID;
    private String account;
    private String username;
    private String email;

    public MemberResp() {
    }

    public MemberResp(String memberID, String account, String username, String email) {
        this.memberID = memberID;
        this.account = account;
        this.username = username;
        this.email = email;
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "MemberResp{" +
                "memberID='" + memberID + '\'' +
                ", account='" + account + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
