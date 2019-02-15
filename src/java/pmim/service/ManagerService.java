package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.UploadInstructionMapper;
import pmim.model.UploadInstruction;

@Service
public class ManagerService {
    @Autowired
    UploadInstructionMapper uim;

    public Object initManagerPages(Integer position) {
        UploadInstruction uploadInstruction = new UploadInstruction();
        uploadInstruction.setPosition(position);
        return uim.selectUploadInstructionByPosition(uploadInstruction);
    }

    public String saveUploadInstruction(UploadInstruction ui) {
        uim.insertUploadInstruction(ui);
        return "修改成功";
    }
}
