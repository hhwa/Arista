package stadium;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;
import stadium.stadiumpagingAction;



public class stadiumlistAction extends ActionSupport {
	
	public static Reader reader;     //파일 스트림을 위한 reader. sql id를 사용하기 위해
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 휘한 sqlMapper 객체.
	
	private List<stadiumVO> list = new ArrayList<stadiumVO>(); //sql쿼리에서 경기장의 정보를 싹다 뽑아와서 list에 저장
	
	private String SearchKeyword;
	private int SearchNum;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private stadiumpagingAction page;
	private int num=0;
	
	public stadiumlistAction()throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);   
		reader.close();
	}
	
	public String execute() throws Exception{
		   
		if(getSearchKeyword() != null)
		   {
			   return search();
		   }
		list = sqlMapper.queryForList("stadiumSQL.stadiumList"); //stadiumSQL의 stadiumList의 쿼리문을 실행해서 List에 넣는다.
		
		totalCount = list.size();
		
		page = new stadiumpagingAction(currentPage, totalCount, blockCount, blockPage,num,"");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount()<totalCount)
			lastCount = page.getEndCount() +1;
		
		list= list.subList(page.getStartCount(), lastCount);
		
		
		
		return SUCCESS;
	}
	
	public String search() throws Exception{
		
		SearchKeyword = new String(SearchKeyword.getBytes("iso-8859-1"),"euc-kr");
		String column;
		if(SearchNum ==0) {
			column="stadium_name";
		}
		else if(SearchNum ==1) {
			column="stadium_addr";
		}
		else
		{
			column="stadium_tel";
		}
		 Map<String,String> search = new HashMap<String, String>();
		 
		 search.put("param1",column);
         search.put("param2","%"+getSearchKeyword()+"%");
		
		list =  sqlMapper.queryForList("stadiumSQL.stadiumSearch",search);
		
		totalCount = list.size();
		page = new stadiumpagingAction(currentPage, totalCount, blockCount, blockPage, SearchNum, getSearchKeyword());
        pagingHtml = page.getPagingHtml().toString();
        
        int lastCount = totalCount;
        
        if(page.getEndCount() < totalCount)
        	lastCount = page.getEndCount() +1;
        
         list = list.subList(page.getStartCount(), lastCount);
         return SUCCESS;
	}
    
	
	public String getSearchKeyword() {
		return SearchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.SearchKeyword = searchKeyword;
	}

	public int getSearchNum() {
		return SearchNum;
	}

	public void setSearchNum(int searchNum) {
		SearchNum = searchNum;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		stadiumlistAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		stadiumlistAction.sqlMapper = sqlMapper;
	}

	public List<stadiumVO> getList() {
		return list;
	}

	public void setList(List<stadiumVO> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public stadiumpagingAction getPage() {
		return page;
	}

	public void setPage(stadiumpagingAction page) {
		this.page = page;
	}
	
	

	
}
