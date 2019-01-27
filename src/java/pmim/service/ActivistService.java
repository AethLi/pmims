package pmim.service;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import pmim.mapper.ActivistMapper;
import pmim.mapper.UploadInfoMapper;
import pmim.mapper.UploadInstructionMapper;
import pmim.model.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class ActivistService {
    @Autowired
    UploadInfoMapper uifm;
    @Autowired
    UploadInstructionMapper uism;
    @Autowired
    ActivistMapper am;

    public Object initUserPage(SysUser currentSysUser) {
        Map result = new HashMap();
        List uploadInstructions = uism.selectUploadInstructionByPosition(new UploadInstruction(1));
        result.put("uploadInstructions", uploadInstructions);
        List uploadInfos = uifm.selectUploadInfoById(currentSysUser);
        result.put("uploadInfos", uploadInfos);
        return JSONObject.fromObject(new ResponseMessage(0, "", result)).toString();
    }

    public Object uploadFile(HttpServletRequest request, String currentUserId, String userPath, String index) {
        File proposerPath = new File(userPath + "activist/");
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
                return JSONObject.fromObject(new ResponseMessage(1, "网络错误", null)).toString();
            }
            while (iter.hasNext()) {
                //一次遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    if (new File(proposerPath + "/" + file.getOriginalFilename()).exists()) {
                        return JSONObject.fromObject(new ResponseMessage(1, "已上传过同名文件", null)).toString();
                    }
                    String path = proposerPath.getPath() + "/" + file.getOriginalFilename();
                    //上传
                    try {
                        file.transferTo(new File(path));
                        am.insertActivist(new Activist(UUID.randomUUID().toString().replace("-", "0"), currentUserId, file.getOriginalFilename(), Calendar.getInstance().getTimeInMillis(), 0, Integer.valueOf(index)));

                    } catch (IOException e) {
                        e.printStackTrace();
                        return JSONObject.fromObject(new ResponseMessage(1, "上传失败", null)).toString();
                    }
                }
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "上传成功", null)).toString();
    }
}
