package pmim.mapper;

import pmim.model.uploadInstruction;

import java.util.List;

public interface uploadInstructionMapper {
    public List<uploadInstruction> selectUploadInstructionByPosition(uploadInstruction u);
}
