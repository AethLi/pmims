package pmim.mapper;

import pmim.model.proposer;
import pmim.model.user;

import java.util.List;

public interface proposerMapper {
    public void insertProposer(proposer p);

    void deleteProposerById(user p);

    List selectProposerById(user currentUser);
}
