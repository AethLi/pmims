package pmim.mapper;

import pmim.model.Proposer;
import pmim.model.SysUser;

import java.util.List;

public interface ProposerMapper {
    void insertProposer(Proposer p);

    void deleteProposerById(Proposer p);

    List selectProposerById(SysUser currentSysUser);

    List selectProposerByIdUndeleted(SysUser currentSysUser);
}
