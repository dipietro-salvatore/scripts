# To find the on which package the application belongs to
# program_belongTo.sh  EXECUTABLE_FILE

dpkg -S `which $1`
