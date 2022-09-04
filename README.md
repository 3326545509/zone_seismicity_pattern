# zone_seismicity_pattern
A seismicity pattern including fault, earthquake, administration divisions, main citys and inset map.

## 各文件说明:
* 云南地震活动性性图.sh:	
 	+ 输入data.csv和data.city, 绘制图像

* Yunnan10years.csv:
	+ 云南省2010.01.01-2022.01.01, 3-10级地震事件(实际上最高为6.2级)

* data.csv:
    + 纬度 经度 震级

* data.city:
    + 云南省几个主要城市位置


* gadm36_CHN_gpkg && gadm36_CHN_2.gmt && gadm36_CHN_Yunnan_2.gmt:
    + 中国行政区划数据、从中国行政区划地图提取出来的云南地图
    + 数据来源:2018-2022 GADM https://gadm.org/download_country_v3.html

* gem_active_faults.gmt && gem_active_faults_IndoAsian_Collision_Zone && gem_active_faults_SE_Asia:
    + 活动断层数据, 数据来源:https://github.com/GEMScienceTools/gem-global-active-faults/blob/master/README.md


* 2010.01.01-2022.01.01_lo/97-106_la/21-29.pdf:
    + 运行的输出结果
