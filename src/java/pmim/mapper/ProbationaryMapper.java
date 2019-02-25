package pmim.mapper;

import pmim.model.Probationary;

public interface ProbationaryMapper {
    void insertProbationary(Probationary p);

    void acceptProbationaryById(Probationary p);

    void disAcceptProbationaryById(Probationary p);

    void deleteProbationaryById(Probationary p);

}
