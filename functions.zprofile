expDot() {
    destArg=$1
    if [ ${destArg:0:2} = "./" ]
    then
        cwd=`pwd`
        dest="${cwd}""${destArg:1}"
    else
        dest="${destArg:0}"
    fi
    echo "${dest}"
}

scpin() {
    ipad=$1
    hn="${ipad%%.*}"
    rem=$(expDot $2)
    if [ ${rem:0:17} = "/Users/gupta/${hn}" ]
    then
        src="${rem:17}"
    elif [ ${rem:0:12} = "/Users/gupta" ]
    then
        src="/home/guptaa${rem:12}"
    else
        src=$rem
    fi
    mkdir -p /Users/gupta/"${hn}""$(dirname "${src}")"
    loc=/Users/gupta/"${hn}${src}"
    loc=${loc//"*"/}
    scp "${@:5:99}" guptaa@"${ipad}":"${src}" "${loc}"
}