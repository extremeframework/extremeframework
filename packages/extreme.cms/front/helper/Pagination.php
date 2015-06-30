<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class Object
{
	function get($property, $default=null)
	{
		if(isset($this->$property)) {
			return $this->$property;
		}
		return $default;
	}

	function set( $property, $value = null )
	{
		$previous = isset($this->$property) ? $this->$property : null;
		$this->$property = $value;
		return $previous;
	}
}

class Pagination extends Object
{
	var $total = null;
	var $limitstart = null;
	var $limit = null;
	var $_viewall = false;

	function __construct($total, $limitstart, $limit) {
		$this->total		= (int) $total;
		$this->limitstart	= (int) max($limitstart, 0);
		$this->limit		= (int) max($limit, 0);

		if ($this->limit > $this->total) {
			$this->limitstart = 0;
		}

		if (!$this->limit)
		{
			$this->limit = $total;
			$this->limitstart = 0;
		}

		if ($this->limitstart > $this->total) {
			$this->limitstart -= $this->limitstart % $this->limit;
		}

		// Set the total pages and current page values
		if($this->limit > 0) {
			$this->set( 'pages.total', ceil($this->total / $this->limit));
			$this->set( 'pages.current', ceil(($this->limitstart + 1) / $this->limit));
		}

		// Set the pagination iteration loop values
		$displayedPages	= 10;
		$this->set( 'pages.start', (floor(($this->get('pages.current') -1) / $displayedPages)) * $displayedPages +1);
		if ($this->get('pages.start') + $displayedPages -1 < $this->get('pages.total')) {
			$this->set( 'pages.stop', $this->get('pages.start') + $displayedPages -1);
		} else {
			$this->set( 'pages.stop', $this->get('pages.total'));
		}

		// If we are viewing all records set the view all flag to true
		if ($this->limit == $total) {
			$this->_viewall = true;
		}
	}

	function _getPageData() {
		// Initialize variables
		$data = new stdClass();

		$data->all	= new PaginationObject((L_PAGING_VIEW_ALL));
		if (!$this->_viewall) {
			$data->all->base	= '0';
		}

		// Set the start and previous data objects
		$data->start	= new PaginationObject((L_PAGING_START));
		$data->previous	= new PaginationObject((L_PAGING_PREV), null, null, 'pagination-prev');

		if ($this->get('pages.current') > 1)
		{
			$page = ($this->get('pages.current') - 1);

			$data->start->base = 1;
			$data->previous->base = $page;
		}

		// Set the next and end data objects
		$data->next	= new PaginationObject((L_PAGING_NEXT), null, null, 'pagination-next');
		$data->end	= new PaginationObject((L_PAGING_END));

		if ($this->get('pages.current') < $this->get('pages.total'))
		{
			$next = $this->get('pages.current') + 1;
			$end  = ($this->get('pages.total'));

			$data->next->base = $next;
			$data->end->base = $end;
		}

		$data->pages = array();
		$stop = $this->get('pages.stop');
		for ($i = $this->get('pages.start'); $i <= $stop; $i ++)
		{
			$offset = ($i);

			$offset = $offset == 1 ? 1 : $offset;  //set the empty for removal from route

			$data->pages[$i] = new PaginationObject($i);
			if ($i != $this->get('pages.current') || $this->_viewall)
			{
				$data->pages[$i]->base	= $offset;
			}
		}

		return $data;
	}

    function getPageLinks() {
		$links = array();

		$data = $this->_getPageData();

		if (count($data->pages) > 1) {
			$page = $data->previous;
			$links[] = $page;

			foreach($data->pages as $page) {
				$links[] = $page;
			}

			$page = $data->next;
			$links[] = $page;
		}

		return $links;
	}
}

//////////////////////////////////////////////////////////////////////////
// PaginationObject
class PaginationObject extends Object
{
	var $text;
	var $base;
	var $class;

	function __construct($text, $base=null, $link=null, $class=null)
	{
		$this->text = $text;
		$this->base = $base;
		$this->class = $class;
	}
}