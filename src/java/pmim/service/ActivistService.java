package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.uploadInfoMapper;
import pmim.mapper.uploadInstructionMapper;
import pmim.model.uploadInstruction;
import pmim.model.user;

import java.util.List;

@Service
public class ActivistService {
    @Autowired
    uploadInfoMapper uifm;
    @Autowired
    uploadInstructionMapper uism;

    public Object initUserPage(user currentUser) {
        List uploadInstructions=uism.selectUploadInstructionByPosition(new uploadInstruction(1));
        List uploadInfos=uifm.selectUploadInfoById(currentUser);
        
        return null;
    }
}
