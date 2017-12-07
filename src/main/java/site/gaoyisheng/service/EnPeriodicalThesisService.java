/*
 * file_name: EnPeriodicalThesisService.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月14日 上午9:43:20
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.service;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.gaoyisheng.dao.EnPeriodicalThesisMapper;
import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.utils.FileUtil;

@Service
public class EnPeriodicalThesisService {

	@Autowired
	private EnPeriodicalThesisMapper thesisDao;

	/**
	 * .
	 * TODO 查询所有
	 * @return
	 */
	public List<EnPeriodicalThesis> selectAll() {
		return thesisDao.selectAll();
	}

	/**
	 * .
	 * TODO 通过认领状态查询
	 * @param status
	 * @return
	 */	
	public List<EnPeriodicalThesis> selectByStatus(String claimStatus) {
		return thesisDao.selectByStatus(claimStatus);
	}
	
	/**
	 * .
	 * TODO  通过认领状态查询,+分页参数:重载
	 * @param status
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<EnPeriodicalThesis> selectByStatus(String claimStatus,int pageNum,int pageSize) {
		return thesisDao.selectByStatus(claimStatus,pageNum,pageSize);
	}

	/**
	 * . 
	 * TODO 统计: "已认领"="claimed"  ,"notClaimed"="未认领"  ,总数="total"
	 * 
	 * @return
	 */
	public Map<String, Integer> selectStatistic() {
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("claimed", thesisDao.selectCountByStatus("已认领"));
		map.put("notClaimed", thesisDao.selectCountByStatus("未认领"));
		map.put("total", thesisDao.selectCount());

		return map;
	}

	/**
	 * .
	 * TODO 主键查询
	 * @param thesisId
	 * @return
	 */
	public EnPeriodicalThesis selectByPrimaryKey(Integer thesisId) {
		return thesisDao.selectByPrimaryKey(thesisId);
	}

	/**
	 * .
	 * TODO 多条件查询
	 * @param map
	 * @return
	 */
	public List<EnPeriodicalThesis> selectByMultiConditions(Map<String, String> map) {
		return thesisDao.selectByMultiConditions(map);
	}
	
	/**
	 * .
	 * TODO 多条件查询 +分页参数:重载
	 * @param map
	 * @return
	 */
	public List<EnPeriodicalThesis> selectByMultiConditions(Map<String, String> map,int pageNum,int pageSize) {
		return thesisDao.selectByMultiConditions(map,pageNum,pageSize);
	}

	/**
	 * .
	 * TODO 通过主键更新.(值为  null , '' 的字段将不被更新)
	 * @param p
	 * @return
	 */
	public int updateByPrimaryKeySelective(EnPeriodicalThesis p) {
		return thesisDao.updateByPrimaryKeySelective(p);
	}
	
	/**
	 * .
	 * TODO 将数据流读取并批量插入
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public int readStreamAndInsertList(InputStream in) throws Exception {
		FileUtil fileUtil = new FileUtil();
		List<EnPeriodicalThesis> thesisList = fileUtil.importFileOfEnPeriodicalThesis(in);
		
		//每1500为一段 插入
		return recurSub(thesisList,1000);
	}

	/**
	 * .
	 * TODO  批量插入
	 * @param thesisList
	 * @return
	 * @throws Exception
	 */
	public int insertList(List<EnPeriodicalThesis> thesisList) throws Exception {
		return thesisDao.insertList(thesisList);
	}
	
	/**
	 * .
	 * TODO 递归:分割长List为 subNum/段。
	 * @param thesisList 论文list(总)
	 * @param subNum 每段长度 (最小1)
	 * @return
	 * @throws Exception
	 */
	private int recurSub(List<EnPeriodicalThesis> thesisList,int subNum) throws Exception{
		//参数合法性判断:
		if(thesisList.isEmpty()) return 0;
		if(subNum<1) return 0;
				
		//大于subNum，进入分割
		if(thesisList.size() > subNum) {// && !(thesisList.isEmpty())
			//将前subNum分出来，直接插入到数据库。
			List<EnPeriodicalThesis> toInsert = thesisList.subList(0, subNum);
			//将subNum至最后 (剩余部分) 继续进行递归分割
			List<EnPeriodicalThesis> toRecurSub = thesisList.subList(subNum, thesisList.size());
			
			//将前subNum分出来，直接插入到数据库 && 将subNum+1至最后 (剩余部分) 继续进行递归分割 。统计数量
			return insertList(toInsert) + recurSub(toRecurSub,subNum);
			
		//少于subNum，直接插入数据库 (递归出口)
		}else {
			//插入到数据库。统计数量
		    return insertList(thesisList);
		}
	}
}
