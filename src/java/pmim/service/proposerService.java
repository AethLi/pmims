package pmim.service;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import pmim.mapper.proposerMapper;
import pmim.mapper.uploadInstructionMapper;
import pmim.model.proposer;
import pmim.model.responseMessage;
import pmim.model.uploadInstruction;
import pmim.model.user;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

@Service
public class proposerService {
    @Autowired
    proposerMapper pm;
    @Autowired
    uploadInstructionMapper upm;

    public Object initProposerUserPage(user currentUser) {
        Map m = new HashMap();
        List ul;
        List pl;
        Map result = new HashMap();
        try {
            ul = upm.selectUploadInstructionByPosition(new uploadInstruction(0));
            pl = pm.selectProposerByIdUndeleted(currentUser);
            result.put("uploadInstructions", ul);
            result.put("currentProposer", pl);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return JSONObject.fromObject(new responseMessage(0, "", result)).toString();
    }

    public Object uploadFile(HttpServletRequest request, String currentUser, String userPath, String index) {
        File proposerPath = new File(userPath + "proposer/");
        if (!proposerPath.exists()) {
            proposerPath.mkdir();
        }
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取multiRequest 中所有的文件名
            Iterator iter = multiRequest.getFileNames();
            if (!iter.hasNext()) {
                return JSONObject.fromObject(new responseMessage(1, "网络错误", null)).toString();
            }
            while (iter.hasNext()) {
                //一次遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    if (new File(proposerPath + "/" + file.getOriginalFilename()).exists()) {
                        return JSONObject.fromObject(new responseMessage(1, "已上传过同名文件", null)).toString();
                    }
                    String path = proposerPath.getPath() + "/" + file.getOriginalFilename();
                    //上传
                    try {
                        file.transferTo(new File(path));
                        pm.insertProposer(new proposer(UUID.randomUUID().toString().replace("-", "0"), currentUser, file.getOriginalFilename(), Calendar.getInstance().getTimeInMillis(), 0, Integer.valueOf(index)));

                    } catch (IOException e) {
                        e.printStackTrace();
                        return JSONObject.fromObject(new responseMessage(1, "上传失败", null)).toString();
                    }
                }
            }
        }
        return JSONObject.fromObject(new responseMessage(0, "上传成功", null)).toString();
    }

    public Object getFileList(user currentUser) {
        try {
            return JSONObject.fromObject(new responseMessage(0, "", pm.selectProposerByIdUndeleted(currentUser))).toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Object deleteFile(String desId, user currentUser) {
        pm.deleteProposerById(new proposer(desId));
        return JSONObject.fromObject(new responseMessage(0, "删除成功", pm.selectProposerByIdUndeleted(currentUser))).toString();
    }
}
