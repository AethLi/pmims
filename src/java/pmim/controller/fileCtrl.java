package pmim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.mapper.*;
import pmim.model.*;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;


@Controller
@RequestMapping(value = "/file")
public class fileCtrl {
    @Autowired
    ProposerMapper proposerMapper;
    @Autowired
    ActivistMapper activistMapper;
    @Autowired
    DevelopmentMapper developmentMapper;
    @Autowired
    ProbationaryMapper probationaryMapper;
    @Autowired
    UserPathService userPathService;
    @Autowired
    ImportedPartyMemberMapper importedPartyMemberMapper;

    /**
     * 显示图片
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/imageShow.do", method = RequestMethod.GET)
    @ResponseBody
    public String imageShow(HttpServletRequest request, HttpServletResponse response) {
        String path = null;
        //拿到前台传入的文件Id
        String desId = request.getParameter("desId");
        //判断文件类型来选择路径
        if (request.getParameter("type").equals("proposer")) {
            Proposer p = proposerMapper.selectProposerByProposerId(new Proposer(desId));
            path = userPathService.checkUserPath(p.getUserId());
            path += "Proposer/" + p.getFileName();
        } else if (request.getParameter("type").equals("activist")) {
            Activist a = activistMapper.selectActivistByActivistId(new Activist(desId));
            path = userPathService.checkUserPath(a.getUserId());
            path += "Activist/" + a.getFileName();
        } else if (request.getParameter("type").equals("development")) {
            Development d = developmentMapper.selectDevelopmentByDevelopmentId(new Development(desId));
            path = userPathService.checkUserPath(d.getUserId());
            path += "Development/" + d.getFileName();
        } else if (request.getParameter("type").equals("probationary")) {
            Probationary p = probationaryMapper.selectProbationaryByProbationaryId(new Probationary(desId));
            path = userPathService.checkUserPath(p.getUserId());
            path += "Probationary/" + p.getFileName();
        }
        FileInputStream fis = null;
        OutputStream os = null;
        try {
            //读取文件并写入流
            fis = new FileInputStream(path);
            os = response.getOutputStream();
            int count = 0;
            byte[] buffer = new byte[1024 * 8];
            while ((count = fis.read(buffer)) != -1) {
                os.write(buffer, 0, count);
                os.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            fis.close();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ok";
    }

    /**
     * 文件下载
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/fileDownload.do")
    public @ResponseBody
    Object fileDown(HttpServletRequest request, HttpServletResponse response) {
        String path = null;
        String fileName = null;
        //拿到前台传入的文件Id
        String desId = request.getParameter("desId");
        //判断文件类型来选择路径
        if (request.getParameter("type").equals("proposer")) {
            Proposer p = proposerMapper.selectProposerByProposerId(new Proposer(desId));
            path = userPathService.checkUserPath(p.getUserId());
            path += "Proposer/" + p.getFileName();
            fileName = p.getFileName();
        } else if (request.getParameter("type").equals("activist")) {
            Activist a = activistMapper.selectActivistByActivistId(new Activist(desId));
            path = userPathService.checkUserPath(a.getUserId());
            path += "Activist/" + a.getFileName();
            fileName = a.getFileName();
        } else if (request.getParameter("type").equals("development")) {
            Development d = developmentMapper.selectDevelopmentByDevelopmentId(new Development(desId));
            path = userPathService.checkUserPath(d.getUserId());
            path += "Development/" + d.getFileName();
            fileName = d.getFileName();
        } else if (request.getParameter("type").equals("probationary")) {
            Probationary p = probationaryMapper.selectProbationaryByProbationaryId(new Probationary(desId));
            path = userPathService.checkUserPath(p.getUserId());
            path += "probationary/" + p.getFileName();
            fileName = p.getFileName();
        } else if (request.getParameter("type").equals("import")) {
            ImportedPartyMember importedPartyMember = new ImportedPartyMember();
            importedPartyMember.setId(desId);
            importedPartyMember = importedPartyMemberMapper.selectById(importedPartyMember);
            path = userPathService.checkUserPath(importedPartyMember.getUserId());
            path += "probationary/" + importedPartyMember.getFileName();
            fileName = importedPartyMember.getFileName();
        }
        if (path != null) {
            //读取文件
            File file = new File(path);
            //判断文件是否存在
            if (file.exists()) {
                // 设置强制下载不打开
                response.setContentType("application/force-download");
                try {
                    //设置下载头
                    response.addHeader("Content-Disposition",
                            "attachment; fileName=" + URLEncoder.encode(fileName.substring(19), "utf-8"));// 设置文件名
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    //将文件写入流
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        return null;
    }

}



