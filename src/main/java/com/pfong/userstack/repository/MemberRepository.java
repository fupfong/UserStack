package com.pfong.userstack.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.pfong.userstack.dto.MemberReq;
import com.pfong.userstack.fiflter.ResourceNotFoundException;

@Repository
public class MemberRepository implements IOperation<MemberReq, String> {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<MemberReq> rowMapper = new RowMapper<MemberReq>() {
        @Override
        public MemberReq mapRow(ResultSet rs, int rowNum) throws SQLException {
            MemberReq member = new MemberReq();
            member.setMemberID(rs.getString("memberID"));
            member.setAccount(rs.getString("account"));
            member.setPassword(rs.getString("password"));
            member.setUsername(rs.getString("username"));
            member.setEmail(rs.getString("email"));
            if (rs.getTimestamp("createTime") != null) {
                member.setCreateTime(rs.getTimestamp("createTime").toLocalDateTime());
            }
            return member;
        }
    };

    @Override
    public List<MemberReq> findAll() throws DataAccessException {
        String sql = "SELECT * FROM member";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public MemberReq findById(String account) throws DataAccessException {
        String sql = "SELECT * FROM member WHERE account = ?";
        return jdbcTemplate.query(sql, rowMapper, account).stream().findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("查無此會員帳號：" + account));
    }

    @Override
    public String add(MemberReq entity) throws DataAccessException {
        String sql = "{call sp_CreateMember(?, ?, ?, ?, ?)}";
        return jdbcTemplate.execute(sql, (CallableStatementCallback<String>) cs -> {
            cs.setString(1, entity.getAccount());
            cs.setString(2, entity.getPassword());
            cs.setString(3, entity.getUsername());
            cs.setString(4, entity.getEmail());
            cs.registerOutParameter(5, java.sql.Types.CHAR);
            cs.execute();
            return cs.getString(5);
        });
    }

    @Override
    public boolean update(MemberReq entity, String key) throws DataAccessException {
        String sql = "UPDATE member SET password = ?, username = ?, email = ? WHERE account = ?";
        int rows = jdbcTemplate.update(sql, entity.getPassword(), entity.getUsername(), entity.getEmail(), key);
        return rows > 0;
    }

    @Override
    public boolean delete(String key) throws DataAccessException {
        String sql = "DELETE FROM member WHERE account = ?";
        int rows = jdbcTemplate.update(sql, key);
        return rows > 0;
    }
}
