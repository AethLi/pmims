package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.ProposerMapper;
import pmim.mapper.StudentMapper;
import pmim.mapper.UploadInstructionMapper;
import pmim.mapper.UserMapper;
import pmim.model.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ManagerService {
    @Autowired
    UploadInstructionMapper uim;
    @Autowired
    UserMapper um;
    @Autowired
    StudentMapper sm;
    @Autowired
    ProposerMapper proposerMapper;

    public Object initManagerPages(Integer position) {
        UploadInstruction uploadInstruction = new UploadInstruction();
        uploadInstruction.setPosition(position);
        return uim.selectUploadInstructionByPosition(uploadInstruction);
    }

    public String saveUploadInstruction(UploadInstruction ui) {
        uim.insertUploadInstruction(ui);
        return "修改成功";
    }

    public Object initTablePages(PageAble pa) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> users = um.selectUsersByPage(pa);
        if (pa.getUserType() == 0) {
            for (Map<String, Object> m : users) {
                List<Proposer> proposers = proposerMapper.selectProposerByIdUndeleted(new SysUser(m.get("userId").toString()));
                m.put("count", proposers.size());
                proposers = proposerMapper.selectProposerByIdDisapproved(new SysUser(m.get("userId").toString()));
                m.put("countN", proposers.size());
            }
        }
        result.put("users", users);
        return result;
    }

    public Object proposerModal(String desId) {
        Map<String, Object> result = new HashMap<>();
        Proposer p=um.selectUsersById(new SysUser(desId,0,0));
        result.put("user", p);
        List<Proposer> proposers=proposerMapper.selectProposerById(new Proposer(desId,0));
        result.put("proposers",proposers);
        return result;
    }
}
