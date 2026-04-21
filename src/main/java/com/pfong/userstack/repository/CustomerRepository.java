package com.pfong.userstack.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.pfong.userstack.dto.MemberResp;
import com.pfong.userstack.fiflter.ResourceNotFoundException;

@Repository
public class CustomerRepository implements IOperation<MemberResp, String> {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<MemberResp> rowMapper = new RowMapper<MemberResp>() {
        @Override
        public MemberResp mapRow(ResultSet rs, int rowNum) throws SQLException {
            MemberResp member = new MemberResp();
            member.setMemberID(rs.getString("memberID"));
            member.setAccount(rs.getString("account"));
            member.setUsername(rs.getString("username"));
            member.setEmail(rs.getString("email"));
            return member;
        }
    };

    @Override
    public List<MemberResp> findAll() throws DataAccessException {
        String sql = "SELECT * FROM member";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public MemberResp findById(String key) {
        String sql = "SELECT * FROM member WHERE memberID = ?";
        return jdbcTemplate.query(sql, rowMapper, key).stream().findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("查無此客戶編號：" + key));
    }

    @Override
    public String add(MemberResp entity) throws DataAccessException {
        throw new UnsupportedOperationException("Unimplemented method 'add'");
    }

    @Override
    public boolean update(MemberResp entity, String key) throws DataAccessException {
        String sql = "UPDATE member SET account = ?, username = ?, email = ? WHERE memberID = ?";
        int rows = jdbcTemplate.update(sql, entity.getAccount(), entity.getUsername(), entity.getEmail(), key);
        return rows > 0;
    }

    @Override
    public boolean delete(String key) throws DataAccessException {
        String sql = "DELETE FROM member WHERE memberID = ?";
        int rows = jdbcTemplate.update(sql, key);
        return rows > 0;
    }
}
