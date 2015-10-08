package ${model.ext.parentPackage};

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import system.dict.Dict;
import system.dict.DictService;
import system.util.TreeUtil;
import net.zweb.core.db.Db;
#if($model.getCategoryField().isDict())
#if($model.getCategoryField().getDicts() && $model.getCategoryField().getDicts().size()>0)
	
import net.zweb.core.db.config.MetaModel;
import net.zweb.core.db.config.MetaModel.MetaField;
#end
#end

import net.zweb.core.ioc.annotation.Inject;
import net.zweb.core.mvc.Result;
import net.zweb.core.mvc.Results;
import net.zweb.core.mvc.annotation.After;
import net.zweb.core.mvc.annotation.BeanParam;
import net.zweb.core.mvc.annotation.Controller;
import net.zweb.core.mvc.annotation.Default;
import net.zweb.core.mvc.annotation.POST;
import net.zweb.core.mvc.annotation.Param;
import net.zweb.core.mvc.annotation.Path;
import net.zweb.core.util.CommonUtil;
import system.query.Query;
import system.common.Page;

import zweb.plugins.excel.ZWebExcel;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import ${model.ext.parentPackage}.${model.ext.Name}Service.SearchForm;

/**
 * ${model.text}控制器
 * <p>处理Web请求响应</p>
 */
@Controller
@Path("${model.ext.path}")
public class ${model.ext.Name}Controller {
	
	/**
	 * 数据库操作对象
	 */
	private Db db;
	/**
	 * 框架使用此方法进行注入Db对象
	 * @param db
	 */
	public void setDb(Db db) {
		this.db = db;
	}
	
    @Inject
    private ${model.ext.Name}Service service;
    public void setService(${model.ext.Name}Service service) {
        this.service = service;
    }
    
	/**
	 * 查询列表
	 */
	public Result list(@BeanParam SearchForm searchForm){
		Page<${model.ext.Name}> r = this.service.list(searchForm);

		/* 序列化成JSON格式内容 */
		String json = JSON.toJSONStringWithDateFormat(r, "yyyy-MM-dd HH:mm:ss", SerializerFeature.DisableCircularReferenceDetect);
		return Results.json(json);
	}
	
	/**
	 * 导出Excel
	 */
	@Path("/export")
	@After(ZWebExcel.class)
	public Result export(@BeanParam SearchForm searchForm) {
		//导出操作不需要分页
		searchForm.setPageSize(-1);
		searchForm.setPageIndex(0);
		
		//调用查询业务
		Page<${model.ext.Name}> r = this.service.list(searchForm);
		
		//封装Excel模板渲染需要的数据结构体
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("data", r.getData());
		datas.put("total", r.getTotal());
		
		//渲染Excel
		return Results.next()
				.setParam("template", "${model.ext.path}/export.xls")
				.setParam("datas", datas);
	}
	
	/**
	 * 添加/更新数据
	 */
	@POST
	public Result save(@Param("data")String data) {
		${model.ext.Name} form = JSON.parseObject(data, ${model.ext.Name}.class);
		db.save(form);
		return Results.ok();
	}
	
	#if(${model.getCategoryField()})
	
	@Path("/categories")
	public Result categories(@Param("${model.getCategoryField().fieldName}")String key, @BeanParam("query")Query query){
	    if (key == null) key = "";
	    String json = null;
	    List<?> r = new ArrayList<Object>();
	    #set($field = $model.getCategoryField())
	    #if($field.isDict())
        #set($dicts = $field.getDicts())
        #if($dicts && $dicts.size()>0)
                
        MetaModel mm = db.getMetaModel(${model.ext.Name}.class);
	    MetaField mf = mm.getCategoryField();
	    List<Map<String, Object>> dicts = mf.getDicts();
        for (Map<String, Object> m : dicts) {
            if (!CommonUtil.isBlank(key) && !String.valueOf(m.get("text")).startsWith(key))
                continue;
            r.add(m);
        }
	    #else
	    
	    List<Object> args = query.args();
	    String filter = "1=1";
	    if (!CommonUtil.isBlank(query.getValue()))
	        filter = query.getValue();
	    args.add("${field.ext.dict_type}");
        Dict parent = db.selectOneByWhere(Dict.class, filter + " and is_type = 1 and dict_value = ?", args.toArray());
        if (parent != null) {
            args = query.args();
            args.add(parent.getId());
            args.add("%"+key+"%");
            List<Dict> data = db.selectByWhere(Dict.class, filter + " and pid = ? and dict_code like ?", args.toArray());
            if (data != null) {
                r = TreeUtil.build(data, db);
            }
        }
        #end
        #elseif($field.isFk())
        #set($refModel = ${field.reference.model})
        
        List<Object> args = query.args();
        String filter = "1=1";
        if (!CommonUtil.isBlank(query.getValue()))
            filter = query.getValue();
        args.add("%"+key+"%");
        List<${refModel.ext.Name}> ms = db.selectByWhere(${refModel.ext.Name}.class, filter + " and ${refModel.getNameField().columnName} like ?", args.toArray());
        if (ms != null) {
            for (${refModel.ext.Name} m : ms) {
                Map<String, Object> map = new HashMap<String, Object>();
                #set($upName = $CommonUtil.toUpCaseFirst(${refModel.getNameField().fieldName}))
                #set($upId = $CommonUtil.toUpCaseFirst(${refModel.getIdField().fieldName}))
                
                map.put("text", m.get${upName}());
                map.put("value", m.get${upId}());
                r.add(map);
            }
        }
        #end
        
        json = JSON.toJSONStringWithDateFormat(r, "yyyy-MM-dd HH:mm:ss", SerializerFeature.DisableCircularReferenceDetect);
        return Results.json(json);
	}
	#end
	
	/**
	 * 通过ID查询
	 */
	@Path("/{id}")
	public Result getById(@Param("id")Long id){
		${model.ext.Name} db_r = db.selectById(${model.ext.Name}.class, id);
		String json = "";
		if (db_r != null) {
			#if($model.ext.hasFk)
				
			db.cascadeSelect(db_r);
			#end
			
			json = JSON.toJSONStringWithDateFormat(db_r, "yyyy-MM-dd HH:mm:ss", SerializerFeature.DisableCircularReferenceDetect);
		}
		return Results.json(json);
	}
	
	#if(${model.getNameField()})
	    
	/**
	 * 通过名称查询
	 */
	@Path("/get_by_name")
	public Result get_by_name(@Param("${model.getNameField().fieldName}")String ${model.getNameField().fieldName}){
	    ${model.ext.Name} db_r = db.selectOneByWhere(${model.ext.Name}.class, "${model.getNameField().columnName} = ?", ${model.getNameField().fieldName});
		String json = "";
		if (db_r != null) {
			#if($model.ext.hasFk)
				
			db.cascadeSelect(db_r);
			#end
			
			json = JSON.toJSONStringWithDateFormat(db_r, "yyyy-MM-dd HH:mm:ss", SerializerFeature.DisableCircularReferenceDetect);
		}
		return Results.json(json);
	}
	#end
	
	/**
	 * 批量删除
	 */
	@POST
	public Result delete(@Param("id")@Default("")String id){
		List<Long> idList = new ArrayList<Long>();
		String[] ids = id.split(",");
		for (String _id : ids) 
			idList.add(CommonUtil.toLong(_id.trim()));
		
		if (idList.isEmpty())
			return Results.not_acceptable("请选择${model.text}");
		
		db.batchDeleteById(${model.ext.Name}.class, idList.toArray());
		return Results.ok();
	}

}