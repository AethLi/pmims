package pmim.service;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.proposerMapper;
import pmim.mapper.uploadInstructionMapper;
import pmim.model.proposer;
import pmim.model.responseMessage;
import pmim.model.uploadInstruction;
import pmim.model.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class proposerService {
    @Autowired
    proposerMapper pm;
    @Autowired
    uploadInstructionMapper upm;

    public Object initProposerUserPage(user currentUser) {
        Map m=new HashMap();
        List ul;
        proposer currentProposer;
        Map result=new HashMap();
        try {
            ul=upm.selectUploadInstructionByPosition(new uploadInstruction(1));
            currentProposer=pm.selectProposerById(currentUser);
            result.put("uploadInstructions",ul);
            result.put("currentProposer",currentProposer);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return JSONObject.fromObject(new responseMessage(0,"",result)).toString();
    }
}
