package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.proposerMapper;

@Service
public class proposerService {
    @Autowired
    proposerMapper pm;

}
