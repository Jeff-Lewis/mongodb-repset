FROM mongo
MAINTAINER jalisquillomanuel[at]gmail[DOT]com
ADD startUp.sh /root/startUp.sh
ADD priorities.js /root/priorities.js
CMD ["bash","/root/startUp.sh"]
