<{$root_category_id = get_theme_option('news-root-category-id')}>
<{$categories = PostHelper::getSubCategories($root_category_id)}>

<div class="sidebar-block links" data-type="links">
    <div class="title">More News Feeds</div>
    <div class="body">
        <ul>
            <li><a href="<{link module="postcategory" id=$root_category_id}>">Featured News</a></li>
            <{foreach from=$categories item=category}>
                <li><a href="<{PostHelper::getCategoryLink($category)}>"><{$category->NAME}></a></li>
            <{/foreach}>
        </ul>
    </div>
</div>