package ${model.ext.parentPackage};

import java.util.List;

import net.zweb.core.config.ZWebConfig;
import net.zweb.core.config.ZWebConfig.SqlConfig;
import net.zweb.core.config.ZWebConfig.SqlConfig.Sql;
import net.zweb.core.db.Db;
import net.zweb.core.ioc.annotation.Inject;
import net.zweb.core.ioc.annotation.Resource;
import net.zweb.core.util.CommonUtil;
import system.query.Query;
import net.zweb.core.mvc.annotation.BeanParam;

import system.common.Page;
import system.common.DbSortUtil;
#if($model.getCategoryField() && $model.getCategoryField().getDictType())

import system.dict.Dict;
import system.dict.DictService;
#end

/**
 * ${model.text} 服务类
 * @author 
 * @createtime ${CommonUtil.getNowTime()}
 */
@Resource
public class ${model.ext.Name}Service {
	
	@Inject
	private Db db;
	public void setDb(Db db) {
		this.db = db;
	}
	
	private SqlConfig sqlCfg;
	@Inject
	private ZWebConfig config;
	public void setConfig(ZWebConfig config) {
		this.config = config;
		if (this.config.getSqlConfig() == null)
            throw new RuntimeException("db.sql not found in config file");
        
        this.sqlCfg = this.config.getSqlConfig().getConfig("${model.ext.Name}");
        if (config == null)
            throw new RuntimeException("db.sql.${model.ext.Name} not found in config file");
	}
	#if($model.getCategoryField() && $model.getCategoryField().getDictType())
		
	@Inject
    private DictService dictService;
    public void setDictService(DictService dictService) {
        this.dictService = dictService;
    }
    #end
	
	/**
	 * 查询、导出列表
	 */
	public Page<${model.ext.Name}> list(SearchForm searchForm) {
		/* 从sql配置中解析获取语句和参数列表 */
		Sql sqlMap = sqlCfg.getSql("list", searchForm);
		String sql = sqlMap.sql;
		List<Object> args = sqlMap.args;
		
		/* 处理数据权限 */
		Query filter = searchForm.query;
		String priviFilter = filter.getValue();
		if (!CommonUtil.isBlank(priviFilter)) {
			sql = sql + " AND ( " + priviFilter + " )";
			args.addAll(filter.args());
		}
		
		/* 处理@Category分类过滤 */
		#if($model.getCategoryField())
		
        if (!CommonUtil.isBlank(searchForm.${model.getCategoryField().fieldName})) {
	        #if($model.getCategoryField().getDictType())
	        
	        String dictTbl = db.getFullTable(Dict.class);
	        String dictType = "$model.getCategoryField().getDictType()";
	        sql = sql + " AND ( ${model.getCategoryField().columnName} = ? or ${model.getCategoryField().columnName} in ( select t1.dict_value from "+dictTbl+" t1 where FIND_IN_SET(?, t1.pid_path) ) )";
            args.add(searchForm.${model.getCategoryField().fieldName});
            Dict ${model.getCategoryField().fieldName}Dict = this.dictService.findByTypeAndValue(dictType, searchForm.${model.getCategoryField().fieldName}, filter);
            args.add(${model.getCategoryField().fieldName}Dict.getId());
            #else
                
            sql = sql + " AND ( ${model.getCategoryField().columnName} = ? )";
            args.add(searchForm.${model.getCategoryField().fieldName});
            #end
            
        }
	    #end

		/* 查询总数 */
		long c = db.selectOne(Long.class, "SELECT COUNT(1) FROM ( " + sql + " ) result", args.toArray());
		if (searchForm.pageSize == -1)
			searchForm.pageSize = (int) c;
		
		/* 处理排序 */
		String sort =  DbSortUtil.getSort(searchForm.sortField, searchForm.sortOrder, ${model.ext.Name}.class);
		if(CommonUtil.isBlank(sort)) sort =  " order by ${model.getIdField().getColumnName()} desc";
		
		/* 分页参数 */
		args.add(searchForm.pageIndex * searchForm.pageSize);
		args.add(searchForm.pageSize);
		
		/* 查询获取数据 */
		List<${model.ext.Name}> data = db.select(${model.ext.Name}.class, sql + " " + sort + " limit ?,?", args.toArray());
		db.cascadeSelect(data);
		/* 封装响应内容 */
		Page<${model.ext.Name}> r = new Page<${model.ext.Name}>();
		r.setData(data);
		r.setTotal(c);
		
		return r;
	}
	
