/*
 * file_name: AdminOpsController.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月4日 下午3:38:34
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

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import site.gaoyisheng.enums.CollegeOperationType;
import site.gaoyisheng.pojo.ChPeriodicalThesis;
import site.gaoyisheng.pojo.College;
import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.pojo.Patent;
import site.gaoyisheng.pojo.User;
import site.gaoyisheng.service.ChPeriodicalThesisService;
import site.gaoyisheng.service.CollegeService;
import site.gaoyisheng.service.EnPeriodicalThesisService;
import site.gaoyisheng.service.PatentService;
import site.gaoyisheng.service.ThesisService;
import site.gaoyisheng.service.UserService;
import site.gaoyisheng.utils.FileUtil;

@Controller
@RequestMapping("/admin")
public class AdminOpsController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PatentService patentService;
	
	@Autowired
	private ThesisService thesisService;
	
	@Autowired
	private CollegeService collegeService;

	@Autowired
	private EnPeriodicalThesisService enPeriodicalThesisService;
  
	@Autowired
	private ChPeriodicalThesisService chPeriodicalThesisService;
	
    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String upload() {
        return "/admin/upload";
    }
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "/admin/home";
    }

    @RequestMapping(value = "/college-manage", method = RequestMethod.GET)
    public String manageCollege() {
        return "/admin/college-manage";
    }
    
    /**
     * .
     * 上传文件,并解析入库  : request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis}
     *                                                   由于还需上传 User 表,此处再加一个 {user}
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/upload/{awardsType}", method = RequestMethod.POST)
    public ModelAndView importXlsFile(@RequestParam("filename") MultipartFile file, 
                                    HttpServletRequest request,ModelAndView mav,
                                    @PathVariable("awardsType") String awardsType) throws Exception {
    	String strAlertMsg = null;
       if (file.isEmpty()) {
           strAlertMsg = "文件上传失败: 服务器未接收到文件";
           request.getSession().setAttribute("msg", strAlertMsg);
           return null;
        }
        
       String name = file.getOriginalFilename();// 获取上传文件名,包括路径  
       long size = file.getSize();
        
       if ((name == null || name.equals("")) && size == 0) {
           strAlertMsg = "文件上传失败: 文件内容为空";
           request.getSession().setAttribute("msg", strAlertMsg);
           return null;
        }
        
       InputStream in = file.getInputStream();
       switch(awardsType) {
             //插入并返回 提示
           case "user":strAlertMsg = "成功追加新用户:" + userService.readStreamAndInsertList(in) + "条！";break;
           case "patent":strAlertMsg = "成功追加新专利:" + patentService.readStreamAndInsertList(in) + "条！";break;
           case "enPeriodicalThesis":strAlertMsg = "成功追加新英文论文:" + enPeriodicalThesisService.readStreamAndInsertList(in) + "条！";break;
           case "chPeriodicalThesis":strAlertMsg = "成功追加新中文论文:" + chPeriodicalThesisService.readStreamAndInsertList(in) + "条！";break;
           default:strAlertMsg = "数据追加失败: 请联系开发人员";
        }
       
       //request.getSession().setAttribute("msg", strAlertMsg);
       //return "{'msg':'"+strAlertMsg+"'}";
       mav.addObject("msg", strAlertMsg);
       mav.setViewName("/admin/upload");
       return mav;
    } 
	
	/**
	 * .
	 * 生成Xls文件,并下载 或者下载(模版)  : request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis,patent_model,enPeriodicalThesis_model,chPeriodicalThesis_model}
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/download/{awardsType}", method = RequestMethod.GET)
	public void exportExcel(HttpServletRequest request, HttpServletResponse response,@PathVariable("awardsType") String awardsType) throws Exception {

		try {
//			String type = request.getParameter("awardsType");
			FileUtil fileUtil = new FileUtil();
			byte[] bytes = null;
			Path file = null;
			
			String fileNameBefore = "";
			
			switch (awardsType) {
			    case "thesis":
			    		bytes = fileUtil.exportFile(thesisService.selectAll());
			    		fileNameBefore = "补录-论文.xls";
                     break;
			    case "patent": 
			    		bytes = fileUtil.exportFileOfPatent(patentService.selectAll());
			    		fileNameBefore = "专利.xls";
			    		break;
			    case "enPeriodicalThesis": 
			    		bytes = fileUtil.exportFileOfEnPeriodicalThesis(enPeriodicalThesisService.selectAll());
			    		fileNameBefore = "英文期刊论文.xls";
			    		break;
			    case "chPeriodicalThesis":
			    		bytes = fileUtil.exportFileOfChPeriodicalThesis(chPeriodicalThesisService.selectAll());
			    		fileNameBefore = "中文期刊论文.xls";
			    		break;
			    case "patent-model":
			    		fileNameBefore = "专利-模板.xls";
		    			file = Paths.get(request.getServletContext().getRealPath("/views/data"), fileNameBefore);
		    			if(Files.exists(file)) {
		    				bytes = fileUtil.getBytesFromFile(file.toFile());
		    			}
		    			break;
			    case "enPeriodicalThesis-model":
			    		fileNameBefore = "英文期刊论文-模板.xls";
		    			file = Paths.get(request.getServletContext().getRealPath("/views/data"), fileNameBefore);
		    			if(Files.exists(file)) {
		    				bytes = fileUtil.getBytesFromFile(file.toFile());
		    			}
			    		break;
			    case "chPeriodicalThesis-model":
		    			fileNameBefore = "中文期刊论文-模板.xls";
		    			file = Paths.get(request.getServletContext().getRealPath("/views/data"), fileNameBefore);
		    			if(Files.exists(file)) {
		    				bytes = fileUtil.getBytesFromFile(file.toFile());
		    			}
		    			break;
			    case "user-model":
	    				fileNameBefore = "人事工号-模板.xls";
	    				file = Paths.get(request.getServletContext().getRealPath("/views/data"), fileNameBefore);
	    				if(Files.exists(file)) {
	    					bytes = fileUtil.getBytesFromFile(file.toFile());
	    				}
	    				break;
			    default : return ; //退出,并返回"无该类型文档"
			}
			
			byte[] fileNameByte = (fileNameBefore).getBytes("GBK");
			String filename = new String(fileNameByte, "ISO8859-1");

			response.setContentType("application/x-msdownload");
			response.setContentLength(bytes.length);
			response.setHeader("Content-Disposition", "attachment;filename=" + filename);
			response.getOutputStream().write(bytes);
		} catch (Exception ex) {
		}
	}
	
	/**
	 * .
	 * 查看认领进度. 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/claim-statistic", method = RequestMethod.GET)
	public String toClaimStatistic(HttpServletRequest request) {
		return "/admin/claim-statistic";
	}
	
	/**
	 * .
	 * 看认领进度. (进度统计):  request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis}
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/claim-statistic", method = RequestMethod.POST)
	@ResponseBody
	public Object claimStatistic(HttpServletRequest request) {
		String type = request.getParameter("awardsType");
		Map<String,Integer> statisticalMap = new HashMap<String,Integer>();
		
		switch(type) {
		    case "patent":statisticalMap=patentService.selectStatistic() ;break;
		    case "enPeriodicalThesis":statisticalMap=enPeriodicalThesisService.selectStatistic();break;
		    case "chPeriodicalThesis": statisticalMap=chPeriodicalThesisService.selectStatistic();break;
		}
		
		//退出,并返回"无该类型文档"
		statisticalMap.isEmpty();
		
		return statisticalMap;
	}
	
	/**
	 * .
	 * 查看所有未认领的awards
	 * @param request
	 * @param mv 包含对象:{notClaimedAwardsList} :未认领awards对象的list
	 * @return
	 */
	@RequestMapping(value = "/notClaimed-list", method = RequestMethod.GET)
	public String toNotClaimedList(HttpServletRequest request,ModelAndView mv) {
		return "/admin/notClaimed-list";
	}
	
	/**
	 * .
	 * 查看所有未认领的awards
	 * @param request
	 * @param mv 包含对象:{notClaimedAwardsList} :未认领awards对象的list
	 * @return
	 */
	@RequestMapping(value = "/notClaimed-list", method = RequestMethod.POST)
	@ResponseBody
	public Object notClaimedList(HttpServletRequest request) {

		String type = request.getParameter("awardsType");
		int pageNum = Integer.valueOf(request.getParameter("pageNum"));
		int pageSize = Integer.valueOf(request.getParameter("pageSize"));
		
	    PageHelper.startPage(pageNum,pageSize);
		switch(type) {
		    case "patent": return new PageInfo<Patent>(patentService.selectByStatus("未认领"));
		    case "enPeriodicalThesis": return new PageInfo<EnPeriodicalThesis>(enPeriodicalThesisService.selectByStatus("未认领"));
		    case "chPeriodicalThesis": return new PageInfo<ChPeriodicalThesis>(chPeriodicalThesisService.selectByStatus("未认领"));
		    default : return "";
		}
	}
	
	/**
	 * .
	 * 查看所有未认领的awards
	 * @param request
	 * @param mv 包含对象:{notClaimedAwardsList} :未认领awards对象的list
	 * @return
	 */
	@RequestMapping(value = "/user-manage", method = RequestMethod.GET)
	public String toManageUser(HttpServletRequest request,ModelAndView mv) {
		return "/admin/user-manage";
	}

	/**
	 * . 
	 * 重置用户密码
	 * @return
	 */
	@RequestMapping(value = "/reset-user-password", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object resetUserPassword(HttpServletRequest request) {
		String msg = "";
		Integer id = Integer.valueOf(request.getParameter("id"));
		User user = userService.selectUserByPrimaryKey(id);
		user.setPassword(user.getNumber());
		if  (userService.updateByPrimaryKeySelective(user) == 1) {
			msg = user.getName()+"初始化密码成功";
		}else {
			msg = user.getName()+"初始化密码失败";
		}
		return "{\"msg\":\"" + msg + "\"}";
	}
	
	/**
	 * . 
	 * 删除用户
	 * @return
	 */
	@RequestMapping(value = "/delete-user", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object deleteUser(HttpServletRequest request) {
		String msg = "";
		Integer id = Integer.valueOf(request.getParameter("id"));
		User user = userService.selectUserByPrimaryKey(id);
		msg = user.getName();
		int i = userService.deleteUserByPrimaryKey(id);
		if  (i == 1) {
			msg = "已删除用户:"+ msg;
		}else {
			msg = "删除用户失败" + msg;
		}
		return "{\"msg\":\"" + msg + "\"}";
	}

	
    /**
     * .
     * 模糊查找一个用户.
     * @return
     */
    @RequestMapping(value = "/user-search/{pageNum}", method = RequestMethod.POST)
    @ResponseBody
    public Object fuzzySearchUser(
    		@RequestParam("name")String name,
    		@RequestParam("number")String number,
    		@RequestParam("college")String college,
    		@PathVariable("pageNum")int pageNum){
    	User u = new User();
    	//非空判断 => 设值 用于查询.
    	
    	if(!"".equals(name) && name != null) {
    		u.setName(name);
    	}
    	if(!"".equals(number) && number != null) {
    		u.setNumber(number);
    	}
    	if(!"".equals(college) && college != null) {
    		u.setCollege(college);
    	}
    	
    	PageHelper.startPage(pageNum,30);
    	return new PageInfo<User>(userService.searchUserFuzzyQuery(u));
    }
    
    /**
     * .
     * 模糊查找一个学院.
     * @return
     */
    @RequestMapping(value = "/college-search/{pageNum}", method = RequestMethod.POST)
    @ResponseBody
    public Object fuzzySearchCollege(
    		@RequestParam("name")String name,
    		@PathVariable("pageNum")int pageNum){
    	
    	PageHelper.startPage(pageNum,30);
		return new PageInfo<College>(collegeService.searchByName(name));
    	//return new PageInfo<College>(collegeService.selectAll());
    }

    /**
     * .
     * 删除一个学院.
     * @return
     */
    @RequestMapping(value = "/college-delete/{id}", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public Object deleteCollege(
    		@PathVariable("id")int id){
    	
    	String msg = "";
    	if(id >0) {
    		if(collegeService.deleteByPrimaryKey(id) == 1) {
    			msg = "删除成功";
    		}else {
    			msg = "删除失败";
    		}
    	}else {
    		msg = "选择数据有误，请再试一次";
    	}
		return "{\"msg\":\"" + msg + "\"}";
    }
    
    /**
     * .
     * 
     * @param type 处理类型{create | update}
     * @param request
     * @return
     */
	@RequestMapping(value = "/college-operate", method = RequestMethod.POST)
	@ResponseBody
	public Object addCollege(@RequestParam("type") String type,HttpServletRequest request) {
		
		String msg = "";//兼任非法值检查
		if ("".equals(type) || type == null) {
			msg = "类型有误，请再试一次";
		} 
		
		if ("".equals(msg)) {//如果msg没报错
			String name = request.getParameter("name");
			if ("".equals(name) || name == null) {
				msg += "名称有误，请再试一次";
			}

			//create 添加 
			if("".equals(msg) && type.equals(CollegeOperationType.CREATE.toString())) {
				if(collegeService.create(new College(name))==1) {
					msg = "添加学院:[" + name + "]成功";
				}else {
					msg = "添加学院失败";
				}
			}
			
			//update 更新
			if("".equals(msg) && type.equals(CollegeOperationType.UPDATE.toString())) {
				int id = Integer.valueOf(request.getParameter("id"));
				
				//利用逻辑与 "短路" 现象
				if("".equals(msg) && 
						id > 0 &&
						collegeService.updateByPrimaryKeySelective(new College(id,name)) == 1) {
					msg = "添加学院:[" + name + "]成功";
				}else {
					msg = "添加学院失败";
				}
			}
			
		}	

		return "{\"msg\":\"" + msg + "\"}";
	}
    
    
}
