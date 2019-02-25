package pmim.mapper;

import pmim.model.Proposer;
import pmim.model.SysUser;

import java.util.List;

public interface ProposerMapper {
    void insertProposer(Proposer p);

    void deleteProposerById(Proposer p);

    List<Proposer> selectProposerById(Proposer p);

    List<Proposer> selectProposerByIdUndeleted(SysUser currentSysUser);

    List<Proposer> selectProposerByIdDisapproved(SysUser currentSysUser);

    void acceptProposerById(Proposer p);

    void disAcceptProposerById(Proposer p);

}
