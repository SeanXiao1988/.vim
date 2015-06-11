#/bin/sh

set -e

CUR_DIR=`pwd`
DIS_DIR='~/'

echo "begin to exe cp -f ${CUR_DIR} ${DIS_DIR}"

cp -f "${CUR_DIR}" "{$DIS_DIR}"

echo "begin to exe ln -f -s ${CUR_DIR}/vimrc ~/.vimrc "

ln -f -s "${CUR_DIR}/vimrc"  "${DIS_DIR}/.vimrc"
