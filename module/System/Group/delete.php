<?php
/*
	Copyright 2014 - Mhd Sulhan
	Authors:
		- mhd.sulhan (m.shulhan@gmail.com)
*/
foreach ($data as $d) {
	$id = $d['id'];

	if ($id < 0) {
		throw new Exception ("Invalid data ID!");
	}

	$q	="	select	type"
		."	from	_group"
		."	where	id = ?";

	$ps = Jaring::$_db->prepare ($q);
	$ps->bindValue (1, $id);
	$ps->execute ();
	$rs = $ps->fetchAll (PDO::FETCH_ASSOC);

	// don't delete group id 0
	if (count ($rs) > 0) {
		$type = (int) $rs[0]['type'];

		if ($type === 0) {
			throw new Exception ("This group is system group and can't be deleted.");
		}
	}

	// Delete group menu access
	$q	="	delete from	_group_menu"
		."	where		_group_id = ?";

	$ps = Jaring::$_db->prepare ($q);
	$ps->bindValue (1, $id);
	$ps->execute ();
	$ps->closeCursor ();

	// Delete group from table
	$q	="	delete from		_group"
		."	where	id		= ?"
		."	and		type	!= 0";

	$ps = Jaring::$_db->prepare ($q);
	$ps->bindValue (1, $id);
	$ps->execute ();
	$ps->closeCursor ();
}

Jaring::$_out['success']	= true;
Jaring::$_out['data']		= Jaring::$MSG_SUCCESS_DESTROY;
