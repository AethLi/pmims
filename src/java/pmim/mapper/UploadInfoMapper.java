package pmim.mapper;

import pmim.model.UploadInfo;
import pmim.model.SysUser;

import java.util.List;

public interface UploadInfoMapper {
    List<UploadInfo> selectUploadInfoById(SysUser u);
}
