package pmim.mapper;

import pmim.model.Student;
import pmim.model.SysUser;

import java.util.List;
import java.util.Map;

public interface StudentMapper {
    void insertStudent(Student s);

    void deleteStudentById(SysUser s);

    Student selectStudentById(SysUser currentSysUser);

    void updateStudentById_forFill(Student s);

    void insertStudentById_forFill(Student s);

    List<Map<String, Object>> selectAllStudent_forAdminPage();

    List<Map<String, Object>> selectAllAdmin_forAdminPage();
}
