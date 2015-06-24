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

    <column>
        <type></type>                                             <!-- [clustered] (clustered, stacked, 100% stacked, 3d column) -->
        <width>85</width>                                         <!-- [80] (0 - 100) width of column (in percents)  -->
        <spacing>0</spacing>                                      <!-- [5] (Number) space between columns of one category axis value, in pixels. Negative values can be used. -->
        <grow_time>3</grow_time>                                  <!-- [0] (Number) grow time in seconds. Leave 0 to appear instantly -->
        <grow_effect></grow_effect>                               <!-- [elastic] (elastic, regular, strong) -->
        <sequenced_grow>true</sequenced_grow>                     <!-- [false] (true / false) whether columns should grow at the same time or one after another -->    
        <alpha></alpha>                                           <!-- [100] (Number) alpha of all columns -->
        <border_color></border_color>                             <!-- [#FFFFFF] (hex color code) -->
        <border_alpha></border_alpha>                             <!-- [0] (Number) -->
        <data_labels>
          <![CDATA[]]>                                            <!-- [] ({title} {value} {series} {percents} {start} {difference} {total}) You can format any data label: {title} will be replaced with real title, {value} - with value and so on. You can add your own text or html code too. -->
        </data_labels>
        <data_labels_text_color></data_labels_text_color>         <!-- [text_color] (hex color code) --> 
        <data_labels_text_size></data_labels_text_size>           <!-- [text_size] (Number) -->
        <data_labels_position></data_labels_position>             <!-- [outside] (inside, outside, above). This setting is only for clustered chart. --> 
                                                                  <!-- if you set "above" for column chart, the data label will be displayed inside column, rotated  by 90 degrees -->
        <data_labels_always_on></data_labels_always_on>           <!-- [false] (true / false) If the data label is placed inside of the bar or column (stacked chart) and the bar or column is too small for the label to fit, it is hidden. If you set this setting to "true", the data labels will always be visible. -->
        <balloon_text>                                                    
         <![CDATA[]]>                                             <!-- [] ({title} {value} {series} {percents} {start} {difference} {total}) You can format any data label: {title} will be replaced with real title, {value} - with value and so on. You can add your own text or html code too. -->
        </balloon_text>    
        <link_target></link_target>                               <!-- [] (_blank, _top ...) -->
        <gradient></gradient>                                     <!-- [vertical] (horizontal / vertical) Direction of column gradient. Gradient colors are defined in graph settings below. -->
        <bullet_offset></bullet_offset>                           <!-- [0] (Number) distance from column / bar to the bullet -->
        <hover_brightness></hover_brightness>                     <!-- [0] (from -255 to 255) The column may darken/lighten when the use rolls over it. The intensity may be set here -->
        <hover_color>#EED600</hover_color>                        <!-- [] (hex color code) -->
        <corner_radius_top></corner_radius_top>                   <!-- [0] (Number, Number%) Corner radius of the column's top. Works only if depth is = 0 -->
        <corner_radius_bottom></corner_radius_bottom>             <!-- [0] (Number, Number%) Corner radius of the column's bottom. Works only if depth is = 0 -->             
    </column>

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
    
  <graphs>                                                     <!-- GRAPHS SETTINGS. These settings can also be specified in data file, as attributes of <graph>, in this case you can delete everything from <graphs> to </graphs> (including) -->
                                                               <!-- It is recommended to have graph settings here if you don't want to mix data with other params -->
                                                               <!-- copy <graph>...</graph> (including) as many times as many graphs you have and edit settings individually -->
                                                               <!-- if graph settings are defined both here and in data file, the ones from data file are used -->
    <graph gid="1">                                            <!-- if you are using XML data file, graph "gid" must match graph "gid" in data file -->
      <type>column</type>                                      <!-- [column] (column/line) -->                  
      <title>Anomaly</title>                                   <!-- [] (graph title) -->
      <color>B92F2F</color>                                    <!-- [] (hex color code) -->
      <alpha></alpha>                                          <!-- [column.alpha (line.alpha)] (0 - 100) -->
      <data_labels>
        <![CDATA[]]>                                           <!-- [column.data_labels (line.data_labels)] ({title} {value} {series} {percents} {start} {difference} {total}) You can format any data label: {title} will be replaced with real title, {value} - with value and so on. You can add your own text or html code too. -->
      </data_labels>      
      <gradient_fill_colors></gradient_fill_colors>            <!-- [] (hex color codes separated by comas) columns can be filled with gradients. Set any number of colors here. Note, that the legend key will be filled with color value, not with gradient. -->
      <balloon_color></balloon_color>                          <!-- [balloon.color] (hex color code) leave empty to use the same color as graph -->
      <balloon_alpha></balloon_alpha>                          <!-- [balloon.alpha] (0 - 100) -->      
      <balloon_text_color></balloon_text_color>                <!-- [balloon.text_color] (hex color code) -->
      <balloon_text>
        <![CDATA[Anomaly in {series}: {value}C]]>              <!-- [column(line).balloon.text] ({title} {value} {series} {description} {percents}) You can format any balloon text: {title} will be replaced with real title, {value} - with value and so on. You can add your own text or html code too. -->
      </balloon_text>       
      <fill_alpha></fill_alpha>                                <!-- [0] (0 - 100) fill alpha (use it if you want to have area chart) -->
      <width></width>                                          <!-- [2] (Number) line width -->
      <bullet></bullet>                                        <!-- [line.bullet] (round, square, round_outlined, square_outline, round_outline, square_outlined, filename) -->            
      <bullet_size></bullet_size>                              <!-- [line.bullet_size] (Number) bullet size -->
      <bullet_color></bullet_color>                            <!-- [] (hex color code) bullet color. If not defined, line color is used -->
      <visible_in_legend></visible_in_legend>                  <!-- [true] (true / false) whether to show legend entry for this graph or not -->
      <pattern></pattern>                                      <!-- [] (path to the pattern file) Pattern file can be: swf, jpg, gif or png. The chart looks for the file in the "path" folder. the pattern can be also set for individual columns in the data xml file -->
      <pattern_color></pattern_color>                          <!-- [] (hex color code) the color of the pattern -->      
    </graph>

    <graph gid="2">
      <type>line</type>                                     
      <title>Smoothed</title>                               
      <color></color>                                   
      <alpha></alpha>
      <balloon_text>
        <![CDATA[Anomaly in {series}: {value}C (Smoothed)]]>  <!-- [column(line).balloon.text] ({title} {value} {series} {description} {percents}) You can format any balloon text: {title} will be replaced with real title, {value} - with value and so on. You can add your own text or html code too. -->
      </balloon_text>                                         
    </graph>
  </graphs>    
</settings>