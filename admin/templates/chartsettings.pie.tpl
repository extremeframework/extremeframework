<settings>
    <text_color>FFFFFF</text_color>
    <precision>1</precision>

    <{if $background}>    
    <background>
        <file><{$background}></file>
    </background>
    <{/if}>      

    <balloon>
        <show>{title}: {value} mln. ({percents}%)</show>
    </balloon>

    <legend>
        <enabled>0</enabled>
    </legend>

    <pie>
        <inner_radius>40</inner_radius>
        <height>10</height>
        <angle>20</angle>
        <base_color>B0DE09</base_color>
        <brightness_step>-10</brightness_step>
    </pie>

    <animation>
        <start_time>2</start_time>
        <pull_out_time>1</pull_out_time>
    </animation>

    <data_labels>
        <show>{title}: {percents}%</show>
        <radius>20</radius>
        <max_width>80</max_width>
        <line_color>FFFFFF</line_color>
        <line_alpha>40</line_alpha>
    </data_labels>

    <labels>
        <label lid='0'>
            <text><![CDATA[<b><{$label}></b>]]></text>
            <y>30</y>
            <text_size>13</text_size>
            <align>center</align>
        </label>
    </labels>
</settings>