package pmim.service;

import net.sf.json.JSONObject;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import pmim.mapper.DevelopmentMapper;
import pmim.mapper.UploadInfoMapper;
import pmim.mapper.UploadInstructionMapper;
import pmim.model.Development;
import pmim.model.ResponseMessage;
import pmim.model.SysUser;
import pmim.model.UploadInstruction;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class DevelopmentService {
    @Autowired
    DevelopmentMapper dm;
    @Autowired
    UploadInstructionMapper uism;
    @Autowired
    UploadInfoMapper uifm;

    public Object uploadFile(HttpServletRequest request, String currentUserId, String userPath, String index) {
        File developmentPath = new File(userPath + "Development/");
        if (!developmentPath.exists()) {
            developmentPath.mkdir();
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
                    String fileRandomName = RandomStringUtils.randomAlphabetic(5) + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date(System.currentTimeMillis())) + file.getOriginalFilename();
                    if (new File(developmentPath + "/" + fileRandomName).exists()) {
                        return JSONObject.fromObject(new ResponseMessage(1, "已上传过同名文件", null)).toString();
                    }
                    String path = developmentPath.getPath() + "/" + fileRandomName;
                    //上传
                    try {
                        file.transferTo(new File(path));
                        dm.insertDevelopment(new Development(UUID.randomUUID().toString().replace("-", "0"), currentUserId, fileRandomName, Calendar.getInstance().getTimeInMillis(), 0, Integer.valueOf(index)));

                    } catch (IOException e) {
                        e.printStackTrace();
                        return JSONObject.fromObject(new ResponseMessage(1, "上传失败", null)).toString();
                    }
                }
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "上传成功", null)).toString();
    }

    public Object initUserPage(SysUser currentSysUser) {
        Map result = new HashMap();
        List uploadInstructions = uism.selectUploadInstructionByPosition(new UploadInstruction(2));
        result.put("uploadInstructions", uploadInstructions);
        List uploadInfos = uifm.selectUploadInfoById(currentSysUser);
        result.put("uploadInfos", uploadInfos);
        List dl = dm.selectDevelopmentByIdUndeleted(currentSysUser);
        result.put("currentDevelopment", dl);
        return JSONObject.fromObject(new ResponseMessage(0, "", result)).toString();
    }

    public Object getFileList(SysUser currentSysUser) {
        try {
            return JSONObject.fromObject(new ResponseMessage(0, "", dm.selectDevelopmentByIdUndeleted(currentSysUser))).toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //删除文件
    public Object deleteFile(String desId, SysUser currentSysUser) {
        dm.deleteDevelopmentById(new Development(desId));
        return JSONObject.fromObject(new ResponseMessage(0, "删除成功", dm.selectDevelopmentByIdUndeleted(currentSysUser))).toString();
    }
}