	/**
	 * 查询操作提交的参数
	 * @author 赖伟威(l.weiwei@163.com)
	 * @date 2014-1-9 下午01:23:04
	 */
	public static class SearchForm {
		
	    public String key;
	    public int pageIndex; 
        public int pageSize;
        public String sortField;
        public String sortOrder;
        public String ids;
        public @BeanParam Query query;
        #if($model.getParentField())
        
        public String ${model.getParentField().fieldName};
        #end
        #if($model.getCategoryField())
        
        public String ${model.getCategoryField().fieldName};
	    #end
		#foreach($field in $model.searchableFields) 
		#if($field.isDate() || (!$field.isDict() && $field.isNumber()))
		
		public String ${field.fieldName}Start;
		public String ${field.fieldName}End;
		#else
		
		public String $field.fieldName;
		#end
		#end
		#foreach($field in $model.searchableFields) 
		#set($fieldName = $CommonUtil.toUpCaseFirst("${field.fieldName}"))
		#if($field.isDate() || (!$field.isDict() && $field.isNumber()))
		
		public String get${fieldName}Start(){
			return this.${field.fieldName}Start;
		}
		public void set${fieldName}Start(String ${field.fieldName}Start){
			this.${field.fieldName}Start = ${field.fieldName}Start;
		}
		public String get${fieldName}End(){
			return this.${field.fieldName}End;
		}
		public void set${fieldName}End(String ${field.fieldName}End){
			this.${field.fieldName}End = ${field.fieldName}End;
		}
		#else
		
		public String get${fieldName}(){
			return this.${field.fieldName};
		}
		public void set${fieldName}(String ${field.fieldName}){
			this.${field.fieldName} = ${field.fieldName};
		}
		#end
		#end
		
		public String getIds() {
			return ids;
		}
		public void setIds(String ids) {
			this.ids = ids;
		}
		public void setKey(String key) {
		    this.key = key;
		}
		public String getKey() {
		    return this.key;
		}
		public int getPageIndex() {
            return this.pageIndex;
        }
        public void setPageIndex(int pageIndex) {
            this.pageIndex = pageIndex;
        }
        public int getPageSize() {
            return this.pageSize;
        }
        public void setPageSize(int pageSize) {
            this.pageSize = pageSize;
        }
        public String getSortField() {
            return this.sortField;
        }
        public void setSortField(String sortField) {
            this.sortField = sortField;
        }
        public String getSortOrder() {
            return this.sortOrder;
        }
        public void setSortOrder(String sortOrder) {
            this.sortOrder = sortOrder;
        }
		#if($model.getCategoryField())
		#set($Name = $CommonUtil.toUpCaseFirst("${model.getCategoryField().fieldName}"))
		
		public String get${Name}(){
            return this.${model.getCategoryField().fieldName};
        }
        public void set${Name}(String ${model.getCategoryField().fieldName}){
            this.${model.getCategoryField().fieldName} = ${model.getCategoryField().fieldName};
        }
        #end
        #if($model.getParentField())
        #set($Name = $CommonUtil.toUpCaseFirst("${model.getParentField().fieldName}"))
        
        public String get${Name}(){
            return this.${model.getParentField().fieldName};
        }
        public void set${Name}(String ${model.getParentField().fieldName}){
            this.${model.getParentField().fieldName} = ${model.getParentField().fieldName};
        }
        #end
        
        public void setQuery(Query query) {
            this.query = query;
        }
        public Query getQuery() {
            return this.query;
        }
	}
}