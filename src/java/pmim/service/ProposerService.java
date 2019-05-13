package pmim.service;

import net.sf.json.JSONObject;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import pmim.mapper.ProposerMapper;
import pmim.mapper.UploadInstructionMapper;
import pmim.model.Proposer;
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
public class ProposerService {
    @Autowired
    ProposerMapper pm;
    @Autowired
    UploadInstructionMapper upm;


    //初始化页面信息
    public Object initUserPage(SysUser currentSysUser) {
        List ul;
        List pl;
        Map result = new HashMap();
        try {
            ul = upm.selectUploadInstructionByPosition(new UploadInstruction(0));
            //获取上传说明
            pl = pm.selectProposerByIdUndeleted(currentSysUser);
            //获取当前用户已上传文件
            result.put("uploadInstructions", ul);
            result.put("currentProposer", pl);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return JSONObject.fromObject(new ResponseMessage(0, "", result)).toString();
    }

    /**
     * 实际存入文件的代码实现
     *
     * @param request
     * @param currentUser
     * @param userPath
     * @param index
     * @return
     */
    public Object uploadFile(HttpServletRequest request, String currentUser, String userPath, String index) {
        File proposerPath = new File(userPath + "Proposer/");
        if (!proposerPath.exists()) {
            proposerPath.mkdir();
        }
        //判断是否有该文件夹
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //获取一个文件解析multipartResolver
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator iter = multiRequest.getFileNames();
            if (!iter.hasNext()) {
                return JSONObject.fromObject(new ResponseMessage(1, "网络错误", null)).toString();
            }
            while (iter.hasNext()) {
                //遍历已上传的文件，实际只有一个
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    String fileRandomName = RandomStringUtils.randomAlphabetic(5) + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date(System.currentTimeMillis())) + file.getOriginalFilename();
                    //生成随机文件名，实际是5个随机字符加时间再加源文件名
                    if (new File(proposerPath + "/" + fileRandomName).exists()) {
                        return JSONObject.fromObject(new ResponseMessage(1, "已上传过同名文件", null)).toString();
                    }
                    String path = proposerPath.getPath() + "/" + fileRandomName;
//                    String fileRandomName = RandomStringUtils.randomAlphabetic(5) + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date(System.currentTimeMillis()));
                    try {
                        //存入文件
                        file.transferTo(new File(path));
                        //存入数据库
                        pm.insertProposer(new Proposer(UUID.randomUUID().toString().replace("-", "0"), currentUser, fileRandomName, Calendar.getInstance().getTimeInMillis(), 0, Integer.valueOf(index)));

                    } catch (IOException e) {
                        e.printStackTrace();
                        return JSONObject.fromObject(new ResponseMessage(1, "上传失败", null)).toString();
                    }
                }
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "上传成功", null)).toString();
    }

    //获取文件列表
    public Object getFileList(SysUser currentSysUser) {
        try {
            return JSONObject.fromObject(new ResponseMessage(0, "", pm.selectProposerByIdUndeleted(currentSysUser))).toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //删除文件
    public Object deleteFile(String desId, SysUser currentSysUser) {
        pm.deleteProposerById(new Proposer(desId));
        return JSONObject.fromObject(new ResponseMessage(0, "删除成功", pm.selectProposerByIdUndeleted(currentSysUser))).toString();
    }
}
