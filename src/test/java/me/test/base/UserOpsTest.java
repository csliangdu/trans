/*
 * file_name: UserOpsTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月2日 下午9:43:07
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package me.test.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import site.gaoyisheng.dao.ChPeriodicalThesisMapper;
import site.gaoyisheng.pojo.ChPeriodicalThesis;
import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.pojo.Patent;
import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.pojo.User;
import site.gaoyisheng.service.ChPeriodicalThesisService;
import site.gaoyisheng.service.EnPeriodicalThesisService;
import site.gaoyisheng.service.PatentService;
import site.gaoyisheng.service.ThesisService;
import site.gaoyisheng.service.UserService;

public class UserOpsTest extends BaseTest {

	@Autowired
	private ChPeriodicalThesisService chService;
	
	@Autowired
	private PatentService ps;
	
	@Autowired
	private UserService us;
	
    @Test
    public void test(){
        ChPeriodicalThesis ch = new ChPeriodicalThesis();

        PageHelper.startPage(2,10);
        List<ChPeriodicalThesis> ls = chService.selectAll();
        
        PageInfo<ChPeriodicalThesis> pageInfo = new PageInfo<ChPeriodicalThesis>(ls);
        
        System.out.println("当前页面第一个元素在数据库中的行号: "+pageInfo.getStartRow()); 
        System.out.println("当前页面最后一个元素在数据库中的行号: "+pageInfo.getEndRow());
        System.out.println("总记录数: "+pageInfo.getTotal());
        System.out.println("总页数: "+pageInfo.getPages());

    }

/*	@Test
	public void loginTest() {

		User user = new User();
		user.setName("陈鹏");
		user.setNumber("123");
		
		List<Thesis> thesisList = ts.selectAllThesisLikeUserNameAndNumber(user);

//		List<Thesis> thesisList = ts.selectAllThesis();
		
		for (Thesis t : thesisList) {
			System.out.println(t.toString());

		}
	}
*/
	
/*	@Test
	public void updateTest() {
		Thesis thesis = new Thesis();

		//注掉此行 将没有数据被更新:
//		thesis.setId(3);
		thesis.setName("haha");
		thesis.setNo10AutherName("haha2");
		
		ts.updateByPrimaryKeySelective(thesis);
	}
*/
	
	@Test
	public void selectTest() {
		
//		List<EnPeriodicalThesis> enList = es.selectByStatus("未认领",1,2);
//		
//		for (EnPeriodicalThesis e : enList) {
//			System.out.println("---" + e.toString());
//		}
		
//		User u = new User();
//		u.setName("e");
//		List<User> userList = us.searchUserFuzzyQuery(u);
//		for (User user : userList) {
//			System.out.println(user.toString());
//
//		}
		
//		Map<String,String> map = new HashMap<String,String>();
//		
////		map.put("name", "1");
//		
//		List<Patent> patentList = ps.selectByMultiConditions(map);
//		for (Patent p : patentList) {
//			System.out.println(p.toString());
//
//		}
		
		//System.out.println(ts.selectByPrimaryKey(101));
		
//		List<EnPeriodicalThesis> list = ts.selectByStatus("未认领");
//		for (EnPeriodicalThesis e : list) {
//			System.out.println(e.toString());
//		}
		
		
//		Map<String,Integer> map = ts.selectStatistic();
//		
//		System.out.println("**************************** 已认领:"+map.get("claimed").toString());
//		System.out.println("**************************** 未认领:"+map.get("notClaimed").toString());
//		System.out.println("**************************** 总数  :"+map.get("total").toString());
		
		
		
	}	
	
	@Test
	public void insertListTest() {
//		List<Patent> thesisList = new ArrayList<Patent>();
//		List<User> thesisList = new ArrayList<User>();
//		
//		User t1 = new User();
//		User t2 = new User();
//		
//		Patent e1 =new Patent();
//		Patent e2 =new Patent();
//		Patent e3 =new Patent();
//		
//		e1.setName("Patent1");
//		e2.setName("Patent2");
//		e3.setName("Patent3");
//		
//		e1.setKeyId("11");
//		e2.setKeyId("12");
//		e3.setKeyId("13");
//		
//		e1.setClaimStatus("未认领");
//		e2.setClaimStatus("未认领");
//		e3.setClaimStatus("未认领");
//	    
//		e1.setAllAutherName("zhao si");
//		e2.setAllAutherName("Li .x");
//		e3.setAllAutherName("Wang. y");
//		
//		e1.setType("发明专利");
//		e2.setType("发明专利");
//		e3.setType("创新专利");
//		
//		e1.setVolume("11");
//		e2.setVolume("12");
//		e3.setVolume("13");
//		
//		t1.setName("qq1");
//		t2.setName("ww2");
//		
//		thesisList.add(e1);
//		thesisList.add(e2);
//		thesisList.add(e3);

//		try {
//			System.out.println(ps.insertList(thesisList));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

}
