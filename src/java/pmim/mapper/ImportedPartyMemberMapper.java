package pmim.mapper;

import pmim.model.ImportedPartyMember;

import java.util.List;

public interface ImportedPartyMemberMapper {
    void insertImportedPartyMember(ImportedPartyMember importedPartyMember);

    List<ImportedPartyMember> selectByUserId(ImportedPartyMember importedPartyMember);

    List<ImportedPartyMember> selectWithAll();

    void updateWithStatus(ImportedPartyMember ipm);

    List<ImportedPartyMember> selectWithAll_New();

    ImportedPartyMember selectById(ImportedPartyMember importedPartyMember);
}
