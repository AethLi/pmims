package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.proposerMapper;
import pmim.model.proposer;
import pmim.model.user;

@Service
public class proposerService {
    @Autowired
    proposerMapper pm;

    public void initProposerUserPage(user currentUser) {
        proposer p =pm.selectProposerById(currentUser);

    }
}
