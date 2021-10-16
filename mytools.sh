#!/bin/bash
echo "harap tunggu, proses sedang berlangsung..."

#initialize command
prefix1="$1"
prefix2="$2"
prefix3="$3"
prefix4="$4"
prefix5="$5"

# checking prefix, if prefix not empty will be execute command inside if
if [ "$prefix1" != '' ];
then
    case $prefix1 in
        # store available prefix command 
        -h)
            # output for help
            echo "##### Guide command #####"
            echo " [ -h ] : untuh daftar perintah tersedia."
            echo " [ mytools lokasilog -t json ] : command untuk memindahkan file log ke folder /var/log dengan format JSON"
            echo " [ mytools lokasilog -t text ] : command untuk memindahkan file log ke folder /var/log dengan format TEXT"
            echo " [ mytools lokasilog/log.log -o lokasibaru/log.json ] : command untuk memindahkan file log ke folder yang anda pilih dengan format JSON"
            echo " [ mytools lokasilog/log.log -o lokasibaru/log.txt ]  : command untuk memindahkan file log ke folder yang anda pilih dengan format JSON"
            echo " [ mytools lokasilog/log.log -t text -o lokasibaru/log.txt ]  : command untuk memindahkan file log ke folder yang anda pilih dengan format TEXT"
            echo " [ mytools lokasilog/log.log -t json -o lokasibaru/log.txt ]  : command untuk memindahkan file log ke folder yang anda pilih dengan format TEXT"
            ;;
        *)
            # checking prefix -t, -o or null
            case $prefix2 in
                # -t prefix for convert
                -t)
                        if [ $prefix3 == 'json' ];
                        then
                            if [ $prefix4 == '-o' ] && [ $prefix5 != ''];
                            then
                                cp $prefix1 $prefix5.txt
                                echo "xxx3"
                            else
                                cp $prefix1 /var/log/logassesment1.json
                                echo "xxx1"
                            fi
                        elif [ "$prefix3" == 'text' ];
                        then
                            cp $prefix1 testlog/logassesment2.txt
                            echo "xxx2"
                        else
                            cp $prefix1 testlog/logassesment3.txt
                            echo "xxx4"
                        fi
                        echo "Data berhasil dipindahkan ke /var/log/"
                        ;;
                # -o prefix for customized location 
                -o)
                        if [ "$prefix3" == 'json' ] && [ "${prefix4}" == '-o' ] && [ "$prefix5" != '' ];
                        then
                            cp $prefix1 $prefix5.json
                            echo "xxx5"
                        else
                            cp $prefix1 $prefix3.txt
                            echo "xxx16"
                        fi
                        echo "data berhasil dipindah ke $prefix3"
                        ;;
                # for setting default prefix
                *)
                        cp $prefix1 /var/log/logassesment4.txt
                        echo 'Data berhasil dipindah ke /var/log/'
                        ;;
            esac
            ;;
    esac
# result when prefix empty/null
else
    echo "perintah yang kamu masukkan tidak sesuai. -h untuk melihat perintah yang tersedia."
fi

echo "Proses terlah berakhir!"