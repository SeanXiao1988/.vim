#/bin/sh

set -e

CUR_DIR=`pwd`
DIS_DIR='~/.vim'

mkdir -p "${DIS_DIR}"

echo "begin to exe cp -rf ${CUR_DIR}/* ${DIS_DIR}/*"

cp -rf "${CUR_DIR}/*" "${DIS_DIR}/*"

echo "begin to exe ln -f -s ${CUR_DIR}/vimrc ~/.vimrc "

ln -f -s "${CUR_DIR}/vimrc" "~/.vimrc"

echo "begin to exe rm -rf ${CUR_DIR}"

rm -rf "${CUR_DIR}"

echo "your job: vim + :BundleInstall"
