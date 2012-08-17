volume="/home"

mount | grep "on ${volume} type" > /dev/null
if [ $? -eq 0 ]; then
 echo "its mounted"
else
 echo $?
fi
