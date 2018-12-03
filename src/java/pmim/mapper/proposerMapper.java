package pmim.mapper;

import pmim.model.proposer;
import pmim.model.user;

import java.util.List;

public interface proposerMapper {
    public void insertProposer(proposer p);

    public List<proposer> selectAllProposer();

    void deleteProposerById(user p);
}
