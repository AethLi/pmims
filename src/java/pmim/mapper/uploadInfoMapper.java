package pmim.mapper;

import pmim.model.uploadInfo;
import pmim.model.user;

import java.util.List;

public interface uploadInfoMapper {
    public List<uploadInfo> selectUploadInfoById(user u);
}
