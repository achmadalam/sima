insert into _menu (
		id	,pid	,type	,label			,icon	,image	,module			,description
) values (
		10	,0		,0		,'Referensi'	,'ref'	,''		,'Reference'	,''
);

insert into _menu (
		id	,pid	,type	,label			,icon	,image	,module					,description
) values (
		11	,10		,3		,'Tipe Aset'	,'ref'	,'../icons/reference.svg'		,'Reference_Asset_Type'	,''
);

insert into _menu (
		id	,pid	,type	,label				,icon	,image	,module							,description
) values (
		12	,10		,3		,'Pengadaan Aset'	,'ref'	,'../icons/reference.svg'		,'Reference_Asset_Procurement'	,''
);

insert into _menu (
		id	,pid	,type	,label				,icon	,image	,module							,description
) values (
		13	,10		,3		,'Status Aset'		,'ref'	,'../icons/reference.svg'		,'Reference_Asset_Status'		,''
);

insert into _menu (
		id	,pid	,type	,label				,icon	,image	,module							,description
) values (
		14	,10		,3		,'Lokasi Aset'		,'ref'	,'../icons/reference.svg'		,'Reference_Asset_Location'		,''
);

insert into _menu (
	id	,pid	,type	,label				,icon	,image						,module						,description
) values (
	15	,10		,3		,'Penghapusan Aset'	,'ref'	,'../icons/reference.svg'	,'Reference_Asset_Removal'	,''
);

insert into _group_menu (_group_id, _menu_id, permission) values (1	,10	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,11	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,12	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,13	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,14	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,15	,4);

insert into _menu (
	id	,pid	,type	,label			,icon		,image						,module		,description
) values (
	20	,0		,0		,'Aset'			,'asset'	,''							,'Asset'	,''
);

insert into _menu (
	id	,pid	,type	,label			,icon		,image						,module		,description
) values (
	21	,20		,3		,'Aset'			,'asset'	,'../app/Asset/asset.svg'	,'Asset'	,''
);

insert into _menu (
	id	,pid	,type	,label			,icon		,image						,module				,description
) values (
	22	,20		,3		,'Barcode'		,'barcode'	,'../app/Asset/barcode.svg'	,'Asset_Barcode'	,''
);

insert into _menu (
	id	,pid	,type	,label			,icon		,image						,module			,description
) values (
	23	,20		,3		,'Relokasi'		,'assign'	,'../app/Asset/assign.svg'	,'Asset_Assign'	,''
);

insert into _menu (
	id	,pid	,type	,label			,icon			,image							,module					,description
) values (
	24	,20		,3		,'Pemeliharaan'	,'maintenance'	,'../app/Asset/maintenance.svg'	,'Asset_Maintenance'	,''
);

insert into _menu (
	id	,pid	,type	,label			,icon			,image							,module				,description
) values (
	25	,20		,3		,'Penghapusan'	,'removal'		,'../app/Asset/removal.svg'		,'Asset_Removal'	,''
);

insert into _group_menu (_group_id, _menu_id, permission) values (1	,20	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,21	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,22	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,23	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,24	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,25	,4);

insert into _menu (
	id,	pid, type, label, icon, image, module, description
) values (
	30, 0, 0, 'Laporan', 'report', '../app/Report/report.svg', 'Report', ''
);

insert into _menu (
	id,	pid, type, label, icon, image, module, description
) values (
	31, 30, 3, 'Pengadaan', 'report', '../app/Report/report.svg', 'Report_Procurement', ''
);

insert into _menu (
	id,	pid, type, label, icon, image, module, description
) values (
	32, 30, 3, 'Penghapusan', 'report', '../app/Report/report.svg', 'Report_Disposal', ''
);

insert into _group_menu (_group_id, _menu_id, permission) values (1	,30	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,31	,4);
insert into _group_menu (_group_id, _menu_id, permission) values (1	,32	,4);

insert into asset_type (id, name) values (0, '-');
insert into asset_type (name) values ("PC");
insert into asset_type (name) values ("Laptop");

insert into asset_procurement (id, name) values (0, "-");
insert into asset_procurement (name) values ("Pembelian");
insert into asset_procurement (name) values ("Hibah");

insert into asset_status (id, name) values (0, "-");
insert into asset_status (name) values ("Baik");
insert into asset_status (name) values ("Rusak");

insert into asset_location (id, name) values (0, "-");
insert into asset_location (name) values ("Kantor Pusat");

insert into asset_removal (id, name) values (0, "-");
insert into asset_removal (name) values ("Dimusnahkan");
insert into asset_removal (name) values ("Dijual");
