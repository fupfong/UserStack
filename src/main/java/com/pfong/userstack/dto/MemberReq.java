package com.pfong.userstack.dto;

import java.time.LocalDateTime;

public class MemberReq {
    private String memberID;
    private String account;
    private String password;
    private String username;
    private String email;
    private LocalDateTime createTime;

    public MemberReq() {
    }

    public MemberReq(String memberID, String account, String password, String username, String email,
            LocalDateTime createTime) {
        this.memberID = memberID;
        this.account = account;
        this.password = password;
        this.username = username;
        this.email = email;
        this.createTime = createTime;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "MemberReq{" +
                "memberID='" + memberID + '\'' +
                ", account='" + account + '\'' +
                ", password='[PROTECTED]'" +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
