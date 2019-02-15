package pmim.mapper;

import pmim.model.Student;
import pmim.model.SysUser;

public interface StudentMapper {
    void insertStudent(Student s);

    void deleteStudentById(SysUser s);

    Student selectStudentById(SysUser currentSysUser);
}
