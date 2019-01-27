package pmim.mapper;

import pmim.model.UploadInstruction;

import java.util.List;

public interface UploadInstructionMapper {
    public List<UploadInstruction> selectUploadInstructionByPosition(UploadInstruction u);
}
