package com.LinkT.MH.Controller;

import com.LinkT.MH.Mapper.userMapper;
import com.LinkT.MH.entity.JoinVO;
import com.LinkT.MH.entity.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

// data를 저장하거나 업데이트 하려면 객체를 저장해야 함.
// 근데 객체를 생성해주는게 Annotation에서 RequiredArgsConstructor이다.

@Controller
public class userController {
    @Inject
    private userMapper mapper;
    private HttpSession session;

    private String message="";

    @RequestMapping("/")
    public String home() {
        return "home";
    }

    @RequestMapping("/Join.do")
    public String Join(JoinVO vo, Model model) {
        if (!vo.getPw().equals(vo.getPw_check())) {
            message = "비밀번호가 서로 다릅니다.";
            model.addAttribute("message", message);
            model.addAttribute("linkUrl", "JoinForm.do");
            return "JoinF";
        }
        mapper.Join(vo);
        message = "회원가입에 성공했습니다.";
        model.addAttribute("message", message);
        model.addAttribute("linkUrl", "LoginForm.do");
        return "JoinS";
    }

    @RequestMapping("Logout.do")
    public String Logout(HttpSession session){
        session.invalidate();
        return "home";
    }
    @RequestMapping("Login.do")
    public String Login(UserVO vo, Model model, HttpServletRequest request) {
        System.out.println(vo.getName());
        System.out.println(vo.getId());
        System.out.println(vo.getPw());
        UserVO user = mapper.LoginCheck(vo);
        if (user == null) {
            message = "id나 pw를 찾을 수 없습니다.";
            model.addAttribute("message", message);
            model.addAttribute("linkUrl", "LoginForm.do");
            if(session != null) {
                session.setAttribute("id", null);
                session.setAttribute("name", null);
            }
            return "LoginF";
        }
        String id = user.getId();
        String name = user.getName();
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        session.setAttribute("name", name);
        message = name + "님 환영합니다.";
        System.out.println(message);
        model.addAttribute("message", message);
        model.addAttribute("linkUrl", "/");
        return "LoginS";
    }

    @RequestMapping("/Update.do")
    public String Update(UserVO vo, Model model){
        message = "회원정보가 수정되었습니다.";
        model.addAttribute("message", message);
        model.addAttribute("linkUrl", "/");
        mapper.Update(vo);
        return "UpdateS";
    }

    @RequestMapping("/NotLogin.do")
    public String NotLogin() {
        return "NotLogin";
    }

    @RequestMapping("/Profile.do")
    public String Profile() {

        return "Profile";
    }

    @RequestMapping("/LoginForm.do")
    public String LoginForm() {
        return "LoginForm";
    }

    @RequestMapping("/JoinForm.do")
    public String JoinForm() {
        return "JoinForm";
    }

    @RequestMapping("/UpdateForm.do")
    public String UpdateForm(){
        return "UpdateForm";
    }
}
