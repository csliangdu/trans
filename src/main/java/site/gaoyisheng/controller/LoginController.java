/*
 * file_name: LoginController.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月2日 下午4:11:43
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import site.gaoyisheng.pojo.User;
import site.gaoyisheng.service.LoginService;

@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	private LoginService loginService;
        
    @RequestMapping(value = "login",method = RequestMethod.GET)
	public String index(){
        return "/login";
    }

    @RequestMapping(value = "home",method = RequestMethod.GET)
	public String home(){
        return "/home";
    }
        
	/**
	 * .
	 *  登陆
	 * @param request
	 * @param number
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public ModelAndView login(@RequestParam(value = "number", required = true) String number,
			@RequestParam(value = "password", required = true) String password,HttpServletRequest request) {
                ModelAndView mv = new ModelAndView();
		if (!(number.equals("") && password.equals(""))) {// not null
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("number", number);
			parameterMap.put("password", password);
			// ajax + jQuery find User in DB or not?
			User currentUser = loginService.selectByNumberAndPassword(parameterMap);
			

			String type = "/user";
			if (currentUser != null) {// 如果不为空,则置入
				mv.addObject("currentUser", currentUser);
				request.getSession().setMaxInactiveInterval(1800);//设置30分钟超时
				request.getSession().setAttribute("currentUser", currentUser);
				
				// 如果是admin则 到/admin/home
				if (currentUser.getName().equals("admin")) {
					type = "/admin";
				}
				
				// 如果是secretary则 到/secretary/home
				if (currentUser.getName().equals("secretary")) {
					type = "/secretary";
				}
			}
			
			mv.setViewName("redirect:" + type + "/home");

		} else {
			return new ModelAndView("error");
		}

		return mv;
	}

	/**
	 * .
	 *  判断是否已登陆
	 * @param session
	 * @return
	 */
	public boolean isLoggedIn(HttpServletRequest request) {
		User currentUser =(User) request.getSession().getAttribute("currentUser");
		
		return currentUser!=null; 
	}
	
    /**
     * .
     *  登出
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String Logout(HttpServletRequest request) {
    	if(request.getSession().getAttribute("currentUser")!=null) {
    		request.getSession().removeAttribute("currentUser"); 
		 }
        return "/login";
    }

}
