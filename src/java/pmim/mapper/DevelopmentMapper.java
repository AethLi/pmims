package pmim.mapper;

import pmim.model.Development;

public interface DevelopmentMapper {
    void insertDevelopment(Development d);


    void acceptDevelopmentById(Development p);

    void disAcceptDevelopmentById(Development p);

    void deleteDevelopmentById(Development p);

}
