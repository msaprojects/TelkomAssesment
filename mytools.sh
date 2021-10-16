#!/bin/bash
echo "harap tunggu, proses sedang berlangsung..."

#initialize command
prefix1="$1"
prefix2="$2"
prefix3="$3"
prefix4="$4"
prefix5="$5"

if [ "$prefix1" != '' ];
then
    case $prefix1 in
        -h)
            echo "##### Guide command #####"
            echo " [ -h ] : untuh daftar perintah tersedia."
            echo " [ mytools lokasilog -t json ] : command untuk memindahkan file log ke folder /var/log dengan format JSON"
            echo " [ mytools lokasilog -t text ] : command untuk memindahkan file log ke folder /var/log dengan format TEXT"
            echo " [ mytools lokasilog/log.log -o lokasibaru/log.json ] : command untuk memindahkan file log ke folder yang anda pilih dengan format JSON"
            echo " [ mytools lokasilog/log.log -o lokasibaru/log.txt ]  : command untuk memindahkan file log ke folder yang anda pilih dengan format TEXT"
            echo " [ mytools lokasilog/log.log -t text -o lokasibaru/log.txt ]  : command untuk memindahkan file log ke folder yang anda pilih dengan format TEXT"
            echo " [ mytools lokasilog/log.log -t json -o lokasibaru/log.txt ]  : command untuk memindahkan file log ke folder yang anda pilih dengan format JSON"
            ;;
        *)
            case $prefix2 in
                -t)
                        if [ $prefix3 == 'json' ];
                        then
                            if [ $prefix4 == '-o' ];
                            then
                                if [ $prefix5 != '' ]
                                then
                                        cp $prefix1 $prefix5.txt
                                        echo "xxx3"
                                fi
                            else
                                cp $prefix1 var/log/logassesment1.json
                                echo "xxx1"
                            fi
                        elif [ "$prefix3" == 'text' ];
                        then
                            cp $prefix1 var/log/logassesment2.txt
                            echo "xxx2"
                        else
                            cp $prefix1 var/log/logassesment3.txt
                            echo "xxx4"
                        fi
                        echo "Data berhasil dipindahkan"
                        ;;
                -o)
                        cp $prefix1 $prefix3.txt
                        echo "xxx6"
                        echo "data berhasil dipindah ke $prefix3"
                        ;;
                *)
                        cp $prefix1 var/log/logassesment4.txt
                        echo 'Data berhasil dipindah'
                        ;;
            esac
            ;;
    esac
else
    echo "perintah yang kamu masukkan tidak sesuai. -h untuk melihat perintah yang tersedia."
fi

echo "Proses terlah berakhir!"
