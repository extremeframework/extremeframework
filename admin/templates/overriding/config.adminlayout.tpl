<{include file="header.tpl"}>
</head>

<body class="module module-<{$module}>" id="<{$module}>">

<{$title = "Config View Layout"}>

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{$title}></span>
</h1>

<p><strong>Note: </strong>Remember to rebuild views after modification.</p>

<!-- Grid Stack -->
<div style="background: #2c3e50; color: #fff; padding: 10px;">
    <style>
        .grid-stack-item-content {
            background: white;
            color: #2c3e50;
            text-align: center;
            font-size: 15px;
            padding-top: 4px;
        }

        .grid-stack-item-content .fa {
            font-size: 64px;
            display: block;
            margin: 20px 0 10px;
        }

        header a, header a:hover { color: #fff; }

        .darklue { background: #2c3e50; color: #fff;}
        .darklue hr.star-light::after {
            background-color: #2c3e50;
        }

        .grid-stack-item.ui-state-disabled {
            opacity: 1!important;
            filter: Alpha(Opacity=100)!important;
        }
    </style>

    <div class="grid-stack darklue" data-gs-width="12" data-gs-animate="yes">
        <{foreach from=$settings key=column item=position}>
            <div class="grid-stack-item" data-custom-id="<{$column}>" data-gs-min-width="6" data-gs-x="<{$position.x}>" data-gs-y="<{$position.y}>" data-gs-width="6" data-gs-max-height="1"><div class="grid-stack-item-content"><{$column}></div></div>
        <{/foreach}>
    </div>

    <script type="text/javascript">
    $(function () {
        var options = {
            cell_height: 30,
            vertical_margin: 10,
            always_show_resize_handle: /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
        };
        $('.grid-stack').gridstack(options);

        var serialize_widget_map = function (items) {
            _.each(items, function(item){
                //console.log(item);
            });

            var serialized_data = _.map($('.grid-stack > .grid-stack-item:visible'), function (el) {
                el = $(el);
                var node = el.data('_gridstack_node');
                return {
                    id: el.attr('data-custom-id'),
                    x: node.x,
                    y: node.y,
                    width: node.width,
                    height: node.height
                };
            });

            $.ajax({
                url: APPLICATION_URL + '/adminlayout/update/<{$module}>/',
                type: "POST",
                data: JSON.stringify(serialized_data),
                contentType: "application/json"
            });
        };

        $('.grid-stack').on('change', function (e, items) {
            serialize_widget_map(items);
        });
    });
    </script>
</div>

<script type="text/javascript">
    $(function() {
        LicenseHelper.init();
    });
</script>

<{include file="footer.tpl"}>