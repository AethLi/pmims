package pmim.mapper;

import pmim.model.Development;
import pmim.model.SysUser;

import java.util.List;

public interface DevelopmentMapper {
    void insertDevelopment(Development d);

    List<Development> selectDevelopmentByIdUndeleted(SysUser sysUser);

    void acceptDevelopmentById(Development p);

    void disAcceptDevelopmentById(Development p);

    void deleteDevelopmentById(Development p);

    Development selectDevelopmentByDevelopmentId(Development p);



    List<Development> selectDevelopmentByIdDisapproved(SysUser userId);
}
