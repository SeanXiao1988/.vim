#/bin/sh

set -e

CUR_DIR=`pwd`
DIS_DIR="$HOME/.vim"

mkdir -p "${DIS_DIR}"

echo "begin to exe cp tar cvf - . | (cd ${DIS_DIR}; tar xvf -)"

tar cvf - . | (cd ${DIS_DIR}; tar xvf -)

echo "begin to exe ln -f -s ${CUR_DIR}/vimrc ~/.vimrc "

ln -f -s ${DIS_DIR}/vimrc ~/.vimrc

echo "begin to exe rm -rf ${CUR_DIR}"

rm -rf ${CUR_DIR}

echo "begin to clone vundle"

cd ${DIS_DIR}
rm -rf bundle
mkdir -p bundle
git clone git@github.com:gmarik/Vundle.vim.git bundle/vundle

echo "********************your job***********************"
echo "vim"
echo ":BundleInstall"
echo "*********************End***************************"
