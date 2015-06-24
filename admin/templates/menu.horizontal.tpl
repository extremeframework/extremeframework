<div class="horizontal-menu">
<style>
.horizontal-menu ul {
  list-style: none;
  padding: 0;
  margin: 0;
  background: #1bc2a2;
    z-index: 1;
}

.horizontal-menu ul li {
  display: block;
  position: relative;
  float: left;
  background: #1bc2a2;
}

/* This hides the dropdowns */


.horizontal-menu li ul { display: none; }

.horizontal-menu ul li a {
  display: block;
  padding: 1em;
  text-decoration: none;
  white-space: nowrap;
  color: #fff;
}

.horizontal-menu ul li ul li { background: #f5f5f5;color:black; border: 1px solid #ccc; border-width: 0 1px 1px 1px;}

.horizontal-menu ul li ul li a {
    padding: 8px 10px;
}

.horizontal-menu > ul > li > a {
    text-transform: uppercase;
}

/* Display the dropdown */
.horizontal-menu li:hover > ul {
  display: block;
  position: absolute;
}

.horizontal-menu li:hover li { float: none; }

.horizontal-menu li:hover a { background: #f5f5f5;color:black; }

.main-navigation li ul li { border-top: 0; }

/* Displays second level dropdowns to the right of the first level dropdown */


.horizontal-menu ul ul ul {
  left: 100%;
  top: 0;
}

/* Simple clearfix */
.horizontal-menu ul:before,
.horizontal-menu ul:after {
  content: " "; /* 1 */
  display: table; /* 2 */
}

.horizontal-menu ul:after { clear: both; }
</style>

<{include file="menu.horizontal.items.tpl" menus=$smarty.session.menu parent=0 depth=0}>

</div>