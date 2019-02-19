package pmim.mapper;

import pmim.model.Student;
import pmim.model.SysUser;

import java.util.List;

public interface StudentMapper {
    void insertStudent(Student s);

    void deleteStudentById(SysUser s);

    Student selectStudentById(SysUser currentSysUser);

    List<Student> selectStudentByIds(List<String> list);
    //弃用
}
