package pmim.mapper;

import pmim.model.UploadInstruction;

import java.util.List;

public interface UploadInstructionMapper {
    List<UploadInstruction> selectUploadInstructionByPosition(UploadInstruction u);

    void insertUploadInstruction(UploadInstruction ui);
}
