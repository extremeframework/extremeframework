<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ViewHelper {
	function treerecurse( $idcol, $namecol, $parentcol, $id, $indent, $list, &$children, $maxlevel=9999, $level=0, $type=1 ) {
		if (@$children[$id] && $level <= $maxlevel) {
			foreach ($children[$id] as $v) {
			    if (!isset($v->INDENT)) {
			        $v->INDENT = '';
			    }
				$id = $v->$idcol;

				if ($type) {
					$pre = '';
					$spacer = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				} else {
					$pre = '- ';
					$spacer = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}

				if ($v->$parentcol == 0) {
					$txt = $v->INDENT;
				} else {
					$txt = $pre.$v->INDENT;
				}

				$pt = $v->$parentcol;
				$list[$id] = $v;
				$list[$id]->INDENT = "$indent$txt";
				$list = $this->treerecurse( $idcol, $namecol, $parentcol, $id, $indent . $spacer, $list, $children, $maxlevel, $level+1, $type );
			}
		}

		return $list;
	}

    function aspect_hierachical(&$rows, $idcol, $namecol, $parentcol, $levellimit) {
		$children = array();

		$ids = array();
		foreach ($rows as $row) {
		    $ids[$row->$idcol] = true;
		}

		foreach ($rows as $row) {
			$pt = (int) $row->$parentcol;
			if (!isset($ids[$pt])) {
			    $pt = 'root';
            }
			$list = @$children[$pt] ? $children[$pt] : array();
			array_push($list, $row);
			$children[$pt] = $list;
		}

		$list = $this->treerecurse( $idcol, $namecol, $parentcol, 'root', '', array(), $children, max( 0, $levellimit-1 ) );

        return $list;
    }
}