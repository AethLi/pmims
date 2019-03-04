package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.*;
import pmim.model.*;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    ActivistMapper activistMapper;
    @Autowired
    DevelopmentMapper developmentMapper;
    @Autowired
    ProbationaryMapper probationaryMapper;
    @Autowired
    PermissionCheckService pcs;

    public Object initManagerPages(Integer position) {
        UploadInstruction uploadInstruction = new UploadInstruction();
        uploadInstruction.setPosition(position);
        return uim.selectUploadInstructionByPosition(uploadInstruction);
    }

    public String saveUploadInstruction(UploadInstruction ui) {
        uim.insertUploadInstruction(ui);
        return "修改成功";
    }

    public Object initTablePages(PageAble pa, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> users = um.selectUsersByPage(pa);
        if (pa.getUserType() == 0) {
            for (Map<String, Object> m : users) {
                List<Proposer> proposers = proposerMapper.selectProposerByIdUndeleted(new SysUser(m.get("userId").toString()));
                m.put("count", proposers.size());
                proposers = proposerMapper.selectProposerByIdDisapproved(new SysUser(m.get("userId").toString()));
                m.put("countN", proposers.size());
            }
        } else if (pa.getUserType() == 1) {
            for (Map<String, Object> m : users) {
                List<Activist> activists = activistMapper.selectActivistByIdUndeleted(new SysUser(m.get("userId").toString()));
                m.put("count", activists.size());
                activists = activistMapper.selectActivistByIdDisapproved(new SysUser(m.get("userId").toString()));
                m.put("countN", activists.size());
            }
        } else if (pa.getUserType() == 2) {
            for (Map<String, Object> m : users) {
                List<Development> developments = developmentMapper.selectDevelopmentByIdUndeleted(new SysUser(m.get("userId").toString()));
                m.put("count", developments.size());
                developments = developmentMapper.selectDevelopmentByIdDisapproved(new SysUser(m.get("userId").toString()));
                m.put("countN", developments.size());
            }
        } else if (pa.getUserType() == 3) {
            for (Map<String, Object> m : users) {
                List<Probationary> probationaries = probationaryMapper.selectProbationaryByIdUndeleted(new SysUser(m.get("userId").toString()));
                m.put("count", probationaries.size());
                probationaries = probationaryMapper.selectProbationaryByIdDisapproved(new SysUser(m.get("userId").toString()));
                m.put("countN", probationaries.size());
            }
        } else if (pa.getUserType() == 4) {
            for (Map<String, Object> m : users) {
                List<Activist> activists = activistMapper.selectActivistByIdUndeleted(new SysUser(m.get("userId").toString()));
                m.put("count", activists.size());
                activists = activistMapper.selectActivistByIdDisapproved(new SysUser(m.get("userId").toString()));
                m.put("countN", activists.size());
            }
        }
        result.put("users", users);
        if (pcs.permissionCheck(6, request)) {
            result.put("isSuperAdmin", true);
        } else {
            result.put("isSuperAdmin", false);
        }
        return result;
    }

    public Object proposerModal(String desId) {
        Map<String, Object> result = new HashMap<>();
        Student student = sm.selectStudentById(new SysUser(desId));
        result.put("student", student);
        List<Proposer> proposers = proposerMapper.selectProposerByIdUndeleted(new SysUser(desId));
        result.put("proposers", proposers);
        return result;
    }

    public Object activistModal(String desId) {
        Map<String, Object> result = new HashMap<>();
        Student student = sm.selectStudentById(new SysUser(desId));
        result.put("student", student);
        List<Activist> activists = activistMapper.selectActivistByIdUndeleted(new SysUser(desId));
        result.put("activists", activists);
        return result;
    }

    public Object developmentModal(String desId) {
        Map<String, Object> result = new HashMap<>();
        Student student = sm.selectStudentById(new SysUser(desId));
        result.put("student", student);
        List<Development> developments = developmentMapper.selectDevelopmentByIdUndeleted(new SysUser(desId));
        result.put("developments", developments);
        return result;
    }


    public Object probationaryModal(String desId) {
        Map<String, Object> result = new HashMap<>();
        Student student = sm.selectStudentById(new SysUser(desId));
        result.put("student", student);
        List<Probationary> probationaries = probationaryMapper.selectProbationaryByIdUndeleted(new SysUser(desId));
        result.put("probationaries", probationaries);
        return result;
    }

    public String acceptItem(String desId, String code, int i) {
        if (i == 0) {

        } else if (i == 1) {

        } else if (i == 2) {

        } else if (i == 3) {

        } else if (i == 4) {

        }
        return null;
    }
}
