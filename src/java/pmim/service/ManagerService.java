package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.UploadInstructionMapper;
import pmim.model.UploadInstruction;

@Service
public class ManagerService {
    @Autowired
    UploadInstructionMapper uim;

    public Object initProposer() {
        UploadInstruction uploadInstruction = new UploadInstruction();
        uploadInstruction.setPosition(0);
        return uim.selectUploadInstructionByPosition(uploadInstruction);
    }
}
