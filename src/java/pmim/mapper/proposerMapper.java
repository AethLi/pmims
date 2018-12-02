package pmim.mapper;

import pmim.model.proposer;

import java.util.List;

public interface proposerMapper {
    public void insertProposer(proposer p);
    public List<proposer> selectAllProposer();
}
