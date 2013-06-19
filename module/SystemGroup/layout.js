/*
	Copyright 2013 x10c-lab.com
	Authors:
		- mhd.sulhan (sulhan@x10c-lab.com)
*/
var SystemGroupGroup;
var SystemGroupUser;

function JxSystemGroup_User ()
{
	this.id		= "SystemGroup_User";
	this.dir	= _g_module_dir + this.id.replace (/_/g, "/");

	this.store			= Ext.create ("Jx.StorePaging", {
			storeId		:this.id
		,	url			:this.dir +"/data.jsp"
		,	extraParams	:
			{
				_group_id	:0
			}
		,	fields		:
			[
				"id"
			,	"_user_id"
			,	"_user_name"
			,	"_user_realname"
			,	"_group_id"
			]
		});

	this.storeNon		= Ext.create ("Jx.StorePaging", {
			storeId		:this.id +"Non"
		,	url			:this.dir +"/data_non.jsp"
		,	extraParams	:
			{
				_group_id	:0
			}
		,	fields		:
			[
				"_user_id"
			,	"_user_realname"
			]
		});

	this.fUserId			= Ext.create ("Jx.ComboPaging", {
			id				:"_user_id"
		,	store			:this.storeNon
		,	valueField		:"_user_id"
		,	displayField	:"_user_realname"
		,	allowBlank		:false
		});

	this.panel				= Ext.create ("Jx.GridPaging.FormEditor", {
			id				:this.id
		,	panelConfig		:
			{
				region			:"east"
			,	split			:true
			,	width			:"50%"
			,	title			:"Users of Group"
			}
		,	formConfig		:
			{
				region			:"south"
			,	syncUseStore	:false
			}
		,	store			:this.store
		,	__class__		:this
		,	columns			:
			[{
				header			:"ID"
			,	dataIndex		:"id"
			,	hidden			:true
			,	editor			:
				{
					xtype			:"textfield"
				,	hidden			:true
				}
			},{
				header			:"User"
			,	dataIndex		:"_user_id"
			,	hidden			:true
			,	editor			:this.fUserId
			},{
				header			:"Group"
			,	dataIndex		:"_group_id"
			,	hidden			:true
			,	editor			:
				{
					xtype			:"textfield"
				,	hidden			:true
				}
			},{
				header			:"User"
			,	dataIndex		:"_user_realname"
			,	flex			:1
			}]

		,	afterFormSave	:function (success)
			{
				if (success) {
					this.__class__.storeNon.load ();
					this.form.hide ();
				}
			}

			/* Disable combo _user_id before deletion */
		,	beforeDelete : function ()
			{
				this.__class__.fUserId.allowBlank		= true;
				this.__class__.fUserId.forceSelection	= false;
				this.__class__.fUserId.submitValue		= false;
				return true;
			}
		,	afterDelete : function ()
			{
				this.__class__.fUserId.allowBlank		= false;
				this.__class__.fUserId.forceSelection	= true;
				this.__class__.fUserId.submitValue		= true;
			}
		});

	this.doRefresh	= function (perm, id)
	{
		if (id <= 0) {
			this.panel.clearData ();
			return;
		}

		this.store.proxy.extraParams._group_id		= id;
		this.storeNon.proxy.extraParams._group_id	= id;
		this.storeNon.load ();
		this.panel.doRefresh (perm);
	}
}

function JxSystemGroup_Group ()
{
	this.id		= "SystemGroup_Group";
	this.dir	= _g_module_dir + this.id.replace (/_/g, "/");

	this.store			= Ext.create ("Jx.StorePaging", {
			storeId		:this.id
		,	url			:this.dir +"/data.jsp"
		,	fieldId		:"id"
		,	fields		:
			[
				"id"
			,	"name"
			]
		});

	this.panel				= Ext.create ("Jx.GridPaging.FormEditor", {
			id				:this.id
		,	panelConfig		:
			{
				region			:"center"
			,	title			:"Group of User"
			}
		,	formConfig		:
			{
				region			:"south"
			,	syncUseStore	:false
			}
		,	store			:this.store
		,	columns			:
			[{
				header			:"ID"
			,	dataIndex		:"id"
			,	hidden			:true
			,	editor			:
				{
					xtype			:"textfield"
				,	hidden			:true
				}
			},{
				header			:"Group name"
			,	dataIndex		:"name"
			,	flex			:1
			,	editor			:
				{
					xtype			:"textfield"
				,	allowBlank		:false
				}
			}]
		,	compDetails		:
			[
				SystemGroupUser
			]
		});

	this.doRefresh			= function (perm)
	{
		this.panel.doRefresh (perm);
	}
};

function JxSystemGroup ()
{
	this.id			="SystemGroup";
	this.dir		= _g_module_dir + this.id;

	SystemGroupUser		= new JxSystemGroup_User ();
	SystemGroupGroup	= new JxSystemGroup_Group ();

	this.panel			= Ext.create ("Ext.panel.Panel", {
			id			:this.id
		,	title		:"System Group"
		,	titleAlign	:"center"
		,	closable	:true
		,	layout		:"border"
		,	items		:
			[
				SystemGroupGroup.panel
			,	SystemGroupUser.panel
			]
		});

	this.doRefresh	= function (perm)
	{
		SystemGroupGroup.doRefresh (perm);
		SystemGroupUser.doRefresh (perm, 0);
	}
}

var SystemGroup = new JxSystemGroup ();
