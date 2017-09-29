#/bin/bash
if [! -d "/home/epa/Backup" ];
 then
	mkdir /home/epa/Backup
fi

tar -cvf $1backup.tar.gz $1
mv $1backup.tar.gz /home/epa/Backup


