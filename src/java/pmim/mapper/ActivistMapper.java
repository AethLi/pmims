package pmim.mapper;

import pmim.model.Activist;
import pmim.model.SysUser;

import java.util.List;

public interface ActivistMapper {
    void insertActivist(Activist a);

    List<Activist> selectActivistById(Activist activist);

    List<Activist> selectActivistByIdUndeleted(SysUser activist);
}
