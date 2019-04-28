package pmim.mapper;

import pmim.model.PartyMemberShipDues;

import java.util.List;
import java.util.Map;

public interface PartyMemberShipDuesMapper {
    List<PartyMemberShipDues> selectAll();

    void insertWithAll(Map<String, Object> dues);
}
