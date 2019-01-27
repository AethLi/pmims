package pmim.mapper;

import pmim.model.Student;
import pmim.model.SysUser;

public interface StudentMapper {
    public void insertStudent(Student s);

    public void deleteStudentById(SysUser s);

    Student selectStudentById(SysUser currentSysUser);
}
