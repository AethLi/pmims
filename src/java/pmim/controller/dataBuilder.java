//package pmim.controller;
//
//import org.apache.commons.lang3.RandomStringUtils;
//import org.apache.commons.math3.random.RandomDataGenerator;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import net.sf.json.JSONObject;
//import pmim.mapper.ProposerMapper;
//import pmim.mapper.StudentMapper;
//import pmim.mapper.UserMapper;
//import pmim.model.Proposer;
//import pmim.model.RequestAction;
//import pmim.model.Student;
//import pmim.model.SysUser;
//import pmim.Tools.Tools;
//
//import java.sql.Timestamp;
//import java.util.List;
//import java.util.Random;
//
//@Controller
//public class dataBuilder {
//
//    @Autowired
//    ProposerMapper pm;
//    @Autowired
//    UserMapper um;
//    @Autowired
//    StudentMapper sm;
//
//    public static String[] firstName = {"伟", "芳", "娜", "敏", "静", "秀英", "丽", "强", "磊", "洋", "艳", "勇", "军", "杰", "娟",
//            "涛", "超", "明", "霞", "秀兰", "刚", "平", "燕", "辉", "玲", "桂英", "丹", "萍", "鹏", "华", "红", "玉兰", "飞", "桂兰", "英", "梅",
//            "鑫", "波", "斌", "莉", "宇", "浩", "凯", "秀珍", "健", "俊", "帆", "雪", "帅", "慧", "旭", "宁", "婷", "玉梅", "龙", "林", "玉珍",
//            "凤英", "晶", "欢", "玉英", "颖", "红梅", "佳", "倩", "阳", "建华", "亮", "成", "琴", "兰英", "畅", "建", "云", "洁", "峰", "建国",
//            "建军", "柳", "淑珍", "春梅", "海燕", "晨", "冬梅", "秀荣", "瑞", "桂珍", "莹", "秀云", "桂荣", "志强", "秀梅", "丽娟", "婷婷", "玉华", "兵",
//            "雷", "东", "琳", "雪梅", "淑兰", "丽丽", "玉", "秀芳", "欣", "淑英", "桂芳", "博", "丽华", "丹丹", "彬", "桂香", "坤", "想", "淑华",
//            "荣", "秀华", "桂芝", "岩", "杨", "小红", "金凤", "文", "利", "楠", "红霞", "建平", "瑜", "桂花", "璐", "凤兰", "媛"};
//    public static String[] lastName = {"赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "诸", "卫", "蒋", "沈", "韩", "杨",
//            "朱", "秦", "尤", "许", "何", "吕", "施", "张", "孔", "曹", "严", "华", "金", "魏", "陶", "姜", "戚", "谢", "邹", "喻", "柏",
//            "水", "窦", "章", "云", "苏", "潘", "葛", "奚", "范", "彭", "郎", "鲁", "韦", "昌", "马", "苗", "凤", "花", "方", "俞", "任",
//            "袁", "柳", "酆", "鲍", "史", "唐", "费", "廉", "岑", "薛", "雷", "贺", "倪", "汤", "滕", "殷", "罗", "毕", "郝", "邬", "安",
//            "常", "乐", "于", "时", "傅", "皮", "卞", "齐", "康", "伍", "余", "元", "卜", "顾", "孟", "平", "黄", "和", "穆", "萧", "尹",
//            "姚", "邵", "湛", "汪", "祁", "毛", "禹", "狄", "米", "贝", "明", "臧", "计", "伏", "成", "戴", "谈", "宋", "茅", "庞", "熊",
//            "纪", "舒", "屈", "项", "祝", "董", "粱", "杜", "阮", "蓝", "闵", "席", "季", "麻", "强", "贾", "路", "娄", "危", "江", "童",
//            "颜", "郭", "梅", "盛", "林", "刁", "钟", "徐", "邱", "骆", "高", "夏", "蔡", "田", "樊", "胡", "凌", "霍", "虞", "万", "支",
//            "柯", "咎", "管", "卢", "莫", "经", "房", "裘", "缪", "干", "解", "应", "宗", "丁", "宣", "贲", "邓", "郁", "单", "杭", "洪",
//            "包", "诸", "左", "石", "崔", "吉", "钮", "龚", "程", "嵇", "邢", "滑", "裴", "陆", "荣", "翁", "荀", "羊", "於", "惠", "甄",
//            "魏", "家", "封", "芮", "羿", "储", "靳", "汲", "邴", "糜", "松", "井", "段", "富", "巫", "乌", "焦", "巴", "弓", "牧", "隗",
//            "山", "谷", "车", "侯", "宓", "蓬", "全", "郗", "班", "仰", "秋", "仲", "伊", "宫", "宁", "仇", "栾", "暴", "甘", "钭", "厉",
//            "戎", "祖", "武", "符", "刘", "景", "詹", "束", "龙", "叶", "幸", "司", "韶", "郜", "黎", "蓟", "薄", "印", "宿", "白", "怀",
//            "蒲", "邰", "从", "鄂", "索", "咸", "籍", "赖", "卓", "蔺", "屠", "蒙", "池", "乔", "阴", "郁", "胥", "能", "苍", "双", "闻",
//            "莘", "党", "翟", "谭", "贡", "劳", "逄", "姬", "申", "扶", "堵", "冉", "宰", "郦", "雍", "却", "璩", "桑", "桂", "濮", "牛",
//            "寿", "通", "边", "扈", "燕", "冀", "郏", "浦", "尚", "农", "温", "别", "庄", "晏", "柴", "翟", "阎", "充", "慕", "连", "茹",
//            "习", "宦", "艾", "鱼", "容", "向", "古", "易", "慎", "戈", "廖", "庚", "终", "暨", "居", "衡", "步", "都", "耿", "满", "弘",
//            "匡", "国", "文", "寇", "广", "禄", "阙", "东", "殴", "殳", "沃", "利", "蔚", "越", "夔", "隆", "师", "巩", "厍", "聂", "晁",
//            "勾", "敖", "融", "冷", "訾", "辛", "阚", "那", "简", "饶", "空", "曾", "毋", "沙", "乜", "养", "鞠", "须", "丰", "巢", "关",
//            "蒯", "相", "查", "后", "荆", "红", "游", "竺", "权", "逯", "盖", "益", "桓", "公", "万", "俟", "司", "马", "上", "官", "欧",
//            "阳", "夏", "侯", "诸", "葛", "闻", "人", "东", "方", "赫", "连", "皇", "甫", "尉", "迟", "公", "羊", "澹", "台", "公", "冶",
//            "宗", "政", "濮", "阳", "淳", "于", "单", "于", "太", "叔", "申", "屠", "公", "孙", "仲", "孙", "轩", "辕", "令", "狐", "钟",
//            "离", "宇", "文", "长", "孙", "慕", "容", "鲜", "于", "闾", "丘", "司", "徒", "司", "空", "亓", "官", "司", "寇", "仉", "督",
//            "子", "车", "颛", "孙", "端", "木", "巫", "马", "公", "西", "漆", "雕", "乐", "正", "壤", "驷", "公", "良", "拓", "跋", "夹",
//            "谷", "宰", "父", "谷", "粱", "晋", "楚", "闫", "法", "汝", "鄢", "涂", "钦", "段", "干", "百", "里", "东", "郭", "南", "门",
//            "呼", "延", "归", "海", "羊", "舌", "微", "生", "岳", "帅", "缑", "亢", "况", "后", "有", "琴", "梁", "丘", "左", "丘", "东",
//            "门", "西", "门", "商", "牟", "佘", "佴", "伯", "赏", "南", "宫", "墨", "哈", "谯", "笪", "年", "爱", "阳", "佟"};
//
//
//    @RequestMapping(value = "AdataBuilder.do", produces = "text/html;charset=UTF-8")
//    public @ResponseBody Object dataBuilderController(@RequestBody String jsonstr) {
//        RequestAction ra=(RequestAction)JSONObject.toBean(JSONObject.fromObject(jsonstr),RequestAction.class);
//        if ("Proposer".equals(ra.getAction())) {
//            for (int i = 0; i < 20; i++) {
//                Random ran=new Random();
//                Student s=new Student();
//                s.setName(lastName[ran.nextInt(lastName.length+1)]+firstName[ran.nextInt(firstName.length+1)]);
//                s.setBirthday(new Timestamp(631123200000L+ (new RandomDataGenerator()).nextLong(0L,315532800000L)));
//                int age=118-s.getBirthday().getYear();
//                s.setClassInfo((1990+age)+"级"+(1+ran.nextInt(5))+"班");
//                s.setHomeAddress("北美洲美国加利福尼亚州");
//                s.setSex(ran.nextInt(1));
//                s.setIDcardNum(RandomStringUtils.randomNumeric(18));
//                s.setUserId(RandomStringUtils.randomNumeric(20));
//                s.setStatus(ran.nextInt(1));
//                Proposer p=new Proposer();
//                p.setUserId(s.getUserId());
//                p.setFileName("/"+s.getName()+RandomStringUtils.randomNumeric(25));
////                p.setDate(new Timestamp(1199116800000L+ (new RandomDataGenerator()).nextLong(0L,315532800000L)));
//                p.setStatus(ran.nextInt(3));
//                p.setIndex(1);
//                SysUser u=new SysUser();
//                u.setUserPwd(Tools.toMD5(RandomStringUtils.randomAscii(8)));
//                u.setUserId(s.getUserId());
//                u.setUserPermission(0);
//                u.setStatus(ran.nextInt(3));
//                u.setUserPath("/"+s.getName()+RandomStringUtils.randomNumeric(25));
//                pm.insertProposer(p);
//                sm.insertStudent(s);
//                um.insertUser_register(u);
//            }
//        } else if ("proposerC".equals(ra.getAction())) {
//            SysUser u=new SysUser();
//            u.setUserPermission(0);
//            List<SysUser> allProposer=um.selectUserByPermission(u);
//            for (SysUser us :allProposer){
//                pm.deleteProposerById(new Proposer());
//                sm.deleteStudentById(us);
//                um.deleteUserById(us);
//            }
//        }
//        return null;
//    }
//}
