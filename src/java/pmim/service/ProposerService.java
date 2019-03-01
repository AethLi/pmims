package pmim.service;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import pmim.mapper.ProposerMapper;
import pmim.mapper.UploadInstructionMapper;
import pmim.model.Proposer;
import pmim.model.ResponseMessage;
import pmim.model.UploadInstruction;
import pmim.model.SysUser;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class ProposerService {
    @Autowired
    ProposerMapper pm;
    @Autowired
    UploadInstructionMapper upm;

    public Object initUserPage(SysUser currentSysUser) {
        List ul;
        List pl;
        Map result = new HashMap();
        try {
            ul = upm.selectUploadInstructionByPosition(new UploadInstruction(0));
            pl = pm.selectProposerByIdUndeleted(currentSysUser);
            result.put("uploadInstructions", ul);
            result.put("currentProposer", pl);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return JSONObject.fromObject(new ResponseMessage(0, "", result)).toString();
    }

    public Object uploadFile(HttpServletRequest request, String currentUser, String userPath, String index) {
        File proposerPath = new File(userPath + "Proposer/");
        if (!proposerPath.exists()) {
            proposerPath.mkdir();
        }
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator iter = multiRequest.getFileNames();
            if (!iter.hasNext()) {
                return JSONObject.fromObject(new ResponseMessage(1, "网络错误", null)).toString();
            }
            while (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    if (new File(proposerPath + "/" + file.getOriginalFilename()).exists()) {
                        return JSONObject.fromObject(new ResponseMessage(1, "已上传过同名文件", null)).toString();
                    }
                    String path = proposerPath.getPath() + "/" + file.getOriginalFilename();
//                    String fileRandomName = RandomStringUtils.randomAlphabetic(5) + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date(System.currentTimeMillis()));
                    try {
                        file.transferTo(new File(path));
                        pm.insertProposer(new Proposer(UUID.randomUUID().toString().replace("-", "0"), currentUser, file.getOriginalFilename(), Calendar.getInstance().getTimeInMillis(), 0, Integer.valueOf(index)));

                    } catch (IOException e) {
                        e.printStackTrace();
                        return JSONObject.fromObject(new ResponseMessage(1, "上传失败", null)).toString();
                    }
                }
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "上传成功", null)).toString();
    }

    public Object getFileList(SysUser currentSysUser) {
        try {
            return JSONObject.fromObject(new ResponseMessage(0, "", pm.selectProposerByIdUndeleted(currentSysUser))).toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Object deleteFile(String desId, SysUser currentSysUser) {
        pm.deleteProposerById(new Proposer(desId));
        return JSONObject.fromObject(new ResponseMessage(0, "删除成功", pm.selectProposerByIdUndeleted(currentSysUser))).toString();
    }
}
