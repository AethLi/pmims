package pmim.mapper;

import pmim.model.ActivistHelper;
import pmim.model.SysUser;

public interface ActivistHelperMapper {
    ActivistHelper selectActivistHelperById(SysUser u);

    void insertActivistHelperById(ActivistHelper activistHelper);

    void updateActivistHelperById(ActivistHelper activistHelper);
}
