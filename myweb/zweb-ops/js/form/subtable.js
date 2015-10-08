function subTable(name){
	this.table=$("table[name="+name+"]");
	this.canWrite=(this.table.attr('right') == 'write');
}

subTable.prototype={
		init:function(){
			//保存模板行
			var row=this.table.find('tr[type="edit"]:first');

			//不可写将控件加上readonly
			if(!this.canWrite){
				//隐藏
				$(".add",this.table).css("display","none");
				$(".del",row).css("display","none");

				row.find("input:text,textarea").addClass("readonly");
			}

			this.table.data('row', $('<div></div>').append(row.clone()).html());
			//隐藏模板行
			row.css('display', 'none').html('');
			//添加 删除事件
			this.handButton();
		},
		handButton:function(){
			var self=this;
			if(!this.canWrite) {
				return;
			};
			$(".add",this.table).click(function(){
				self.add();
			});

			this.table.delegate(".del", "click", function(){
			      $(this).closest('[type]').remove();
			});
		},
		add:function(dataRow){
			var self=this;
			var newrow = $(this.table.data('row'));
			this.table.find('tr[type]').last().after(newrow);
			//初始化miui控件
			mini.parse();
			var rowRet = this.table.find('tr[type]').last();
			if(dataRow){
				 var form=new mini.Form(self.table.find("tr[type=edit]:last").get(0));
			     form.setData(dataRow);//设置多个控件数据
			}
			if(!self.canWrite){
		    	 //做只读处理
				self.readonlyProcess(rowRet);
		    }
			return rowRet ;
		},
		getData:function(){
			//子表数据
			var sub = [];

			this.table.find('[type=edit]').each(function() {
				//不为空的
				if($(this).html()){
					var row = null;
					var rowitem = new mini.Form(this);
					var data = rowitem.getData();      //获取表单多个控件的数据
					//row = mini.encode(data);   //序列化成JSON
					sub.push(data);
				}
			});

			return sub;
		},
		setData:function(id){
			var url=this.table.attr("url");

			var self=this;
			 $.ajax({
					url : url,
					type : 'post',
					cache : false,
					data : {"parent_id":id},
					success : function(json) {
						if(!json){
							return;
						}
						for(var i=0;i<json.length;i++){
							 self.add();
							 var form=new mini.Form(self.table.find("tr[type=edit]:last").get(0));
						     form.setData(json[i]);//设置多个控件数据
						}
						if(!self.canWrite){
					    	 //做只读处理
							self.readonlyProcess();
					    }
					}
			})
		},
		readonlyProcess:function(newRow){
			var textareas = (newRow)? newRow.find("textarea") : $("textarea") ;
			textareas.each(function(index){
				var container=$(this).parent().parent();
				var flag = container.hasClass("readonly");
				if(flag){
					var innerHtml = container.html();
					var content = $(this).val();
					$(this).parent().parent().after("<div class='sub-linestext'><pre style='font-family: 微软雅黑;width:100%;text-align:left'>"+content+"</pre></div>");
					$(this).parent().parent().wrap("<span style='display:none'></span>");

				}
			});
	var inputs = (newRow)? newRow.find("input[type='text'],input[type='input']") : $("input[type='text'],input[type='input']") ;
	      inputs.each(function(index){
					var container=$(this).parent().parent();
					var flag = container.hasClass("readonly");
					if(flag){
						var innerHtml = container.html();
						var content = $(this).val();
						$(this).parent().parent().after("<div style='display:inline-block;font-family: 微软雅黑'>"+content+"</div>");
						$(this).parent().parent().wrap("<span style='display:none'></span>");

					}
				});
		}
}


/**
 * TaskTable
 *   实现行级别的编辑和只读控制.
 * @author fanjf
 */
//扩展subTable表
function TaskTable(name){
	var self=this;
	self.name=name ;
}

TaskTable.prototype={
		init: function(){
			var self=this;
			self.table=$("table[name="+self.name+"]");
			self.canWrite=(self.table.attr('right') == 'write');
			//保存模板行
			var row=self.table.find('tr[type="edit"]:first');

			self.table.data('rowWirte', $('<div></div>').append(row.clone()).html());
			//隐藏
			$(".add",self.table).css("display","none");
			$(".del",row).css("display","none");

			row.find("input:text,textarea").addClass("readonly");
			self.table.data('rowRead', $('<div></div>').append(row.clone()).html());

			self.setWritable(self.canWrite) ;

			//隐藏模板行
			row.css('display', 'none').html('');
			//添加 删除事件
			self.handButton();
		},
		setWritable:function(canWrite){
			var self = this ;
			self.canWrite = canWrite ;
			var row ;
			if(self.canWrite){
				row = self.table.data('rowWirte') ;
			}else{
				row = self.table.data('rowRead') ;
			}
			self.table.data('row',row) ;
		},
		loadTask:function(params){
			var url=this.table.attr("url");
			var self=this;
			 $.ajax({
					url : url,
					type : 'post',
					cache : false,
					data : params,
					success : function(json) {
						if(!json || !json.data) {
							return ;
						}
						var oldValue = self.canWrite ;
						for(var i=0;i<json.data.length;i++){
							 var rowData = json.data[i] ;
							 if(typeof self.initRowData =='function'){
								 self.initRowData(rowData);
							 }
							 if(typeof rowData.editflag == 'boolean'){
								 self.setWritable(rowData.editflag);
							 }
							 self.add(rowData);
						}
						self.setWritable(oldValue) ;
						if(typeof self.afterDataLoad == 'function')
							self.afterDataLoad();
					}
			})
		}
};

TaskTable.prototype = $.extend(new subTable(),TaskTable.prototype);
TaskTable.prototype.constructor = TaskTable ;
