package pmim.mapper;

import pmim.model.Probationary;
import pmim.model.SysUser;

import java.util.List;

public interface ProbationaryMapper {
    void insertProbationary(Probationary p);

    List<Probationary> selectProbationaryByIdUndeleted(SysUser sysUser);

}
