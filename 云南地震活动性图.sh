name="2010.01.01-2022.01.01_lo:97-106_la:21-29"

gmt begin $name pdf

gmt grdimage @earth_relief_01m -JM15c -R97/106/21/29 -Baf -BWSen+t"Yunnan mag:0.27-0.62"
gmt pscoast -JM15c -R97/106/21/29 -ECN.53+p1p,white 
gmt psxy -JM15c -R97/106/21/29  gadm36_CHN_Yunnan_2.gmt -W1p,white 
#gmt psxy -JM15c -R97/106/21/29  gem_active_faults_IndoAsian_Collision_Zone.gmt -W2p,black



i=1
imax=`cat data.csv|wc -l`
while(($i<$imax))
do
lo=`cat data.csv | awk -F ',' '{if(NR=="'$i'")print$1}'`
la=`cat data.csv | awk -F ',' '{if(NR=="'$i'")print$2}'`
ra=`cat data.csv | awk -F ',' '{if(NR=="'$i'")print$3}'`
ra="$ra""c"
echo "$lo $la" | gmt plot -Sc$ra -W1.5p,cyan,solid #-W1p,black,solid -Gcyan #-Bya180
let i++
done

#-----标记断层
gmt psxy -JM15c -R97/106/21/29  gem_active_faults_SE_Asia.gmt -W2p,black
#-----图例-------
gmt colorbar -Bxaf #+l"Elevation (m)"
echo "30 30"|gmt plot -Sc0.27c -W1.5p,cyan,solid -l"mag:3"
echo "30 30"|gmt plot -Sc0.36c -W1.5p,cyan,solid -l"mag:4"
echo "30 30"|gmt plot -Sc0.45c -W1.5p,cyan,solid -l"mag:5"
gmt legend -DjBR+o0.1c/0.1c -F+p1p+glightcyan

    gmt inset begin -DjRT+w4.5c/3.6c+o-2c -F+gwhite+p1p
        gmt coast -R73/123/20/60 -JM? -ECN+glightbrown+p0.2p 
        # Plot a rectangle region using -Sr+s
        echo 107 21 116 29 | gmt plot -Sr+s -W1p,blue
        #97/106/21/29
    gmt inset end
#-----标记地点名称————————
j=1
jmax=`cat data.city|wc -l`
while(($j<=$jmax))
do
lo=`cat data.city | awk -F ',' '{if(NR=="'$j'")print$1}'`
la=`cat data.city | awk -F ',' '{if(NR=="'$j'")print$2}'`
na=`cat data.city | awk -F ',' '{if(NR=="'$j'")print$3}'`
echo "$lo $la $na "| gmt pstext -F+jCT+f6p,0.8,green -Dj0c/0.3c
echo "$lo $la " | gmt plot -Sc0.15c -W1.8p,green,solid -Gwhite
let j++
done
gmt end show

#gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=all_sec_sta.pdf *.pdf